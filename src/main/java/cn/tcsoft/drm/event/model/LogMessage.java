package cn.tcsoft.drm.event.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author : hyman
 * create at:  2022/3/7  10:23
 * @description: 日志信息
 */
@Data
public class LogMessage implements Serializable {
    @ApiModelProperty("接口请求开始时间")
    Long startTime;
    @ApiModelProperty("接口请求结束时间")
    Long endTime;
    @ApiModelProperty("接口请求时间")
    Long spendTime;
    @ApiModelProperty("接口入参")
    String parameter;
    @ApiModelProperty("模块名称")
    String moduleName;
    @ApiModelProperty("接口描述")
    String description;
    @ApiModelProperty("类型")
    String type;
    @ApiModelProperty("等级")
    String level;
    @ApiModelProperty("系统名称")
    String systemName;
    @ApiModelProperty("访问ip")
    String requestIp;
    @ApiModelProperty("访问消息")
    String msg;
    @ApiModelProperty("访问终端")
    String userAgent;
    @ApiModelProperty("访问地址")
    String requestUrl;

}