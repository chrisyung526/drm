package cn.tcsoft.drm.event.listener;

import cn.tcsoft.drm.event.model.MediaStreamStatus;
import cn.tcsoft.drm.util.SpringUtils;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * @author : hyman
 * create at:  2022/2/23  17:12
 * @description: 监听器
 * eg: SpringUtils.publishEvent(event)
 */
@Component
public class MediaStreamListener {

    @Async
    @EventListener({MediaStreamStatus.class})
    public void update(MediaStreamStatus event) {
        //写业务


    }
}