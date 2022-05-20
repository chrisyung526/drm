package cn.tcsoft.drm.controller.client;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.Constants;
import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.service.MediaStreamService;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/2/21  09:23
 * @description: 流媒体加密校验
 */
@RestController
@RequestMapping("/client-api/mediaStream")
@Api(tags = "流媒体播放管理模块")
public class MediaStreamController extends BaseController {

    @Resource
    MediaStreamService mediaStreamService;


    @GetMapping("generateToken")
    @ApiOperation("流媒体token生成")
    @ApiOperationSupport(author = Constants.BY_TC_DEVELOPER_HYMAN,order = 1)
    @Loggable(description = "流媒体token生成")
    public R generalToken(){
        return success(mediaStreamService.generalToken());
    }

    @GetMapping("decrypt")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "identifier", value = "流媒体标识", required = true, example = "aaa"),
            @ApiImplicitParam(name = "streamToken", value = "流媒体检验token", required = true, example = "enc"),
    })
    @ApiOperation("流媒体解密key")
    @ApiOperationSupport(author = Constants.BY_TC_DEVELOPER_HYMAN,order = 2)
    @Loggable(description = "流媒体解密key")
    public String decrypt(String identifier,String streamToken){
        if(Objects.isNull(identifier)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        return mediaStreamService.getDecrypt(identifier,streamToken);
    }

    @GetMapping(value = "playlist/{identifier}/{listName:.+}")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "identifier", value = "流媒体标识", required = true, example = "aaa"),
            @ApiImplicitParam(name = "streamToken", value = "流媒体检验token", required = true, example = "enc"),
            @ApiImplicitParam(name = "listName", value = "播放的资源名称", required = true, example = "test.m3u8")
    })
    @ApiOperation("播放流媒体资源")
    @ApiOperationSupport(author = Constants.BY_TC_DEVELOPER_HYMAN,order = 3)
    @Loggable(description = "播放流媒体资源", include = "")
    public ResponseEntity<?> playlist(@PathVariable("identifier") String identifier,@PathVariable("listName") String listName,String streamToken)  {
        if(Objects.isNull(listName) || Objects.isNull(identifier)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        return mediaStreamService.playlist(identifier,listName,streamToken);
    }

    @GetMapping(value = "playlist/{identifier}/{rate}/{listName:.+}")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "identifier", value = "流媒体标识", required = true, example = "aaa"),
            @ApiImplicitParam(name = "streamToken", value = "流媒体检验token", required = true, example = "enc"),
            @ApiImplicitParam(name = "rate", value = "码率", required = true, example = "h1080"),
            @ApiImplicitParam(name = "listName", value = "播放的资源名称", required = true, example = "test.m3u8")
    })
    @ApiOperation("播放流媒体资源(视频码率切换)")
    @ApiOperationSupport(author = Constants.BY_TC_DEVELOPER_HYMAN,order = 4)
    @Loggable(description = "播放流媒体资源(视频码率切换)")
    public ResponseEntity<?> codeRateSwitch(@PathVariable("identifier") String identifier,@PathVariable("rate")String rate,@PathVariable("listName") String listName,String streamToken)  {
        if(Objects.isNull(listName) || Objects.isNull(rate) || Objects.isNull(identifier)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        return mediaStreamService.codeRateSwitch(identifier,rate,listName,streamToken);
    }

    @GetMapping(value = "playlist/{identifier}/{live}/{rate}/{listName:.+}")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "identifier", value = "流媒体标识", required = true, example = "aaa"),
            @ApiImplicitParam(name = "streamToken", value = "流媒体检验token", required = true, example = "enc"),
            @ApiImplicitParam(name = "live", value = "直播间", required = true, example = "5125"),
            @ApiImplicitParam(name = "rate", value = "码率", required = true, example = "h1080"),
            @ApiImplicitParam(name = "listName", value = "播放的资源名称", required = true, example = "test.m3u8")
    })
    @ApiOperation("直播回放流媒体资源(视频码率切换)")
    @ApiOperationSupport(author = Constants.BY_TC_DEVELOPER_HYMAN ,order = 5)
    @Loggable(description = "播放流媒体资源(视频码率切换)直播回放")
    public ResponseEntity<?> codeRateSwitch(@PathVariable("identifier") String identifier,@PathVariable("live")String live,@PathVariable("rate")String rate,@PathVariable("listName") String listName,String streamToken)  {
        if(Objects.isNull(listName) || Objects.isNull(rate) || Objects.isNull(identifier)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        return mediaStreamService.codeRateSwitch(identifier,live,rate,listName,streamToken);
    }


}