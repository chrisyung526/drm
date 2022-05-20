package cn.tcsoft.drm.config.log.enums;

/**
 * 日志类型
 */
public enum LogTypeEnum {

    ADMIN_WEB("1"), CLIENT_API("2"), OPEN_API("3"), HTTP_API("4");

    private final String value;

    LogTypeEnum(String value) {
        this.value = value;
    }

    public String value() {
        return this.value;
    }
}
