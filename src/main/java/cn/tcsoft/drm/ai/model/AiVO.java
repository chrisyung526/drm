package cn.tcsoft.drm.ai.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @author : laimin
 * create at:  2022/4/15  16:35
 * @description: 识别结果
 */
@Data
@Builder
public class AiVO implements Serializable {
    @ApiModelProperty("识别源内容")
    private String sourceContent;
    @ApiModelProperty("过滤后的内容")
    private String content;
}