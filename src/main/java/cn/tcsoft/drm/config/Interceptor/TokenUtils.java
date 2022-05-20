package cn.tcsoft.drm.config.Interceptor;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.enums.TokenSourceEnum;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.service.StaffUserService;
import cn.tcsoft.drm.util.UserInfoHolder;
import com.alibaba.fastjson.JSONObject;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/3/17  17:31
 * @description: 校验token
 */
public class TokenUtils {
    /**
     * token校验
     * @param redissonClient
     * @param token
     * @param response
     * @return
     * @throws IOException
     */
    public static Boolean checkToken(RedissonClient redissonClient, StaffUserService loginService, String token, HttpServletResponse response, Integer source) throws IOException {
        if(Objects.nonNull(token)){
            // 去缓存里取用户
            RBucket<UserInfoDto> bucket=redissonClient.getBucket(TokenSourceEnum.findByType(source)+token);
            UserInfoDto userInfoDto=null;
            if(!bucket.isExists()){
                userInfoDto=loginService.loadUserByToken(token);
                if(Objects.isNull(userInfoDto)) {
                    unauthorized(response, ApiErrorCode.LOGIN_EXPIRED);
                    return Boolean.FALSE;
                }
            }
            if(Objects.isNull(bucket)){
                userInfoDto=loginService.loadUserByToken(token);
                if(Objects.isNull(userInfoDto)) {
                    unauthorized(response, ApiErrorCode.UNAUTHORIZED);
                    return Boolean.FALSE;
                }
            }
            userInfoDto=bucket.get();
            //用户存储在上下文内
            UserInfoHolder.set(userInfoDto);
            return Boolean.TRUE;
        }
        unauthorized(response, ApiErrorCode.UNAUTHORIZED);
        return Boolean.TRUE;
    }

    /**
     * 响应数据给前端
     * @param response
     */
    private static void unauthorized(HttpServletResponse response, ApiErrorCode apiErrorCode) throws IOException {
        JSONObject jsonObject = new JSONObject(2);
        jsonObject.put("code", apiErrorCode.getCode());
        jsonObject.put("message", apiErrorCode.getMsg());
        response.setContentType("application/json;charset=utf-8");
        PrintWriter writer=response.getWriter();
        writer.print(jsonObject.toJSONString());
        writer.close();
        response.flushBuffer();
    }
}