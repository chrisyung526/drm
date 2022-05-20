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
 * Catalogue Template Field
 * </p>
 *
 * @author ZYS 编目管理
 * @since 2022-05-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_catalogue_template_field")
@ApiModel(value="CatalogueTemplateField对象", description="Catalogue Template Field")
public class CatalogueTemplateField extends BaseBO {

    private static final long serialVersionUID=1L;
    @ApiModelProperty(value = "Template Id	ID of the parent Catalogue Template")
        private Long templateId;

    @ApiModelProperty(value = "Metadata Field Id	ID of the Dublin Core field（biz_mmis_metadata_field")
        private Long metadataFieldId;

    @ApiModelProperty(value = "Value of the DC field")
        private String textValue;

    @ApiModelProperty(value = "Place	Sequence for repeated fields")
        private Long place;

    @ApiModelProperty(value = "Authority Reference	Authority ID if the value is from Authority record")
        private String authority;



}