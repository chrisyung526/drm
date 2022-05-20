package cn.tcsoft.drm.forest.interceptor;

import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.dtflys.forest.exceptions.ForestRuntimeException;
import com.dtflys.forest.http.ForestRequest;
import com.dtflys.forest.http.ForestResponse;
import com.dtflys.forest.interceptor.Interceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/2/11  16:29
 * @description: B端登录拦截器
 */
@Slf4j
@Component
public class StaffUserInterceptor implements Interceptor {
    @Override
    public boolean beforeExecute(ForestRequest request) {
//        if(!request.getUrl().contains("login")) {
//            request.addHeader("OFA-TOKEN", "");
//        }
        return true;
    }

    @Override
    public void onError(ForestRuntimeException ex, ForestRequest req, ForestResponse res) {
        // 执行发送请求失败后处理的代码
        int status = res.getStatusCode(); // 获取请求响应状态码
        if(Objects.equals(401,status)){
            throw new ApiException(ApiErrorCode.UNAUTHORIZED);
        }
    }
}