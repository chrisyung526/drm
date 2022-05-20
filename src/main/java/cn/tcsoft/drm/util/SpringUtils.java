package cn.tcsoft.drm.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.util.Map;

/**
 * @author chenshaofeng wrote on 2020/9/8
 * @version 1.0
 */
@Component
public class SpringUtils implements ApplicationContextAware {

    private static ApplicationContext applicationContext;
    private static ApplicationContext parentApplicationContext;

    public SpringUtils() {
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    @Override
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {
        SpringUtils.applicationContext = ctx;
        SpringUtils.parentApplicationContext = ctx.getParent();
    }

    public static Object getBean(String name) {
        Assert.hasText(name, "SpringUtil name is null or empty");

        try {
            return applicationContext.getBean(name);
        } catch (Exception var2) {
            return parentApplicationContext.getBean(name);
        }
    }

    public static <T> T getBean(String name, Class<T> type) {
        Assert.hasText(name, "SpringUtil name is null or empty");
        Assert.notNull(type, "SpringUtil type is null");

        try {
            return applicationContext.getBean(name, type);
        } catch (Exception var3) {
            return parentApplicationContext.getBean(name, type);
        }
    }

    public static <T> T getBean(Class<T> type) {
        Assert.notNull(type, "SpringUtil type is null");

        try {
            return applicationContext.getBean(type);
        } catch (Exception var2) {
            return parentApplicationContext.getBean(type);
        }
    }

    public static <T> Map<String, T> getBeansOfType(Class<T> type) {
        Assert.notNull(type, "SpringUtil type is null");

        try {
            return applicationContext.getBeansOfType(type);
        } catch (Exception var2) {
            return parentApplicationContext.getBeansOfType(type);
        }
    }

    public static ApplicationContext publishEvent(Object event) {
        applicationContext.publishEvent(event);
        return applicationContext;
    }
}
