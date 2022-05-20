package cn.tcsoft.drm.service.admin.system.impl;

import cn.tcsoft.drm.entity.admin.system.FieldType;
import cn.tcsoft.drm.mapper.admin.system.FieldTypeMapper;
import cn.tcsoft.drm.service.admin.system.FieldTypeService;
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
 * 字段类型;普通文本	Nornal text
密碼文本	Password
多行文本	Multi-Line text	
是非框		Yes No button
單選鈕		Radio button
多選鈕		Checkbox
下拉列表	Pulldown menu
可輸入下拉列表	Input pulldown menu
可輸入提示列表	Input select menu
日期		Date
分類法		Classification
簡易編輯器	Simple editor
複雜編輯器	Complex editor
附件		Attachment
相關文檔	File
自定義類型	User-define field
視頻		Video  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Slf4j
@Service
public class FieldTypeServiceImpl extends ServiceImpl<FieldTypeMapper, FieldType> implements FieldTypeService {

   @Resource
   private FieldTypeMapper fieldtypeMapper;

   /**
   * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
   */
   @Override
   public FieldType getInfoById(Long id){
        FieldType fieldtype = fieldtypeMapper.selectById(id);
        if (Objects.isNull(fieldtype)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return fieldtype;
   }


   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean updateFieldType(FieldType fieldtype){
        if (Objects.isNull(fieldtype.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = fieldtypeMapper.updateById(fieldtype);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{fieldtype}] 未知异常");
        }
        return row > 0;
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public boolean insertFieldType(FieldType fieldtype){
        int row = 0;
        try {
            row = fieldtypeMapper.insert(fieldtype);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{fieldtype}] 未知异常");
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
            row = fieldtypeMapper.deleteById(id);
        } catch (Exception e) {
           e.printStackTrace();
           log.error("[{fieldtype}] 未知异常");
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
            row = fieldtypeMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{fieldtype}] 未知异常");
        }
        return row>0;
   }

   @Override
   public Page<FieldType> getFieldTypePage(QueryPageDO query){
        Page<FieldType> fieldtypePage = fieldtypeMapper.selectPage(new Page<>(query.getCurrent(),query.getSize()), new QueryWrapper<FieldType>());
        return fieldtypePage;
   }
}
