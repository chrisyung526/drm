//package cn.tcsoft.drm.test.test;
//
//import cn.tcsoft.drm.enums.VideoFetchEnum;
//import cn.tcsoft.drm.util.tools.FileUtils;
//import cn.tcsoft.drm.util.tools.VideoUtils;
//import com.alibaba.fastjson.JSON;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//
//import java.io.File;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * 本机要有ffmpeg服务
// * @author : hyman
// * create at:  2021/11/2  15:57
// * @description: 视频处理
// */
//@Slf4j
//public class VideoProcessTest {
//    @SneakyThrows
//    public static void main(String[] args) {
//        log.info(System.getProperty("os.name"));
//        String path="/Users/hyman/Desktop/视频格式转换/";
//        File file=new File(path+"aaa.mp4");
//        Map<String, Object> map = new HashMap<>();
//        map.put("size", FileUtils.formatFileSize(file.length()));
//        map.put("name", file.getName());
////        map.put(VideoFetchEnum.DURATION.getCode(), VideoUtils.duration(path ,file.getName()));
////        map.put(VideoFetchEnum.COVER.getCode(),VideoUtils.cover(path ,file.getName()));
////        map.put(VideoFetchEnum.DEMO.getCode(),VideoUtils.demo(path ,file.getName()));
//        map.put(VideoFetchEnum.SUBTITLE.getCode(), VideoUtils.subtitle(path ,file.getName(),"/Users/hyman/Desktop/视频格式转换/aaa.ass"));
////        map.put(VideoFetchEnum.WATERMARK.getCode(),VideoUtils.watermark(path ,file.getName(),"/Users/hyman/Desktop/avatar.png"));
//       log.info(JSON.toJSONString(map));
//    }
//}