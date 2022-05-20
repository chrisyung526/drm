package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.config.properties.MediaStreamProperties;
import cn.tcsoft.drm.service.MediaStreamService;
import cn.tcsoft.drm.util.SnowflakeIdWorker;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.google.common.collect.ImmutableMap;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @author : hyman
 * create at:  2022/2/22  12:56
 * @description:
 */
@EnableConfigurationProperties(MediaStreamProperties.class)
@Service
@Slf4j
public class MediaStreamServiceImpl implements MediaStreamService {
    static String SLASH="/",ST="streamToken=",TS=".ts",YST=TS+"?",M3U8="m3u8",ST_KEY="streamToken:%s";
    @Resource
    MediaStreamProperties mediaStreamProperties;
    @Resource
    RedissonClient redissonClient;

    @Override
    public String getDecrypt(String identifier,String streamToken) {
        if(!isExpire(streamToken)){
            throw new ApiException(ApiErrorCode.STREAM_TOKEN_NOT_VALID);
        }
        return decryptStr(Paths.get(mediaStreamProperties.getDecryptPath()+identifier+SLASH+mediaStreamProperties.getKeyName()+mediaStreamProperties.getFileExtension()));
    }

    @Override
    public ResponseEntity<?> playlist(String identifier, String listName, String streamToken) {
        if(!isExpire(streamToken)){
            throw new ApiException(ApiErrorCode.STREAM_TOKEN_NOT_VALID);
        }
        String path=mediaStreamProperties.getDecryptPath()+identifier+SLASH+listName;
        Path filePath = Paths.get(path);
        if (filePath.toFile().exists()) {
            return mediaStream(filePath,identifier,streamToken);
        } else {
            throw new ApiException(ApiErrorCode.FILE_NOT_FOUND);
        }
    }

    @Override
    public ResponseEntity<?> codeRateSwitch(String identifier, String rate, String listName, String streamToken) {
        if(!isExpire(streamToken)){
            throw new ApiException(ApiErrorCode.STREAM_TOKEN_NOT_VALID);
        }
        Path filePath = Paths.get(mediaStreamProperties.getDecryptPath()+identifier+SLASH+rate+SLASH+listName);
        if (filePath.toFile().exists()) {
            if(filePath.toFile().getName().contains(TS)){
                return mediaStream(filePath);
            }
            return mediaStream(filePath,Objects.equals(identifier,"live")?(identifier+SLASH+rate):identifier,streamToken);
        } else {
            throw new ApiException(ApiErrorCode.FILE_NOT_FOUND);
        }
    }

    @Override
    public ResponseEntity<?> codeRateSwitch(String identifier, String live, String rate, String listName, String streamToken) {
        if(!isExpire(streamToken)){
            throw new ApiException(ApiErrorCode.STREAM_TOKEN_NOT_VALID);
        }
        Path filePath = Paths.get(mediaStreamProperties.getDecryptPath()+identifier+SLASH+live+SLASH+rate+SLASH+listName);
        if (filePath.toFile().exists()) {
            if(filePath.toFile().getName().contains(TS)){
                return mediaStream(filePath);
            }
            return mediaStream(filePath,identifier+SLASH+live,streamToken);
        } else {
            throw new ApiException(ApiErrorCode.FILE_NOT_FOUND);
        }
    }

    @Override
    public Map generalToken() {
        String streamToken=SnowflakeIdWorker.getUUID();
        //设置为30分钟有效期
        redissonClient.getBucket(String.format(ST_KEY,streamToken)).setAsync(streamToken,30, TimeUnit.MINUTES);
        Map map=ImmutableMap.of("streamToken",streamToken);
        return map;
    }

    @Override
    @SneakyThrows
    public Boolean isExpire(String streamToken){
        RBucket bucket=redissonClient.getBucket(String.format(ST_KEY,streamToken));
        return bucket.isExistsAsync().get();
    }

    private Path m3u8Replace(Path source,String identifier,String streamToken){
        Path tempPath = null;
        try {
            String tempM3u8=streamToken+M3U8;
            tempPath=Paths.get(tempM3u8);
            Files.createFile(tempPath);

            BufferedReader reader = Files.newBufferedReader(source, StandardCharsets.UTF_8);
            BufferedWriter writer = Files.newBufferedWriter(tempPath, StandardCharsets.UTF_8);
            String str;
            while (Objects.nonNull(str = reader.readLine())) {
                String newStr = str.replace(ST+identifier,ST+streamToken).replace(TS,YST+ST+streamToken);
                writer.write(newStr);
                writer.newLine();
            }
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tempPath;
    }

    @SneakyThrows
    private ResponseEntity<?> mediaStream(Path m3u8Path,String identifier,String streamToken){
        Path sourcePath = m3u8Path.getFileName();
        String fileName = "";
        if (Objects.nonNull(sourcePath)) {
            fileName = sourcePath.toString();
        }
        Path tempPath=m3u8Replace(m3u8Path,identifier,streamToken);
        ResponseEntity res= toMediaStream(fileName,tempPath,"application/vnd.apple.mpegurl");
        tempPath.toFile().delete();
        return res;
    }

    @SneakyThrows
    private ResponseEntity<?> toMediaStream(String fileName,Path path,String mediaType){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData(fileName, fileName);
        headers.setCacheControl(CacheControl.maxAge(604800, TimeUnit.SECONDS));

        ResponseEntity res= ResponseEntity
                .ok()
                .contentLength(path.toFile().length())
                .contentType(MediaType.parseMediaType(mediaType))
                .headers(headers)
                .body(new InputStreamResource(Files.newInputStream(path)));
        return res;
    }

    @SneakyThrows
    private ResponseEntity<?> mediaStream(Path filePath){
        Path fileNamePath = filePath.getFileName();
        String fileName = "";
        if (Objects.nonNull(fileNamePath)) {
            fileName = fileNamePath.toString();
        }
        return toMediaStream(fileName,filePath,"video/mp2t");
    }

    @SneakyThrows
    private String decryptStr(Path path) {
        RBucket<String> bucket=redissonClient.getBucket(path.toFile().getPath());
        if(bucket.isExists()){
            return bucket.get();
        }
        if(path.toFile().exists()) {
            BufferedReader reader = Files.newBufferedReader(path, StandardCharsets.UTF_8);
            String str;
            StringBuilder content = new StringBuilder();
            while(Objects.nonNull(str = reader.readLine())){
                content.append(str);
            }
            String decryptContent=content.toString().trim();
            bucket.set(decryptContent,24,TimeUnit.HOURS);
            return decryptContent;
        }else{
            throw new ApiException(ApiErrorCode.FILE_NOT_FOUND);
        }
    }
}