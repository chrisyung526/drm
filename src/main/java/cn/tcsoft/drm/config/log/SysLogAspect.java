package cn.tcsoft.drm.config.log;

import cn.tcsoft.drm.Constants;
import cn.tcsoft.drm.config.log.enums.LogScopeEnum;
import cn.tcsoft.drm.event.model.LogMessage;
import cn.tcsoft.drm.util.RequestUtils;
import cn.tcsoft.drm.util.SpringUtils;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import eu.bitwalker.useragentutils.UserAgent;
import io.swagger.annotations.Api;
import javassist.ClassClassPath;
import javassist.ClassPool;
import javassist.CtMethod;
import javassist.bytecode.LocalVariableAttribute;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/3/7  10:01
 * @description: 日志切面监控
 */
@Component
@Aspect
@Slf4j
public class SysLogAspect {
    @Resource
    RedissonClient redissonClient;
    //开始时间
    private Long startTime;
    //结束时间
    private Long endTime;
    //模块名称
    private String moduleName;

    /**
     * Controller层切点
     */
    @Pointcut("execution(* *..controller..*.*(..))")
    public void controllerAspect() {
    }

    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public void doBeforeInServiceLayer(JoinPoint joinPoint) {
    }

    /**
     * 配置controller环绕通知,使用在方法aspect()上注册的切入点
     *
     * @param point 切点
     * @return
     * @throws Throwable
     */
    @Around("controllerAspect()")
    public Object doAround(ProceedingJoinPoint point) throws Throwable {
        // 获取request
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
        HttpServletRequest request = servletRequestAttributes.getRequest();

        //目标方法实体
        Method method = ((MethodSignature) point.getSignature()).getMethod();
        boolean hasMethodLog= method.isAnnotationPresent(Loggable.class);
        //没加注解 直接执行返回结果
        if (!hasMethodLog) {
            return point.proceed();
        }

        //日志打印外部开关默认关闭
        String logSwitch = Objects.equals(redissonClient.getBucket(Constants.CACHE_WEB_LOG_SWITCH).get(), Constants.YES) ? Constants.YES : Constants.NO;

        if(method.getDeclaringClass().isAnnotationPresent(Api.class)){
            moduleName=StringUtils.join(method.getDeclaringClass().getAnnotation(Api.class).tags(),",");
        }

        //记录日志信息
        LogMessage logMessage = new LogMessage();

        //方法注解实体
        Loggable methodLog = method.getAnnotation(Loggable.class);

        //处理入参日志
        handleRequestLog(point, methodLog, request, logMessage, logSwitch);

        //执行目标方法内容，获取执行结果
        Object result = point.proceed();

        //处理接口响应日志
        handleResponseLog(logSwitch, logMessage, methodLog, result);
        return result;
    }

    /**
     * 处理入参日志
     *
     * @param point          　切点
     * @param methodLog 　日志注解
     * @param logMessage     　日志信息记录实体
     */
    private void handleRequestLog(ProceedingJoinPoint point, Loggable methodLog, HttpServletRequest request,
                                 LogMessage logMessage, String logSwitch) throws Exception {

        String paramsText = "";
        //参数列表
        String includeParam = methodLog.include();
        Map<String, Object> methodParamNames = getMethodParamNames(
                point.getTarget().getClass(), point.getSignature().getName(), includeParam);
        Map<String, Object> params = getArgsMap(
                point, methodParamNames);
        if (params != null) {
            //序列化参数列表
            paramsText = JSON.toJSONString(params);
        }
        logMessage.setParameter(paramsText);
        //判断是否输出日志
        if (methodLog.loggable()
                && methodLog.scope().contains(LogScopeEnum.BEFORE)
                && methodLog.console()
                && StringUtils.equals(logSwitch, Constants.YES)) {
            //打印入参日志
            log.info("【{}】 接口入参成功!, 方法名称:【{}】, 请求参数:【{}】", methodLog.description(), point.getSignature().getName(), paramsText);
        }
        startTime = System.currentTimeMillis();
        //接口描述
        logMessage.setDescription(methodLog.description());
        logMessage.setLevel(methodLog.level());
        logMessage.setModuleName(moduleName);
        logMessage.setType(methodLog.type().value());
        logMessage.setSystemName(methodLog.system().value());
        logMessage.setRequestIp(RequestUtils.getIpAddress(request));
        logMessage.setRequestUrl(request.getRequestURI());
        logMessage.setMsg(methodLog.msg());
        logMessage.setStartTime(startTime);
        UserAgent userAgent= UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        logMessage.setUserAgent(userAgent.getBrowser().toString());
    }

    /**
     * 处理响应日志
     *
     * @param logSwitch         外部日志开关，用于外部动态开启日志打印
     * @param logMessage        日志记录信息实体
     * @param methodLog    日志注解实体
     * @param result         　 接口执行结果
     */
    private void handleResponseLog(String logSwitch, LogMessage logMessage, Loggable methodLog, Object result) {
        endTime = System.currentTimeMillis();
        //结束时间
        logMessage.setEndTime(endTime);
        //消耗时间
        logMessage.setSpendTime(endTime - startTime);

        //是否输出日志
        if (methodLog.loggable()
                && methodLog.scope().contains(LogScopeEnum.AFTER)) {
            //判断是否入库
            if (methodLog.db()) {
//                JSONObject json=JSON.parseObject(JSON.toJSONString(result));
//                if(Objects.nonNull(result)){
//                    if(!Objects.equals(json.getLong("code"), 200L) && !Objects.equals(json.getLong("code"), 0L)){
//                        logMessage.setLevel("ERROR");
//                        logMessage.setMsg(json.toJSONString());
//                        if(log.isErrorEnabled()) {
//                            log.error(logMessage.getMsg());
//                        }
//                    }
//                }
                // 入库代码
                SpringUtils.publishEvent(logMessage);
            }
            //判断是否输出到控制台
            if (methodLog.console()
                    && StringUtils.equals(logSwitch, Constants.YES)) {
                if(log.isInfoEnabled()) {
                    //打印日志代码
                    log.info("【{}】 接口请求成功!,  响应结果:【{}】", methodLog.description(), JSON.toJSONString(result));
                }
            }
        }
    }
    /**
     * 获取方法入参变量名
     *
     * @param cls        触发的类
     * @param methodName 触发的方法名
     * @param include    需要打印的变量名
     * @return
     * @throws Exception
     */
    private Map<String, Object> getMethodParamNames(Class cls,
                                                    String methodName, String include) throws Exception {
        ClassPool pool = ClassPool.getDefault();
        pool.insertClassPath(new ClassClassPath(cls));
        CtMethod cm = pool.get(cls.getName()).getDeclaredMethod(methodName);
        LocalVariableAttribute attr = (LocalVariableAttribute) cm
                .getMethodInfo().getCodeAttribute()
                .getAttribute(LocalVariableAttribute.tag);

        if (attr == null) {
            return Maps.newConcurrentMap();
        } else {
            Map<String, Object> paramNames = new HashMap<>();
            int paramNamesLen = cm.getParameterTypes().length;
            int pos = Modifier.isStatic(cm.getModifiers()) ? 0 : 1;
            if (StringUtils.isEmpty(include)) {
                for (int i = 0; i < paramNamesLen; i++) {
                    paramNames.put(attr.variableName(i + pos), i);
                }
            } else { // 若include不为空
                for (int i = 0; i < paramNamesLen; i++) {
                    String paramName = attr.variableName(i + pos);
                    if (include.indexOf(paramName) > -1) {
                        paramNames.put(paramName, i);
                    }
                }
            }
            return paramNames;
        }
    }

    /**
     * 组装入参Map
     *
     * @param point　　　　　　　切点
     * @param methodParamNames　参数名称集合
     * @return
     */
    private Map getArgsMap(ProceedingJoinPoint point,
                           Map<String, Object> methodParamNames) {
        Object[] args = point.getArgs();
        if (null == methodParamNames) {
            return Collections.EMPTY_MAP;
        }
        for (Map.Entry<String, Object> entry : methodParamNames.entrySet()) {
            int index = Integer.parseInt(String.valueOf(entry.getValue()));
            if (args[index] instanceof ServletRequest || args[index] instanceof ServletResponse || args[index] instanceof MultipartFile) {
                continue;
            }
            if (args != null && args.length > 0) {
                Object arg = (null == args[index] ? "" : args[index]);
                methodParamNames.put(entry.getKey(), arg);
            }
        }
        return methodParamNames;
    }


}