package cn.tcsoft.drm.config;

import ma.glasnost.orika.MapperFacade;
import ma.glasnost.orika.MapperFactory;
import ma.glasnost.orika.impl.DefaultMapperFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description:
 * @author: hyman(hyman@interlib.club)
 * @time: 2021/6/16 15:13
 */
@Configuration
public class OrikaMapperConfig {
    /**
     * Orika 对象拷贝工具
     * @return MapperFacade
     */
    @Bean
    @ConditionalOnMissingBean
    public MapperFacade mapperFacade() {
        MapperFactory factory = new DefaultMapperFactory.Builder()
                .mapNulls(false)
                .useBuiltinConverters(true)
                .build();
        return factory.getMapperFacade();
    }
}
