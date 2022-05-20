package cn.tcsoft.drm.service;

import cn.tcsoft.drm.entity.CatalogueTemplate;
import cn.tcsoft.drm.model.vo.CatalogueTemplateVO;
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
 * @author ZYS 编目管理service层
 * @since 2022-05-17
 */
public interface CatalogueTemplateService extends IService<CatalogueTemplate> {
    /**
     * 根据CatalogueTemplate的id获取当前对象
     * @param id
     * @return CatalogueTemplate
     */
    CatalogueTemplateVO getInfoById(Long id);



    /**
    * 修改
    * @param catalogueTemplateVO 实体类对象
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateCatalogueTemplateVO(CatalogueTemplateVO catalogueTemplateVO);

    /**
    * 删除
    * @param id 要删除的对象主键
    * @return true代表删除成功  false代表删除失败
    */
    boolean deleteCatalogueTemplateVO(Long id);

    /**
    * 批量删除
    * @param ids 要删除的集合列表
    * @return true代表删除成功  false代表删除失败
    */
    boolean deleteCatalogueTemplateVOList(List<Long> ids);

    /**
    * 分页查询
    * @param query  分页参数
    * @return  Page<CatalogueTemplate>
    */
    IPage<CatalogueTemplateVO> getCatalogueTemplatePage(QueryPageDO query);

    /**
     * 新增
     * @param catalogueTemplateVO 实体类VO对象
     * @return true代表新增成功  false代表新增失败
     */
    boolean insertCatalogueTemplateVO(CatalogueTemplateVO catalogueTemplateVO);

    /**
     * 前端传过来的ids集合为空 表示查询全部数据
     * @return CatalogueTemplateVO 对象集合
     */
    List<CatalogueTemplateVO> getAll();

    /**
     * 前端传过来的ids集合不为空 表示查询指定id的VO对象数据
     * @param ids id集合
     * @return CatalogueTemplateVO 对象集合
     */
    List<CatalogueTemplateVO> getListByIds(List<Long> ids);
}
