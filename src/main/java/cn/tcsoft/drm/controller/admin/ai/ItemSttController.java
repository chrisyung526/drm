package cn.tcsoft.drm.controller.admin.ai;

import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.ItemStt;
import cn.tcsoft.drm.service.ItemSttService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.model.QueryPageDO;

import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * <p>
 * Speech to Text  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-04-18
 */
@Api(tags = "Speech to Text")
@RestController
@RequestMapping("/admin/itemStt")
public class ItemSttController extends BaseController{

   @Resource
   private ItemSttService itemsttService;

   /**
    * 分页列表
    */
    @GetMapping("page")
    @ApiOperation(value = "分页列表",notes = "分页列表查询",response = ItemStt.class)
    @Loggable(description = "分页列表")
    public R queryItemSttList(@Validated @ModelAttribute("query") QueryPageDO query) {
          return success(itemsttService.getItemSttPage(query));
    }

   /**
    * 根据id获取信息
    */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息",notes = "根据主键查询数据详情",response = ItemStt.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getItemSttInfoById(@PathVariable("id") Long id) {
          return success(itemsttService.getInfoById(id));
    }


   /**
    * 新增
    */
    @PostMapping("add")
    @ApiOperation(value = "新增",notes = "新增数据")
    @Loggable(description = "新增")
    public R insertItemStt(@RequestBody ItemStt itemstt) {
          return success(itemsttService.insertItemStt(itemstt));
    }

    /**
     * 更新
     */
     @PostMapping("update")
     @ApiOperation(value = "修改",notes = "根据主键修改数据")
     @Loggable(description = "修改")
     public R updateItemStt(@RequestBody ItemStt itemstt) {
          return success(itemsttService.updateItemStt(itemstt));
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
          return success(itemsttService.delete(id));
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
        return success(itemsttService.deleteList(ids));
     }
}
