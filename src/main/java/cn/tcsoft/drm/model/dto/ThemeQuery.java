package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author ZYS 2022-05-10 主题分页对象 + 条件查询
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "主题高级查询对象",description = "用于对数据进行条件查询")
public class ThemeQuery extends QueryPageDO {

    /**
     * 主题 ID
     */
    @ApiModelProperty(value = "Theme ID")
    private String themeId;

    /**
     * 主题中文名称
     */
    @ApiModelProperty(value = "Name (Chinese)")
    private String chiName;

    /**
     * 主题英文名称
     */
    @ApiModelProperty(value = "Name (English)")
    private String engName;

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

    /**
     * 词库数据创建的时间范围
     */
    @ApiModelProperty(value = "创建的开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginCreateDate;

    @ApiModelProperty(value = "创建的结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endCreateDate;

    /**
     * 词库最后修改的时间
     */
    @ApiModelProperty(value = "最后的创建的开始时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginLastCreateDate;

    @ApiModelProperty(value = "最后的创建的结束时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endLastCreateDate;
}
