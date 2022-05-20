package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.MetadataFieldDisplay;
import cn.tcsoft.drm.mapper.MetadataFieldDisplayMapper;
import cn.tcsoft.drm.service.MetadataFieldDisplayService;
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
 * Metadata Properties Display  服务实现类
 * </p>
 *
 * @author ZYS 元数据service实现类
 * @since 2022-05-11
 */
@Slf4j
@Service
public class MetadataFieldDisplayServiceImpl extends ServiceImpl<MetadataFieldDisplayMapper, MetadataFieldDisplay> implements MetadataFieldDisplayService {

   @Resource
   private MetadataFieldDisplayMapper metadataFieldDisplayMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public MetadataFieldDisplay getInfoById(Long id){
        MetadataFieldDisplay metadataFieldDisplay = metadataFieldDisplayMapper.selectById(id);
        if (Objects.isNull(metadataFieldDisplay)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataFieldDisplay;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateMetadataFieldDisplay(MetadataFieldDisplay metadataFieldDisplay){
        if (Objects.isNull(metadataFieldDisplay.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataFieldDisplayMapper.updateById(metadataFieldDisplay);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldDisplay}] 未知异常");
           throw new RuntimeException("修改数据失败");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertMetadataFieldDisplay(MetadataFieldDisplay metadataFieldDisplay){
        int row = 0;
        try {
            row = metadataFieldDisplayMapper.insert(metadataFieldDisplay);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldDisplay}] 未知异常");
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
            row = metadataFieldDisplayMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{metadataFieldDisplay}] 未知异常");
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
            row = metadataFieldDisplayMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{metadataFieldDisplay}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<MetadataFieldDisplay> getMetadataFieldDisplayPage(QueryPageDO query){
        Page<MetadataFieldDisplay> metadataFieldDisplayPage = metadataFieldDisplayMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<MetadataFieldDisplay>());
        return metadataFieldDisplayPage;
   }
}
