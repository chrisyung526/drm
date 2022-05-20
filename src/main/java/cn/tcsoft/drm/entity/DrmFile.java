package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author CodeGenerator
 * @since 2021-12-24
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value = "DRM_file对象", description = "")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DrmFile extends BaseBO {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "文件分类")
    private String fileType;

    @ApiModelProperty(value = "文件地址")
    private String fileUrl;

    @ApiModelProperty(value = "源文件名称")
    private String fileText;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "M3u8地址")
    private String m3u8Url;

    @ApiModelProperty(value = "文件状态 1：解析中，2：解析完成")
    private Integer fileState;

    @ApiModelProperty(value = "文件MD5值")
    private String fileMd5;


}
