package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.MetadataField;
import cn.tcsoft.drm.model.dto.MetadataFieldVOQuery;
import cn.tcsoft.drm.model.vo.MetadataFieldVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;
import cn.tcsoft.drm.model.QueryPageDO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ZYS 元数据service层
 * @since 2022-05-11
 */
public interface MetadataFieldService extends IService<MetadataField> {
    /**
     * 根据MetadataField的id获取当前对象
     * @param id metadataSchemaId
     * @return MetadataField
     */
    MetadataFieldVO getInfoById(Long id);


    /**
     * 分页对象
     * @param query 分页参数
     * @return 分页数据
     */
    IPage<MetadataFieldVO> getMetadataFieldVOPage(MetadataFieldVOQuery query);


    /**
     * 新增VO对象
     * @param metadataFieldVO 元数据VO对象
     * @return true : 表示新增成功  false : 表示新增操作失败
     */
    boolean insertMetadataFieldVO(MetadataFieldVO metadataFieldVO);

    /**
     * 更新VO对象数据
     * @param metadataFieldVO 元数据VO对象
     * @return true : 更新成功  false : 表示更新失败
     */
    boolean updateMetadataFieldVO(MetadataFieldVO metadataFieldVO);

    /**
     * 根据id删除对应的VO对象数据
     * @param id metadataSchemaId
     * @return true : 删除成功  false : 表示删除失败
     */
    boolean deleteMetadataFieldVO(Long id);

    /**
     * 批量删除VO对象
     * @param ids metadataSchemaId集合
     * @return true : 批量删除成功  false : 批量删除失败
     */
    boolean deleteMetadataFieldVOList(List<Long> ids);

    /**
     * 获取全部元数据数据
     * @return 元数据VO对象集合
     */
    List<MetadataFieldVO> getAll();

    /**
     * 根据 metadataSchemaId集合 获取对应的元数据VO对象
     * @param ids metadataSchemaId集合
     * @return 元数据VO对象集合
     */
    List<MetadataFieldVO> getListByIds(List<Long> ids);

    /**
     * 根据传递过来的参数对元数据进行排序设定
     * @param fieldId fieldId
     * @param brief brief
     * @param detail detail
     * @param hitList hitList
     * @param contentHighlight contentHighlight
     * @return  true : 设定成功  false : 设定失败
     */
    boolean updateOrderSetting(Long fieldId, String brief, String detail, String hitList, String contentHighlight);

    /**
     * 根据fieldId 对元数据排序设定数据修改锁标识状态
     * @param fieldId fieldId
     * @param lock 锁标识
     * @return true : 修改成功  false : 修改失败
     */
    Boolean updateLockSetting(Long fieldId, String lock);

    /**
     * 元数据显示顺序设置
     * @param query 分页参数
     * @return 分页数据
     */
    IPage<MetadataFieldVO> getPageDisplay(MetadataFieldVOQuery query);

    /**
     * 根据 metadataFieldId 获取对应的VO对象
     * @param metadataFieldId 元数据metadataFieldId
     * @return MetadataFieldVO 元数据VO对象
     */
    MetadataFieldVO getInfoByFieldId(Long metadataFieldId);


}
