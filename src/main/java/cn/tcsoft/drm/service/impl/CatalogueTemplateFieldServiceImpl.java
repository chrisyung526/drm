package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.CatalogueTemplateField;
import cn.tcsoft.drm.mapper.CatalogueTemplateFieldMapper;
import cn.tcsoft.drm.service.CatalogueTemplateFieldService;
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
 * Catalogue Template Field  服务实现类
 * </p>
 *
 * @author ZYS 编目管理service 实现类
 * @since 2022-05-17
 */
@Slf4j
@Service
public class CatalogueTemplateFieldServiceImpl extends ServiceImpl<CatalogueTemplateFieldMapper, CatalogueTemplateField> implements CatalogueTemplateFieldService {

   @Resource
   private CatalogueTemplateFieldMapper catalogueTemplateFieldMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public CatalogueTemplateField getInfoById(Long id){
        CatalogueTemplateField catalogueTemplateField = catalogueTemplateFieldMapper.selectById(id);
        if (Objects.isNull(catalogueTemplateField)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return catalogueTemplateField;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateCatalogueTemplateField(CatalogueTemplateField catalogueTemplateField){
        if (Objects.isNull(catalogueTemplateField.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = catalogueTemplateFieldMapper.updateById(catalogueTemplateField);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{catalogueTemplateField}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertCatalogueTemplateField(CatalogueTemplateField catalogueTemplateField){
        int row = 0;
        try {
            row = catalogueTemplateFieldMapper.insert(catalogueTemplateField);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{catalogueTemplateField}] 未知异常");
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
            row = catalogueTemplateFieldMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{catalogueTemplateField}] 未知异常");
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
            row = catalogueTemplateFieldMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{catalogueTemplateField}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<CatalogueTemplateField> getCatalogueTemplateFieldPage(QueryPageDO query){
        Page<CatalogueTemplateField> catalogueTemplateFieldPage = catalogueTemplateFieldMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<CatalogueTemplateField>());
        return catalogueTemplateFieldPage;
   }
}
