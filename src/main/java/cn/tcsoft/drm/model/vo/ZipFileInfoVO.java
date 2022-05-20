package cn.tcsoft.drm.model.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @author : hyman
 * create at:  2022/3/3  17:27
 * @description:
 */
@Data
@Builder
public class ZipFileInfoVO implements Serializable {
    @ApiModelProperty("文件名称")
    private String fileName;
    @ApiModelProperty("文件路径")
    private String fileSuffix;
    @ApiModelProperty("文件路径")
    private String filePath;
    @ApiModelProperty("文件大小")
    private Long fileSize;
    @ApiModelProperty("压缩文件名称")
    private String fromZipName;
    @ApiModelProperty("文件类型")
    private String fileType;
}