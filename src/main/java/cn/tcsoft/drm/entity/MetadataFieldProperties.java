package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * Metadata Field Properties
 * </p>
 *
 * @author ZYS 元数据
 * @since 2022-05-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_metadata_field_properties")
@ApiModel(value = "MetadataFieldProperties对象", description = "Metadata Field Properties")
public class MetadataFieldProperties extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "field id")
    private Long fieldId;

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



}