package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.SysLog;
import cn.tcsoft.drm.mapper.SysLogMapper;
import cn.tcsoft.drm.service.SysLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;
import java.util.Objects;
import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import cn.tcsoft.drm.model.QueryPageDO;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;

import javax.annotation.Resource;

/**
 * <p>
 * 系统日志表  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-03-30
 */
@Slf4j
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {

   @Resource
   private SysLogMapper syslogMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public SysLog getInfoById(Long id){
        SysLog syslog = syslogMapper.selectById(id);
        if (Objects.isNull(syslog)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return syslog;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateSysLog(SysLog syslog){
        if (Objects.isNull(syslog.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = syslogMapper.updateById(syslog);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{syslog}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertSysLog(SysLog syslog){
        int row = 0;
        try {
            row = syslogMapper.insert(syslog);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{syslog}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean delete(Long id){
        if (Objects.isNull(id)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = syslogMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{syslog}] 未知异常");
        }
        return row > 0;
   }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteList(List<Long> ids) {
        if (Objects.isNull(ids)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = syslogMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{syslog}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<SysLog> getSysLogPage(QueryPageDO query){
        Page<SysLog> syslogPage = syslogMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<SysLog>());
        return syslogPage;
   }
}
