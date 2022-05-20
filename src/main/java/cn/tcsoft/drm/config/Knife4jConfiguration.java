package cn.tcsoft.drm.config;

import cn.tcsoft.drm.Constants;
import com.github.xiaoymin.knife4j.spring.extension.OpenApiExtensionResolver;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import springfox.documentation.service.Parameter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : hyman
 * create at:  2022/2/11  13:57
 * @description: 接口文档配置
 */
@Configuration
@EnableSwagger2WebMvc
@ConditionalOnProperty(value = {"knife4j.enable"})
public class Knife4jConfiguration {
    private static final String CLIENT_BASE_PATH = "/client-api/**";
    private static final String OPEN_BASE_PATH = "/open-api/**";
    private static final String ADMIN_BASE_PATH = "/admin/**";

    @Resource
    OpenApiExtensionResolver openApiExtensionResolver;
    /**
     * 后端管理端接口
     * @return
     */
    @Bean(value = "adminApi")
    public Docket adminApi() {
        Docket docket=new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(this.apiInfo())
                .groupName("后端接口(B端)")
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
                .paths(PathSelectors.ant(ADMIN_BASE_PATH))
                .build()
                .globalOperationParameters(getParameterList(Constants.ADMIN_TOKEN))
                .ignoredParameterTypes(HttpServletResponse.class, HttpServletRequest.class)
                .extensions(openApiExtensionResolver.buildSettingExtensions());
        return docket;
    }

    /**
     * C端接口
     * @return
     */
    @Bean(value = "clientApi")
    public Docket clientApi() {
        Docket docket=new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(this.apiInfo())
                .groupName("前端接口(C端)")
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
                .paths(PathSelectors.ant(CLIENT_BASE_PATH))
                .build()
                .globalOperationParameters(getParameterList(Constants.CLIENT_TOKEN))
                .ignoredParameterTypes(HttpServletResponse.class, HttpServletRequest.class)
                .extensions(openApiExtensionResolver.buildSettingExtensions());
        return docket;
    }

    /**
     * 开放接口
     * @return
     */
    @Bean(value = "openApi")
    public Docket openApi() {
        Docket docket=new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(this.apiInfo())
                .groupName("开放接口")
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
                .paths(PathSelectors.ant(OPEN_BASE_PATH))
                .build()
                .globalOperationParameters(getParameterList(Constants.CLIENT_TOKEN))
                .ignoredParameterTypes(HttpServletResponse.class, HttpServletRequest.class)
                .extensions(openApiExtensionResolver.buildSettingExtensions());
        return docket;
    }

    private List<Parameter> getParameterList(String tokenName){
        List<Parameter> parameterList = new ArrayList<Parameter>();
        ParameterBuilder parameterBuilder = new ParameterBuilder();
        parameterBuilder.name(tokenName)
                .description("Access Token")
                .modelRef(new ModelRef("String"))
                .defaultValue("eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJnV1l3UlF3RkdCazJQdWRiZ1lNenZ4RmExU0RHeWNNY0t1dnphZXVBYW1jIn0.eyJleHAiOjE2NTI2ODYyOTIsImlhdCI6MTY1MjY2ODI5MiwiYXV0aF90aW1lIjoxNjUyNjY4Mjg3LCJqdGkiOiIxOThmNDk5ZC1kMjMwLTQzNDUtOGU0MC03M2UzODg1Y2FjMzkiLCJpc3MiOiJodHRwOi8vMTAuMTAuNi41ODo4MTgwL2F1dGgvcmVhbG1zL2hrSW50ZXJsaWItdGVzdCIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiI2NjI3OGM5MC0wNmEzLTRjMmUtODhjZC1kMmE3YWIwMjRjODYiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJoZ3Byb2plY3QtZnJvbnQiLCJub25jZSI6ImJhYzU5MzMzLTNjYjEtNDdkZS1hOGU1LTdmNDUzNDUwMzA0MiIsInNlc3Npb25fc3RhdGUiOiIyNjgzMDljYy1jMTdmLTQ0YmItYTlhZS0zMTI0NjEwZjU5MjQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly8xMC4xMC42LjI2IiwiaHR0cDovL2xvY2FsaG9zdDo4MDgwIiwiaHR0cDovLzEwLjEwLjMuMzo2ODg4IiwiaHR0cDovLzEwLjEwLjMuOTY6ODA4MCIsImh0dHA6Ly8xMC4xMC4yLjE4Nzo4MDgwIiwiaHR0cDovLzEwLjEwLjYuMjY6ODAiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLWhraW50ZXJsaWItdGVzdCJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIHBob25lIG9mZmxpbmVfYWNjZXNzIG1pY3JvcHJvZmlsZS1qd3QgZW1haWwgcHJvZmlsZSBhZGRyZXNzIiwic2lkIjoiMjY4MzA5Y2MtYzE3Zi00NGJiLWE5YWUtMzEyNDYxMGY1OTI0IiwidXBuIjoibGFpbWluIiwiYWRkcmVzcyI6e30sImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6Iui1luaVjyIsImdyb3VwcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1oa2ludGVybGliLXRlc3QiXSwicHJlZmVycmVkX3VzZXJuYW1lIjoibGFpbWluIiwibG9jYWxlIjoiemgtQ04iLCJnaXZlbl9uYW1lIjoi6LWW5pWPIn0.PskgkyPNJ3yZZV6SZPFTUrtt98jd4uZyZPc3vfy2VGMsP7pjujnoQ2SGkcypbfvzCLsPYoNYWT1aJp3P5b7Gf5hf1Le4QS38kerazeEkK0rTjohXEsU0kWc1Zn_yBDiuoQqK9AHn1IW8DhH7s2xuMvSCEHJc9M8DZiC6fyJ2R021nTOvmh8v1O3qdrfbHb48aHZvZnF98V5VgcecBrTAdqMJFbzmtFX_L5dZ3RwobP48L59aM2BiSPM-yyBFy3uTcfNDXZTkT7cnhfRcmDrbGPKH1WNio2IIs2HRG1jQaGOIznKU3BKh2hrNAxPH1k_LDcxmsnizc1iAN_41ublFfQ")
                .parameterType("header")
                .required(false).build();
        //header中的Token参数必填，但是这里不能解决部分接口不需要token参数
        parameterList.add(parameterBuilder.build());
        return parameterList;
    }

    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("数字资源管理系统")
                .description("数字资源管理系统接口文档(HKMP|MMIS)")
                .termsOfServiceUrl("www.interlib.cn")
                .contact(new Contact("广州图创计算机软件开发有限公司","www.interlib.cn","interlib@interlib.com"))
                .version("1.0")
                .build();
    }
}