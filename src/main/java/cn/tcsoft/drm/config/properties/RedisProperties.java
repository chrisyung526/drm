package cn.tcsoft.drm.config.properties;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author : hyman
 * create at:  2021/8/5  14:52
 * @description:
 */
@ConfigurationProperties(
        prefix = "redis"
)
@Data
public class RedisProperties {
    @ApiModelProperty("redis地址")
    String host;
    @ApiModelProperty("密码")
    String password;
    @ApiModelProperty("端口")
    Integer port;
}