package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;


/**
 * @author ZYS 元数据VO对象高级查询
 */
@Data
@ApiModel(value = "元数据高级查询对象",description = "用于对元数据进行条件查询")
public class MetadataFieldVOQuery extends QueryPageDO {

    @ApiModelProperty(value = "Controlled Field Group")
    private String controlledGroup;

    @ApiModelProperty(value = "Controlled Field(Y N)")
    private String controlledField;

    @ApiModelProperty(value = "Metadata Type")
    private String type;

    @ApiModelProperty(value = "Metadata Effective Scope")
    private String effectiveScope;
    /**
     * 使用in
     */
    @ApiModelProperty(value = "Display Field	Signifies if field is displayed in content cover page")
    private List<String> displayField;

    @ApiModelProperty(value = "Repeatable Signifies if field is repeatable on DC specs")
    private String repeatable;

    @ApiModelProperty(value = "Mandatory Signifies if field is mandatory on DC specs")
    private String dcMandatory;

    @ApiModelProperty(value = "updated_by_system(1:Yes 0:No)")
    private String updatedBySystem;

    @ApiModelProperty(value = "status")
    private String status;

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
}
