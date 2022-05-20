package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.MetadataSchema;
import cn.tcsoft.drm.mapper.MetadataSchemaMapper;
import cn.tcsoft.drm.service.MetadataSchemaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.List;
import java.util.Objects;
import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import cn.tcsoft.drm.model.QueryPageDO;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;

import javax.annotation.Resource;

/**
 * <p>
 * Metadata Schema  服务实现类
 * </p>
 *
 * @author ZYS 元数据service实现类
 * @since 2022-05-11
 */
@Slf4j
@Service
public class MetadataSchemaServiceImpl extends ServiceImpl<MetadataSchemaMapper, MetadataSchema> implements MetadataSchemaService {

   @Resource
   private MetadataSchemaMapper metadataSchemaMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public MetadataSchema getInfoById(Long id){
        MetadataSchema metadataSchema = metadataSchemaMapper.selectById(id);
        if (Objects.isNull(metadataSchema)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataSchema;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateMetadataSchema(MetadataSchema metadataSchema){
        if (Objects.isNull(metadataSchema.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataSchemaMapper.updateById(metadataSchema);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataSchema}] 未知异常");
           throw new RuntimeException("修改数据失败");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertMetadataSchema(MetadataSchema metadataSchema){
        int row = 0;
        try {
            row = metadataSchemaMapper.insert(metadataSchema);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataSchema}] 未知异常");
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
            row = metadataSchemaMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataSchema}] 未知异常");
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
            row = metadataSchemaMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{metadataSchema}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<MetadataSchema> getMetadataSchemaPage(QueryPageDO query){
        Page<MetadataSchema> metadataSchemaPage = metadataSchemaMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<MetadataSchema>());
        return metadataSchemaPage;
   }
}
