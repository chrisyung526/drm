package cn.tcsoft.drm.xlsx.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 元数据 Excel模板对象
 * @author ZYS
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@ApiModel(value="MetadtaFieldVOModel Excel模板对象", description="")
public class MetadtaFieldVOModel {

    @ApiModelProperty(value = "METADATA SCHEMA ID sourcebiz_mmis_metadata_schema")
    private Long metadataSchemaId;

    @ApiModelProperty(value = "field id")
    private Long fieldId;

    @ApiModelProperty(value = "ELEMENT")
    private String element;

    @ApiModelProperty(value = "QUALIFIER")
    private String qualifier;

    @ApiModelProperty(value = "Miscellaneous Attribute")
    private String controlledAttribute;

    @ApiModelProperty(value = "Metadata Type")
    private String type;

    @ApiModelProperty(value = "Metadata Effective Scope")
    private String effectiveScope;

    @ApiModelProperty(value = "Display Field	Signifies if field is displayed in content cover page")
    private String displayField;

    @ApiModelProperty(value = "Mandatory Signifies if field is mandatory on DC specs")
    private String dcMandatory;

    @ApiModelProperty(value = "Repeatable Signifies if field is repeatable on DC specs")
    private String repeatable;

    @ApiModelProperty(value = "Controlled Field(Y N)")
    private String controlledField;

    @ApiModelProperty(value = "Controlled Field Group")
    private String controlledGroup;

    @ApiModelProperty(value = "updated_by_system(1:Yes 0:No)")
    private String updatedBySystem;

    @ApiModelProperty(value = "status")
    private String status;

}
