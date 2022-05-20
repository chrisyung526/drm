package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author ZYS 编目管理VO对象
 */
@Data
@ApiModel(value = "编目管理高级查询对象",description = "用于对数据进行条件查询")
public class CatalogueTemplateVOQuery extends QueryPageDO {

    @ApiModelProperty(value = "数据主键")
    private Long templateId;

    @ApiModelProperty(value = "Template Name Template Name")
    private String templateName;

    @ApiModelProperty(value = "Material Type(Source Material Type Table)")
    private String materialType;

    @ApiModelProperty(value = "Template Description Template Description")
    private String templateDescrip;

    /**
     * 编目数据创建的时间范围
     */
    @ApiModelProperty(value = "创建的开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginCreateDate;

    @ApiModelProperty(value = "创建的结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endCreateDate;

    /**
     * 编目最后修改的时间
     */
    @ApiModelProperty(value = "最后的创建的开始时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginLastCreateDate;

    @ApiModelProperty(value = "最后的创建的结束时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endLastCreateDate;

}
