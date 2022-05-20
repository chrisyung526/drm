package cn.tcsoft.drm.entity.admin.system;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 视图字段关联表;XWCMVIEWFIELDINFO
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_hkmp_view_fieldinfo_ref")
@ApiModel(value = "ViewFieldinfoRef对象", description = "视图字段关联表;XWCMVIEWFIELDINFO")
public class ViewFieldinfoRef extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "视图id;VIEWID")
    private Long viewId;

    @ApiModelProperty(value = "字段id;FIELDNAME")
    private Long fieldId;

    @ApiModelProperty(value = "数据库关联id;MAINTABLEID")
    private Long dbTableinfoId;

    @ApiModelProperty(value = "image前台显示名称(英文)")
    private String imageFrontendFieldNameEn;

    @ApiModelProperty(value = "image前台显示名称(中文)")
    private String imageFrontendFieldNameCn;

    @ApiModelProperty(value = "video前台显示名称(英文)")
    private String videoFrontendFieldNameEn;

    @ApiModelProperty(value = "video前台显示名称(中文)")
    private String videoFrontendFieldNameCn;

    @ApiModelProperty(value = "audio前台显示名称(英文)")
    private String audioFrontendFieldNameEn;

    @ApiModelProperty(value = "audio前台显示名称(中文)")
    private String audioFrontendFieldNameCn;

    @ApiModelProperty(value = "print前台显示名称(英文)")
    private String printFrontendFieldNameEn;

    @ApiModelProperty(value = "print前台显示名称(中文)")
    private String printFrontendFieldNameCn;


    @ApiModelProperty(value = "前台页面是否显示;NO EXIST")
    private Integer isDisplayFront;

    @ApiModelProperty(value = "后台页面是否显示;NO EXIST")
    private Integer isDisplayBackend;

    @ApiModelProperty(value = "是否支持超链接搜索;NO EXIST")
    private Integer isHyperlinkSearch;

    @ApiModelProperty(value = "排序;NO EXIST")
    private Integer sort;
    private Integer imageSort;
    private Integer videoSort;
    private Integer audioSort;
    private Integer printSort;

    private Integer imageIsDisplayFrontEn;
    private Integer imageIsDisplayFrontCn;
    private Integer videoIsDisplayFrontEn;
    private Integer videoIsDisplayFrontCn;
    private Integer audioIsDisplayFrontEn;
    private Integer audioIsDisplayFrontCn;
    private Integer printIsDisplayFrontEn;
    private Integer printIsDisplayFrontCn;

    private Integer imageFrontIsDelete;
    private Integer videoFrontIsDelete;
    private Integer audioFrontIsDelete;
    private Integer printFrontIsDelete;

    @TableField(exist = false)
    private String fieldName;
    @TableField(exist = false)
    private String fieldDesc;
    @TableField(exist = false)
    private String fieldTypeName;

}