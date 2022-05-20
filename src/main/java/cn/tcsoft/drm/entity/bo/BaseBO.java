package cn.tcsoft.drm.entity.bo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author : hyman
 * create at:  2021/10/29  14:22
 * @description: 实体基础类
 */
@Data
@Accessors(chain = true)
public class BaseBO implements Serializable {
    /**
     * 主键，默认自增 ASSIGN_ID
     */
    @TableId(type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "数据主键")
    private Long id;
    /**
     * 租户ID
     */
    @TableField(value = "org_id", fill = FieldFill.INSERT)
    @ApiModelProperty(hidden = true)
    private Long orgId;
    /**
     * 租户名称
     */
    @TableField(value = "org_name", fill = FieldFill.INSERT)
    @ApiModelProperty(hidden = true)
    private String orgName;

    /**
     * 修改用户
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建用户")
    private String createBy;
    /**
     * Insert时生成，MyMetaObjectHandler自动填充
     */
    @TableField(value = "create_dt", fill = FieldFill.INSERT)
    @JsonFormat(pattern = "MM/dd/yyyy HH:mm:ss",timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间")
    private Date createDt;

    /**
     * 删除标识
     */
    @TableField(value = "is_delete")
    @TableLogic(delval = "1",value = "0")
    @ApiModelProperty(hidden = true)
    private Integer isDelete;

    /**
     * Insert, Update时生成，MyMetaObjectHandler自动填充
     */
    @TableField(value = "last_upd_dt", fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "MM/dd/yyyy HH:mm:ss",timezone = "GMT+8")
    @ApiModelProperty(value = "更新时间")
    private Date lastUpdDt;
    /**
     * 更新用户
     */
    @TableField(value = "last_upd_by", fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "更新用户")
    private String lastUpdBy;
}