package cn.tcsoft.drm.controller.admin;

import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.util.LanguageUtil;
import com.baomidou.mybatisplus.extension.api.R;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author : laimin
 * create at:  2022/5/12  16:35
 * @description: 国际化接口相关
 */
@RestController
@RequestMapping("/admin/language")
@Api(tags = "语言国际化管理模块")
@Slf4j
@ApiSupport(order = 1)
public class LanguageController extends BaseController {
    @Resource
    private LanguageUtil languageUtil;

    @GetMapping("getMsg")
    @ApiOperation(value = "测试",response = String.class)
    public R getMsg(String msgCode) {
        return success(languageUtil.getMessageByCode(msgCode));
    }

    @GetMapping("getCurrentLanguage")
    @ApiOperation(value = "获取当前语言",response = String.class)
    public R getCurrentLanguage() {
        return success(languageUtil.getCurrentLanguage());
    }

    @GetMapping("setLanguage")
    @ApiOperation(value = "设置语言",response = String.class)
    public R setLanguage(String language) {
        languageUtil.setLanguage(language);
        return success(languageUtil.getMessageByCode("200"));
    }
}