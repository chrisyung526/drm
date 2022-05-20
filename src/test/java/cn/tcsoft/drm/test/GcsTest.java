//package cn.tcsoft.drm.test;
//
//import cn.tcsoft.drm.Constants;
//import com.alibaba.fastjson.JSON;
//import com.google.api.gax.core.FixedCredentialsProvider;
//import com.google.api.gax.longrunning.OperationFuture;
//import com.google.auth.oauth2.GoogleCredentials;
//import com.google.cloud.speech.v1p1beta1.RecognitionConfig;
//import com.google.cloud.speech.v1p1beta1.*;
//import com.google.cloud.storage.Storage;
//import com.google.cloud.storage.StorageOptions;
//import com.google.common.collect.ImmutableMap;
//import com.google.protobuf.ByteString;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang3.time.DurationFormatUtils;
//import org.springframework.util.ResourceUtils;
//
//import java.io.FileInputStream;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.List;
//import java.util.Map;
//
///**
// * 语言支持 : https://cloud.google.com/speech-to-text/docs/languages
// * 普通話 (香港)	cmn-Hans-HK	中文、普通话（香港简体）
// * 廣東話 (香港)	yue-Hant-HK	中文、粤语（香港繁体）
// * 普通话 (中国大陆)	cmn-Hans-CN	中文、普通话（中国简体）
// *
// * English (Great Britain)	en-GB	英语（英国）
// * English (United States)	en-US	英语（美国）
// */
///**
// * google sdk speech-to-text
// * 同步识别（REST 和 gRPC）将音频数据发送到 Speech-to-Text API，对该数据执行识别，并在所有音频处理完毕后返回结果。同步识别请求仅限于持续时间不超过 1 分钟的音频数据。
// *
// * 异步识别（REST 和 gRPC）将音频数据发送到 Speech-to-Text API 并启动长时间运行的操作。使用此操作，您可以定期轮询识别结果。异步请求可用于任何持续时间不超过 180 分钟的音频数据。
// *
// * 流式识别（仅限 gRPC）对 gRPC 双向流内提供的音频数据执行识别。流式传输请求专为实时识别（例如从麦克风采集实时音频）而设计。流式识别可以一边采集音频一边提供临时结果，例如实现在用户仍在讲话时显示结果。
// *
// */
//
///**
// * @author : hyman
// * create at:  2022/3/11  11:25
// * @description: google-cloud-speech 语音转文字
// */
//@Slf4j
//public class GcsTest {
//    static String targetLanguage = "yue-Hant-HK" ;
//    static String jsonPath="data/serviceAccountKey.json";
//    static String proxyHost="127.0.0.1";
//    static String proxyPort="19180";
//    static String outputStorageUri = "gs://tc_test_20220209/audio/transcripts/";
//
//    public static void main(String[] args) throws Exception {
//        System.setProperty("proxyHost", proxyHost);
//        System.setProperty("proxyPort", proxyPort);
//        syncRecognizeFile();
//    }
//
//
//    /**
//     * Performs speech recognition on raw PCM audio and prints the transcription.
//     *
//     */
//    @SneakyThrows
//    public static void syncRecognizeFile() throws Exception {
//        FileInputStream credentialsStream = new FileInputStream(jsonPath);
//        GoogleCredentials credentials = GoogleCredentials.fromStream(credentialsStream);
//        FixedCredentialsProvider credentialsProvider = FixedCredentialsProvider.create(credentials);
//        SpeechSettings settings = SpeechSettings.newBuilder().setCredentialsProvider(credentialsProvider).build();
//        try (SpeechClient speech = SpeechClient.create(settings)) {
//
//            // Configure request with local raw PCM audio
//            RecognitionConfig config =
//                    RecognitionConfig.newBuilder()
//                            .setEncoding(RecognitionConfig.AudioEncoding.MP3)
//                            .setLanguageCode(targetLanguage)
//                            .setSampleRateHertz(Constants.HERTZ_MAP.get("mp3"))
//                            .setEnableAutomaticPunctuation(true) //自动加标点符号
//                            .setEnableWordTimeOffsets(true) //自动加时间戳
//                            .build();
//            //RecognitionAudio audio = RecognitionAudio.newBuilder().setContent(audioBytes).build();
//            RecognitionAudio audio = RecognitionAudio.newBuilder().setUri("gs://tc_test_20220209/audio/audio-files/test.mp3").build();
//
//
//            // Pass in the URI of the Cloud Storage bucket to hold the transcription
//            TranscriptOutputConfig outputConfig =
//                    TranscriptOutputConfig.newBuilder().setGcsUri(outputStorageUri+System.currentTimeMillis()+".json").build();
//
//            LongRunningRecognizeRequest request =
//                    LongRunningRecognizeRequest.newBuilder()
//                            .setConfig(config)
//                            .setAudio(audio)
//                            .setOutputConfig(outputConfig)
//                            .build();
//
//
//            OperationFuture<LongRunningRecognizeResponse, LongRunningRecognizeMetadata> future =
//                    speech.longRunningRecognizeAsync(request);
//            log.debug("任务已提交...");
//            future.get();
////            while (!response.isDone()) {
////                //log.info(JSON.toJSONString(response));
////                System.out.println("Waiting for response...");
////                Thread.sleep(10000);
////            }
//
//            //log.info(JSON.toJSONString(response));
//            // Use blocking call to get audio transcript
//
////            List<SpeechRecognitionResult> results = future.get().getResultsList();
////            StringBuilder sb=new StringBuilder();
////            for (SpeechRecognitionResult result : results) {
////                // There can be several alternative transcripts for a given chunk of speech. Just use the
////                // first (most likely) one here.
////                SpeechRecognitionAlternative alternative = result.getAlternativesList().get(0);
////                List<WordInfo> wordsList=alternative.getWordsList();
////                Long startTime=wordsList.get(0).getStartTime().getSeconds()*1000,endTime=wordsList.get(wordsList.size()-1).getEndTime().getSeconds()*1000;
////                String start= DurationFormatUtils.formatDuration(startTime,"HH:mm:ss.SS");
////                String end=DurationFormatUtils.formatDuration(endTime,"HH:mm:ss.SS");
////                sb.append(alternative.getTranscript()).append(".");
////                log.info(String.format("%s,%s,%s",start,end,alternative.getTranscript()));
////            }
////            log.info(sb.toString());
//        }
//    }
//}