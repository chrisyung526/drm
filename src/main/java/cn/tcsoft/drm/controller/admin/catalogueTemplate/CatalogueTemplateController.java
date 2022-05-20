package cn.tcsoft.drm.controller.admin.catalogueTemplate;

import cn.tcsoft.drm.model.dto.CatalogueTemplateVOQuery;
import cn.tcsoft.drm.model.vo.CatalogueTemplateVO;
import cn.tcsoft.drm.service.MetadataFieldService;
import cn.tcsoft.drm.xlsx.model.CatalogueTemplateVOModel;
import com.alibaba.excel.EasyExcel;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.CatalogueTemplate;
import cn.tcsoft.drm.service.CatalogueTemplateService;
import cn.tcsoft.drm.controller.BaseController;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.config.log.Loggable;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


/**
 * <p>
 * Catalogue Template  前端控制器
 * </p>
 *
 * @author ZYS 编目模板管理
 * @since 2022-05-17
 */
@Api(tags = "(MMIS)Catalogue Template")
@RestController
@RequestMapping("/admin/catalogueTemplate")
public class CatalogueTemplateController extends BaseController {

    @Resource
    private CatalogueTemplateService catalogueTemplateService;

    @Resource
    private MetadataFieldService metadataFieldService;

    /**
     * 分页列表
     */
    @GetMapping("page")
    @ApiOperation(value = "分页列表", notes = "分页列表查询", response = CatalogueTemplateVO.class)
    @Loggable(description = "分页列表")
    public R queryCatalogueTemplateList(@Validated CatalogueTemplateVOQuery query) {
        return success(catalogueTemplateService.getCatalogueTemplatePage(query));
    }

    /**
     * 根据id获取信息
     */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息", notes = "根据主键查询数据详情", response = CatalogueTemplate.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getCatalogueTemplateInfoById(@PathVariable("id") Long id) {
        return success(catalogueTemplateService.getInfoById(id));
    }

    /**
     * 新增,注意进行传递的id为字符串格式的时候后面添加"," 如1,2,或者直接传递list集合 到时候进行修改实体类数据类型
     */
    @PostMapping("add")
    @ApiOperation(value = "新增", notes = "新增数据")
    @Loggable(description = "新增")
    public R insertCatalogueTemplate(@RequestBody CatalogueTemplateVO catalogueTemplateVO) {
        return success(catalogueTemplateService.insertCatalogueTemplateVO(catalogueTemplateVO));
    }

    /**
     * 新增页面元数据列表
     */
    @GetMapping("getMetadataField")
    @ApiOperation(value = "元数据列表", notes = "获取元数据列表")
    public R getMetadataFieldById(Long id) {
        return success(metadataFieldService.getAll());
    }

    /**
     * 更新
     */
    @PostMapping("update")
    @ApiOperation(value = "更新", notes = "根据主键更新数据")
    @Loggable(description = "更新")
    public R updateCatalogueTemplate(@RequestBody CatalogueTemplateVO catalogueTemplateVO) {
        return success(catalogueTemplateService.updateCatalogueTemplateVO(catalogueTemplateVO));
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
        return success(catalogueTemplateService.deleteCatalogueTemplateVO(id));
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
        return success(catalogueTemplateService.deleteCatalogueTemplateVOList(ids));
    }

    /**
     * 根据id列表批量导出词库数据,当id列表的长度0时,表示导出所有词库数据
     */
    @GetMapping("exportFile")
    @ApiOperation(value = "批量导出数据", notes = "根据主键导出对应的数据,当没有主键时导出全部数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ids", value = "id列表", required = true, example = "1,2,3")
    })
    @Loggable(description = "批量导出数据")
    public void exportFile(@RequestParam(value = "ids", required = false) List<Long> ids, HttpServletResponse response) {

        try {
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            // 防止中文乱码
            String fileName = URLEncoder.encode("编目管理导出数据", "UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".xlsx");
            /**
             * 判断前端传递的参数过来的ids是否为空 为空表示导出全部数据,不为空表示查询指定id的数据
             */
            List<CatalogueTemplateVO> list = new ArrayList<>();
            if (ids.isEmpty()) {
                list = catalogueTemplateService.getAll();
            } else {
                list = catalogueTemplateService.getListByIds(ids);
            }
            Set<String> includeFields = CatalogueTemplateVOModel.setField();
            //将数据写入到Excel中
            EasyExcel.write(response.getOutputStream(), CatalogueTemplateVOModel.class)
                    .sheet("编目数据")
                    .includeColumnFiledNames(includeFields)
                    .doWrite(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
