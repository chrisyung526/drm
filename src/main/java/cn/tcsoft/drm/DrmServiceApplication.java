package cn.tcsoft.drm;

import com.dtflys.forest.springboot.annotation.ForestScan;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 程序启动入口
 *
 * @date 2022-02-10
 */
@EnableTransactionManagement
@SpringBootApplication
@ForestScan(basePackages = Constants.F_S)
@EnableScheduling
@Slf4j
public class DrmServiceApplication {

    /**
     * 程序启动入口
     */
    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(DrmServiceApplication.class);
        app.setBannerMode(Banner.Mode.OFF);
        app.run(args);
        log.debug("PortalApplication is success!");
    }
}
