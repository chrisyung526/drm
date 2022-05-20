package cn.tcsoft.drm.ai;

import cn.tcsoft.drm.ai.model.AiDTO;
import cn.tcsoft.drm.ai.model.AiVO;

/**
 * ai人工智能接口对接
 * stt 语音转文字
 * ocr 图片文字识别
 * @author hyman
 * @date 2022-04-15
 */
public interface ArtificialIntelligenceService {
    /**
     * 语音转文字
     * @param dto 入参
     * @return
     */
    AiVO stt(AiDTO dto);

    /**
     * 图片识别文字
     * @return
     */
    String ocr(String imagePath);
}
