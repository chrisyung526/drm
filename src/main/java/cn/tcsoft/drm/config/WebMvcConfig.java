package cn.tcsoft.drm.config;

import cn.tcsoft.drm.config.Interceptor.StaffUserInterceptor;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcRegistrations;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;
import org.springframework.util.unit.DataUnit;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.MultipartConfigElement;

/**
 * @author : hyman
 * create at:  2022/2/11  16:04
 * @description: mvc相关配置
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer, WebMvcRegistrations {
    private static final String CLIENT_BASE_PATH = "/client-api/**";
    private static final String OPEN_BASE_PATH = "/open-api/**";
    private static final String ADMIN_BASE_PATH = "/admin/**";

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminLoginInterceptor())
                .excludePathPatterns("/admin/user/login")
                .addPathPatterns(ADMIN_BASE_PATH);
        WebMvcConfigurer.super.addInterceptors(registry);
    }
    @Bean
    public StaffUserInterceptor adminLoginInterceptor(){
        return new StaffUserInterceptor();
    }
    /**
     * 接口跨域配置
     * @return
     */
    @Bean
    public CorsFilter corsFilter() {
        //创建CorsConfiguration对象后添加配置
        CorsConfiguration config = new CorsConfiguration();
        //设置放行哪些原始域
        //config.addAllowedOrigin("*");
        config.addAllowedOriginPattern("*");
        //放行哪些原始请求头部信息
        config.addAllowedHeader("*");
        //放行哪些请求方式
        config.addAllowedMethod("*");     //放行全部请求
        //是否发送Cookie
        config.setAllowCredentials(true);
        //2. 添加映射路径
        UrlBasedCorsConfigurationSource corsConfigurationSource =
                new UrlBasedCorsConfigurationSource();
        corsConfigurationSource.registerCorsConfiguration("/**", config);
        return new CorsFilter(corsConfigurationSource);
    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //允许上传的文件最大值
        factory.setMaxFileSize(DataSize.of(5L, DataUnit.GIGABYTES));
        /// 设置总上传数据总大小
        factory.setMaxRequestSize(DataSize.of(5L, DataUnit.GIGABYTES));
        return factory.createMultipartConfig();
    }
}