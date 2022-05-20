package cn.tcsoft.drm.event;

import cn.tcsoft.drm.event.model.MediaStreamStatus;
import org.springframework.context.ApplicationEvent;

/**
 * @author : hyman
 * create at:  2022/2/23  16:57
 * @description: 日志入库事件
 */
public class SysLogEvent extends ApplicationEvent {
    public SysLogEvent(MediaStreamStatus source) {
        super(source);
    }
}