package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.*;
import cn.tcsoft.drm.mapper.*;
import cn.tcsoft.drm.model.dto.MetadataFieldVOQuery;
import cn.tcsoft.drm.model.vo.MetadataFieldVO;
import cn.tcsoft.drm.service.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ma.glasnost.orika.MapperFacade;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

/**
 * <p>
 * Metadata Fields  服务实现类
 * </p>
 *
 * @author ZYS 元数据service实现类
 * @since 2022-05-11
 */
@Slf4j
@Service
public class MetadataFieldServiceImpl extends ServiceImpl<MetadataFieldMapper, MetadataField> implements MetadataFieldService {

    @Resource
    private MapperFacade mapperFacade;

    @Resource
    private MetadataSchemaService metadataSchemaService;

    @Resource
    private MetadataFieldControlledGroupService metadataFieldControlledGroupService;

    @Resource
    private MetadataFieldDisplayService metadataFieldDisplayService;

    @Resource
    private MetadataFieldPropertiesService metadataFieldPropertiesService;

    @Resource
    private MetadataSchemaMapper metadataSchemaMapper;

    @Resource
    private MetadataFieldMapper metadataFieldMapper;

    @Resource
    private MetadataFieldDisplayMapper metadataFieldDisplayMapper;

    @Resource
    private MetadataFieldControlledGroupMapper metadataFieldControlledGroupMapper;

    @Resource
    private MetadataFieldPropertiesMapper metadataFieldPropertiesMapper;


    /**
     * 根据id 获取主键对应的vo
     * @param id 元数据主键id ---> MetadataField 的id
     * @return 元数据VO对象
     */
    @Override
    public MetadataFieldVO getInfoById(Long id) {
        MetadataFieldVO metadataFieldVO = metadataFieldMapper.selectMetadataFieldVOById(id);
        if (Objects.isNull(metadataFieldVO)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataFieldVO;
    }


    /**
     * 更新数据
     * @param metadataFieldVO 元数据VO对象
     * @return true:表示对数据更新成功 false: 表示对数据更新失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateMetadataFieldVO(MetadataFieldVO metadataFieldVO) {
        if (Objects.isNull(metadataFieldVO.getId())){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        /**
         * 持久化操作结果标记
         */
        boolean flag = false;

        /**
         * MetadataField对象的id值
         */
        Long fieldId = null;
        /**
         * 获取field表与metadataSchema表的关联主键
         */
        Long metadataSchemaId = metadataFieldVO.getId();
        /**
         * 进行属性的复制,进行修改操作
         */
        MetadataSchema metadataSchema = new MetadataSchema();
        mapperFacade.map(metadataFieldVO, metadataSchema);
        flag = metadataSchemaService.updateById(metadataSchema);

        /**
         * 根据metadataSchemaId 查询到对应的metadataField对象进行更新
         */
        MetadataField metadataField = new MetadataField();
        mapperFacade.map(metadataFieldVO, metadataField);
        LambdaUpdateWrapper<MetadataField> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(MetadataField::getMetadataSchemaId,metadataSchemaId);
        flag = super.update(metadataField, wrapper);
        if (flag){
            /**
             * 根据metadataSchemaId 去查询对应的MetadataField对象,获取对应MetadataField对象的id值
             */
            LambdaQueryWrapper<MetadataField> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(MetadataField::getMetadataSchemaId,metadataSchemaId);
            fieldId = super.getOne(queryWrapper).getId();

            /**
             * 根据field_id 对metadataFieldControlledGroup对象进行更新
             */
            MetadataFieldControlledGroup metadataFieldControlledGroup = new MetadataFieldControlledGroup();
            mapperFacade.map(metadataFieldVO, metadataFieldControlledGroup);
            LambdaUpdateWrapper<MetadataFieldControlledGroup> groupWrapper = new LambdaUpdateWrapper<>();
            groupWrapper.eq(MetadataFieldControlledGroup::getFieldId,fieldId);
            metadataFieldControlledGroupService.update(metadataFieldControlledGroup, groupWrapper);

            /**
             * 对metadataFieldDisplay对象进行封装
             */
            MetadataFieldDisplay metadataFieldDisplay = new MetadataFieldDisplay();
            mapperFacade.map(metadataFieldVO, metadataFieldDisplay);
            LambdaUpdateWrapper<MetadataFieldDisplay> displayWrapper = new LambdaUpdateWrapper<>();
            displayWrapper.eq(MetadataFieldDisplay::getFieldId,fieldId);
            metadataFieldDisplayService.update(metadataFieldDisplay, displayWrapper);

            /**
             * 对metadataFieldProperties对象进行封装
             */
            MetadataFieldProperties metadataFieldProperties = new MetadataFieldProperties();
            mapperFacade.map(metadataFieldVO, metadataFieldProperties);
            LambdaUpdateWrapper<MetadataFieldProperties> propertiesWrapper = new LambdaUpdateWrapper<>();
            propertiesWrapper.eq(MetadataFieldProperties::getFieldId,fieldId);
            metadataFieldPropertiesService.update(metadataFieldProperties, propertiesWrapper);

        }
        return flag;
    }

    /**
     * 新增数据
     * @param metadataFieldVO 元数据VO对象
     * @return true:表示 新增数据成功 false: 表示新增数据失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertMetadataFieldVO(MetadataFieldVO metadataFieldVO) {
        /**
         * 持久化操作结果标记
         */
        boolean flag = false;
        Long fieldId = null;
        MetadataSchema metadataSchema = new MetadataSchema();
        /**
         * 进行属性的复制,进行新增操作
         */
        mapperFacade.map(metadataFieldVO, metadataSchema);
        flag = metadataSchemaService.insertMetadataSchema(metadataSchema);
        /**
         * 判断metadataSchema是否插入成功,插入成功后获取到对象的id值
         */
        if (flag) {
            /**
             * 获取到最大的id值,表示最新插入的数据,将返回的metadataSchema_id作为metadataFiled对象的metadataSchemaId属性值
             */
            Long metadataSchemaId = metadataSchemaService.getOne(new LambdaQueryWrapper<MetadataSchema>().orderByDesc(MetadataSchema::getId).last("limit 1")).getId();
            MetadataField metadataField = new MetadataField();
            mapperFacade.map(metadataFieldVO, metadataField);
            metadataField.setMetadataSchemaId(metadataSchemaId);
            flag = super.save(metadataField);
            if (flag) {
                /**
                 * 对metadataFieldControlledGroup对象进行封装
                 */
                fieldId = super.getOne(new LambdaQueryWrapper<MetadataField>().orderByDesc(MetadataField::getId).last("limit 1")).getId();
                MetadataFieldControlledGroup metadataFieldControlledGroup = new MetadataFieldControlledGroup();
                mapperFacade.map(metadataFieldVO, metadataFieldControlledGroup);
                metadataFieldControlledGroup.setFieldId(fieldId);
                flag = metadataFieldControlledGroupService.insertMetadataFieldControlledGroup(metadataFieldControlledGroup);
                /**
                 * 对metadataFieldDisplay对象进行封装
                 */
                MetadataFieldDisplay metadataFieldDisplay = new MetadataFieldDisplay();
                mapperFacade.map(metadataFieldVO, metadataFieldDisplay);
                metadataFieldDisplay.setFieldId(fieldId);
                flag = metadataFieldDisplayService.insertMetadataFieldDisplay(metadataFieldDisplay);
                /**
                 * 对metadataFieldProperties对象进行封装
                 */
                MetadataFieldProperties metadataFieldProperties = new MetadataFieldProperties();
                mapperFacade.map(metadataFieldVO, metadataFieldProperties);
                metadataFieldProperties.setFieldId(fieldId);
                flag = metadataFieldPropertiesService.insertMetadataFieldProperties(metadataFieldProperties);
            }
        }
        return flag;
    }

    /**
     * 根据主键id 对指定的VO对象数据进行删除操作
     * @param id 主键ID
     * @return true: 删除成功 false: 删除失败 / 返回数据数量<1
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMetadataFieldVO(Long id) {
        if (Objects.isNull(id)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataSchemaMapper.deleteById(id);
            /**
             * 根据metadataSchemaId,获取到与之关联的metadataField对象的id
             */
            LambdaQueryWrapper<MetadataField> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(MetadataField::getMetadataSchemaId,id);
            Long fieldId = super.getOne(wrapper).getId();
            if (Objects.isNull(fieldId)) {
                throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
            }

            /**
             * 根据fieldId对关联表数据进行删除操作
             */
            LambdaQueryWrapper<MetadataField> metadataFieldWrapper = new LambdaQueryWrapper<>();
            metadataFieldWrapper.eq(MetadataField::getMetadataSchemaId,id);
            metadataFieldMapper.delete(wrapper);

            LambdaQueryWrapper<MetadataFieldDisplay> metadataFieldDisplayWrapper = new LambdaQueryWrapper<>();
            metadataFieldDisplayWrapper.eq(MetadataFieldDisplay::getFieldId,fieldId);
            metadataFieldDisplayMapper.delete(metadataFieldDisplayWrapper);

            LambdaQueryWrapper<MetadataFieldControlledGroup> metadataFieldControlledGroupWrapper = new LambdaQueryWrapper<>();
            metadataFieldControlledGroupWrapper.eq(MetadataFieldControlledGroup::getFieldId,fieldId);
            metadataFieldControlledGroupMapper.delete(metadataFieldControlledGroupWrapper);

            LambdaQueryWrapper<MetadataFieldProperties> metadataFieldPropertiesWrapper = new LambdaQueryWrapper<>();
            metadataFieldPropertiesWrapper.eq(MetadataFieldProperties::getFieldId,fieldId);
            metadataFieldPropertiesService.delete(fieldId);

        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{MetadataFieldVO}] 未知异常");
            throw new RuntimeException("删除数据失败");
        }
        return row > 0;
    }

    /**
     * 批量删除数据
     * @param ids 主键id集合
     * @return 根据id主键集合对数据进行批量删除操作
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMetadataFieldVOList(List<Long> ids) {
        if (Objects.isNull(ids)){
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = metadataSchemaMapper.deleteBatchIds(ids);
            /**
             * 根据ids 获取对应的 metadataField的ids
             */
            LambdaQueryWrapper<MetadataField> wrapper = new LambdaQueryWrapper<>();
            wrapper.in(MetadataField::getMetadataSchemaId,ids);
            List<MetadataField> metadataFields = super.list(wrapper);
            List<Long> metadataFieldIds = new ArrayList<>();
            for (MetadataField metadataField : metadataFields) {
                Long metadataFieldId = metadataField.getId();
                metadataFieldIds.add(metadataFieldId);
            }

            /**
             * 进行批量删除操作
             */
            LambdaQueryWrapper<MetadataField> metadataFieldWrapper = new LambdaQueryWrapper<>();
            metadataFieldWrapper.in(MetadataField::getMetadataSchemaId,ids);
            metadataFieldMapper.delete(metadataFieldWrapper);

            LambdaQueryWrapper<MetadataFieldDisplay> metadataFieldDisplayWrapper = new LambdaQueryWrapper<>();
            metadataFieldDisplayWrapper.in(MetadataFieldDisplay::getFieldId,metadataFieldIds);
            metadataFieldDisplayMapper.delete(metadataFieldDisplayWrapper);

            LambdaQueryWrapper<MetadataFieldControlledGroup> metadataFieldControlledGroupWrapper = new LambdaQueryWrapper<>();
            metadataFieldControlledGroupWrapper.in(MetadataFieldControlledGroup::getFieldId,metadataFieldIds);
            metadataFieldControlledGroupMapper.delete(metadataFieldControlledGroupWrapper);

            LambdaQueryWrapper<MetadataFieldProperties> metadataFieldPropertiesWrapper = new LambdaQueryWrapper<>();
            metadataFieldPropertiesWrapper.in(MetadataFieldProperties::getFieldId,metadataFieldIds);
            metadataFieldPropertiesMapper.delete(metadataFieldPropertiesWrapper);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{MetadataFieldVO}] 未知异常");
            throw new RuntimeException("批量删除数据失败");
        }
        return row>0;
    }

    /**
     * 分页查询
     * @param query 分页参数
     * @return 分页数据
     */
    @Override
    public IPage<MetadataFieldVO> getMetadataFieldVOPage(MetadataFieldVOQuery query) {
        Page<MetadataFieldVO> page = new Page<>(query.getCurrent(), query.getSize());
        IPage<MetadataFieldVO> metadataFieldVOIPage = metadataFieldMapper.list(page, query);
        return metadataFieldVOIPage;
    }

    /**
     * 获取数据库中全部数据
     * @return
     */
    @Override
    public List<MetadataFieldVO> getAll() {
        List<MetadataFieldVO> list = metadataFieldMapper.getAll();
        return list;
    }

    /**
     * 获取主键集合对应的VO对象
     * @param ids 主键集合
     * @return
     */
    @Override
    public List<MetadataFieldVO> getListByIds(List<Long> ids) {
        List<MetadataFieldVO> list = metadataFieldMapper.getListByIds(ids);
        return list;
    }

    /**
     * 更新display的数据
     * @param fieldId fieldId
     * @param brief brief
     * @param detail detail
     * @param hitList hitList
     * @param contentHighlight contentHighlight
     * @return true : 表示更新成功  false : 表示更新失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateOrderSetting(Long fieldId, String brief, String detail, String hitList, String contentHighlight) {
        /**
         * 判断参数是否为空 为空则不进行更新操作
         */
        try{
            LambdaUpdateWrapper<MetadataFieldDisplay> displayLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
            displayLambdaUpdateWrapper.eq(MetadataFieldDisplay::getFieldId,fieldId);
            if (StringUtils.hasText(brief)){
                displayLambdaUpdateWrapper.set(MetadataFieldDisplay::getBrief,brief);
            }
            if (StringUtils.hasText(detail)){
                displayLambdaUpdateWrapper.set(MetadataFieldDisplay::getDetail,detail);
            }
            if (StringUtils.hasText(hitList)){
                displayLambdaUpdateWrapper.set(MetadataFieldDisplay::getHitList,hitList);
            }
            metadataFieldDisplayService.update(null, displayLambdaUpdateWrapper);

            if (StringUtils.hasText(contentHighlight)){
                LambdaUpdateWrapper<MetadataField> fieldLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
                fieldLambdaUpdateWrapper.eq(MetadataField::getId,fieldId);
                fieldLambdaUpdateWrapper.set(MetadataField::getContentHighlightLabel,contentHighlight);
                super.update(null, fieldLambdaUpdateWrapper);
            }
        }catch(Exception e){
            e.printStackTrace();
            log.error("[{MetadataFieldVO}] 未知异常");
            throw new RuntimeException("更新数据失败");
        }
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateLockSetting(Long fieldId, String lock) {
        Boolean flag = false;
        if (StringUtils.hasText(lock)){
            LambdaUpdateWrapper<MetadataFieldDisplay> displayLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
            displayLambdaUpdateWrapper.eq(MetadataFieldDisplay::getFieldId,fieldId);
            displayLambdaUpdateWrapper.set(MetadataFieldDisplay::getLockTag,lock);
            flag = metadataFieldDisplayService.update(null, displayLambdaUpdateWrapper);
        }
        return flag;
    }

    @Override
    public IPage<MetadataFieldVO> getPageDisplay(MetadataFieldVOQuery query) {
        Page<MetadataFieldVO> page = new Page<>(query.getCurrent(), query.getSize());
        IPage<MetadataFieldVO> displayListPage = metadataFieldMapper.displayList(page, query);
        return displayListPage;
    }

    @Override
    public MetadataFieldVO getInfoByFieldId(Long metadataFieldId) {

        MetadataFieldVO metadataFieldVO = metadataFieldMapper.getInfoByFieldId(metadataFieldId);
        if (Objects.isNull(metadataFieldVO)){
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return metadataFieldVO;
    }

}
