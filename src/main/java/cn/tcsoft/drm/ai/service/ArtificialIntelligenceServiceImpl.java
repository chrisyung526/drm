package cn.tcsoft.drm.ai.service;

import cn.tcsoft.drm.Constants;
import cn.tcsoft.drm.ai.ArtificialIntelligenceService;
import cn.tcsoft.drm.ai.model.AiDTO;
import cn.tcsoft.drm.ai.model.AiVO;
import cn.tcsoft.drm.config.properties.GoogleCloudProperties;
import cn.tcsoft.drm.entity.ItemStt;
import cn.tcsoft.drm.service.ItemSttService;
import cn.tcsoft.drm.util.xfocr.XunFeiOcrUtils;
import com.alibaba.fastjson.JSON;
import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.api.gax.longrunning.OperationFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.WriteChannel;
import com.google.cloud.speech.v1p1beta1.*;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.ImmutableMap;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DurationFormatUtils;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author : laimin
 * create at:  2022/4/15  16:23
 * @description: ai人工智能接口相关实现
 */
@Service
@Slf4j
@EnableConfigurationProperties(GoogleCloudProperties.class)
public class ArtificialIntelligenceServiceImpl implements ArtificialIntelligenceService {
    @Resource
    GoogleCloudProperties googleCloudProperties;
    @Resource
    ItemSttService sttService;
    @Resource
    XunFeiOcrUtils ocrUtils;

    private String gsPath="gs://%s/%s%s";



    private SpeechSettings settings;
    private GoogleCredentials credentials;

    /**
     * 初始化属性
     */
    @PostConstruct
    @SneakyThrows(Exception.class)
    public void initProxy(){
        if(googleCloudProperties.getProxyEnable()) {
            System.setProperty("proxyHost", googleCloudProperties.getProxyHost());
            System.setProperty("proxyPort", googleCloudProperties.getProxyPort());
        }
        InputStream inputStream = new ClassPathResource(googleCloudProperties.getKeyPath()).getInputStream();
        credentials=GoogleCredentials.fromStream(inputStream);
        settings = SpeechSettings.newBuilder().setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build();
    }

    @SneakyThrows(Exception.class)
    private String uploadGs(String filePath){
        Storage storageService=StorageOptions.newBuilder().setCredentials(credentials).build()
                .getService();
        Path uploadFrom= Paths.get(filePath);
        String objectName=uploadFrom.toFile().getName();
        BlobInfo blobInfo= BlobInfo.newBuilder(googleCloudProperties.getBucketName(),googleCloudProperties.getBucketPath()+objectName).setContentType(Constants.AUDIO_MAP.get(objectName.split("\\.")[1])).build();
        if (Files.size(uploadFrom) > 2_000_000) {
            // When content is not available or large (2MB or more) it is recommended
            // to write it in chunks via the blob's channel writer.
            try (WriteChannel writer = storageService.writer(blobInfo)) {
                byte[] buffer = new byte[2048];
                try (InputStream input = Files.newInputStream(uploadFrom)) {
                    int limit;
                    while ((limit = input.read(buffer)) >= 0) {
                        try {
                            writer.write(ByteBuffer.wrap(buffer, 0, limit));
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            }
        } else {
            byte[] bytes = Files.readAllBytes(uploadFrom);
            // create the blob in one request.
            storageService.create(blobInfo, bytes);
        }
        String gsUri=String.format(gsPath,googleCloudProperties.getBucketName(),googleCloudProperties.getBucketPath(),objectName);
        log.debug(gsUri);
        return gsUri;
    }


    @Override
    @Async("asyncTaskExecutor")
    @SneakyThrows(Exception.class)
    public AiVO stt(AiDTO dto) {
        if(dto.getIsUpload()){
            dto.setGsPath(uploadGs(dto.getFilePath()));
        }
        String fileExt= dto.getGsPath().split("\\.")[1];
        String jsonName=System.currentTimeMillis()+".json";
        String outPutGcsUri=String.format(gsPath,googleCloudProperties.getBucketName(),googleCloudProperties.getTranscript(),jsonName);
        ItemStt itemStt=new ItemStt();
        itemStt.setBucketName(googleCloudProperties.getBucketName());
        itemStt.setObjectName(googleCloudProperties.getTranscript()+jsonName);
        itemStt.setGcsUri(outPutGcsUri);
        sttService.insertItemStt(itemStt);
        SpeechClient speech = SpeechClient.create(settings);
        RecognitionConfig config = RecognitionConfig.newBuilder()
            .setEncoding(RecognitionConfig.AudioEncoding.MP3)
            .setLanguageCode(dto.getLanguage())
            .setSampleRateHertz(Constants.HERTZ_MAP.get(fileExt))
            .setEnableAutomaticPunctuation(true)
            .setEnableWordTimeOffsets(true)
            .build();

        RecognitionAudio audio = RecognitionAudio.newBuilder().setUri(dto.getGsPath()).build();

        // 结果输出到gcs
        TranscriptOutputConfig outputConfig =
                TranscriptOutputConfig.newBuilder().setGcsUri(outPutGcsUri).build();

        LongRunningRecognizeRequest request =
                LongRunningRecognizeRequest.newBuilder()
                        .setConfig(config)
                        .setAudio(audio)
                        .setOutputConfig(outputConfig)
                        .build();


        OperationFuture<LongRunningRecognizeResponse, LongRunningRecognizeMetadata> response =
                speech.longRunningRecognizeAsync(request);
        log.debug("Task has already submit, gcsUri:"+outputConfig.getGcsUri());

        while (!response.isDone()) {
            log.debug("Waiting for response...");
            TimeUnit.SECONDS.sleep(10L);
        }
        List<SpeechRecognitionResult> results = response.get().getResultsList();
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
        itemStt.setStatus(1);
        itemStt.setContent(contentSb.toString());
        itemStt.setSourceContent(JSON.toJSONString(list));
        sttService.updateItemStt(itemStt);

        return AiVO.builder().sourceContent(JSON.toJSONString(list)).content(contentSb.toString()).build();
    }

    @Override
    @Async("asyncTaskExecutor")
    @SneakyThrows
    public String ocr(String imagePath) {
        return ocrUtils.getJpgContentByUrl(imagePath);
    }
}