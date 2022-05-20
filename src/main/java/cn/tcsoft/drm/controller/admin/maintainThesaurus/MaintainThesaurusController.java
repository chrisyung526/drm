package cn.tcsoft.drm.controller.admin.maintainThesaurus;

import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.model.dto.MaintainThesaurusQuery;
import cn.tcsoft.drm.xlsx.listener.MaintainThesaurusModelListener;
import cn.tcsoft.drm.xlsx.model.MaintainThesaurusModel;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import cn.tcsoft.drm.entity.MaintainThesaurus;
import cn.tcsoft.drm.service.MaintainThesaurusService;
import com.baomidou.mybatisplus.extension.api.R;
import cn.tcsoft.drm.config.log.Loggable;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ZYS 2022-05-07 词库接口
 * @since 2022-05-06
 */
@Api(tags = "(MMIS)词库管理")
@RestController
@RequestMapping("/admin/maintainThesaurus")
public class MaintainThesaurusController extends BaseController {

    @Resource
    private MaintainThesaurusService maintainThesaurusService;

    @Resource
    private MaintainThesaurusModelListener listener;

    /**
     * 分页列表
     */
    @GetMapping("page")
    @ApiOperation(value = "分页列表", notes = "分页列表查询", response = MaintainThesaurus.class)
    @Loggable(description = "分页列表")
    public R queryMaintainThesaurusList(@Validated @ModelAttribute("query") MaintainThesaurusQuery query) {
        Page<MaintainThesaurus> page = maintainThesaurusService.getMaintainThesaurusPage(query);
        System.out.println(page.toString());
        return success(page);
    }

    /**
     * 根据id获取信息
     */
    @GetMapping("{id}")
    @ApiOperation(value = "详情信息", notes = "根据主键查询数据详情", response = MaintainThesaurus.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "主键id", required = true, example = "1")
    })
    @Loggable(description = "详情信息")
    public R getMaintainThesaurusInfoById(@PathVariable("id") Long id) {
        return success(maintainThesaurusService.getInfoById(id));
    }


    /**
     * 新增
     */
    @PostMapping("add")
    @ApiOperation(value = "新增", notes = "新增数据")
    @Loggable(description = "新增")
    public R insertMaintainThesaurus(@RequestBody MaintainThesaurus maintainThesaurus) {
        return success(maintainThesaurusService.insertMaintainThesaurus(maintainThesaurus));
    }

    /**
     * 更新
     */
    @PostMapping("update")
    @ApiOperation(value = "更新", notes = "根据主键更新数据")
    @Loggable(description = "更新")
    public R updateMaintainThesaurus(@RequestBody MaintainThesaurus maintainThesaurus) {
        return success(maintainThesaurusService.updateMaintainThesaurus(maintainThesaurus));
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
        return success(maintainThesaurusService.delete(id));
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
        return success(maintainThesaurusService.deleteList(ids));
    }

    /**
     * 根据前端传进来的excel文件对数据进行读取并存进数据库
     *
     * @param importExcel 传过来的excel文件
     * @return success 表示数据导入成功
     */
    @PostMapping("importFile")
    @ApiOperation(value = "数据导入", notes = "根据前端传过来的文件对文件内容进行读取,将数据存进词库中")
    @Loggable(description = "读取文件")
    public R importFile(MultipartFile importExcel) throws IOException {
        //获取文件名称
        String originalFilename = importExcel.getOriginalFilename();
        //获取文件后缀名称
        String excelLastName = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
        if (!".xlsx".equals(excelLastName)) {
            return failed("文件格式错误,请重新导入");
        }
        ExcelReaderBuilder readWorkBook = EasyExcel.read(importExcel.getInputStream(), MaintainThesaurusModel.class, listener);
        readWorkBook.sheet().doRead();
        return success("success");
    }

    @GetMapping("downloadTemplate")
    @ApiOperation(value = "词库Excel模板下载", notes = "提供词库上传模板")
    @Loggable(description = "模板下载")
    public void downloadTemplate(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        // 防止中文乱码
        String fileName = URLEncoder.encode("词库上传模板", "UTF-8");

        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".xlsx");

        //设置要屏蔽的字段
        Set<String> excludeField = MaintainThesaurusModel.setField();

        //将数据写入到Excel中
        EasyExcel.write(response.getOutputStream(), MaintainThesaurusModel.class)
                .excludeColumnFiledNames(excludeField)
                .sheet("模板").doWrite(MaintainThesaurusModel.initData());

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
    public void exportFile(@RequestParam(value = "ids",required = false) List<Long> ids , HttpServletResponse response){

        try {
            response.setContentType("application/vnd.ms-excel");

            response.setCharacterEncoding("utf-8");
            // 防止中文乱码
            String fileName = URLEncoder.encode("导出数据", "UTF-8");

            response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".xlsx");

            // 判断前端页面传过来的ids的长度,若为0 则表示查询全部数据.
            List<MaintainThesaurus> list = maintainThesaurusService.list(Wrappers.lambdaQuery(MaintainThesaurus.class)
                    .in(!ids.isEmpty(), MaintainThesaurus::getId, ids));

            // 设置要导出的字段
            Set<String> includeFields = MaintainThesaurusModel.setField();
            includeFields.add("synonyms");

            //将数据写入到Excel中
            EasyExcel.write(response.getOutputStream(), MaintainThesaurusModel.class)
                    .includeColumnFiledNames(includeFields)
                    .sheet("词库数据").doWrite(list);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
