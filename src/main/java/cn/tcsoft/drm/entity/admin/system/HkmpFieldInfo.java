package cn.tcsoft.drm.entity.admin.system;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 字段管理;XWCMDBFIELDINFO
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_hkmp_field_info")
@ApiModel(value = "HkmpFieldInfo对象", description = "字段管理;XWCMDBFIELDINFO")
public class HkmpFieldInfo extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "表id;TABLEDESC")
    private Long tableId;

    @ApiModelProperty(value = "表名")
    private String tableName;

    @ApiModelProperty(value = "字段类型id;FIELDTYPE")
    private String fieldTypeId;

    @ApiModelProperty(value = "元素类型id;METADATATYPEID")
    private String elementId;

    @ApiModelProperty(value = "字段名称;FIELDNAME")
    private String fieldName;
    @ApiModelProperty(value = "字段别名;ANOTHERNAME")
    private String fieldAnotherName;

    @ApiModelProperty(value = "数据库中的数据大小;DBLENGTH")
    private Integer fieldLength;

    @ApiModelProperty(value = "枚举值(当字段类型为多选时填写_分割)")
    private String evmValue;

    @ApiModelProperty(value = "前台显示名称")
    private String frontendFieldName;

    @ApiModelProperty(value = "字段默认值;DEFAULTVALUE")
    private String defaultValue;

    @ApiModelProperty(value = "是否可以为空;NOTNULL")
    private Integer isEmpty;

    @ApiModelProperty(value = "是否可以编辑;NOTEDIT")
    private Integer isEdit;

    @ApiModelProperty(value = "是否隐藏;HIDDENFIELD")
    private Integer isHidden;

    @TableField(exist = false)
    @ApiModelProperty(value = "关联视图个数")
    private Integer fieldViewRefCount;

    @TableField(exist = false)
    @ApiModelProperty(value = "字段类型")
    private String fieldTypeName;

}