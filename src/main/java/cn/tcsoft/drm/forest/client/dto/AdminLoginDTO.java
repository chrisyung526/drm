package cn.tcsoft.drm.forest.client.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author : hyman
 * create at:  2022/2/11  16:37
 * @description: 用户登录
 */
@Data
public class AdminLoginDTO {
    @ApiModelProperty("用户账号")
    String username;
    @ApiModelProperty("用户密码")
    String password;
}