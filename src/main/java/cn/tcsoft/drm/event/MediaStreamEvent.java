package cn.tcsoft.drm.event;

import cn.tcsoft.drm.event.model.MediaStreamStatus;
import org.springframework.context.ApplicationEvent;

/**
 * @author : hyman
 * create at:  2022/2/23  16:57
 * @description: 流媒体推流转换事件
 */
public class MediaStreamEvent extends ApplicationEvent {
    public MediaStreamEvent(MediaStreamStatus source) {
        super(source);
    }
}