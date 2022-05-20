package cn.tcsoft.drm.mapper;

import cn.tcsoft.drm.entity.MetadataField;
import cn.tcsoft.drm.model.dto.MetadataFieldVOQuery;
import cn.tcsoft.drm.model.vo.MetadataFieldVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Metadata Fields Mapper 接口
 * </p>
 *
 * @author ZYS 元数据mapper层
 * @since 2022-05-11
 */
public interface MetadataFieldMapper extends BaseMapper<MetadataField> {

    /**
     * 获取元数据分页数据
     * @param page 分页对象
     * @param query 分页参数
     * @return 分页数据
     */
    IPage<MetadataFieldVO> list(Page<MetadataFieldVO> page, MetadataFieldVOQuery query);

    /**
     * 根据id 查询对应的元数据VO对象
     * @param id metadataSchemaId
     * @return MetadataFieldVO 对象
     */
    MetadataFieldVO selectMetadataFieldVOById(Long id);

    /**
     * 获取全部元数据数据
     * @return 元数据VO对象集合
     */
    List<MetadataFieldVO> getAll();

    /**
     * 根据 metadataSchemaId集合 获取对应的VO对象集合
     * @param ids metadataSchemaId集合
     * @return 元数据VO对象集合
     */
    List<MetadataFieldVO> getListByIds(@Param("ids") List<Long> ids);

    /**
     * display元数据排序分页查询
     * @param page 分页
     * @param query 分页参数
     * @return 分页数据
     */
    IPage<MetadataFieldVO> displayList(@Param("page") Page<MetadataFieldVO> page, @Param("query") MetadataFieldVOQuery query);

    /**
     * 通过metadataFieldId 获取到对应的元数据
     * @param metadataFieldId metadataFieldId
     * @return 对应的元数据VO对象
     */
    MetadataFieldVO getInfoByFieldId(Long metadataFieldId);

}
