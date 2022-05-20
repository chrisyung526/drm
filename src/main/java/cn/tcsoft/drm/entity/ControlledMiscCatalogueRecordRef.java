package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 权威记录书目关联表
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_controlled_misc_catalogue_record_ref")
@ApiModel(value = "ControlledMiscCatalogueRecordRef对象", description = "权威记录书目关联表")
public class ControlledMiscCatalogueRecordRef extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "权威记录 id")
    private Long controlledMiscId;

    @ApiModelProperty(value = "书目 ID")
    private Long catalogueRecordId;


}