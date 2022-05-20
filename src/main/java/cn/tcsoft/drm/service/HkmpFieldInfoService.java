package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.model.vo.HkmpFieldInfoQueryVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
public interface HkmpFieldInfoService extends IService<HkmpFieldInfo> {
    /**
     * 根据HkmpFieldInfo的id获取当前对象
     * @param id
     * @return HkmpFieldInfo
     */
    HkmpFieldInfo getInfoById(Long id);



    /**
    * 修改
    * @param hkmpfieldinfo
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateHkmpFieldInfo(HkmpFieldInfo hkmpfieldinfo);

    /**
    * 新增
    * @param hkmpfieldinfo
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertHkmpFieldInfo(HkmpFieldInfo hkmpfieldinfo);

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
    * @return  Page<HkmpFieldInfo>
    */
    IPage<HkmpFieldInfo> getHkmpFieldInfoPage(HkmpFieldInfoQueryVO query);
}
