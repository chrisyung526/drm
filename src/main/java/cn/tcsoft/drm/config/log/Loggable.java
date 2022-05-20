package cn.tcsoft.drm.config.log;

import cn.tcsoft.drm.config.log.enums.LogScopeEnum;
import cn.tcsoft.drm.config.log.enums.LogTypeEnum;
import cn.tcsoft.drm.config.log.enums.SystemTypeEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 日志注解
 * @author hyman
 * @date 2022-03-06
 * @desc 注解作用于方法级别 运行时起作用
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Loggable {
    /**
     * 是否输出日志
     */
    boolean loggable() default true;

    /**
     * 日志信息描述,可以记录该方法的作用等信息。
     */
    String description() default "";

    String msg() default "请求成功";

    SystemTypeEnum system() default SystemTypeEnum.MMIS;

    /**
     * 日志类型，可能存在多种接口类型都需要记录日志，比如admin-web接口，client-api接口，open-api接口，http第三方接口
     */
    LogTypeEnum type() default LogTypeEnum.ADMIN_WEB;

    /**
      * 日志等级
     */
    String level() default "INFO";

    /**
     * 日志输出范围,用于标记需要记录的日志信息范围，包含入参、返回值等。
     * ALL-入参和出参, BEFORE-入参, AFTER-出参
     */
    LogScopeEnum scope() default LogScopeEnum.ALL;

    /**
     * 入参输出范围，值为入参变量名，多个则逗号分割。不为空时，入参日志仅打印include中的变量
     */
    String include() default "";

    /**
     * 是否存入数据库
     */
    boolean db() default true;

    /**
     * 是否输出到控制台
     *
     * @return
      */
    boolean console() default true;
}
