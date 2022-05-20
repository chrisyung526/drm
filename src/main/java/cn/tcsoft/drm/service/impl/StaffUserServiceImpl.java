package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.Constants;
import cn.tcsoft.drm.forest.client.StaffUserClient;
import cn.tcsoft.drm.forest.client.dto.AdminLoginDTO;
import cn.tcsoft.drm.model.dto.LoginDTO;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.service.StaffUserService;
import cn.tcsoft.drm.util.UserInfoHolder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.extern.slf4j.Slf4j;
import ma.glasnost.orika.MapperFacade;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * @author : hyman
 * create at:  2022/2/14  13:46
 * @description: 用户登录
 */
@Slf4j
@Service
public class StaffUserServiceImpl implements StaffUserService {
    @Resource
    MapperFacade mapperFacade;
    @Resource
    StaffUserClient staffUserClient;
    @Resource
    RedissonClient redissonClient;

    @Override
    public R login(LoginDTO dto) {
        R r= staffUserClient.login(mapperFacade.map(dto, AdminLoginDTO.class));
        if(isOk(r)){
            String token=r.getData().toString();
            loadUserByToken(token);
        }
        return r;
    }

    @Override
    public UserInfoDto loadUserByToken(String token){
        R infoR= staffUserClient.userInfo(token);
        UserInfoDto userInfo = null;
        if(isOk(infoR)){
            log.debug("用户："+infoR.getData());
            userInfo = JSONObject.parseObject(JSON.toJSONString(infoR.getData()), UserInfoDto.class);
            redissonClient.getBucket(Constants.ADMIN_TOKEN_KEY+token)
                    .set(userInfo,5, TimeUnit.MINUTES);
        }else{
            log.error("error:token解析用户接口失败{%s}",JSON.toJSONString(infoR));
        }
        return userInfo;
    }

    @Override
    public UserInfoDto loadUserByToken(String token, Long systemId) {
        R infoR= staffUserClient.userInfo(token,systemId);
        UserInfoDto userInfo = null;
        if(isOk(infoR)){
            log.debug("用户："+infoR.getData());
            userInfo = JSONObject.parseObject(JSON.toJSONString(infoR.getData()), UserInfoDto.class);
            redissonClient.getBucket(Constants.ADMIN_TOKEN_KEY+token)
                    .set(userInfo,5, TimeUnit.MINUTES);
        }else{
            log.error("error:token解析用户接口失败{%s}",JSON.toJSONString(infoR));
        }
        return userInfo;
    }


    @Override
    public Boolean logout(String token) {
        R logoutR= staffUserClient.logout(token);
        if(isOk(logoutR)) {
            redissonClient.getBucket(Constants.ADMIN_TOKEN_KEY+token).delete();
            UserInfoHolder.remove();
            return Boolean.TRUE;
        }else{
            return Boolean.FALSE;
        }
    }

    private Boolean isOk(R r){
       return Objects.equals(r.getCode(),200L);
    }
}