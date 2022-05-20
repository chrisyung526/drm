package cn.tcsoft.drm.forest.client;

import cn.tcsoft.drm.forest.client.dto.AdminLoginDTO;
import cn.tcsoft.drm.forest.interceptor.StaffUserInterceptor;
import com.baomidou.mybatisplus.extension.api.R;
import com.dtflys.forest.annotation.*;

/**
 * B端用户相关接口
 * @date 2022-02-11
 * @author hyman
 */
@BaseRequest(interceptor = StaffUserInterceptor.class)
public interface StaffUserClient {
    /**
     * 用户登录
     * @param dto
     * @return
     */
    @Post(url="/api/ofa-admin/login")
    R login(@JSONBody AdminLoginDTO dto);

    /**
     * 用户登出
     * @return
     */
    @Get(url="/api/ofa-admin/exitLogin")
    R logout(@Header("OFA-TOKEN") String token);

    /**
     * 用户信息
     * @return
     */
    @Get(url="/api/ofa-admin/admin/ofaUser/loginUser")
    R userInfo(@Header("OFA-TOKEN") String token);

    @Get(url="/api/ofa-admin/admin/ofaUser/loginUser")
    R userInfo(@Header("OFA-TOKEN") String token,@Header("SUBSYSTEM-ID") Long systemId);

}
