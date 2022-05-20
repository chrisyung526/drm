package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.SysLog;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;
import cn.tcsoft.drm.model.QueryPageDO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-03-30
 */
public interface SysLogService extends IService<SysLog> {
    /**
     * 根据SysLog的id获取当前对象
     * @param id
     * @return SysLog
     */
    SysLog getInfoById(Long id);



    /**
    * 修改
    * @param syslog
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateSysLog(SysLog syslog);

    /**
    * 新增
    * @param syslog
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertSysLog(SysLog syslog);

    /**
    * 删除
    * @param id 要删除的对象主键
    * @return true代表删除成功  false代表删除失败
    */
    boolean delete(Long id);

    /**
    * 批量删除
    * @param ids 要删除的集合列表
    * @return true代表删除成功  false代表删除失败
    */
    boolean deleteList(List<Long> ids);

    /**
    * 分页查询
    * @param query  分页参数
    * @return  Page<SysLog>
    */
    Page<SysLog> getSysLogPage(QueryPageDO query);
}
