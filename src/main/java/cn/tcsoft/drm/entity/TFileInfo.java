package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 文件模型
 *
 * @author 洋葱骑士
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "DRM_file对象", description = "")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TFileInfo implements Serializable {

    private static final long serialVersionUID = 6969462437970901728L;

    //附件编号
    private String id;

    //附件名称
    private String fileName;

    //附件MD5标识
    private String identifier;

    //附件总大小
    private Long totalSize;

    //视频时长（秒）
    private Long duration;

    @TableField(exist = false)
    private String totalSizeName;

    //附件类型
    private String type;

    //附件存储地址
    private String location;

    //删除标志
    private String delFlag;

    //文件所属目标（项目、学生、档案等，预留字段）
    private String refProjectId;

    //上传人
    private String uploadBy;

    //上传时间
    private Date uploadTime;

    private Date updateTime;

    @TableField(exist = false)
    private String uploadTimeString;

    @TableField(exist = false)
    private String updateTimeString;

    @ApiModelProperty(value = "M3u8地址")
    private String m3u8Url;

    @ApiModelProperty(value = "文件状态 1：解析中，2：解析完成")
    private Integer fileState;
    //解析时间
    @TableField(exist = false)
    private String resolutionTime;

    public void setTotalSize(Long totalSize) {
        this.totalSize = totalSize;
        if (1024 * 1024 > this.totalSize && this.totalSize >= 1024) {
            this.totalSizeName = String.format("%.2f", this.totalSize.doubleValue() / 1024) + "KB";
        } else if (1024 * 1024 * 1024 > this.totalSize && this.totalSize >= 1024 * 1024) {
            this.totalSizeName = String.format("%.2f", this.totalSize.doubleValue() / (1024 * 1024)) + "MB";
        } else if (this.totalSize >= 1024 * 1024 * 1024) {
            this.totalSizeName = String.format("%.2f", this.totalSize.doubleValue() / (1024 * 1024 * 1024)) + "GB";
        } else {
            this.totalSizeName = this.totalSize.toString() + "B";
        }
    }

}
