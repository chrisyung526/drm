package cn.tcsoft.drm.xlsx.model;

import com.alibaba.excel.annotation.ExcelProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 元数据 Excel模板对象
 * @author ZYS
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@ApiModel(value="CatalogueTemplateVOModel Excel模板对象", description="")
public class CatalogueTemplateVOModel {

    @ApiModelProperty(value = "主键id")
    @ExcelProperty(value = "TemplateId")
    private Long id;

    @ApiModelProperty(value = "Template Name Template Name")
    private String templateName;

    @ApiModelProperty(value = "Material Type(Source Material Type Table)")
    private String materialType;

    @ApiModelProperty(value = "Template Description Template Description")
    private String templateDescrip;

    @ApiModelProperty(value = "创建用户")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createDt;

    @ApiModelProperty(value = "更新用户")
    private String lastUpdBy;

    @ApiModelProperty(value = "更新时间")
    private Date lastUpdDt;

    /**
     * 用于设置在Excel导出的字段
     * @return field字段set集合
     */
    public static Set<String> setField(){
        Set<String> field = new HashSet<>();
        field.add("id");
        field.add("templateName");
        field.add("materialType");
        field.add("templateDescrip");
        field.add("createBy");
        field.add("createDt");
        field.add("lastUpdBy");
        field.add("lastUpdDt");
        return field;
    }
}
