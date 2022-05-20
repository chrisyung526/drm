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
 * Theme Rel Collection
 * </p>
 *
 * @author ZYS 主题关联列表对象
 * @since 2022-05-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_theme_collection")
@ApiModel(value="ThemeCollection对象", description="Theme关联列表对象")
public class ThemeCollection extends BaseBO {

    private static final long serialVersionUID=1L;
    @ApiModelProperty(value = "Theme ID")
        private Long themeId;

    @ApiModelProperty(value = "Collection ID")
        private Long themeRelCollectionId;
}