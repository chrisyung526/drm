package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.ThemeCollection;
import cn.tcsoft.drm.mapper.ThemeCollectionMapper;
import cn.tcsoft.drm.service.ThemeCollectionService;
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
 * Theme Rel Collection  服务实现类
 * </p>
 *
 * @author ZYS 主题列表 实现类
 * @since 2022-05-10
 */
@Slf4j
@Service
public class ThemeCollectionServiceImpl extends ServiceImpl<ThemeCollectionMapper, ThemeCollection> implements ThemeCollectionService {

   @Resource
   private ThemeCollectionMapper themeCollectionMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public ThemeCollection getInfoById(Long id){
        ThemeCollection themeCollection = themeCollectionMapper.selectById(id);
        if (Objects.isNull(themeCollection)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return themeCollection;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateThemeCollection(ThemeCollection themeCollection){
        if (Objects.isNull(themeCollection.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = themeCollectionMapper.updateById(themeCollection);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{themeCollection}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertThemeCollection(ThemeCollection themeCollection){
        int row = 0;
        try {
            row = themeCollectionMapper.insert(themeCollection);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{themeCollection}] 未知异常");
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
            row = themeCollectionMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{themeCollection}] 未知异常");
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
            row = themeCollectionMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{themeCollection}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<ThemeCollection> getThemeCollectionPage(QueryPageDO query){
        Page<ThemeCollection> themeCollectionPage = themeCollectionMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<ThemeCollection>());
        return themeCollectionPage;
   }
}
