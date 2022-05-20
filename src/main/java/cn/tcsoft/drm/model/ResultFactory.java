package cn.tcsoft.drm.model;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.util.LanguageUtil;
import com.baomidou.mybatisplus.extension.api.IErrorCode;
import lombok.NonNull;

import javax.annotation.Resource;
import java.time.ZonedDateTime;

/**
 * @author : laimin
 * create at:  2022/5/12  17:09
 * @description: ResultEntity的工厂方法
 */
public class ResultFactory {
    private static final Object EMPTY_OBJECT = new Object();

    /**
     * 成功（无返回值）
     * @return  ResultEntity<T>
     */
    @NonNull
    public static ResultEntity success() {
        return success(EMPTY_OBJECT);
    }

    /**
     * 成功（带返回值）
     * @param data 数据
     * @return  ResultEntity<T>
     */
    @NonNull
    public static ResultEntity success(Object data) {
        return new ResultEntity()
                .setMessage(ApiErrorCode.SUCCESS.getMsg())
                .setTime(System.currentTimeMillis())
                .setCode(ApiErrorCode.SUCCESS.getCode())
                .setData(data);
    }


    /**
     * 失败（带错误原因）
     * @param errorCode ErrorCode
     * @return ResultEntity
     */
    @NonNull
    public static ResultEntity fail(@NonNull ApiErrorCode errorCode) {
        return new ResultEntity()
                .setMessage(errorCode.getMsg())
                .setTime(System.currentTimeMillis())
                .setCode(errorCode.getCode())
                .setData(EMPTY_OBJECT);
    }

    /**
     * 失败（带错误原因）
     */
    @NonNull
    public static ResultEntity fail(IErrorCode errorCode, String msg) {
        return new ResultEntity()
                .setMessage(msg)
                .setTime(System.currentTimeMillis())
                .setCode(errorCode.getCode());
    }

    /**
     * 失败（默认错误原因）
     * @return ResultEntity
     */
    @NonNull
    public static ResultEntity fail() {
        return fail(ApiErrorCode.FAILED);
    }
}