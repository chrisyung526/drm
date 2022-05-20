package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.entity.CatalogueRecord;
import cn.tcsoft.drm.entity.ControlledMisc;
import cn.tcsoft.drm.entity.ControlledMiscCatalogueRecordRef;
import cn.tcsoft.drm.entity.bo.BaseBO;
import cn.tcsoft.drm.mapper.ControlledMiscMapper;
import cn.tcsoft.drm.model.vo.ControlledMiscVO;
import cn.tcsoft.drm.service.CatalogueRecordService;
import cn.tcsoft.drm.service.ControlledMiscCatalogueRecordRefService;
import cn.tcsoft.drm.service.ControlledMiscService;
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * MMIS系统元数据字段属性表(Controlled Misc)  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-12
 */
@Slf4j
@Service
public class ControlledMiscServiceImpl extends ServiceImpl<ControlledMiscMapper, ControlledMisc> implements ControlledMiscService {
    private static final String QUERY_BY_ALL = "Any Field";
    private static final String QUERY_BY_ID = "Controlled Misc ID";
    private static final String QUERY_BY_VALUE = "Value";
    private static final String QUERY_BY_DESC_EN = "Description(English)";
    private static final String QUERY_BY_DESC_CN = "Description(Chinese)";

    @Resource
    private ControlledMiscMapper controlledmiscMapper;

    @Resource
    private ControlledMiscCatalogueRecordRefService controlledMiscCatalogueRecordRefService;

    @Resource
    private CatalogueRecordService catalogueRecordService;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public ControlledMisc getInfoById(Long id) {
        ControlledMisc controlledmisc = controlledmiscMapper.selectById(id);
        if (Objects.isNull(controlledmisc)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return controlledmisc;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateControlledMisc(ControlledMisc controlledmisc) {
        if (Objects.isNull(controlledmisc.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = controlledmiscMapper.updateById(controlledmisc);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{controlledmisc}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertControlledMisc(ControlledMisc controlledmisc) {
        int row;
        try {
            row = controlledmiscMapper.insert(controlledmisc);

            if (controlledmisc.getBibIds() != null && row > 0) {
                List<String> bibIds = controlledmisc.getBibIds();
                //解析书目信息
                if (controlledmisc.getFile() != null) {
                    MultipartFile file = controlledmisc.getFile();
                    List<CatalogueRecord> bibNos = EasyExcel.read(file.getInputStream()).head(CatalogueRecord.class).sheet().doReadSync();
                    List<String> list = bibNos.stream().map(CatalogueRecord::getBibNo).collect(Collectors.toList());
                    bibIds.addAll(list);
                }
                List<ControlledMiscCatalogueRecordRef> list = new ArrayList<>();
                ControlledMiscCatalogueRecordRef controlledMiscCatalogueRecordRef;
                LambdaQueryWrapper<CatalogueRecord> wrapper;
                if (bibIds.size() > 0) {
                    for (String bibId : bibIds) {
                        wrapper = new LambdaQueryWrapper<CatalogueRecord>().eq(CatalogueRecord::getBibNo, bibId).last("limit 1");
                        CatalogueRecord infoById = catalogueRecordService.getOne(wrapper);
                        if (infoById == null) {
                            log.info("关联书编号未找到====" + bibId);
                        } else {
                            controlledMiscCatalogueRecordRef = new ControlledMiscCatalogueRecordRef();
                            controlledMiscCatalogueRecordRef.setCatalogueRecordId(infoById.getId());
                            controlledMiscCatalogueRecordRef.setControlledMiscId(controlledmisc.getId());
                            list.add(controlledMiscCatalogueRecordRef);
                        }
                    }
                    //保存书编号关联信息
                    boolean b = controlledMiscCatalogueRecordRefService.saveBatch(list);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{controlledmisc}] 未知异常");
            throw new RuntimeException(e.getMessage());
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean delete(Long id) {
        if (Objects.isNull(id)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = controlledmiscMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{controlledmisc}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteList(List<Long> ids) {
        if (Objects.isNull(ids)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = controlledmiscMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{controlledmisc}] 未知异常");
        }
        return row > 0;
    }

    @Override
    public Page<ControlledMisc> getControlledMiscPage(ControlledMiscVO query) {
        LambdaQueryWrapper<ControlledMisc> wrapper = new LambdaQueryWrapper<>();
        //等值查询
        wrapper.eq(StringUtils.isNotBlank(query.getActive()), ControlledMisc::getActive, query.getActive());
        wrapper.eq(StringUtils.isNotBlank(query.getAuthType()), ControlledMisc::getAuthType, query.getAuthType());
        wrapper.eq(StringUtils.isNotBlank(query.getAttrType()), ControlledMisc::getAttrType, query.getAttrType());
        wrapper.eq(StringUtils.isNotBlank(query.getShare()), ControlledMisc::getShare, query.getShare());
        wrapper.eq(StringUtils.isNotBlank(query.getCreateBy()), ControlledMisc::getCreateBy, query.getCreateBy());
        wrapper.eq(StringUtils.isNotBlank(query.getLastUpdBy()), ControlledMisc::getLastUpdDt, query.getLastUpdBy());
        //时间查询
        wrapper.ge(query.getBeginCreateDate() != null, ControlledMisc::getCreateDt, query.getBeginCreateDate());
        wrapper.le(query.getEndCreateDate() != null, ControlledMisc::getCreateDt, query.getEndCreateDate());

        wrapper.ge(query.getBeginLastCreateDate() != null, ControlledMisc::getLastUpdDt, query.getBeginLastCreateDate());
        wrapper.le(query.getEndLastCreateDate() != null, ControlledMisc::getLastUpdDt, query.getEndLastCreateDate());

        //模糊查询
        if (StringUtils.isNotBlank(query.getQueryColumn()) && !query.getQueryVal().isEmpty()) {
            if (QUERY_BY_ALL.equals(query.getQueryColumn())) {
                wrapper.in(BaseBO::getId, query.getQueryVal()).or()
                        .in(ControlledMisc::getValue, query.getQueryVal()).or()
                        .in(ControlledMisc::getEngDescrip, query.getQueryVal()).or()
                        .in(ControlledMisc::getChiDescrip, query.getQueryVal());
            }
            if (QUERY_BY_VALUE.equals(query.getValue())) {
                wrapper.in(ControlledMisc::getValue, query.getQueryVal());
            }
            if (QUERY_BY_DESC_CN.equals(query.getQueryColumn())) {
                wrapper.in(ControlledMisc::getChiDescrip, query.getQueryVal());
            }
            if (QUERY_BY_DESC_EN.equals(query.getQueryColumn())) {
                wrapper.in(ControlledMisc::getEngDescrip, query.getQueryVal());
            }
            if (QUERY_BY_ID.equals(query.getQueryColumn())) {
                wrapper.in(ControlledMisc::getId, query.getQueryVal());
            }

        }

        Page<ControlledMisc> controlledmiscPage = controlledmiscMapper.selectPage(new Page<>(query.getCurrent(), query.getSize()), wrapper);
        return controlledmiscPage;
    }

    @Override
    public boolean mergeControlledMisc(ControlledMisc controlledmisc) {
        boolean b = false;
        if (controlledmisc.getMargeList() != null) {
            List<ControlledMisc> margeList = controlledmisc.getMargeList();
            List<Long> ids = margeList.stream().skip(1).map(BaseBO::getId).collect(Collectors.toList());
            b = this.deleteList(ids);
        }
        //将第一个取消删除并修改
        if (b) {
            int update = controlledmiscMapper.updateById(controlledmisc);
            b = update > 0;
        }
        return b;
    }
}
