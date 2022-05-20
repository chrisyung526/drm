package cn.tcsoft.drm.controller.admin.system;

import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import cn.tcsoft.drm.model.vo.HkmpFieldInfoQueryVO;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.service.HkmpFieldInfoService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * 字段管理;XWCMDBFIELDINFO  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Api(tags = "HKMP_字段管理")
@RestController
@RequestMapping("admin/hkmpfieldinfo")
public class HkmpFieldInfoController extends BaseController{

   @Resource
   private HkmpFieldInfoService hkmpfieldinfoService;
   @Resource
   private ViewFieldinfoRefService viewFieldinfoRefService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = HkmpFieldInfo.class)
    @Loggable(description = "分页列表")
    public R queryHkmpFieldInfoList(@Validated HkmpFieldInfoQueryVO query) {
          return success(hkmpfieldinfoService.getHkmpFieldInfoPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = HkmpFieldInfo.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getHkmpFieldInfoInfoById(@PathVariable("id") Long id) {
          return success(hkmpfieldinfoService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertHkmpFieldInfo(@RequestBody HkmpFieldInfo hkmpfieldinfo) {
          return success(hkmpfieldinfoService.insertHkmpFieldInfo(hkmpfieldinfo));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateHkmpFieldInfo(@RequestBody HkmpFieldInfo hkmpfieldinfo) {
          return success(hkmpfieldinfoService.updateHkmpFieldInfo(hkmpfieldinfo));
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
         Integer count = viewFieldinfoRefService.lambdaQuery().eq(ViewFieldinfoRef::getFieldId,id).count();
         if (count>0){
             return failed("该字段正在使用中，\n" +
                     "\n" +
                     "操作字段删除必须要在该字段没有发布情况下才可以进行操作");
         }
         return success(hkmpfieldinfoService.delete(id));
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
         Integer count = viewFieldinfoRefService.lambdaQuery().in(ViewFieldinfoRef::getFieldId, ids).count();
         if (count>0){
             return failed("该字段正在使用中，\n" +
                     "\n" +
                     "操作字段删除必须要在该字段没有发布情况下才可以进行操作");
         }
         return success(hkmpfieldinfoService.deleteList(ids));
     }
}
