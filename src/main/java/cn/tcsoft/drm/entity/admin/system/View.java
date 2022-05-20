package cn.tcsoft.drm.entity.admin.system;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <p>
 * 视图信息;XWCMVIEWINFO
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("biz_hkmp_view")
@ApiModel(value = "View对象", description = "视图信息;XWCMVIEWINFO")
public class View extends BaseBO {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "视图英文名称;VIEWNAME")
    @ExcelProperty(index = 1)
    private String viewEName;

    @ApiModelProperty(value = "视图中文名称;VIEWDESC")
    @ExcelProperty(index = 0)
    private String viewCnName;

    @ApiModelProperty(value = "数据库后缀名;MAINTABLENAME")
    private String dbTablename;

    @ApiModelProperty(value = "数据库关联id;MAINTABLEID")
    private Long dbTableinfoId;

    @TableField(exist = false)
    private List<ViewFieldinfoRef> refList;

}