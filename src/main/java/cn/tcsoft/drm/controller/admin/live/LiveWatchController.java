package cn.tcsoft.drm.controller.admin.live;

import cn.tcsoft.drm.controller.BaseController;
import cn.tcsoft.drm.entity.TccLiveWatch;
import cn.tcsoft.drm.model.vo.ApiResult;
import cn.tcsoft.drm.service.LiveWatchService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 测试使用，后期请改成admin
 */
@RestController
@RequestMapping("/client-api/live/watch")
@Api(tags = "直播观看")
@Slf4j
public class LiveWatchController extends BaseController {
    @Resource
    private LiveWatchService liveWatchService;

    @GetMapping("/{liveId}")
    public ApiResult liveList(@PathVariable Long liveId) {
        return ApiResult.success(liveWatchService.list(Wrappers.lambdaQuery(TccLiveWatch.class).eq(TccLiveWatch::getLiveId,liveId).orderByDesc(TccLiveWatch::getCreateTime)));
    }

    @PostMapping
    public ApiResult addLive(@RequestBody TccLiveWatch liveWatch) {
        liveWatch.setOnlineStatus(1);
        liveWatch.setJoinTime(new Date());
        liveWatchService.save(liveWatch);
        return ApiResult.success();
    }
    @PutMapping("/{liveId}")
    public  ApiResult updateStatus(@PathVariable Long liveId,@RequestParam Long userId){
        TccLiveWatch t = liveWatchService.getOne(Wrappers.lambdaQuery(TccLiveWatch.class).eq(TccLiveWatch::getLiveId,liveId).eq(TccLiveWatch::getUserId,userId));
        TccLiveWatch liveWatch = new TccLiveWatch();
        liveWatch.setId(t.getId());
        liveWatch.setOnlineStatus(0);
        liveWatchService.updateById(liveWatch);
        return ApiResult.success();
    }
    

}
