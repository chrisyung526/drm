package cn.tcsoft.drm.controller.admin.sys;

import io.swagger.annotations.*;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.tcsoft.drm.entity.SysLog;
import cn.tcsoft.drm.service.SysLogService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import java.util.List;
/**
 * <p>
 * 系统日志表  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-03-29
 */
@Api(tags = "系统日志表")
@RestController
@RequestMapping("/admin/syslog")
public class SysLogController extends BaseController{

   @Resource
   private SysLogService syslogService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "日志分页列表查询",response = SysLog.class)
    @Loggable(description = "分页列表")
    public R querySysLogList(@Validated QueryPageDO query) {
          return success(syslogService.getSysLogPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",response = SysLog.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getSysLogInfoById(@PathVariable("id") Long id) {
          return success(syslogService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增")
    @Loggable(description = "新增")
    public R insertSysLog(@RequestBody SysLog syslog) {
          return success(syslogService.insertSysLog(syslog));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改")
     @Loggable(description = "修改")
     public R updateSysLog(@RequestBody SysLog syslog) {
          return success(syslogService.updateSysLog(syslog));
     }

    /**
     * 根据id删除
     */
     @DeleteMapping("{id}")
     @ApiOperation(value = "删除")
     @ApiImplicitParams({
             @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
     })
     @Loggable(description = "删除")
     public R delete(@PathVariable("id") Long id) {
          return success(syslogService.delete(id));
     }

    /**
     * 根据id列表批量删除
     */
     @DeleteMapping("delete")
     @ApiOperation(value = "批量删除")
     @ApiImplicitParams({
             @ApiImplicitParam(name = "ids", value = "id列表", required = true, example = "1,2,3")
     })
     @Loggable(description = "批量删除")
     public R batchDelete(@RequestParam("ids") List<Long> ids) {
        return success(syslogService.deleteList(ids));
     }
}
