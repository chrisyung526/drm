package cn.tcsoft.drm.config.Interceptor;

import cn.tcsoft.drm.service.StaffUserService;
import cn.tcsoft.drm.util.RequestUtils;
import org.redisson.api.RedissonClient;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author : hyman
 * create at:  2022/2/11  15:54
 * @description: B端用户登录拦截
 */
public class StaffUserInterceptor implements HandlerInterceptor {
    @Resource
    RedissonClient redissonClient;
    @Resource
    StaffUserService loginService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //return Boolean.TRUE;
        return TokenUtils.checkToken(redissonClient,loginService, RequestUtils.getAdminTokenValue(request),response,1);
    }
}