package cn.tcsoft.drm.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author : hyman
 * create at:  2022/2/21  09:47
 * @description: 流媒体配置信息
 */
@ConfigurationProperties(
        prefix = "media-stream"
)
@Data
public class MediaStreamProperties {
    String decryptPath;
    String fileExtension;
    String infoFileExtension;
    String keyName;
    String uri;
}