package cn.tcsoft.drm.util;

import cn.tcsoft.drm.model.dto.UserInfoDto;

/**
 * @author : hyman
 * create at:  2022/2/11  10:06
 * @description: B端用户上下文存储
 */
public class UserInfoHolder {
    private static ThreadLocal<UserInfoDto> userHolder = new ThreadLocal();

    public UserInfoHolder() {
    }

    public static void set(UserInfoDto userInfoDto) {
        userHolder.set(userInfoDto);
    }

    public static UserInfoDto get() {
        UserInfoDto userInfoDto = userHolder.get();
        return userInfoDto;
    }

    public static void remove() {
        userHolder.remove();
    }
}