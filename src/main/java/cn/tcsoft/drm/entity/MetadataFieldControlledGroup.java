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
 * Metadata property control
 * </p>
 *
 * @author ZYS 元数据
 * @since 2022-05-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_metadata_field_controlled_group")
@ApiModel(value = "MetadataFieldControlledGroup对象", description = "Metadata property control")
public class MetadataFieldControlledGroup extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "field id")
    private Long fieldId;

    @ApiModelProperty(value = "Controlled Field Group")
    private String controlledGroup;

    @ApiModelProperty(value = "Miscellaneous Attribute")
    private String controlledAttribute;

    @ApiModelProperty(value = "status")
    private String status;


}