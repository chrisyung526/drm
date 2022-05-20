package cn.tcsoft.drm.config;

import cn.tcsoft.drm.config.properties.ElasticsProperties;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.Duration;
import java.util.Objects;

/**
 * @author : laimin
 * create at:  2022/4/12  15:14
 * @description: elasticsearch 配置
 * 采用elasticsearch-rest-high-level-client解决es版本兼容性问题
 */
@Configuration
@EnableConfigurationProperties(ElasticsProperties.class)
public class ElasticsConfiguration {
    @Resource
    ElasticsProperties elasticsProperties;

    @Bean(name = "elasticsSearchClient",destroyMethod = "close")
    @ConditionalOnMissingBean(RestHighLevelClient.class)
    public RestHighLevelClient elasticsSearchClient(){
        if (Objects.isNull(elasticsProperties.getHost())) {
            return null;
        }
        RestClientBuilder builder = RestClient.builder(new HttpHost(elasticsProperties.getHost(), elasticsProperties.getPort(), elasticsProperties.getScheme()));
        // 异步连接延时配置
        builder.setRequestConfigCallback(requestConfigBuilder -> {
            requestConfigBuilder.setConnectTimeout(elasticsProperties.getConnectTimeout());
            requestConfigBuilder.setSocketTimeout(elasticsProperties.getSocketTimeout());
            requestConfigBuilder.setConnectionRequestTimeout(elasticsProperties.getConnectionRequestTimeout());
            return requestConfigBuilder;
        });

        // 异步连接数配置 开启认证需加入密码认证
        if(elasticsProperties.getEnableAuth()) {
            final CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
            credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials(elasticsProperties.getUsername(), elasticsProperties.getPassword()));
            builder.setHttpClientConfigCallback(httpClientBuilder -> {
                httpClientBuilder.setMaxConnTotal(elasticsProperties.getMaxConnectNum());
                httpClientBuilder.setMaxConnPerRoute(elasticsProperties.getMaxConnectPerRoute());
                httpClientBuilder.setKeepAliveStrategy((response, context) -> Duration.ofMinutes(5).toMillis());
                httpClientBuilder.disableAuthCaching();
                return httpClientBuilder.setDefaultCredentialsProvider(credentialsProvider);
            });
        }else{
            builder.setHttpClientConfigCallback(httpClientBuilder -> {
                httpClientBuilder.setMaxConnTotal(elasticsProperties.getMaxConnectNum());
                httpClientBuilder.setMaxConnPerRoute(elasticsProperties.getMaxConnectPerRoute());
                httpClientBuilder.setKeepAliveStrategy((response, context) -> Duration.ofMinutes(5).toMillis());
                return httpClientBuilder;
            });
        }
        return new RestHighLevelClient(builder);
    }
}