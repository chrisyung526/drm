package cn.tcsoft.drm.ai.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author : laimin
 * create at:  2022/4/15  16:44
 * @description: Ai接口入参
 */
@Data
public class AiDTO implements Serializable {
    @ApiModelProperty("gs路径")
    String gsPath;
    @ApiModelProperty("语种")
    String language;
    @ApiModelProperty("文件路径")
    String filePath;
    @ApiModelProperty("是否需要上传")
    Boolean isUpload;
}