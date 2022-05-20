//package cn.tcsoft.drm.test;
//
//import cn.tcsoft.drm.Constants;
//import com.google.auth.oauth2.GoogleCredentials;
//import com.google.cloud.WriteChannel;
//import com.google.cloud.speech.v1.LongRunningRecognizeResponse;
//import com.google.cloud.speech.v1.SpeechRecognitionAlternative;
//import com.google.cloud.speech.v1.SpeechRecognitionResult;
//import com.google.cloud.speech.v1.WordInfo;
//import com.google.cloud.storage.*;
//import com.google.protobuf.util.JsonFormat;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang3.time.DurationFormatUtils;
//import org.json.JSONObject;
//
//import java.io.*;
//import java.nio.ByteBuffer;
//import java.nio.charset.StandardCharsets;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.UUID;
//
///**
// * @author : hyman
// * create at:  2022/3/14  10:03
// * @description:
// */
//@Slf4j
//public class GoogleStorage {
//    static String proxyHost="127.0.0.1";
//    static String proxyPort="19180";
//    static String bucketName="tc_test_20220209";
//    static String fileFolder="audio/audio-files/";
//    static String gsPath="gs://%s/%s%s";
//
//
//    final static String OC="[Script Info]\n" +
//            "ScriptType: v4.00+\n" +
//            "PlayResX: 852\n" +
//            "PlayResY: 480\n" +
//            "WrapStyle: 2\n" +
//            "\n" +
//            "[V4+ Styles]\n" +
//            "Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding\n" +
//            "Style: Original,FandolHei,37,&Hffffff,&Hffffffff,&Hntrepansra,&H000000,0,0,0,0,100,100,0.0,0,0,0,1,2,10,10,10,0\n" +
//            "\n" +
//            "[Events]\n" +
//            "Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text\n";
//
//    @SneakyThrows
//    public static void main(String[] args) {
//        System.setProperty("proxyHost", proxyHost);
//        System.setProperty("proxyPort", proxyPort);
//
//
//        //uploadFile();
//        //upload(Paths.get("/Users/hyman/Desktop/视频格式转换/test.mp3"));
//        getContent();
//
//
//    }
//
//    @SneakyThrows
//    public static void uploadFile(){
//        FileInputStream serviceAccount =
//                new FileInputStream("data/serviceAccountKey.json");
//        Storage storageService=StorageOptions.newBuilder()
//                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
//                .build()
//                .getService();
//
//
//        //gs://tc_test_20220209/audio/audio-files/AD.wav
//        String objectName;
//        File file=new File("/Users/hyman/Desktop/SpeechToText/VD18007.mp4");
//
//        objectName=file.getName();
//        //文件上传
//        Bucket bucket=storageService.get(bucketName);
//        bucket.create(fileFolder+objectName, new FileInputStream(file));
//
//        log.info(String.format(gsPath,bucketName,fileFolder,objectName));
//    }
//
//
//    public static void upload(Path uploadFrom) throws IOException {
//        log.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//        FileInputStream serviceAccount =
//                new FileInputStream("data/serviceAccountKey.json");
//        Storage storage=StorageOptions.newBuilder()
//                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
//                .build()
//                .getService();
//        String objectName=uploadFrom.toFile().getName();
//        BlobInfo blobInfo= BlobInfo.newBuilder(bucketName,fileFolder+objectName).setContentType(Constants.AUDIO_MAP.get(objectName.split("\\.")[1])).build();
//        if (Files.size(uploadFrom) > 2_000_000) {
//            // When content is not available or large (2MB or more) it is recommended
//            // to write it in chunks via the blob's channel writer.
//            try (WriteChannel writer = storage.writer(blobInfo)) {
//                byte[] buffer = new byte[1024*4];
//                try (InputStream input = Files.newInputStream(uploadFrom)) {
//                    int limit;
//                    while ((limit = input.read(buffer)) >= 0) {
//                        try {
//                            writer.write(ByteBuffer.wrap(buffer, 0, limit));
//                        } catch (Exception ex) {
//                            ex.printStackTrace();
//                        }
//                    }
//                }
//            }
//        } else {
//            byte[] bytes = Files.readAllBytes(uploadFrom);
//            // create the blob in one request.
//            storage.create(blobInfo, bytes);
//        }
//        log.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//        log.info(String.format(gsPath,bucketName,fileFolder,objectName));
//    }
//    @SneakyThrows
//    public static void getContent() throws IOException {
//        StringBuilder fileContent=new StringBuilder("WEBVTT\n\n");
//
//        FileInputStream serviceAccount =
//                new FileInputStream("data/serviceAccountKey.json");
//        Storage storage=StorageOptions.newBuilder()
//                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
//                .build()
//                .getService();
//        // Get blob given bucket and object name
//        BlobId blobId=BlobId.of(bucketName, "audio/transcripts/1650262236762.json");
//        Blob blob = storage.get(blobId);
//        // Create json object
//        JSONObject jsonObject = new JSONObject(new String(blob.getContent(), "UTF-8"));
//
//        // Specefy the proto type message
//        LongRunningRecognizeResponse.Builder builder = LongRunningRecognizeResponse.newBuilder();
//        // Construct a parser
//        JsonFormat.Parser parser = JsonFormat.parser().ignoringUnknownFields();
//
//        // Parses from JSON into a protobuf message.
//        parser.merge(jsonObject.toString(), builder);
//
//        // Get the converted values
//        LongRunningRecognizeResponse storageResponse = builder.build();
//
//        List<SpeechRecognitionResult> results = storageResponse.getResultsList();
//        StringBuilder sb=new StringBuilder();
//        for (SpeechRecognitionResult result : results) {
//            // There can be several alternative transcripts for a given chunk of speech. Just use the
//            // first (most likely) one here.
//            SpeechRecognitionAlternative alternative = result.getAlternativesList().get(0);
//            List<WordInfo> wordsList=alternative.getWordsList();
//            Long startTime=wordsList.get(0).getStartTime().getSeconds()*1000,endTime=wordsList.get(wordsList.size()-1).getEndTime().getSeconds()*1000;
//            String start= DurationFormatUtils.formatDuration(startTime,"HH:mm:ss.SS");
//            String end=DurationFormatUtils.formatDuration(endTime,"HH:mm:ss.SS");
//            sb.append(alternative.getTranscript()).append(".");
//            for(WordInfo info:wordsList) {
//                //fileContent.append("Dialogue: 3," + DurationFormatUtils.formatDuration(info.getStartTime().getSeconds()*1000,"HH:mm:ss.SS").substring(0, start.length() - 1) + "," + DurationFormatUtils.formatDuration(info.getEndTime().getSeconds()*1000,"HH:mm:ss.SS").substring(0, end.length() - 1) + ",Original,,31,31,31,," + info.getWord()).append("\n");
//                fileContent.append(DurationFormatUtils.formatDuration(info.getStartTime().getSeconds()*1000,"HH:mm:ss.SS"));
//                fileContent.append(" --> ");
//                fileContent.append(DurationFormatUtils.formatDuration(info.getEndTime().getSeconds()*1000,"HH:mm:ss.SS"));
//                fileContent.append("\n");
//                fileContent.append(info.getWord());
//                fileContent.append("\n\r");
//            }
//            log.info(String.format("%s,%s,%s",start,end,alternative.getTranscript()));
//        }
//        log.info(sb.toString());
//        Files.write(Paths.get(UUID.randomUUID().toString().replace("-","")+".vtt"),fileContent.toString().getBytes(StandardCharsets.UTF_8));
//
//        //storage.delete(blobId);
//
//    }
//
//}