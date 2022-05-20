package cn.tcsoft.drm.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 *
 * @author hzw
 */
@Data
@Component
@ConfigurationProperties(prefix = "hkmp")
public class HkmpConfig {
    /** 上传路径 */
    private static String profile;

    public static String getProfile() {
        return profile;
    }
    @Value("profile")
    public void setProfile(String profile) {
        HkmpConfig.profile = profile;
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath()
    {
        return getProfile() + "/upload";
    }
}
