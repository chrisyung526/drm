package cn.tcsoft.drm.controller.admin.live;

import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.entity.TFileInfo;
import cn.tcsoft.drm.entity.TccLive;
import cn.tcsoft.drm.model.vo.ApiResult;
import cn.tcsoft.drm.service.FileInfoService;
import cn.tcsoft.drm.service.LiveService;
import cn.tcsoft.drm.service.MediaStreamService;
import cn.tcsoft.drm.util.ffmpeg.FileInfoUtil;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.Random;

/**
 * 测试使用，后期所有接口代码逻辑需要重新调整。目前没有做任何校验和按照规范编写
 */
@RestController
@RequestMapping("/client-api/live")
@Api(tags = "直播")
@Slf4j
public class LiveController extends BaseController {
    @Resource
    private LiveService liveService;
    @Resource
    private FileInfoService fileInfoService;
    @Value("${prop.upload-folder}")
    private String uploadFolder;
    @Resource
    private MediaStreamService mediaStreamService;

    /**
     * srs 服务器文件
     * see:https://gitee.com/ossrs/srs/wikis/v4_CN_HTTPCallback
     */
    @PostMapping("/dvr")
    public ApiResult liveApi(@RequestBody Map<String, String> map) {
        System.out.println("直播服务器录制视频回调参数");
        map.forEach((k, v) -> System.out.println("key:value = " + k + ":" + v));
        int code = 0;
        String mes = "回调成功";
        //注意：当使用rtmp拉流会进去on_connect和on_close和on_play等，所以可以使用来做观看直播的进入和退出、播放等功能
        if ("on_connect".equals(map.get("action"))) {//连接
            if ("test".equals(map.get("stream"))) {
                File file = new File(uploadFolder + "/live/" + map.get("stream") + "/" + "live_" + map.get("stream") + ".mp4");
                if (file.exists()) {
                    file.delete();
                }
            }


            TccLive tccLive = liveService.getOne(Wrappers.lambdaQuery(TccLive.class).eq(TccLive::getRoomId, map.get("stream")));
            if (tccLive == null) {//没有开始直播的才可以直播，没有开的房间都不允许直播
                code = 404;
                mes = "没有找到房间号";
            } else if (tccLive.getStatus() != 0 && tccLive.getClientId().equals(map.get("client_id"))) {
                code = 404;
                mes = "直播已经结束";
            }
        }
        if ("on_publish".equals(map.get("action"))) {//开始推流
            TccLive live = new TccLive();
            live.setStatus(1);
            live.setClientId(map.get("client_id"));
            live.setStartTime(new Date());
            liveService.update(live, new UpdateWrapper<TccLive>().lambda().eq(TccLive::getRoomId, map.get("stream")));
        } else if ("on_play".equals(map.get("action"))) {//拉流播放
            String param = map.get("param");
            //携带url验证格式为?streamToken=....携带参数应为大于13个字符且问号在第一位
            if (param.length() > 13 && param.indexOf("?") == 0) {
                //截取？后面字符判断是否为token
                String str = param.substring(param.indexOf("?") + 1, 12);
                if ("streamToken".equals(str)) {
                    Boolean flag = false;
                    //截取=后面字符串校验token是否有效
                    String token = param.substring(param.indexOf("=") + 1, param.length());
                    flag = mediaStreamService.isExpire(token);
                    if (flag) {
                        code = 0;
                        mes = "token验证成功...客户端开始播放...";
                    } else {
                        code = 1;
                        mes = "token验证失败...禁止客户端播放...";
                    }
                } else {
                    code = 1;
                    mes = "请求未携带token...禁止客户端播放";
                }
            } else {
                code = 1;
                mes = "请求未携带token...禁止客户端播放";
            }
        } else if ("on_unpublish".equals(map.get("action"))) {//停止推流
            if (!"test".equals(map.get("stream"))) {
                TccLive tccLive = liveService.getOne(Wrappers.lambdaQuery(TccLive.class).eq(TccLive::getRoomId, map.get("stream")));
                TccLive live = new TccLive();
                live.setStatus(2);
                live.setEndTime(new Date());
                live.setId(tccLive.getId());
                live.setDuration(Integer.valueOf(String.valueOf((live.getEndTime().getTime() - tccLive.getStartTime().getTime()) / 1000)));
                liveService.updateById(live);
                //存储文件
                TFileInfo info = new TFileInfo();
                info.setFileName("live_" + map.get("stream") + ".mp4");
                info.setLocation("/live/" + map.get("stream") + "/" + info.getFileName());
                info.setRefProjectId(map.get("stream"));
                info.setTotalSize(FileInfoUtil.getFileSize(uploadFolder + info.getLocation()));
                fileInfoService.addFileInfo(info);
                fileInfoService.convertM3u8("live/" + map.get("stream"), info.getFileName());
            } else {
                TccLive live = new TccLive();
                live.setStatus(0);
                live.setClientId("");
                live.setStartTime(null);
                liveService.update(live, new UpdateWrapper<TccLive>().lambda().eq(TccLive::getRoomId, map.get("stream")));
            }
        }
        System.out.println("直播服务器录制视频回调结束");
        return ApiResult.success(code, mes, map.get("action") + "==" + map.get("stream"));
    }

    @GetMapping
    public ApiResult liveList() {
        return ApiResult.success(liveService.list(Wrappers.lambdaQuery(TccLive.class).last("limit 0,20").orderByDesc(TccLive::getCreateTime)));
    }

    @PostMapping
    public ApiResult addLive(@RequestBody TccLive live) {
        live.setRoomId(new Random().nextInt(9999) + "");
        live.setStatus(0);
        liveService.save(live);
        return ApiResult.success(live);
    }

    @PutMapping("/{id}")
    public ApiResult updateStatus(@PathVariable Long id, @RequestParam String roomId, @RequestParam Integer status) {
        TccLive live = new TccLive();
        live.setId(id);
        live.setStatus(status);
        live.setRoomId(roomId);
        liveService.updateById(live);
        return ApiResult.success();
    }

    @GetMapping("/{roomId}")
    public ApiResult liveInfoToRoomId(@PathVariable String roomId) {
        return ApiResult.success(liveService.getOne(Wrappers.lambdaQuery(TccLive.class).eq(TccLive::getRoomId, roomId)));
    }


}
