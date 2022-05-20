package cn.tcsoft.drm.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @author : hyman
 * create at:  2022/2/11  16:41
 * @description: 用户登录
 */
@Data
@ApiModel(description = "用户登录模块")
public class LoginDTO implements Serializable {
    @ApiModelProperty(value = "用户账号",required = true,example = "test")
    @NotBlank(message = "Login account cannot be empty")
    String username;
    @ApiModelProperty(value = "用户密码<br/><b style=\"color:red\">秘密需要传递密文不是明文</b>",required = true,example = "123456")
    @NotBlank(message = "Login password cannot be empty")
    String password;
}