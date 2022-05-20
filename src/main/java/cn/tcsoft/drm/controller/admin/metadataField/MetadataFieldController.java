package cn.tcsoft.drm.controller.admin.metadataField;

import cn.tcsoft.drm.model.dto.MetadataFieldVOQuery;
import cn.tcsoft.drm.model.vo.MetadataFieldVO;
import cn.tcsoft.drm.service.MetadataFieldService;
import cn.tcsoft.drm.xlsx.model.MetadtaFieldVOModel;
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.MetadataField;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * Metadata Fields  前端控制器
 * </p>
 *
 * @author ZYS 元数据管理
 * @since 2022-05-11
 */
@Api(tags = "(MMIS)Metadata_Fields")
@RestController
@RequestMapping("/admin/metadataField")
public class MetadataFieldController extends BaseController {

    @Resource
    private MetadataFieldService metadataFieldService;

    /**
     * 分页列表 + 条件查询 + 字段排序(仅支持单字段排序)
     */
    @GetMapping("page")
    @ApiOperation(value = "分页列表", notes = "分页列表查询", response = MetadataFieldVO.class)
    @Loggable(description = "分页列表")
    public R queryMetadataFieldVOList(@Validated MetadataFieldVOQuery query) {
        IPage<MetadataFieldVO> metadataFieldPage = metadataFieldService.getMetadataFieldVOPage(query);
        return success(metadataFieldPage);
    }

    /**
     * 根据id获取信息
     */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息", notes = "根据主键查询元数据数据详情", response = MetadataField.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getMetadataFieldVOInfoById(@PathVariable("id") Long id) {
        return success(metadataFieldService.getInfoById(id));
    }

    /**
     * 新增元数据
     */
    @PostMapping("add")
    @ApiOperation(value = "新增", notes = "新增数据")
    @Loggable(description = "新增")
    public R insertMetadataFieldVO(@RequestBody  MetadataFieldVO metadataFieldVO) {
        boolean b = true;
        try {
            b = metadataFieldService.insertMetadataFieldVO(metadataFieldVO);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("插入数据失败");
        }
        return success(b);
    }

    /**
     * 更新
     */
    @PostMapping("update")
    @ApiOperation(value = "更新", notes = "更新元数据")
    @Loggable(description = "更新")
    public R updateMetadataFieldVO(@RequestBody MetadataFieldVO metadataFieldVO) {
        boolean b = true;
        try {
            b = metadataFieldService.updateMetadataFieldVO(metadataFieldVO);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("更新数据失败");
        }
        return success(b);
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
    public R deleteMetadataFieldVO(@PathVariable("id") Long id) {
        boolean b = true;
        try {
            b = metadataFieldService.deleteMetadataFieldVO(id);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("删除数据失败");
        }
        return success(b);
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
    public R batchDeleteMetadataFieldVO(@RequestParam("ids") List<Long> ids) {
        boolean b = true;
        try {
            b = metadataFieldService.deleteMetadataFieldVOList(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("删除数据失败");
        }
        return success(b);
    }

    /**
     * 根据页面传递过来的ids 对数据进行导出到Excel中
     */
    @GetMapping("exportFile")
    @ApiOperation(value = "批量导出数据", notes = "根据主键导出对应的数据,当没有主键时导出全部数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ids", value = "id列表", required = true, example = "1,2,3")
    })
    @Loggable(description = "批量导出数据")
    public void exportFile(@RequestParam(value = "ids",required = false) List<Long> ids , HttpServletResponse response)  {
        try{
            response.setContentType("application/vnd.ms-excel");

            response.setCharacterEncoding("utf-8");
            // 防止中文乱码
            String fileName = URLEncoder.encode("元数据导出数据", "UTF-8");

            response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".xlsx");

            /**
             * 判断前端传递的参数过来的ids是否为空 为空表示导出全部数据,不为空表示查询指定id的数据
             */
            List<MetadataFieldVO> list = new ArrayList<>();
            if (ids.isEmpty()) {
                list = metadataFieldService.getAll();
            } else {
                list = metadataFieldService.getListByIds(ids);
            }
            //将数据写入到Excel中
            EasyExcel.write(response.getOutputStream(), MetadtaFieldVOModel.class )
                    .sheet("元数据")
                    .doWrite(list);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 更新排序设置
     */
    @PostMapping("updateOrderSetting")
    @ApiOperation(value = "修改排序", notes = "修改排序设置")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fieldId", value = "fieldId", required = true, example = "1,2,3"),
            @ApiImplicitParam(name = "brief", value = "brief", required = true, example = "1,2,3"),
            @ApiImplicitParam(name = "hitList", value = "hitList", required = true, example = "1,2,3"),
            @ApiImplicitParam(name = "contentHighlight", value = "contentHighlight", required = true, example = "1,2,3"),
    })
    @Loggable(description = "修改元数据顺序")
    public R updateOrderSetting(Long fieldId, String brief , String detail, String hitList, String contentHighlight) {
        boolean b = true;

        try {
            b = metadataFieldService.updateOrderSetting(fieldId,brief,detail,hitList,contentHighlight);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("更新数据失败");
        }
        return success(b);
    }

    /**
     * 更新锁设置
     */
    @PostMapping("updateLockSetting")
    @ApiOperation(value = "修改锁标识", notes = "根据主键修改锁标识")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "lock", value = "lock_tag", required = true, example = "0,1"),
    })
    @Loggable(description = "修改锁标识")
    public R updateLockSetting(Long fieldId, String lock) {
        Boolean b = true;
        try {
            b = metadataFieldService.updateLockSetting(fieldId,lock);
        } catch (Exception e) {
            e.printStackTrace();
            return failed("更新数据失败");
        }
        return success(b);
    }

    /**
     * 分页列表 + 条件查询 + 字段排序(仅支持单字段排序)
     */
    @GetMapping("pageDisplay")
    @ApiOperation(value = "元数据排序分页列表", notes = "元数据排序分页列表查询", response = MetadataFieldVO.class)
    @Loggable(description = "元数据排序分页列表")
    public R pageDisplay(@Validated MetadataFieldVOQuery query) {
        IPage<MetadataFieldVO> metadataFieldPage = metadataFieldService.getPageDisplay(query);
        return success(metadataFieldPage);
    }
}
