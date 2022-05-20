package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ZYS 主题列表分页对象 2022-5-11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "主题列表高级查询对象",description = "用于对数据进行条件查询")
public class ThemeCollectionQuery extends QueryPageDO {
    /**
     * 主题描述中文
     */
    @ApiModelProperty(value = "Description (Chinese)")
    private String chiDescription;

    /**
     * 主题描述英文
     */
    @ApiModelProperty(value = "Description (English)")
    private String engDescription;

}
