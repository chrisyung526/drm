package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.ControlledMisc;
import cn.tcsoft.drm.model.vo.ControlledMiscVO;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-12
 */
public interface ControlledMiscService extends IService<ControlledMisc> {
    /**
     * 根据ControlledMisc的id获取当前对象
     * @param id
     * @return ControlledMisc
     */
    ControlledMisc getInfoById(Long id);



    /**
    * 修改
    * @param controlledmisc
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateControlledMisc(ControlledMisc controlledmisc);

    /**
    * 新增
    * @param controlledmisc
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertControlledMisc(ControlledMisc controlledmisc);

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
    * @return  Page<ControlledMisc>
    */
    Page<ControlledMisc> getControlledMiscPage(ControlledMiscVO query);

    /**
     * 合并
     * @param controlledmisc
     * @return
     */
    boolean mergeControlledMisc(ControlledMisc controlledmisc);
}
