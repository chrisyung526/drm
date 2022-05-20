package cn.tcsoft.drm.util;

import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.extension.api.IErrorCode;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Component;

import java.util.Locale;

/**
 * @author : laimin
 * create at:  2022/5/12  16:12
 * @description: 国际化语言工具
 */
@Component
public class LanguageUtil extends ReloadableResourceBundleMessageSource {
    public LanguageUtil(){
        setDefaultLocale(Locale.CHINA);
        setDefaultEncoding("UTF-8");
        setBasenames("classpath:messages/messages");
    }

    /**
     * 根据code获取值
     * @param code 消息code
     * @param languageTag 语言
     * @return:
     */
    public String getMessage(String code,String languageTag){
        Locale locale = Locale.forLanguageTag(languageTag);
        return super.getMessage(code,null,"error",locale);

    }

    /**
     * 根据code获取值
     * @param code 消息code
     * @param languageTag 语言
     * @return:
     */
    public String getMessage(String code,String defaultMsg,String languageTag){
        Locale locale = Locale.forLanguageTag(languageTag);
        return super.getMessage(code,null,defaultMsg,locale);

    }

    /**
     * 获取当前语言
     * @return:
     */
    public String getCurrentLanguage(){
        return super.getDefaultLocale().getLanguage();
    }

    /**
     * 设置语言
     * zh-CN 简体中文
     * zh-TW 繁体中文
     * fr-FR 法国法语
     * de-DE 德国
     * en    英语
     * en-GB 英国英语
     * en-UG 美国英语
     * @param languageTag
     * @return:
     */
    public void setLanguage(String languageTag){
        Locale locale = Locale.forLanguageTag(languageTag);
        super.setDefaultLocale(locale);
    }

    /**
     * 根据code获取值
     * @param: code 消息code
     * @param defaultMsg 默认消息
     * @return:
     */
    public String getMessageByCode(String code,String defaultMsg){
        return super.getMessage(code,null,defaultMsg,super.getDefaultLocale());
    }

    /**
     * 根据code获取值
     * @param code
     * @return:
     */
    public String getMessageByCode(String code){
        return super.getMessage(code,null,"error",super.getDefaultLocale());
    }

    public String getMessageByEnum(IErrorCode code ){
        return super.getMessage(code.getCode()+"",null,code.getMsg(),super.getDefaultLocale());
    }
}