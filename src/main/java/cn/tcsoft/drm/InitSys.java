package cn.tcsoft.drm;

import cn.tcsoft.drm.ai.ArtificialIntelligenceService;
import cn.tcsoft.drm.ai.model.AiDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author : laimin
 * create at:  2022/4/15  17:02
 * @description: 初始化系统
 */
@Component
@Slf4j
public class InitSys implements CommandLineRunner {
    @Resource
    ArtificialIntelligenceService aiService;

    @Override
    public void run(String... args) throws Exception {
//        AiDTO dto=new AiDTO();
//        dto.setGsPath("gs://tc_test_20220209/audio/audio-files/AD21040.mp3");
//        dto.setLanguage("yue-Hant-HK");
//        dto.setFilePath("/Users/hyman/Desktop/视频格式转换/output.mp3");
//        dto.setIsUpload(Boolean.TRUE);
//        aiService.stt(dto);
    }
}