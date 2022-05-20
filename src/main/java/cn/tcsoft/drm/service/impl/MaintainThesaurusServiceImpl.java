package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.entity.MaintainThesaurus;
import cn.tcsoft.drm.mapper.MaintainThesaurusMapper;
import cn.tcsoft.drm.model.dto.MaintainThesaurusQuery;
import cn.tcsoft.drm.service.MaintainThesaurusService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;
import java.util.Objects;

import cn.tcsoft.drm.ApiErrorCode;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ZYS 词库Service实现类
 * @since 2022-05-06
 */
@Slf4j
@Service
public class MaintainThesaurusServiceImpl extends ServiceImpl<MaintainThesaurusMapper, MaintainThesaurus> implements MaintainThesaurusService {

    @Resource
    private MaintainThesaurusMapper maintainThesaurusMapper;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public MaintainThesaurus getInfoById(Long id) {
        MaintainThesaurus maintainThesaurus = maintainThesaurusMapper.selectById(id);
        if (Objects.isNull(maintainThesaurus)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return maintainThesaurus;
    }


    /**
     * 修改
     * @param maintainThesaurus 页面传递过来的词库对象
     * @return true : 修改成功 false : 修改失败 / 受影响行数 < 1
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateMaintainThesaurus(MaintainThesaurus maintainThesaurus) {

        if (Objects.isNull(maintainThesaurus.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = maintainThesaurusMapper.updateById(maintainThesaurus);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{maintainThesaurus}] 未知异常");
        }
        return row > 0;
    }

    /**
     * 新增
     * @param maintainThesaurus 页面传递过来的词库对象
     * @return true : 新增成功 影响行数>0  false : 新增失败 影响行数 <= 0
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertMaintainThesaurus(MaintainThesaurus maintainThesaurus) {
        int row = 0;
        try {
            row = maintainThesaurusMapper.insert(maintainThesaurus);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{maintainThesaurus}] 未知异常");
        }
        return row > 0;
    }

    /**
     * 根据主键对数据进行删除操作
     * @param id 要删除的对象主键
     * @return true : 新增成功 影响行数>0  false : 新增失败 影响行数 <= 0
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean delete(Long id) {
        if (Objects.isNull(id)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = maintainThesaurusMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{maintainThesaurus}] 未知异常");
        }
        return row > 0;
    }

    /**
     * 根据传递过来的主键集合 对数据库数据进行批量删除操作
     * @param ids 要删除的集合列表
     * @return true : 删除成功  false: 删除失败/受影响行数 < 1
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteList(List<Long> ids) {
        if (Objects.isNull(ids)) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = maintainThesaurusMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{maintainThesaurus}] 未知异常");
        }
        return row > 0;
    }

    /**
     * 分页 + 条件查询 + 字段排序
     * @param query  分页参数
     * @return 分页对象
     */
    @Override
    public Page<MaintainThesaurus> getMaintainThesaurusPage(MaintainThesaurusQuery query) {
        //拼接条件 ---> 关键字查询
        LambdaQueryWrapper<MaintainThesaurus> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.hasText(query.getKeyword()), MaintainThesaurus::getSynonyms, query.getKeyword());
        wrapper.like(StringUtils.hasText(query.getCreator()), MaintainThesaurus::getCreateBy, query.getCreator());
        wrapper.like(StringUtils.hasText(query.getLastCreator()), MaintainThesaurus::getLastUpdBy, query.getLastCreator());
        //判断传进来的时间范围参数是否为空
        wrapper.ge(query.getBeginCreateDate() != null, MaintainThesaurus::getCreateDt, query.getBeginCreateDate());
        wrapper.le(query.getEndCreateDate() != null, MaintainThesaurus::getCreateDt, query.getEndCreateDate());

        wrapper.ge(query.getBeginLastCreateDate() != null, MaintainThesaurus::getLastUpdDt, query.getBeginLastCreateDate());
        wrapper.le(query.getEndLastCreateDate() != null, MaintainThesaurus::getLastUpdDt, query.getEndLastCreateDate());

        //字段排序 ---> 单字段排序
        String field = null;
        if (StringUtils.hasText(query.getSortColumns()) && query.getSortDesc()) {
            field = query.getSortColumns();
            switch (field) {
                case MaintainThesaurus.ORDER_BY_SYNONYMS:
                    wrapper.orderByDesc(MaintainThesaurus::getSynonyms);
                    break;
                case MaintainThesaurus.ORDER_BY_LAST_UPDATED_DATE:
                    wrapper.orderByDesc(MaintainThesaurus::getLastUpdDt);
                    break;
                case MaintainThesaurus.ORDER_BY_CREATE_DATE:
                    wrapper.orderByDesc(MaintainThesaurus::getCreateDt);
                    break;
                case MaintainThesaurus.ORDER_BY_LAST_UPDATE_BY:
                    wrapper.orderByDesc(MaintainThesaurus::getLastUpdBy);
                    break;
                default:
                    wrapper.orderByDesc(MaintainThesaurus::getCreateBy);
            }
        } else if (StringUtils.hasText(query.getSortColumns()) && !query.getSortDesc()) {
            field = query.getSortColumns();
            switch (field) {
                case MaintainThesaurus.ORDER_BY_SYNONYMS:
                    wrapper.orderByAsc(MaintainThesaurus::getSynonyms);
                    break;
                case MaintainThesaurus.ORDER_BY_LAST_UPDATED_DATE:
                    wrapper.orderByAsc(MaintainThesaurus::getLastUpdDt);
                    break;
                case MaintainThesaurus.ORDER_BY_CREATE_DATE:
                    wrapper.orderByAsc(MaintainThesaurus::getCreateDt);
                    break;
                case MaintainThesaurus.ORDER_BY_LAST_UPDATE_BY:
                    wrapper.orderByAsc(MaintainThesaurus::getLastUpdBy);
                    break;
                default:
                    wrapper.orderByAsc(MaintainThesaurus::getCreateBy);
            }
        }
        Page<MaintainThesaurus> maintainThesaurusPage = maintainThesaurusMapper.selectPage(new Page<>(query.getCurrent(), query.getSize()), wrapper);
        return maintainThesaurusPage;

    }


    /**
     * 批量插入词库数据
     * @param maintainThesaurusList 词库列表对象
     */
    @Override
    public void saveModel(List<MaintainThesaurus> maintainThesaurusList) {
        if (CollectionUtils.isEmpty(maintainThesaurusList)) {
            throw new IllegalArgumentException("Error: entityList must not be empty");
        }
        super.saveBatch(maintainThesaurusList);
    }

}
