package cn.tcsoft.drm.service.admin.system;

import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
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
 * @since 2022-05-07
 */
public interface ViewFieldinfoRefService extends IService<ViewFieldinfoRef> {
    /**
     * 根据ViewFieldinfoRef的id获取当前对象
     * @param id
     * @return ViewFieldinfoRef
     */
    ViewFieldinfoRef getInfoById(Long id);



    /**
    * 修改
    * @param viewfieldinforef
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateViewFieldinfoRef(ViewFieldinfoRef viewfieldinforef);

    /**
    * 新增
    * @param viewfieldinforef
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertViewFieldinfoRef(ViewFieldinfoRef viewfieldinforef);

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
    * @return  Page<ViewFieldinfoRef>
    */
    Page<ViewFieldinfoRef> getViewFieldinfoRefPage(QueryPageDO query);

    /**
     * 根据字段id获取关联view信息
     * @param fieldId
     * @return
     */
    List<View> getInfoByFieldId(Long fieldId);

    /**
     * 根据视图id获取关联字段信息
     * @param vid
     * @return
     */
    List<ViewFieldinfoRef> getInfoByViewId(Long vid);
}
