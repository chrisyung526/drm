package cn.tcsoft.drm.service.admin.system.impl;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import cn.tcsoft.drm.mapper.admin.system.ViewFieldinfoRefMapper;
import cn.tcsoft.drm.model.QueryPageDO;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import cn.tcsoft.drm.service.admin.system.ViewService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 视图字段关联表;XWCMVIEWFIELDINFO  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Slf4j
@Service
public class ViewFieldinfoRefServiceImpl extends ServiceImpl<ViewFieldinfoRefMapper, ViewFieldinfoRef> implements ViewFieldinfoRefService {

    @Resource
    private ViewFieldinfoRefMapper viewfieldinforefMapper;
    @Resource
    private ViewService viewService;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public ViewFieldinfoRef getInfoById(Long id) {
        ViewFieldinfoRef viewfieldinforef = viewfieldinforefMapper.selectById(id);
        if (Objects.isNull(viewfieldinforef)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return viewfieldinforef;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateViewFieldinfoRef(ViewFieldinfoRef viewfieldinforef) {
        if (Objects.isNull(viewfieldinforef.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = viewfieldinforefMapper.updateById(viewfieldinforef);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{viewfieldinforef}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertViewFieldinfoRef(ViewFieldinfoRef viewfieldinforef) {
        int row = 0;
        try {
            row = viewfieldinforefMapper.insert(viewfieldinforef);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{viewfieldinforef}] 未知异常");
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
            row = viewfieldinforefMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{viewfieldinforef}] 未知异常");
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
            row = viewfieldinforefMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{viewfieldinforef}] 未知异常");
        }
        return row > 0;
    }

    @Override
    public Page<ViewFieldinfoRef> getViewFieldinfoRefPage(QueryPageDO query) {
        Page<ViewFieldinfoRef> viewfieldinforefPage = viewfieldinforefMapper.selectPage(new Page<>(query.getCurrent(), query.getSize()), new QueryWrapper<ViewFieldinfoRef>());
        return viewfieldinforefPage;
    }

    @Override
    public List<View> getInfoByFieldId(Long fieldId) {
        List<ViewFieldinfoRef> list = this.lambdaQuery().eq(ViewFieldinfoRef::getFieldId, fieldId).list();
        List<Long> viewIdList = list.stream().map(ViewFieldinfoRef::getViewId).collect(Collectors.toList());
        return viewService.listByIds(viewIdList);
    }

    @Override
    public List<ViewFieldinfoRef> getInfoByViewId(Long vid) {
        return viewfieldinforefMapper.selectByViewId(vid);
    }
}
