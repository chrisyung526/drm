package cn.tcsoft.drm.event.listener;

import cn.tcsoft.drm.entity.SysLog;
import cn.tcsoft.drm.event.model.LogMessage;
import cn.tcsoft.drm.service.SysLogService;
import ma.glasnost.orika.MapperFacade;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/2/23  17:12
 * @description: 日志监听器
 * eg: SpringUtils.publishEvent(event)
 */
@Component
public class SysLogListener {

    @Resource
    SysLogService logService;
    @Resource
    MapperFacade mapperFacade;

    @Async("asyncTaskExecutor")
    @EventListener({LogMessage.class})
    public void save(LogMessage logMessage) {
        SysLog sysLog=mapperFacade.map(logMessage, SysLog.class);
        sysLog.setSystemName(Objects.equals(logMessage.getSystemName(),"1")?"mmis":Objects.equals(logMessage.getSystemName(),"2")?"hkmemory":"common");
        //入库
        logService.save(sysLog);

    }
}