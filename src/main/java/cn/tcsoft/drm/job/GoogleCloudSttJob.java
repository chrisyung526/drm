package cn.tcsoft.drm.job;

import cn.tcsoft.drm.config.properties.GoogleCloudProperties;
import cn.tcsoft.drm.entity.ItemStt;
import cn.tcsoft.drm.service.ItemSttService;
import com.alibaba.fastjson.JSON;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.speech.v1p1beta1.LongRunningRecognizeResponse;
import com.google.cloud.speech.v1p1beta1.SpeechRecognitionAlternative;
import com.google.cloud.speech.v1p1beta1.SpeechRecognitionResult;
import com.google.cloud.speech.v1p1beta1.WordInfo;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.ImmutableMap;
import com.google.protobuf.util.JsonFormat;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DurationFormatUtils;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author : laimin
 * create at:  2022/4/18  13:44
 * @description: Google cloud speech to text job
 */
@Component
@EnableConfigurationProperties(GoogleCloudProperties.class)
@Slf4j
public class GoogleCloudSttJob {
    @Resource
    GoogleCloudProperties googleCloudProperties;
    @Resource
    ItemSttService sttService;
    private GoogleCredentials credentials;

    @PostConstruct
    @SneakyThrows(Exception.class)
    public void initProxy(){
        if(googleCloudProperties.getProxyEnable()) {
            System.setProperty("proxyHost", googleCloudProperties.getProxyHost());
            System.setProperty("proxyPort", googleCloudProperties.getProxyPort());
        }
        InputStream inputStream = new ClassPathResource(googleCloudProperties.getKeyPath()).getInputStream();
        credentials= GoogleCredentials.fromStream(inputStream);
    }

    @Async("asyncTaskExecutor")
    @SneakyThrows
    @Scheduled(cron = "0 0/5 *  * * ?")
    public void offsetStt(){
        List<ItemStt> sttList=sttService.lambdaQuery().eq(ItemStt::getStatus,2).list();
        if(CollectionUtils.isEmpty(sttList)){
            log.warn("没有可以解析任务");
            return;
        }
        Storage storage= StorageOptions.newBuilder()
                .setCredentials(credentials)
                .build()
                .getService();
        for(ItemStt stt:sttList) {
            // Get blob given bucket and object name
            BlobId blobId = BlobId.of(stt.getBucketName(), stt.getObjectName());
            Blob blob = storage.get(blobId);
            if(Objects.isNull(blob)){
                continue;
            }
            // Create json object
            JSONObject jsonObject = new JSONObject(new String(blob.getContent(), "UTF-8"));
            // Specefy the proto type message
            LongRunningRecognizeResponse.Builder builder = LongRunningRecognizeResponse.newBuilder();
            // Construct a parser
            JsonFormat.Parser parser = JsonFormat.parser().ignoringUnknownFields();
            // Parses from JSON into a protobuf message.
            parser.merge(jsonObject.toString(), builder);
            // Get the converted values
            LongRunningRecognizeResponse storageResponse = builder.build();
            List<SpeechRecognitionResult> results = storageResponse.getResultsList();
            StringBuilder contentSb=new StringBuilder();
            List<Map<String,Object>> list=new ArrayList<>();
            for (SpeechRecognitionResult result : results) {
                SpeechRecognitionAlternative alternative = result.getAlternativesList().get(0);
                List<WordInfo> wordsList=alternative.getWordsList();
                Long start=wordsList.get(0).getStartTime().getSeconds()*1000,end=wordsList.get(wordsList.size()-1).getEndTime().getSeconds()*1000;
                String startTime= DurationFormatUtils.formatDuration(start,"HH:mm:ss.SS"),endTime=DurationFormatUtils.formatDuration(end,"HH:mm:ss.SS");
                contentSb.append(alternative.getTranscript()).append(".");
                list.add(ImmutableMap.of(
                        "start",startTime,"end",endTime,"content",alternative.getTranscript()
                ));
                log.debug(String.format("%s,%s,%s",startTime,endTime,alternative.getTranscript()));
            }
            storage.delete(blobId);
            stt.setStatus(1);
            stt.setContent(contentSb.toString());
            stt.setSourceContent(JSON.toJSONString(list));
            sttService.updateItemStt(stt);
        }

    }
}