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
@ApiModel(value="TccLiveWatch对象", description="直播观看用户")
public class TccLiveWatch implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "直播id")
    private Long liveId;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "用户姓名")
    private String realName;

    @ApiModelProperty(value = "在线状态 0:离线 1:在线")
    private Integer onlineStatus;

    @ApiModelProperty(value = "在线时长，单位秒")
    private Integer onlineDuration;

    @ApiModelProperty(value = "入群时间")
    private Date joinTime;

    @ApiModelProperty(value = "退群时间")
    private Date leaveTime;

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;


}
