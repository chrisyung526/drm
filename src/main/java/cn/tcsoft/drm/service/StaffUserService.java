package cn.tcsoft.drm.service;

import cn.tcsoft.drm.model.dto.LoginDTO;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import com.baomidou.mybatisplus.extension.api.R;

public interface StaffUserService {
    /**
     * 用户登录
     * @param dto
     * @return
     */
    R login(LoginDTO dto);

    /**
     * 用户登录
     * @return
     */
    Boolean logout(String token);

    /**
     * 根据token获取用户
     * @param token
     * @return
     */
    UserInfoDto loadUserByToken(String token);
    /**
     * 根据token获取用户
     * @param token
     * @param systemId 系统id
     * @return
     */
    UserInfoDto loadUserByToken(String token,Long systemId);
}
