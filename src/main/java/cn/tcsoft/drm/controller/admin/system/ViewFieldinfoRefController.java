package cn.tcsoft.drm.controller.admin.system;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * 视图字段关联表;XWCMVIEWFIELDINFO  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Api(tags = "HKMP_视图字段关联表")
@RestController
@RequestMapping("/admin/viewfieldinforef")
public class ViewFieldinfoRefController extends BaseController{

   @Resource
   private ViewFieldinfoRefService viewfieldinforefService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = ViewFieldinfoRef.class)
    @Loggable(description = "分页列表")
    public R queryViewFieldinfoRefList(@Validated QueryPageDO query) {
          return success(viewfieldinforefService.getViewFieldinfoRefPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = ViewFieldinfoRef.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getViewFieldinfoRefInfoById(@PathVariable("id") Long id) {
          return success(viewfieldinforefService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertViewFieldinfoRef(@RequestBody ViewFieldinfoRef viewfieldinforef) {
          return success(viewfieldinforefService.insertViewFieldinfoRef(viewfieldinforef));
    }

    /**
     * 新增
     */
    @PostMapping("addBatch")
    @ApiOperation(value = "批量新增",notes = "批量新增数据")
    @Loggable(description = "批量新增")
    public R insertViewFieldinfoRefBatch(@RequestBody List<ViewFieldinfoRef> list) {
        for (ViewFieldinfoRef viewFieldinfoRef : list) {
            Integer count = viewfieldinforefService.lambdaQuery().eq(viewFieldinfoRef.getViewId() != null, ViewFieldinfoRef::getViewId, viewFieldinfoRef.getViewId())
                    .eq(viewFieldinfoRef.getFieldId() != null, ViewFieldinfoRef::getFieldId, viewFieldinfoRef.getFieldId()).count();
            if (count>0){
                return failed("该字段已关联该视图");
            }
        }
        return success(viewfieldinforefService.saveBatch(list));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateViewFieldinfoRef(@RequestBody ViewFieldinfoRef viewfieldinforef) {
          return success(viewfieldinforefService.updateViewFieldinfoRef(viewfieldinforef));
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
          return success(viewfieldinforefService.delete(id));
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
        return success(viewfieldinforefService.deleteList(ids));
     }



}
