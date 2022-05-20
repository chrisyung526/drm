package cn.tcsoft.drm.controller.admin.system;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.admin.system.FieldType;
import cn.tcsoft.drm.service.admin.system.FieldTypeService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * 字段类型;普通文本
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Api(tags = "HKMP_字段类型")
@RestController
@RequestMapping("/admin/fieldType")
public class FieldTypeController extends BaseController{

   @Resource
   private FieldTypeService fieldtypeService;

    /**
     * 获取全部字段类型
     */
    @GetMapping("getAll")
    @ApiOperation(value = "获取全部字段类型",notes = "获取全部字段类型",response = FieldType.class)
    @Loggable(description = "获取全部字段类型")
    public R queryFieldTypeList() {
        return success(fieldtypeService.list());
    }

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = FieldType.class)
    @Loggable(description = "分页列表")
    public R queryFieldTypeList(@Validated QueryPageDO query) {
          return success(fieldtypeService.getFieldTypePage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = FieldType.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getFieldTypeInfoById(@PathVariable("id") Long id) {
          return success(fieldtypeService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertFieldType(@RequestBody FieldType fieldtype) {
          return success(fieldtypeService.insertFieldType(fieldtype));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateFieldType(@RequestBody FieldType fieldtype) {
          return success(fieldtypeService.updateFieldType(fieldtype));
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
          return success(fieldtypeService.delete(id));
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
        return success(fieldtypeService.deleteList(ids));
     }
}
