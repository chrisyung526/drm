package cn.tcsoft.drm.controller.admin;

import cn.tcsoft.drm.model.vo.ControlledMiscVO;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.ControlledMisc;
import cn.tcsoft.drm.service.ControlledMiscService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import java.util.List;
/**
 * <p>
 *     权威数据管理
 * MMIS系统元数据字段属性表(Controlled Misc)  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-12
 */
@Api(tags = "MMIS_权威记录(Controlled Misc)")
@RestController
@RequestMapping("/admin/controlledmisc")
public class ControlledMiscController extends BaseController{

   @Resource
   private ControlledMiscService controlledmiscService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = ControlledMisc.class)
    @Loggable(description = "分页列表")
    public R queryControlledMiscList(@Validated ControlledMiscVO query) {
          return success(controlledmiscService.getControlledMiscPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = ControlledMisc.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getControlledMiscInfoById(@PathVariable("id") Long id) {
          return success(controlledmiscService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertControlledMisc(@Validated ControlledMisc controlledmisc) {
        return success(controlledmiscService.insertControlledMisc(controlledmisc));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateControlledMisc(@RequestBody ControlledMisc controlledmisc) {
          return success(controlledmiscService.updateControlledMisc(controlledmisc));
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
          return success(controlledmiscService.delete(id));
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
        return success(controlledmiscService.deleteList(ids));
     }
    /**
     * 更新
     */
    @PostMapping("merge")
    @ApiOperation(value = "合并",notes = "根据主键合并数据")
    @Loggable(description = "合并")
    public R mergeControlledMisc(@RequestBody ControlledMisc controlledmisc) {
        return success(controlledmiscService.mergeControlledMisc(controlledmisc));
    }
}
