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
 * Speech to Text
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-04-18
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_item_stt")
@ApiModel(value="ItemStt对象", description="Speech to Text")
public class ItemStt extends BaseBO {

    private static final long serialVersionUID=1L;
    @ApiModelProperty(value = "Item ID Item ID of the Catalogue record")
    private Long itemId;
    @ApiModelProperty(value = "gcs uri")
    private String gcsUri;
    @ApiModelProperty(value = "Object Name")
    private String objectName;
    @ApiModelProperty(value = "Bucket Name")
    private String bucketName;

    @ApiModelProperty(value = "Source Content")
    private String sourceContent;

    @ApiModelProperty(value = "Content")
    private String content;

    @ApiModelProperty(value = "Status: 1 ok 0 fail 2 analyze")
    private Integer status;



}