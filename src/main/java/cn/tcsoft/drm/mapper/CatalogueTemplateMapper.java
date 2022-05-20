package cn.tcsoft.drm.mapper;

import cn.tcsoft.drm.entity.CatalogueTemplate;
import cn.tcsoft.drm.model.QueryPageDO;
import cn.tcsoft.drm.model.vo.CatalogueTemplateVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Catalogue Template Mapper 接口
 * </p>
 *
 * @author ZYS 编目管理mapper层
 * @since 2022-05-17
 */
public interface CatalogueTemplateMapper extends BaseMapper<CatalogueTemplate> {

    /**
     * 查询分页列表
     * @param page 分页
     * @param query 分页参数
     * @return 分页对象
     */
    IPage<CatalogueTemplateVO> pageList(@Param("page") Page<CatalogueTemplateVO> page,@Param("query") QueryPageDO query);


    /**
     * 根据id 获取对应的VO对象
     * @param id 主键id
     * @return CatalogueTemplateVO 对象
     */
    CatalogueTemplateVO selectCatalogueTemplateVOById(Long id);

    /**
     * 查询全部CatalogueTemplateVO对象数据
     * @return CatalogueTemplateVO对象集合
     */
    List<CatalogueTemplateVO> getAll();

    /**
     * 查询ids集合对应的VO对象数据
     * @param ids id集合
     * @return CatalogueTemplateVO 对象
     */
    List<CatalogueTemplateVO> getListByIds(@Param("ids") List<Long> ids);
}
