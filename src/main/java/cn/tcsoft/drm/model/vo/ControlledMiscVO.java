package cn.tcsoft.drm.model.vo;

import cn.tcsoft.drm.model.QueryPageDO;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author
 * @version 1.0
 * @description 权威记录页面查询条件封装
 * @updateRemark
 * @updateUser
 * @createDate 2022/5/13 15:13
 * @updateDate 2022/5/13 15:13
 **/
@Data
public class ControlledMiscVO extends QueryPageDO {



    @ApiModelProperty(value = "可选查询列", example = "Any Field")
    private String queryColumn;
    @ApiModelProperty(value = "查询列对应值")
    private List<String> queryVal;
    @ApiModelProperty(value = "Attribute Type	Attribute Type	 ")
    private String attrType;

    @ApiModelProperty(value = "Value	Value of the Attribute Type	 ")
    private String value;
    @ApiModelProperty(value = "Share Digital Collection Only or HKMP Only or DRM ")
    private String share;

    @ApiModelProperty(value = "Active	Active Indicator Yes / No	 ")
    private String active;

    @ApiModelProperty(value = "Type of Authority	 ")
    private String authType;

    /**
     * 修改用户
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建用户")
    private String createBy;

    /**
     * 更新用户
     */
    @TableField(value = "last_upd_by", fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新用户")
    private String lastUpdBy;

    /**
     * 词库数据创建的时间范围
     */
    @ApiModelProperty(value = "创建的开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginCreateDate;

    @ApiModelProperty(value = "创建的结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endCreateDate;

    /**
     * 词库最后修改的时间
     */
    @ApiModelProperty(value = "最后的创建的开始时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginLastCreateDate;

    @ApiModelProperty(value = "最后的创建的结束时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endLastCreateDate;


}
