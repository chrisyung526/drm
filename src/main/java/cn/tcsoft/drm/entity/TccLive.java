package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;


@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "TccLive对象", description = "直播表")
public class TccLive implements Serializable {

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;
    @ApiModelProperty(value = "房间ID")
    private String roomId;
    @ApiModelProperty(value = "客户端id")
    private String clientId;
    @ApiModelProperty(value = "直播标题")
    private String liveTitle;
    @ApiModelProperty(value = "开播时间")
    private Date startTime;
    @ApiModelProperty(value = "结束时间")
    private Date endTime;
    @ApiModelProperty(value = "状态 0未开始 1直播中 2已结束 3已取消 4已下架")
    private Integer status;
    @ApiModelProperty(value = "时长，单位秒")
    private Integer duration;
    private String createBy;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;


}
