package cn.tcsoft.drm.controller.admin.system;

import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import cn.tcsoft.drm.model.vo.ViewQueryVO;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import cn.tcsoft.drm.service.admin.system.ViewService;
import com.baomidou.mybatisplus.extension.api.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 视图信息;XWCMVIEWINFO  前端控制器
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Api(tags = "HKMP_视图信息")
@RestController
@RequestMapping("/admin/view")
public class ViewController extends BaseController {

    @Resource
    private ViewService viewService;

    @Resource
    private ViewFieldinfoRefService viewFieldinfoRefService;

    /**
     * 分页列表
     */
    @GetMapping("page")
    @ApiOperation(value = "分页列表", notes = "分页列表查询", response = View.class)
    @Loggable(description = "分页列表")
    public R queryViewList(@Validated @ModelAttribute("query") ViewQueryVO query) {
        return success(viewService.getViewPage(query));
    }

    /**
     * 根据id获取信息
     */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息", notes = "根据主键查询数据详情", response = View.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getViewInfoById(@PathVariable("id") Long id) {
        return success(viewService.getInfoById(id));
    }

    /**
     * 根据id复制视图
     */
    @GetMapping("copy/{id}")
    @ApiOperation(value = "复制视图", notes = "根据主键复制视图", response = View.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "复制视图")
    public R copyById(@PathVariable("id") Long id) {
        View infoById = viewService.getInfoById(id);
        infoById.setId(null);
        List<ViewFieldinfoRef> refList = infoById.getRefList();
        for (ViewFieldinfoRef viewFieldinfoRef : refList) {
            viewFieldinfoRef.setViewId(null);
        }
        infoById.setRefList(refList);
        return success(infoById);
    }

    /**
     * 根据字段id获取关联view信息
     */
    @GetMapping("getView/{id}")
    @ApiOperation(value = "根据字段id获取关联view信息", notes = "根据字段id获取关联view信息", response = View.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "字段id", required = true, example = "1")
    })
    @Loggable(description = "字段关联视图详情信息")
    public R getViewInfoByFieldId(@PathVariable("id") Long fieldId) {
        return success(viewFieldinfoRefService.getInfoByFieldId(fieldId));
    }

    /**
     * 根据view id获取关联field信息
     */
    @GetMapping("getField/{id}")
    @ApiOperation(value = "根据view id获取关联field信息", notes = "根据view id获取关联field信息", response = View.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "view id", required = true, example = "1")
    })
    @Loggable(description = "根据view id获取关联field信息")
    public R getFieldByFieldId(@PathVariable("id") Long vid) {
        return success(viewFieldinfoRefService.getInfoByViewId(vid));
    }


    /**
     * 新增
     */
    @PostMapping("add")
    @ApiOperation(value = "新增", notes = "新增数据")
    @Loggable(description = "新增")
    public R insertView(@RequestBody View view) {
        return success(viewService.insertView(view));
    }

    /**
     * 更新
     */
    @PostMapping("update")
    @ApiOperation(value = "修改", notes = "根据主键修改数据")
    @Loggable(description = "修改")
    public R updateView(@RequestBody View view) {
        return success(viewService.updateView(view));
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
        Integer count = viewFieldinfoRefService.lambdaQuery().eq(ViewFieldinfoRef::getViewId, id).count();
        if (count > 0) {
            return failed("视图已有关联数据！无法删除");
        }
        return success(viewService.delete(id));
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
        Integer count = viewFieldinfoRefService.lambdaQuery().in(ViewFieldinfoRef::getViewId, ids).count();
        if (count > 0) {
            return failed("视图已有关联数据！无法删除");
        }
        return success(viewService.deleteList(ids));
    }


    @PostMapping("upload")
    @ApiOperation(value = "ex导入", notes = "导入")
    @Loggable(description = "ex导入")
    public R upload(@RequestParam("file") MultipartFile file) throws Exception {
        String name = file.getOriginalFilename();
        assert name != null;
        if (name.length() < 6 || !name.endsWith(".xlsx")) {
            return failed("文件格式错误");
        }
        return success(viewService.inputFile(file));
    }

}
