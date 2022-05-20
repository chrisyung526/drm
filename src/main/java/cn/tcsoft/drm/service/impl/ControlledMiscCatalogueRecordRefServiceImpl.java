package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.ControlledMiscCatalogueRecordRef;
import cn.tcsoft.drm.mapper.ControlledMiscCatalogueRecordRefMapper;
import cn.tcsoft.drm.service.ControlledMiscCatalogueRecordRefService;
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
 * 权威记录书目关联表  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-13
 */
@Slf4j
@Service
public class ControlledMiscCatalogueRecordRefServiceImpl extends ServiceImpl<ControlledMiscCatalogueRecordRefMapper, ControlledMiscCatalogueRecordRef> implements ControlledMiscCatalogueRecordRefService {

   @Resource
   private ControlledMiscCatalogueRecordRefMapper controlledmisccataloguerecordrefMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public ControlledMiscCatalogueRecordRef getInfoById(Long id){
        ControlledMiscCatalogueRecordRef controlledmisccataloguerecordref = controlledmisccataloguerecordrefMapper.selectById(id);
        if (Objects.isNull(controlledmisccataloguerecordref)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return controlledmisccataloguerecordref;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateControlledMiscCatalogueRecordRef(ControlledMiscCatalogueRecordRef controlledmisccataloguerecordref){
        if (Objects.isNull(controlledmisccataloguerecordref.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = controlledmisccataloguerecordrefMapper.updateById(controlledmisccataloguerecordref);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{controlledmisccataloguerecordref}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertControlledMiscCatalogueRecordRef(ControlledMiscCatalogueRecordRef controlledmisccataloguerecordref){
        int row = 0;
        try {
            row = controlledmisccataloguerecordrefMapper.insert(controlledmisccataloguerecordref);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{controlledmisccataloguerecordref}] 未知异常");
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
            row = controlledmisccataloguerecordrefMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{controlledmisccataloguerecordref}] 未知异常");
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
            row = controlledmisccataloguerecordrefMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{controlledmisccataloguerecordref}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<ControlledMiscCatalogueRecordRef> getControlledMiscCatalogueRecordRefPage(QueryPageDO query){
        Page<ControlledMiscCatalogueRecordRef> controlledmisccataloguerecordrefPage = controlledmisccataloguerecordrefMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<ControlledMiscCatalogueRecordRef>());
        return controlledmisccataloguerecordrefPage;
   }
}
