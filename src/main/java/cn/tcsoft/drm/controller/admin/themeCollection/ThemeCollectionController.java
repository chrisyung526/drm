package cn.tcsoft.drm.controller.admin.themeCollection;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.ThemeCollection;
import cn.tcsoft.drm.service.ThemeCollectionService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * Theme Rel Collection  前端控制器
 * </p>
 *
 * @author ZYS 主题列表管理
 * @since 2022-05-10
 */
@Api(tags = "(MMIS)主题列表管理")
@RestController
@RequestMapping("/admin/themeCollection")
public class ThemeCollectionController extends BaseController{

   @Resource
   private ThemeCollectionService themeCollectionService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = ThemeCollection.class)
    @Loggable(description = "分页列表")
    public R queryThemeCollectionList(@Validated QueryPageDO query) {
          return success(themeCollectionService.getThemeCollectionPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = ThemeCollection.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getThemeCollectionInfoById(@PathVariable("id") Long id) {
          return success(themeCollectionService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertThemeCollection(@RequestBody ThemeCollection themeCollection) {
          return success(themeCollectionService.insertThemeCollection(themeCollection));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "更新",notes = "根据主键更新数据")
     @Loggable(description = "更新")
     public R updateThemeCollection(@RequestBody ThemeCollection themeCollection) {
          return success(themeCollectionService.updateThemeCollection(themeCollection));
     }

    /**
     * 根据id删除
     */
     @DeleteMapping("{id}")
     @ApiOperation(value = "删除",notes = "根据主键删除数据")
     @ApiImplicitParams({
             @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
     })
     @Loggable(description = "删除")
     public R delete(@PathVariable("id") Long id) {
          return success(themeCollectionService.delete(id));
     }

    /**
     * 根据id列表批量删除
     */
     @DeleteMapping("delete")
     @ApiOperation(value = "批量删除",notes = "根据主键列表删除数据")
     @ApiImplicitParams({
             @ApiImplicitParam(name = "ids", value = "id列表", required = true, example = "1,2,3")
     })
     @Loggable(description = "批量删除")
     public R batchDelete(@RequestParam("ids") List<Long> ids) {
        return success(themeCollectionService.deleteList(ids));
     }
}
