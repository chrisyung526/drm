package cn.tcsoft.drm.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author : laimin
 * create at:  2022/4/12  15:23
 * @description: es配置
 */
@ConfigurationProperties(
        prefix = "es"
)
@Data
public class ElasticsProperties {
    private String host;
    private Integer port;
    private String scheme;
    private String username;
    private String password;
    private Boolean enableAuth;
    // 连接超时时间
    private int connectTimeout;
    // Socket 连接超时时间
    private int socketTimeout;
    // 获取连接的超时时间
    private int connectionRequestTimeout;
    // 最大连接数
    private int maxConnectNum;
    // 最大路由连接数
    private int maxConnectPerRoute;
}