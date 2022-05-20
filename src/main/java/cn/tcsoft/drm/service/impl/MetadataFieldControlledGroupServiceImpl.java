package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.MetadataFieldControlledGroup;
import cn.tcsoft.drm.mapper.MetadataFieldControlledGroupMapper;
import cn.tcsoft.drm.service.MetadataFieldControlledGroupService;
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
 * Metadata property control  服务实现类
 * </p>
 *
 * @author ZYS 元数据service实现类
 * @since 2022-05-11
 */
@Slf4j
@Service
public class MetadataFieldControlledGroupServiceImpl extends ServiceImpl<MetadataFieldControlledGroupMapper, MetadataFieldControlledGroup> implements MetadataFieldControlledGroupService {

   @Resource
   private MetadataFieldControlledGroupMapper metadataFieldControlledGroupMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public MetadataFieldControlledGroup getInfoById(Long id){
        MetadataFieldControlledGroup metadataFieldControlledGroup = metadataFieldControlledGroupMapper.selectById(id);
        if (Objects.isNull(metadataFieldControlledGroup)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataFieldControlledGroup;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateMetadataFieldControlledGroup(MetadataFieldControlledGroup metadataFieldControlledGroup){
        if (Objects.isNull(metadataFieldControlledGroup.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataFieldControlledGroupMapper.updateById(metadataFieldControlledGroup);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldControlledGroup}] 未知异常");
            throw new RuntimeException("修改数据失败");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertMetadataFieldControlledGroup(MetadataFieldControlledGroup metadataFieldControlledGroup){
        int row = 0;
        try {
            row = metadataFieldControlledGroupMapper.insert(metadataFieldControlledGroup);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldControlledGroup}] 未知异常");
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
            row = metadataFieldControlledGroupMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldControlledGroup}] 未知异常");
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
            row = metadataFieldControlledGroupMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{metadataFieldControlledGroup}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<MetadataFieldControlledGroup> getMetadataFieldControlledGroupPage(QueryPageDO query){
        Page<MetadataFieldControlledGroup> metadataFieldControlledGroupPage = metadataFieldControlledGroupMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<MetadataFieldControlledGroup>());
        return metadataFieldControlledGroupPage;
   }
}
