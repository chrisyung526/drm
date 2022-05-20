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
 * Catalogue Template
 * </p>
 *
 * @author ZYS 编目管理
 * @since 2022-05-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_catalogue_template")
@ApiModel(value="CatalogueTemplate对象", description="Catalogue Template")
public class CatalogueTemplate extends BaseBO {

    private static final long serialVersionUID=1L;
    @ApiModelProperty(value = "Template Name Template Name")
        private String templateName;

    @ApiModelProperty(value = "Template Description Template Description")
        private String templateDescrip;

    @ApiModelProperty(value = "Material Type(Source Material Type Table)")
        private String materialType;

}