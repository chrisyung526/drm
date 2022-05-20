package cn.tcsoft.drm.controller.admin.theme;

import cn.tcsoft.drm.model.dto.ThemeQuery;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.Theme;
import cn.tcsoft.drm.service.ThemeService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.config.log.Loggable;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * Theme  前端控制器
 * </p>
 *
 * @author ZYS 主题controller
 * @since 2022-05-10
 */
@Api(tags = "(MMIS)主题管理")
@RestController
@RequestMapping("/admin/theme")
public class ThemeController extends BaseController {

    @Resource
    private ThemeService themeService;

    /**
     * 分页列表
     */
    @GetMapping("page")
    @ApiOperation(value = "分页列表", notes = "分页列表查询", response = Theme.class)
    @Loggable(description = "分页列表")
    public R queryThemeList(@Validated ThemeQuery query) {
        return success(themeService.getThemePage(query));
    }

    /**
     * 根据id获取信息
     */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息", notes = "根据主键查询数据详情", response = Theme.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getThemeInfoById(@PathVariable("id") Long id) {
        return success(themeService.getInfoById(id));
    }


    /**
     * 新增
     */
    @PostMapping("add")
    @ApiOperation(value = "新增", notes = "新增数据")
    @Loggable(description = "新增")
    public R insertTheme(@RequestBody Theme theme) {
        return success(themeService.insertTheme(theme));
    }

    /**
     * 更新
     */
    @PostMapping("update")
    @ApiOperation(value = "更新", notes = "根据主键更新数据")
    @Loggable(description = "更新")
    public R updateTheme(@RequestBody Theme theme) {
        return success(themeService.updateTheme(theme));
    }

    /**
     * 根据id删除
     */
    @DeleteMapping("{id}")
    @ApiOperation(value = "删除", notes = "根据主键删除数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "删除")
    public R delete(@PathVariable("id") Long id) {
        return success(themeService.delete(id));
    }

    /**
     * 根据id列表批量删除
     */
    @DeleteMapping("delete")
    @ApiOperation(value = "批量删除", notes = "根据主键列表删除数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ids", value = "id列表", required = true, example = "1,2,3")
    })
    @Loggable(description = "批量删除")
    public R batchDelete(@RequestParam("ids") List<Long> ids) {
        return success(themeService.deleteList(ids));
    }


    @GetMapping("picturePreview/{id}")
    @ApiOperation(value = "主题图片预览", notes = "根据前端传过来的主题ID,返回对应对象的图片存储地址信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主题主键id", required = true, example = "1")
    })
    @Loggable(description = "图片预览")
    public R picturePreview(@PathVariable("id") Long id) {
        return success(themeService.getInfoById(id).getWallpaper());
    }

}
