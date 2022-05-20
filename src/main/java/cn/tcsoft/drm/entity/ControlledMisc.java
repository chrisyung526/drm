package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * <p>
 * MMIS系统元数据字段属性表(Controlled Misc)
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-12
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_controlled_misc")
@ApiModel(value = "ControlledMisc对象", description = "MMIS系统元数据字段属性表(Controlled Misc)")
public class ControlledMisc extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "Status	New / Being Processed	 ")
    @NotNull(message = "dbStatus is null")
    private String dbStatus;


    @ApiModelProperty(value = "Type of Authority	 ")
    @NotNull(message = "authType is null")
    private String authType;

    @ApiModelProperty(value = "Attribute Type	Attribute Type	 ")
    @NotNull(message = "attrType is null")
    private String attrType;

    @ApiModelProperty(value = "Value	Value of the Attribute Type	 ")
    @NotNull(message = "value is null")
    private String value;

    @ApiModelProperty(value = "English Description	English Description	 ")
    private String engDescrip;

    @ApiModelProperty(value = "Chinese Description	Chinese Description	 ")
    private String chiDescrip;

    @ApiModelProperty(value = "Active	Active Indicator Yes / No	 ")
    private String active;

    @ApiModelProperty(value = "Temporary Indicator	Temporary Indicator Yes / No	 ")
    private String temporaryInd;

    private String url;

    private String valueChi;

    private String duplicateMetadata;

    @ApiModelProperty(value = "Share Digital Collection Only or HKMP Only or DRM ")
    private String share;

    @ApiModelProperty(value = "关联书目id list")
    @TableField(exist = false)
    private List<String> bibIds;

    @ApiModelProperty(value = "合并权威记录List")
    @TableField(exist = false)
    private List<ControlledMisc> margeList;

    @ApiModelProperty(value = "书目xmls")
    @TableField(exist = false)
    private MultipartFile file;

    @ApiModelProperty(value = "相关出版目录号")
    @TableField(exist = false)
    private Page<CatalogueRecord> catalogueRecordPagePublished;

    @ApiModelProperty(value = "相关未出版目录号")
    @TableField(exist = false)
    private Page<CatalogueRecord> catalogueRecordPageUnpublished;
}