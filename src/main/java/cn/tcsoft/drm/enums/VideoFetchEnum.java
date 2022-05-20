package cn.tcsoft.drm.enums;

/**
 * 视频相关操作枚举类型
 * @author hyman
 * @date 2021-11-02
 */
public enum VideoFetchEnum {
    DURATION("duration", "时长"),
    COVER("cover", "封面或缩略图"),
    BITRATE("bitrate", "码率"),
    WATERMARK("watermark", "水印"),
    SUBTITLE("subtitle", "字幕"),
    ASS("ass","srt转换成ass"),
    DEMO("demo", "预览");
    private String code;
    private String msg;
    VideoFetchEnum(final String code, final String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
