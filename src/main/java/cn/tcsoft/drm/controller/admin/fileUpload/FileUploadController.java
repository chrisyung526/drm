package cn.tcsoft.drm.controller.admin.fileUpload;


import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.service.FileUploadService;
import com.baomidou.mybatisplus.extension.api.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @author ZYS 2022-05-11 文件上传控制层
 */
@Api(tags = "文件上传")
@RestController
@RequestMapping("/admin/fileUpload")
public class FileUploadController extends BaseController {

    @Resource
    private FileUploadService fileUploadService;

    /**
     * 文件上传
     */
    @PostMapping("uploadFile")
    @ApiOperation(value = "文件上传", notes = "进行文件上传操作返回对应的文件地址", response = String.class)
    @Loggable(description = "文件上传")
    public R uploadFile(MultipartFile... file) throws IOException {
        return success(fileUploadService.uploadFile(file));
    }
}
