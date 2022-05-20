package cn.tcsoft.drm.config;

import cn.tcsoft.drm.config.properties.RedisProperties;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2021/8/5  14:47
 * @description: RedissonConfig
 */
@Configuration
@EnableConfigurationProperties(RedisProperties.class)
public class RedissonConfig {
    @Resource
    RedisProperties properties;
    static String REDIS_PREFIX="redis://";

    @Bean
    public RedissonClient redissonClient(){
        Config config = new Config();
        //单机模式
        SingleServerConfig singleServerConfig= config.useSingleServer();
        //redisson版本是3.5，集群的ip前面要加上“redis://”，不然会报错，3.2版本可不加
        singleServerConfig
                .setAddress(REDIS_PREFIX + properties.getHost() + ":" + properties.getPort());
        if(Objects.nonNull(properties.getPassword())) {
            singleServerConfig
                    .setPassword(properties.getPassword());
        }
        return Redisson.create(config);
    }
}