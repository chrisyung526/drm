package cn.tcsoft.drm;

import com.baomidou.mybatisplus.extension.api.IErrorCode;

/**
 * * 接口请求错误编码定义
 * @author hyman
 * @date 2022-02-11
 */
public enum ApiErrorCode implements IErrorCode {

    BAD_ERROR(400L, "Request error"),
    UNAUTHORIZED(401L, "Not login"),
    PROHIBIT(403L, "Prohibit access"),
    SUCCESS(200L, "Request successful"),
    FAILED(-1L, "Request failed"),
    LOGIN_EXPIRED(100010, "Login expired"),
    PARAMETER_CHECK_ERROR(200010, "Parameter checksum exception"),
    FILE_NOT_FOUND(200011, "File does not exist"),
    STREAM_TOKEN_NOT_VALID(200012, "Stream token not valid"),
    DATA_NOT_FOUND(200013, "Data does not exist"),
    ;

    private long code;
    private String msg;

    ApiErrorCode(final long code, final String msg) {
        this.code = code;
        this.msg = msg;
    }

    @Override
    public long getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
