package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.MetadataFieldProperties;
import cn.tcsoft.drm.mapper.MetadataFieldPropertiesMapper;
import cn.tcsoft.drm.service.MetadataFieldPropertiesService;
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
 * Metadata Field Properties  服务实现类
 * </p>
 *
 * @author ZYS 元数据service实现类
 * @since 2022-05-11
 */
@Slf4j
@Service
public class MetadataFieldPropertiesServiceImpl extends ServiceImpl<MetadataFieldPropertiesMapper, MetadataFieldProperties> implements MetadataFieldPropertiesService {

   @Resource
   private MetadataFieldPropertiesMapper metadataFieldPropertiesMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public MetadataFieldProperties getInfoById(Long id){
        MetadataFieldProperties metadataFieldProperties = metadataFieldPropertiesMapper.selectById(id);
        if (Objects.isNull(metadataFieldProperties)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataFieldProperties;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateMetadataFieldProperties(MetadataFieldProperties metadataFieldProperties){
        if (Objects.isNull(metadataFieldProperties.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataFieldPropertiesMapper.updateById(metadataFieldProperties);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldProperties}] 未知异常");
           throw new RuntimeException("修改数据失败");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertMetadataFieldProperties(MetadataFieldProperties metadataFieldProperties){
        int row = 0;
        try {
            row = metadataFieldPropertiesMapper.insert(metadataFieldProperties);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldProperties}] 未知异常");
           throw new RuntimeException("新增数据失败");
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
            row = metadataFieldPropertiesMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldProperties}] 未知异常");
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
            row = metadataFieldPropertiesMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{metadataFieldProperties}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<MetadataFieldProperties> getMetadataFieldPropertiesPage(QueryPageDO query){
        Page<MetadataFieldProperties> metadataFieldPropertiesPage = metadataFieldPropertiesMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<MetadataFieldProperties>());
        return metadataFieldPropertiesPage;
   }
}
