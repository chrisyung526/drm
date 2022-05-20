package cn.tcsoft.drm.controller.admin;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.model.dto.LoginDTO;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.service.StaffUserService;
import cn.tcsoft.drm.util.RequestUtils;
import com.baomidou.mybatisplus.extension.api.R;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/2/11  16:16
 * @description: 用户登录模块
 */
@RestController
@RequestMapping("/admin/user")
@Api(tags = "用户登录管理")
@Slf4j
@ApiSupport(order = 1)
public class StaffUserController extends BaseController {

    @Resource
    StaffUserService loginService;

    @ApiOperation("用户登录")
    @PostMapping("login")
    @Loggable(description = "用户登录", include = "")
    public R login(@RequestBody @Validated LoginDTO dto) {
        return loginService.login(dto);
    }

    @ApiOperation("用户登出")
    @GetMapping("logout")
    @Loggable(description = "用户登出", include = "")
    public R logout(HttpServletRequest request) {
        String token = RequestUtils.getAdminTokenValue(request);
        if(Objects.isNull(token)){
            return failed(ApiErrorCode.UNAUTHORIZED);
        }
        return success(loginService.logout(token));
    }


    @ApiOperation(value = "用户信息",response = UserInfoDto.class)
    @GetMapping("info")
    public R info(HttpServletRequest request) {
        UserInfoDto userInfo=loginService.loadUserByToken(RequestUtils.getAdminTokenValue(request));
        if(Objects.isNull(userInfo)){
            log.warn("获取用户为空,用户未登录！");
            return failed(ApiErrorCode.UNAUTHORIZED);
        }
        return success(userInfo);
    }
}