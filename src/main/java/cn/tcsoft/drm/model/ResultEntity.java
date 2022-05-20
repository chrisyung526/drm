package cn.tcsoft.drm.model;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.apache.poi.ss.formula.functions.T;

import java.time.Instant;

/**
 * @author : laimin
 * create at:  2022/5/12  17:10
 * @description:
 *  * 返回实体类，其中data数据主要由DTO和AO构成:
 *  * DTO: 数据传输对象，Service或Manager向外传输的对象。
 *  * AO: 应用对象，在Web层与Service层之间抽象的复用对象模型，极为贴近展示层，复用度不高
 */
@Setter
@Getter
@Accessors(chain = true)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@ApiModel(description = "API请求的返回模型，所有rest正常都返回该类的对象")
public class ResultEntity {
    @ApiModelProperty(value = "处理结果code", required = true)
    private Long code;
    @ApiModelProperty(value = "处理结果描述信息")
    private String message;
    @ApiModelProperty(value = "请求结果生成时间戳")
    private Long time;
    @ApiModelProperty(value = "处理结果数据信息")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Object data;

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}