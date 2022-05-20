package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author CodeGenerator
 * @since 2021-12-24
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@ApiModel(value="MmisMetadata对象", description="")
public class MmisMetadata extends BaseBO {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "分类")
    private String category;

    @ApiModelProperty(value = "bibNo")
    private String bibNo;

    @ApiModelProperty(value = "metadataField")
    private String metadataField;

    @ApiModelProperty(value = "sequence")
    private String sequence;

    @ApiModelProperty(value = "value")
    private String value;


}
