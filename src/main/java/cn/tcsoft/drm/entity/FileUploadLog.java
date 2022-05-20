package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文件上传日志表
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-01-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_file_upload_log")
@ApiModel(value="FileUploadLog对象", description="文件上传日志表")
public class FileUploadLog extends BaseBO {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "文件源名称")
    private String fileSourceName;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "文件类型")
    private String fileType;

    @ApiModelProperty(value = "文件大小")
    private Long fileSize;

    @ApiModelProperty(value = "文件访问地址")
    private String filePath;


}
