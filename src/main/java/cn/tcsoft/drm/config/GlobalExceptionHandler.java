package cn.tcsoft.drm.config;

import java.util.*;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.model.ResultFactory;
import cn.tcsoft.drm.util.LanguageUtil;
import com.google.api.client.util.Lists;
import com.google.common.collect.ImmutableMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.baomidou.mybatisplus.extension.api.IErrorCode;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;

import javax.annotation.Resource;

/**
 * <p>
 * 通用 Api Controller 全局异常处理
 * @date 2022-02-28
 * @author hyman
 * </p>
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @Resource
    LanguageUtil languageUtil;
    /**
     * <p>
     * 自定义 REST 业务异常
     * <p>
     *
     * @param e 异常类型
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public Object handleBadRequest(Exception e) {
        /*
         * 业务逻辑异常
         */
        if (e instanceof ApiException) {
            IErrorCode errorCode = ((ApiException) e).getErrorCode();
            if (null != errorCode) {
                log.debug("Rest request error, {}", errorCode);
                return ResultFactory.fail(errorCode,languageUtil.getMessageByEnum(errorCode));
                //return R.failed(errorCode);
            }
            log.debug("Rest request error, {}", e.getMessage());
            return ResultFactory.fail(ApiErrorCode.FAILED,languageUtil.getMessageByEnum(ApiErrorCode.FAILED));
            //return R.failed(e.getMessage());
        }

        /*
         * 参数校验异常
         */
        if (e instanceof BindException) {
            BindingResult bindingResult = ((BindException) e).getBindingResult();
            if (bindingResult.hasErrors()) {
                List<Object> jsonList = Lists.newArrayList();
                bindingResult.getFieldErrors().forEach(fieldError -> {
                    jsonList.add(ImmutableMap.of("name", fieldError.getField(),"msg", fieldError.getDefaultMessage()));
                });
                return ResultFactory.fail(ApiErrorCode.PARAMETER_CHECK_ERROR,languageUtil.getMessageByEnum(ApiErrorCode.PARAMETER_CHECK_ERROR));
                //return R.restResult(jsonList, ApiErrorCode.PARAMETER_CHECK_ERROR);
            }
        }

        if ( e instanceof MethodArgumentNotValidException) {
            BindingResult bindingResult = ((MethodArgumentNotValidException) e).getBindingResult();
            if (bindingResult.hasErrors()) {
                List<Object> jsonList = Lists.newArrayList();
                bindingResult.getFieldErrors().forEach(fieldError -> {
                    jsonList.add(ImmutableMap.of("name", fieldError.getField(),"msg", fieldError.getDefaultMessage()));
                });
                return ResultFactory.fail(ApiErrorCode.PARAMETER_CHECK_ERROR,languageUtil.getMessageByEnum(ApiErrorCode.PARAMETER_CHECK_ERROR));
                //return R.restResult(jsonList, ApiErrorCode.PARAMETER_CHECK_ERROR);
            }
        }

        /**
         * 系统内部异常，打印异常栈
         */
        log.error("Error: handleBadRequest StackTrace : {}", e);
        return ResultFactory.fail(ApiErrorCode.FAILED,languageUtil.getMessageByEnum(ApiErrorCode.FAILED));
        //return R.failed(ApiErrorCode.FAILED);
    }
}
