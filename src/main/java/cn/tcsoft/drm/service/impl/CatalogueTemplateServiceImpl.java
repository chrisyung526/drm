package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.CatalogueTemplate;
import cn.tcsoft.drm.entity.CatalogueTemplateField;
import cn.tcsoft.drm.mapper.CatalogueTemplateFieldMapper;
import cn.tcsoft.drm.mapper.CatalogueTemplateMapper;
import cn.tcsoft.drm.model.vo.CatalogueTemplateVO;
import cn.tcsoft.drm.model.vo.MetadataFieldVO;
import cn.tcsoft.drm.service.CatalogueTemplateFieldService;
import cn.tcsoft.drm.service.CatalogueTemplateService;
import cn.tcsoft.drm.service.MetadataFieldService;
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
import cn.tcsoft.drm.model.QueryPageDO;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;

import javax.annotation.Resource;

/**
 * <p>
 * Catalogue Template  服务实现类
 * </p>
 *
 * @author ZYS 编目模板service 实现类
 * @since 2022-05-17
 */
@Slf4j
@Service
public class CatalogueTemplateServiceImpl extends ServiceImpl<CatalogueTemplateMapper, CatalogueTemplate> implements CatalogueTemplateService {
    @Resource
    private MapperFacade mapperFacade;

    @Resource
    private CatalogueTemplateMapper catalogueTemplateMapper;

    @Resource
    private CatalogueTemplateFieldMapper catalogueTemplateFieldMapper;

    @Resource
    private CatalogueTemplateFieldService catalogueTemplateFieldService;

    @Resource
    private MetadataFieldService metadataFieldService;
    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public CatalogueTemplateVO getInfoById(Long id) {
        CatalogueTemplateVO catalogueTemplateVO = catalogueTemplateMapper.selectCatalogueTemplateVOById(id);
        if (Objects.isNull(catalogueTemplateVO)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        /**
         * 获取metadataFieldId 查询对应的metadataFieldVO对象进行封装 一并返回给前端页面
         */
        Long metadataFieldId = catalogueTemplateVO.getMetadataFieldId();
        MetadataFieldVO metadataFieldVO = metadataFieldService.getInfoByFieldId(metadataFieldId);
        /**
         * 将metadataFieldVO对象封装进CatalogueTemplateVO对象中 一并返回给前端编辑页面
         */
        catalogueTemplateVO.setMetadataFieldVO(metadataFieldVO);
        return catalogueTemplateVO;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateCatalogueTemplateVO(CatalogueTemplateVO catalogueTemplateVO) {
        if (Objects.isNull(catalogueTemplateVO.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        Boolean flag = null;
        try {
            CatalogueTemplate catalogueTemplate = new CatalogueTemplate();
            mapperFacade.map(catalogueTemplateVO, catalogueTemplate);
            row = catalogueTemplateMapper.updateById(catalogueTemplate);

            CatalogueTemplateField catalogueTemplateField = new CatalogueTemplateField();
            mapperFacade.map(catalogueTemplateVO, catalogueTemplateField);
            LambdaUpdateWrapper<CatalogueTemplateField> wrapper = new LambdaUpdateWrapper<>();
            wrapper.eq(CatalogueTemplateField::getTemplateId,catalogueTemplateVO.getId());
            flag = catalogueTemplateFieldService.update(catalogueTemplateField, wrapper);

        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{catalogueTemplate}] 未知异常");
        }
        return row > 0 && flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertCatalogueTemplateVO(CatalogueTemplateVO catalogueTemplateVO) {
        int row1 = 0;
        int row2 = 0;
        try {
            CatalogueTemplate catalogueTemplate = new CatalogueTemplate();
            mapperFacade.map(catalogueTemplateVO, catalogueTemplate);
            row1 = catalogueTemplateMapper.insert(catalogueTemplate);

            if (row1 >= 1){
                Long catalogueTemplateId = super.getOne(new LambdaQueryWrapper<CatalogueTemplate>().orderByDesc(CatalogueTemplate::getId).last("limit 1")).getId();
                CatalogueTemplateField catalogueTemplateField = new CatalogueTemplateField();
                mapperFacade.map(catalogueTemplateVO, catalogueTemplateField);
                catalogueTemplateField.setTemplateId(catalogueTemplateId);
                catalogueTemplateField.setId(null);
                row2 = catalogueTemplateFieldMapper.insert(catalogueTemplateField);
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{catalogueTemplateVO}] 未知异常");
        }
        return row1 > 1 && row2 > 1;
    }

    @Override
    public List<CatalogueTemplateVO> getAll() {
        List<CatalogueTemplateVO> catalogueTemplateVOS = catalogueTemplateMapper.getAll();
        return catalogueTemplateVOS;
    }

    @Override
    public List<CatalogueTemplateVO> getListByIds(List<Long> ids) {
        List<CatalogueTemplateVO> catalogueTemplateVOS = catalogueTemplateMapper.getListByIds(ids);
        return catalogueTemplateVOS;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteCatalogueTemplateVO(Long id) {
        if (Objects.isNull(id)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        Boolean flag = null;
        try {
            /**
             * 根据id对catalogueTemplate数据进行删除
             */
            row = catalogueTemplateMapper.deleteById(id);

            /**
             * 根据templateId 对CatalogueTemplateField对象进行获取,通过对象获取对应的catalogueTemplateFieldId,再进行删除操作
             */
            LambdaQueryWrapper<CatalogueTemplateField> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(CatalogueTemplateField::getTemplateId,id);
            Long catalogueTemplateFieldId = catalogueTemplateFieldService.getOne(wrapper).getId();
            if (Objects.isNull(catalogueTemplateFieldId)) {
                throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
            }
            flag = catalogueTemplateFieldService.delete(catalogueTemplateFieldId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{catalogueTemplateVO}] 未知异常");
        }
        return row > 0 && flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteCatalogueTemplateVOList(List<Long> ids) {
        if (Objects.isNull(ids)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row1 = 0;
        int row2 = 0;
        try {

            row1 = catalogueTemplateMapper.deleteBatchIds(ids);

            /**
             * 根据ids 获取到对应CatalogueTemplateField 的ids
             */
            LambdaQueryWrapper<CatalogueTemplateField> wrapper = new LambdaQueryWrapper<>();
            wrapper.in(CatalogueTemplateField::getTemplateId,ids);
            /**
             * 拼接条件 获取ids对应的CatalogueTemplateField对象
             */
            List<CatalogueTemplateField> list = catalogueTemplateFieldService.list(wrapper);
            List<Long> catalogueTemplateFieldIds = new ArrayList<>();
            /**
             * 遍历CatalogueTemplateField对象集合 获取对应的ids
             */
            for (CatalogueTemplateField catalogueTemplateField : list) {
                catalogueTemplateFieldIds.add(catalogueTemplateField.getId());
            }
            row2 = catalogueTemplateFieldMapper.deleteBatchIds(catalogueTemplateFieldIds);

        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{catalogueTemplateVO}] 未知异常");
        }
        return row1 > 0 && row2 >0;
    }

    @Override
    public IPage<CatalogueTemplateVO> getCatalogueTemplatePage(QueryPageDO query) {
        Page<CatalogueTemplateVO> page = new Page<>(query.getCurrent(), query.getSize());
        IPage<CatalogueTemplateVO> catalogueTemplateVOIPage = catalogueTemplateMapper.pageList(page, query);
        return catalogueTemplateVOIPage;
    }
}
