package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.ItemStt;
import cn.tcsoft.drm.mapper.ItemSttMapper;
import cn.tcsoft.drm.service.ItemSttService;
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
 * Speech to Text  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-04-18
 */
@Slf4j
@Service
public class ItemSttServiceImpl extends ServiceImpl<ItemSttMapper, ItemStt> implements ItemSttService {

   @Resource
   private ItemSttMapper itemsttMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public ItemStt getInfoById(Long id){
        ItemStt itemstt = itemsttMapper.selectById(id);
        if (Objects.isNull(itemstt)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return itemstt;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateItemStt(ItemStt itemstt){
        if (Objects.isNull(itemstt.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = itemsttMapper.updateById(itemstt);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{itemstt}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertItemStt(ItemStt itemstt){
        int row = 0;
        try {
            row = itemsttMapper.insert(itemstt);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{itemstt}] 未知异常");
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
            row = itemsttMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{itemstt}] 未知异常");
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
            row = itemsttMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{itemstt}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<ItemStt> getItemSttPage(QueryPageDO query){
        Page<ItemStt> itemsttPage = itemsttMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<ItemStt>());
        return itemsttPage;
   }
}
