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
 * Metadata Properties Display
 * </p>
 *
 * @author ZYS 元数据
 * @since 2022-05-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_metadata_field_display")
@ApiModel(value = "MetadataFieldDisplay对象", description = "Metadata Properties Display")
public class MetadataFieldDisplay extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "field id")
    private Long fieldId;

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

    @ApiModelProperty(value = "updated_by_system(1:Yes 0:No)")
    private String updatedBySystem;

}