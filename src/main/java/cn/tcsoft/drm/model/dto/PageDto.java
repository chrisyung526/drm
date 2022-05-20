package cn.tcsoft.drm.model.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author : hyman
 * create at:  2022/2/11  09:51
 * @description: 分页查询
 */
@Data
public class PageDto {
    @ApiModelProperty(value = "当前页",example = "1")
    private long current = 1L;
    @ApiModelProperty(value = "每页条数",example = "20")
    private long size = 20L;
    @ApiModelProperty(value = "排序字段")
    private String sortColumns;
    @ApiModelProperty(value = "是否逆序")
    private Boolean sortDesc = false;
}