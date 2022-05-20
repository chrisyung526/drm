package cn.tcsoft.drm.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.*;
import java.io.Serializable;

/**
 * @author : laimin
 * create at:  2022/3/24  15:26
 * @description: 分页查询
 */
@Data
@ApiModel(description = "分页模块")
public class QueryPageDO implements Serializable {
    @ApiModelProperty(value = "当前页(current)", required = true, example = "1")
    @NotNull(message = "Current cannot be empty")
    @DecimalMin(value = "0",message = "Minimum page size is 0")
    private Long current;
    @ApiModelProperty(value = "分页条数(size)", required = true, example = "20")
    @NotNull(message = "Size cannot be empty")
    @DecimalMax(value = "100", message = "Maximum number of pagination bars is 100")
    private Long size;
    @ApiModelProperty(value = "排序字段", example = "createTime")
    private String sortColumns;
    @ApiModelProperty(value = "是否逆序", example = "true")
    private Boolean sortDesc;
}