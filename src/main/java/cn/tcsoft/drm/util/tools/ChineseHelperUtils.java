package cn.tcsoft.drm.util.tools;

import com.github.stuxuhai.jpinyin.ChineseHelper;
import com.github.stuxuhai.jpinyin.PinyinHelper;

import java.util.Objects;


/**
 * @author : hyman
 * create at:  2021/11/11  09:34
 * @description: 字体转换 简体繁体
 */
public class ChineseHelperUtils {
    /**
     * 文字转拼音
     * @param pinYinStr
     * @return
     */
    public static String convertToPinyin(String pinYinStr) {
        if(Objects.isNull(pinYinStr)){
            return null;
        }
        String tempStr = null;
        try {
            tempStr = PinyinHelper.convertToPinyinString(pinYinStr," ");
        } catch (Exception e) {
            tempStr = pinYinStr;
            e.printStackTrace();
        }
        return tempStr;
    }

    /**
     * 简体转换为繁体
     * @param pinYinStr 要转换的字符串
     * @return
     */
    public static String convertToTraditionalChinese(String pinYinStr) {
        if(Objects.isNull(pinYinStr)){
            return null;
        }
        String tempStr = null;
        try {
            tempStr = ChineseHelper.convertToTraditionalChinese(pinYinStr);
        } catch (Exception e) {
            tempStr = pinYinStr;
            e.printStackTrace();
        }
        return tempStr;
    }


    /**
     * 繁体转换为简体
     * @param pinYinSt 要转换的字符串
     * @return
     */
    public static String convertToSimplifiedChinese(String pinYinSt) {
        if(Objects.isNull(pinYinSt)){
            return null;
        }
        String tempStr = null;
        try {
            tempStr = ChineseHelper.convertToSimplifiedChinese(pinYinSt);
        } catch (Exception e) {
            tempStr = pinYinSt;
            e.printStackTrace();
        }
        return tempStr;
    }
}