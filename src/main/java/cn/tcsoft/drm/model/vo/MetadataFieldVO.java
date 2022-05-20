package cn.tcsoft.drm.model.vo;

import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

/**
 * @author ZYS 元数据VO对象
 */
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value="MetadataFieldVO对象", description="元数据VO对象")
@ToString
@Data
public class MetadataFieldVO extends BaseBO {

    @ApiModelProperty(value = "METADATA SCHEMA ID sourcebiz_mmis_metadata_schema")
    private Long metadataSchemaId;

    @ApiModelProperty(value = "field id")
    private Long fieldId;

    @ApiModelProperty(value = "ELEMENT")
    private String element;

    @ApiModelProperty(value = "QUALIFIER")
    private String qualifier;

    @ApiModelProperty(value = "SCOPE NOTE")
    private String scopeNote;

    @ApiModelProperty(value = "Metadata Type")
    private String type;

    @ApiModelProperty(value = "Field Length")
    private Integer length;

    @ApiModelProperty(value = "Metadata Effective Scope")
    private String effectiveScope;

    @ApiModelProperty(value = "Content Cover Page Label")
    private String contentCoverPageLabel;

    @ApiModelProperty(value = "Content Cover Page Label(Chinese)")
    private String contentCoverPageLabelChi;

    @ApiModelProperty(value = "Content Cover Page Label(English)")
    private String contentCoverPageLabelEng;

    @ApiModelProperty(value = "Content Highlight Label")
    private String contentHighlightLabel;

    @ApiModelProperty(value = "Content Highlight Label(Chinese)")
    private String contentHighlightLabelChi;

    @ApiModelProperty(value = "Content Highlight Label(English)")
    private String contentHighlightLabelEng;

    @ApiModelProperty(value = "Controlled Field(Y N)")
    private String controlledField;

    @ApiModelProperty(value = "Controlled Field Group")
    private String controlledGroup;

    @ApiModelProperty(value = "Miscellaneous Attribute")
    private String controlledAttribute;

    @ApiModelProperty(value = "Brief(1:Yes 0:No)")
    private String brief;

    @ApiModelProperty(value = "Brief Order")
    private Integer orderBrief;

    @ApiModelProperty(value = "Detail(1:Yes 0:No)")
    private String detail;

    @ApiModelProperty(value = "Detail Order")
    private Integer orderDetail;

    @ApiModelProperty(value = "Hit List(1:Yes 0:No)")
    private String hitList;

    @ApiModelProperty(value = "Hit List Order")
    private Integer orderHitList;

    @ApiModelProperty(value = "Lock Tag")
    private String lockTag;

    @ApiModelProperty(value = "DC Element Dublin Core Element")
    private String dcElement;

    @ApiModelProperty(value = "DC Qualifier Dublin Core Qualifier")
    private String dcQualifier;

    @ApiModelProperty(value = "Referenced Table")
    private String refTableName;

    @ApiModelProperty(value = "Repeatable Signifies if field is repeatable on DC specs")
    private String repeatable;

    @ApiModelProperty(value = "Mandatory Signifies if field is mandatory on DC specs")
    private String dcMandatory;

    @ApiModelProperty(value = "Display Field	Signifies if field is displayed in content cover page")
    private String displayField;

    @ApiModelProperty(value = "Internal	Signifies if field is an internal field")
    private String internal;

    @ApiModelProperty(value = "NAMESPACE")
    private String namespace;

    @ApiModelProperty(value = "SHORT ID")
    private String shortId;

    @ApiModelProperty(value = "status")
    private String status;

    @ApiModelProperty(value = "updated_by_system(1:Yes 0:No)")
    private String updatedBySystem;
}
