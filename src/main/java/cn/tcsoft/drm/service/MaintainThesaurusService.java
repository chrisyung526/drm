package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.MaintainThesaurus;
import cn.tcsoft.drm.model.dto.MaintainThesaurusQuery;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ZYS 词库service层
 * @since 2022-05-06
 */
public interface MaintainThesaurusService extends IService<MaintainThesaurus> {
    /**
     * 根据MaintainThesaurus的id获取当前对象
     * @param id
     * @return MaintainThesaurus
     */
    MaintainThesaurus getInfoById(Long id);

    /**
    * 修改
    * @param maintainThesaurus 词库对象
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateMaintainThesaurus(MaintainThesaurus maintainThesaurus);

    /**
    * 新增
    * @param maintainThesaurus 词库对象
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertMaintainThesaurus(MaintainThesaurus maintainThesaurus);

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
    * @return  Page<MaintainThesaurus>
    */
    Page<MaintainThesaurus> getMaintainThesaurusPage(MaintainThesaurusQuery query);

    /**
     * 批量插入词库数据
     * @param maintainThesaurusList 词库列表
     */
    void saveModel(List<MaintainThesaurus> maintainThesaurusList);

}
