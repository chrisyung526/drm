package cn.tcsoft.drm.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author : hyman
 * create at:  2022/2/11  10:04
 * @description: B端用户信息
 */
@Data
public class UserInfoDto implements Serializable {
    @ApiModelProperty("用户在当前租户的唯一ID，对应 ofa_org_user_info.id")
    private Long id;
    @ApiModelProperty("用户在平台内的全局唯一ID，对应 ofa_user.id")
    private String userId;
    @ApiModelProperty("账号")
    private String userName;
    @ApiModelProperty("手机号码")
    private String mobile;
    @ApiModelProperty("邮件")
    private String email;
    @ApiModelProperty(
            value = "用户类型,0超管，1管理员，2普通用户,3开发者,4开发者管理员",
            example = "1"
    )
    private Integer userType;
    @ApiModelProperty("最后登录ip")
    private String lastLoginIp;
    @ApiModelProperty("最后登录时间")
    @JsonFormat(
            pattern = "yyyy-MM-dd HH:mm:ss",
            timezone = "GMT+8"
    )
    private Date lastLoginTime;
    @ApiModelProperty("租户id")
    private Long orgId;
    @ApiModelProperty("租户编码")
    private String orgCode;
    @ApiModelProperty("租户名称")
    private String orgName;
    @ApiModelProperty("是否第一次登陆")
    private boolean firstLogin = false;
    @ApiModelProperty("昵称")
    private String nickName;
    @ApiModelProperty("头像")
    private String headPic;
    @ApiModelProperty("部门id")
    private Long[] deptIds;
    @ApiModelProperty("部门名称")
    private String[] deptName;
    private Integer isAccount;
}