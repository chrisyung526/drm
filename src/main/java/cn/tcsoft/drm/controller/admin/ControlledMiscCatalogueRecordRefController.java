package cn.tcsoft.drm.controller.admin;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.ControlledMiscCatalogueRecordRef;
import cn.tcsoft.drm.service.ControlledMiscCatalogueRecordRefService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * 权威记录书目关联表  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-13
 */
@Api(tags = "MMIS_权威记录书目关联表")
@RestController
@RequestMapping("/admin/contradicted")
public class ControlledMiscCatalogueRecordRefController extends BaseController{

   @Resource
   private ControlledMiscCatalogueRecordRefService controlledmisccataloguerecordrefService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = ControlledMiscCatalogueRecordRef.class)
    @Loggable(description = "分页列表")
    public R queryControlledMiscCatalogueRecordRefList(@Validated QueryPageDO query) {
          return success(controlledmisccataloguerecordrefService.getControlledMiscCatalogueRecordRefPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = ControlledMiscCatalogueRecordRef.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getControlledMiscCatalogueRecordRefInfoById(@PathVariable("id") Long id) {
          return success(controlledmisccataloguerecordrefService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertControlledMiscCatalogueRecordRef(@RequestBody ControlledMiscCatalogueRecordRef controlledmisccataloguerecordref) {
          return success(controlledmisccataloguerecordrefService.insertControlledMiscCatalogueRecordRef(controlledmisccataloguerecordref));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateControlledMiscCatalogueRecordRef(@RequestBody ControlledMiscCatalogueRecordRef controlledmisccataloguerecordref) {
          return success(controlledmisccataloguerecordrefService.updateControlledMiscCatalogueRecordRef(controlledmisccataloguerecordref));
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
          return success(controlledmisccataloguerecordrefService.delete(id));
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
        return success(controlledmisccataloguerecordrefService.deleteList(ids));
     }
}
