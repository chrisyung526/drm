package cn.tcsoft.drm.controller;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.config.constants.HttpStatus;
import com.baomidou.mybatisplus.extension.api.IErrorCode;
import com.baomidou.mybatisplus.extension.api.R;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

/**
 * @author : hyman
 * create at:  2022/2/16  10:08
 * @description: 接口返回值
 */
@ApiResponses(value = {
        @ApiResponse(code = HttpStatus.SUCCESS, message = "客户端请求成功"),
        @ApiResponse(code = HttpStatus.CREATED, message = "对象创建成功"),
        @ApiResponse(code = HttpStatus.ACCEPTED, message = "请求已经被接受"),
        @ApiResponse(code = HttpStatus.NO_CONTENT, message = "操作已经执行成功，但是没有返回数据"),
        @ApiResponse(code = HttpStatus.MOVED_PERM, message = "资源已被移除"),
        @ApiResponse(code = HttpStatus.SEE_OTHER, message = "重定向"),
        @ApiResponse(code = HttpStatus.NOT_MODIFIED, message = "资源没有被修改"),
        @ApiResponse(code = HttpStatus.BAD_REQUEST, message = "客户端请求有语法错误，不能被服务器所理解"),
        @ApiResponse(code = HttpStatus.UNAUTHORIZED, message = "请求未经授权，这个状态代码必须和TOKEN报头域一起使用"),
        @ApiResponse(code = HttpStatus.FORBIDDEN, message = "服务器收到请求，但是拒绝提供服务"),
        @ApiResponse(code = HttpStatus.NOT_FOUND, message = "请求资源不存在"),
        @ApiResponse(code = HttpStatus.BAD_METHOD, message = "不允许的http方法"),
        @ApiResponse(code = HttpStatus.CONFLICT, message = "资源冲突，或者资源被锁"),
        @ApiResponse(code = HttpStatus.UNSUPPORTED_TYPE, message = "不支持的数据，媒体类型"),
        @ApiResponse(code = HttpStatus.ERROR, message = "系统内部错误"),
        @ApiResponse(code = HttpStatus.NOT_IMPLEMENTED, message = "接口未实现"),
        @ApiResponse(code = 503, message = "服务器当前不能出来客户端的请求，一段时间后可能恢复正常")
})
public class BaseController {
    /**
     * 覆盖之前接口请求成功返回code为0->200
     * @param data
     * @param <T>
     * @return
     */
    protected <T> R<T> success(T data) {
        return R.restResult(data, ApiErrorCode.SUCCESS);
    }
    protected <T> R<T> failed(String msg) {
        return R.failed(msg);
    }

    protected <T> R<T> failed(IErrorCode errorCode) {
        return R.failed(errorCode);
    }
}