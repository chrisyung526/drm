package cn.tcsoft.drm.config.log.enums;

public enum SystemTypeEnum {
    MMIS("1"), HK_MEMORY("2") ,COMMON("3");

    private final String value;

    SystemTypeEnum(String value) {
        this.value = value;
    }

    public String value() {
        return this.value;
    }
}
