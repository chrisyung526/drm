package cn.tcsoft.drm.controller.admin.system;

import cn.tcsoft.drm.config.HkmpConfig;
import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.util.tools.FileUtils;
import com.baomidou.mybatisplus.extension.api.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import sun.swing.FilePane;

import java.net.URLDecoder;

/**
 * <p>
 * HKMP通用接口
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Slf4j
@Api(tags = "HKMP_通用接口")
@RestController
@RequestMapping("/admin/common")
public class HkmpCommonController extends BaseController {
    /**
     * 通用上传请求
     */
    @PostMapping("/hkmp/upload")
    @ApiOperation(value = "通用上传接口",notes = "通用上传接口",response = String.class)
    @Loggable(description = "通用上传接口")
    public R uploadFile(MultipartFile file) throws Exception
    {
        try
        {   // 上传文件路径
            String filePath = HkmpConfig.getUploadPath();
            filePath = URLDecoder.decode(filePath, "utf-8");
            String url = FileUtils.saveHkmpFile(file, filePath);
            return success(R.ok(url));
        }
        catch (Exception e)
        {
            log.debug(e.getMessage());
            return  failed(e.getMessage());
        }
    }
}
