package cn.tcsoft.drm.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.io.Serializable;

/**
 * @author : laimin
 * create at:  2022/4/18  09:51
 * @description: Google Cloud Properties
 */
@Data
@ConfigurationProperties(
        prefix = "google.cloud"
)
public class GoogleCloudProperties implements Serializable {
    private Boolean proxyEnable;
    private String proxyHost;
    private String proxyPort;
    private String keyPath;
    private String bucketName;
    private String bucketPath;
    private String transcript;
}