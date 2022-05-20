package cn.tcsoft.drm;

import com.google.common.collect.ImmutableMap;

import java.util.Map;

/**
 * @author : hyman
 * create at:  2022/2/14  13:41
 * @description: 静态变量
 */
public class Constants {
    public final static String ADMIN_TOKEN="OFA-TOKEN";
    public final static String ADMIN_TOKEN_KEY="ADMIN-TOKEN-KEY:";
    public final static String CLIENT_TOKEN="CLIENT-TOKEN";
    public final static String CLIENT_TOKEN_KEY="CLIENT-TOKEN-KET:";
    public final static String YES="yes";
    public final static String NO="no";
    public final static String CACHE_WEB_LOG_SWITCH="cache_web_log_switch";
    public final static String F_S="cn.tcsoft.drm.forest.client";
    public final static String BY_TC_DEVELOPER_HYMAN="By TC Hyman";
    public final static Map<String,Integer> HERTZ_MAP= ImmutableMap.of("wav",16000,"amr",8000,"mp3",32000);
    public final static Map<String,String> AUDIO_MAP= ImmutableMap.of("wav","audio/wav","amr","audio/amr","mp3","audio/mpeg","ogg","audio/ogg");

}