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
 * Metadata Schema
 * </p>
 *
 * @author ZYS 元数据
 * @since 2022-05-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_metadata_schema")
@ApiModel(value = "MetadataSchema对象", description = "Metadata Schema")
public class MetadataSchema extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "NAMESPACE")
    private String namespace;

    @ApiModelProperty(value = "SHORT ID")
    private String shortId;

}