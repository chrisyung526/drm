package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.util.Date;

import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统日志表
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-03-07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_sys_log")
@ApiModel(value="SysLog对象", description="系统日志表")
public class SysLog extends BaseBO {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "请求参数")
    private String parameter;

    @ApiModelProperty(value = "模块名称")
    String moduleName;

    @ApiModelProperty(value = "接口描述")
    private String description;

    @ApiModelProperty(value = "类型 1.admin接口，2.client-api接口，3.open-api接口，4.http第三方接口")
    private String type;

    @ApiModelProperty(value = "等级：INFO ERROR")
    private String level;

    @ApiModelProperty(value = "系统名称：1>MMIS 2>香港记忆 ")
    private String systemName;

    @ApiModelProperty(value = "错误日志")
    private String msg;

    @ApiModelProperty(value = "访问ip")
    private String requestIp;

    @ApiModelProperty(value = "访问时长")
    private Long spendTime;

    @ApiModelProperty(value = "开始时间")
    private Date startTime;

    @ApiModelProperty(value = "结束时间")
    private Date endTime;

    @ApiModelProperty(value = "访问终端")
    String userAgent;

    @ApiModelProperty(value = "请求地址")
    String requestUrl;



}
