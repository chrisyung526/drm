package cn.tcsoft.drm.enums;

import cn.tcsoft.drm.Constants;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;

import java.util.Arrays;
import java.util.Objects;

/**
 * 视频相关操作枚举类型
 * @author hyman
 * @date 2021-11-02
 */
public enum TokenSourceEnum {
    /**
     * admin
     */
    ADMIN(1, Constants.ADMIN_TOKEN_KEY),
    /**
     * client
     */
    CLIENT(2, Constants.CLIENT_TOKEN_KEY);

    private Integer type;
    private String msg;

    TokenSourceEnum(final Integer type, final String msg) {
        this.type = type;
        this.msg = msg;
    }

    public static String findByType(Integer type){
        if(Objects.isNull(type)){
            throw new ApiException("token不能为空");
        }
        return Arrays.stream(values()).filter(po-> Objects.equals(type,po.getType())).findFirst().get().getMsg();
    }

    public Integer getType() {
        return type;
    }

    public String getMsg() {
        return msg;
    }
}
