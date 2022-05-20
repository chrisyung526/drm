package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.CatalogueRecord;
import cn.tcsoft.drm.mapper.CatalogueRecordMapper;
import cn.tcsoft.drm.service.CatalogueRecordService;
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
 * Catalogue Record  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-13
 */
@Slf4j
@Service
public class CatalogueRecordServiceImpl extends ServiceImpl<CatalogueRecordMapper, CatalogueRecord> implements CatalogueRecordService {

   @Resource
   private CatalogueRecordMapper cataloguerecordMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public CatalogueRecord getInfoById(Long id){
        CatalogueRecord cataloguerecord = cataloguerecordMapper.selectById(id);
        if (Objects.isNull(cataloguerecord)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return cataloguerecord;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateCatalogueRecord(CatalogueRecord cataloguerecord){
        if (Objects.isNull(cataloguerecord.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = cataloguerecordMapper.updateById(cataloguerecord);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{cataloguerecord}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertCatalogueRecord(CatalogueRecord cataloguerecord){
        int row = 0;
        try {
            row = cataloguerecordMapper.insert(cataloguerecord);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{cataloguerecord}] 未知异常");
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
            row = cataloguerecordMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{cataloguerecord}] 未知异常");
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
            row = cataloguerecordMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{cataloguerecord}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<CatalogueRecord> getCatalogueRecordPage(QueryPageDO query){
        Page<CatalogueRecord> cataloguerecordPage = cataloguerecordMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<CatalogueRecord>());
        return cataloguerecordPage;
   }
}
