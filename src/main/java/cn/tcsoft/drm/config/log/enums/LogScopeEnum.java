package cn.tcsoft.drm.config.log.enums;

/**
 * 日志输出范围
 * @author hyman
 * @date 2022-03-06
 */
public enum LogScopeEnum {

    ALL, BEFORE, AFTER;

    public boolean contains(LogScopeEnum scope) {
        if (this == ALL) {
            return true;
        } else {
            return this == scope;
        }
    }

    @Override
    public String toString() {
        String str = "";
        switch (this) {
            case BEFORE:
                str = "REQUEST";
                break;
            case AFTER:
                str = "RESPONSE";
                break;
            default:
                break;
        }
        return str;
    }
}
