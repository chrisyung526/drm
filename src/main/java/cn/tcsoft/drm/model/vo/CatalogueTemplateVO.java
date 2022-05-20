package cn.tcsoft.drm.model.vo;

import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @author ZYS 编目管理VO对象
 */

@Accessors(chain = true)
@ApiModel(value="CatalogueTemplateVO对象", description="元数据VO对象")
@ToString
@Data
@EqualsAndHashCode(callSuper = true)
public class CatalogueTemplateVO extends BaseBO {

    @ApiModelProperty(value = "Template Name Template Name")
    private String templateName;

    @ApiModelProperty(value = "Template Description Template Description")
    private String templateDescrip;

    @ApiModelProperty(value = "Material Type(Source Material Type Table)")
    private String materialType;

    @ApiModelProperty(value = "Metadata Field Id ID of the Dublin Core field（biz_mmis_metadata_field")
    private Long metadataFieldId;

    @ApiModelProperty(value = "Value of the DC field")
    private String textValue;

    @ApiModelProperty(value = "Place Sequence for repeated fields")
    private Long place;

    @ApiModelProperty(value = "Authority Reference	Authority ID if the value is from Authority record")
    private String authority;

    @ApiModelProperty(value = "MetadataFieldVO 元数据VO对象")
    private MetadataFieldVO metadataFieldVO;
}
