package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.Theme;
import cn.tcsoft.drm.entity.ThemeCollection;
import cn.tcsoft.drm.mapper.ThemeMapper;
import cn.tcsoft.drm.model.dto.ThemeQuery;
import cn.tcsoft.drm.service.ThemeCollectionService;
import cn.tcsoft.drm.service.ThemeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;
import java.util.Objects;

import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

/**
 * <p>
 * Theme  服务实现类
 * </p>
 *
 * @author ZYS 主题service 实现类
 * @since 2022-05-10
 */
@Slf4j
@Service
public class ThemeServiceImpl extends ServiceImpl<ThemeMapper, Theme> implements ThemeService {

    @Resource
    private ThemeMapper themeMapper;

    @Resource
    private ThemeCollectionService themeCollectionService;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public Theme getInfoById(Long id) {
        Theme theme = themeMapper.selectById(id);
        if (Objects.isNull(theme)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        /**
         * 查询主题关联列表中的数据,并设置到主题对象中一并返回
         */
        theme.setThemeCollectionList(themeCollectionService.listByIds(theme.parseCollectionIds()));
        return theme;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateTheme(Theme theme) {
        if (Objects.isNull(theme.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = themeMapper.updateById(theme);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{theme}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertTheme(Theme theme) {
        int row = 0;
        try {
            row = themeMapper.insert(theme);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{theme}] 未知异常");
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
            row = themeMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{theme}] 未知异常");
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
            row = themeMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{theme}] 未知异常");
        }
        return row > 0;
    }

    @Override
    public Page<Theme> getThemePage(ThemeQuery query) {
        /**
         * 根据页面传进来的条件,进行查询条件的拼接
         */
        LambdaQueryWrapper<Theme> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.hasText(query.getThemeId()), Theme::getThemeId, query.getThemeId());
        wrapper.like(StringUtils.hasText(query.getChiName()), Theme::getChiName, query.getChiName());
        wrapper.like(StringUtils.hasText(query.getEngName()), Theme::getEngName, query.getEngName());
        wrapper.like(StringUtils.hasText(query.getEngDescription()), Theme::getEngDescription, query.getEngDescription());
        wrapper.like(StringUtils.hasText(query.getChiDescription()), Theme::getChiDescription, query.getChiDescription());

        /**
         * 时间范围
         */
        wrapper.ge(query.getBeginCreateDate() != null, Theme::getCreateDt, query.getBeginCreateDate());
        wrapper.le(query.getEndCreateDate() != null, Theme::getCreateDt, query.getEndCreateDate());

        wrapper.ge(query.getBeginLastCreateDate() != null, Theme::getLastUpdDt, query.getBeginLastCreateDate());
        wrapper.le(query.getEndLastCreateDate() != null, Theme::getLastUpdDt, query.getEndLastCreateDate());

        /**
         * 字段排序 sortDesc: true : 按传进来的字段降序排序  false : 传进来的字段升序排序
         */
        String field = null;
        if (StringUtils.hasText(query.getSortColumns()) && query.getSortDesc()) {
            field = query.getSortColumns();
            switch (field) {
                case Theme.ORDER_BY_THEME_ID:
                    wrapper.orderByDesc(Theme::getThemeId);
                    break;
                case Theme.ORDER_BY_NAME_CHI:
                    wrapper.orderByDesc(Theme::getChiName);
                    break;
                case Theme.ORDER_BY_NAME_ENG:
                    wrapper.orderByDesc(Theme::getEngName);
                    break;
                case Theme.ORDER_BY_DESCRIPTION_CHI:
                    wrapper.orderByDesc(Theme::getChiDescription);
                    break;
                case Theme.ORDER_BY_DESCRIPTION_ENG:
                    wrapper.orderByDesc(Theme::getEngDescription);
                    break;
                case Theme.ORDER_BY_CREATE_DATE:
                    wrapper.orderByDesc(Theme::getCreateDt);
                    break;
                case Theme.ORDER_BY_CREATE_BY:
                    wrapper.orderByDesc(Theme::getCreateBy);
                    break;
                case Theme.ORDER_BY_LAST_UPDATE_BY:
                    wrapper.orderByDesc(Theme::getLastUpdDt);
                    break;
                default:
                    wrapper.orderByDesc(Theme::getLastUpdBy);
            }
        } else if (StringUtils.hasText(query.getSortColumns()) && !query.getSortDesc()) {
            field = query.getSortColumns();
            switch (field) {
                case Theme.ORDER_BY_THEME_ID:
                    wrapper.orderByAsc(Theme::getThemeId);
                    break;
                case Theme.ORDER_BY_NAME_CHI:
                    wrapper.orderByAsc(Theme::getChiName);
                    break;
                case Theme.ORDER_BY_NAME_ENG:
                    wrapper.orderByAsc(Theme::getEngName);
                    break;
                case Theme.ORDER_BY_DESCRIPTION_CHI:
                    wrapper.orderByAsc(Theme::getChiDescription);
                    break;
                case Theme.ORDER_BY_DESCRIPTION_ENG:
                    wrapper.orderByAsc(Theme::getEngDescription);
                    break;
                case Theme.ORDER_BY_CREATE_DATE:
                    wrapper.orderByAsc(Theme::getCreateDt);
                    break;
                case Theme.ORDER_BY_CREATE_BY:
                    wrapper.orderByAsc(Theme::getCreateBy);
                    break;
                case Theme.ORDER_BY_LAST_UPDATE_BY:
                    wrapper.orderByAsc(Theme::getLastUpdDt);
                    break;
                default:
                    wrapper.orderByAsc(Theme::getLastUpdBy);
            }
        }

        Page<Theme> themePage = themeMapper.selectPage(new Page<>(query.getCurrent(), query.getSize()), wrapper);
        return themePage;
    }
}
