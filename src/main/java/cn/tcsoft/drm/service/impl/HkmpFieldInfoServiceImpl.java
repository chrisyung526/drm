package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.mapper.admin.system.HkmpFieldInfoMapper;
import cn.tcsoft.drm.model.vo.HkmpFieldInfoQueryVO;
import cn.tcsoft.drm.service.HkmpFieldInfoService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import ma.glasnost.orika.MapperFacade;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 字段管理;XWCMDBFIELDINFO  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Slf4j
@Service
public class HkmpFieldInfoServiceImpl extends ServiceImpl<HkmpFieldInfoMapper, HkmpFieldInfo> implements HkmpFieldInfoService {

    @Resource
    private HkmpFieldInfoMapper hkmpfieldinfoMapper;
    @Resource
    private MapperFacade mapperFacade;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public HkmpFieldInfo getInfoById(Long id) {
        HkmpFieldInfo hkmpfieldinfo = hkmpfieldinfoMapper.selectById(id);
        if (Objects.isNull(hkmpfieldinfo)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return hkmpfieldinfo;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateHkmpFieldInfo(HkmpFieldInfo hkmpfieldinfo) {
        if (Objects.isNull(hkmpfieldinfo.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = hkmpfieldinfoMapper.updateById(hkmpfieldinfo);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{hkmpfieldinfo}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertHkmpFieldInfo(HkmpFieldInfo hkmpfieldinfo) {
        int row = 0;
        try {
            row = hkmpfieldinfoMapper.insert(hkmpfieldinfo);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{hkmpfieldinfo}] 未知异常");
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
            row = hkmpfieldinfoMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{hkmpfieldinfo}] 未知异常");
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
            row = hkmpfieldinfoMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{hkmpfieldinfo}] 未知异常");
        }
        return row > 0;
    }

    @Override
    public IPage<HkmpFieldInfo> getHkmpFieldInfoPage(HkmpFieldInfoQueryVO query) {
        Page<HkmpFieldInfo> page = new Page<>(query.getCurrent(), query.getSize());
        //List<OrderItem> orderItems = new ArrayList<>();
        //if (query.getSortDesc()) {
        //    orderItems.add(OrderItem.desc(query.getSortColumns()));
        //} else {
        //    orderItems.add(OrderItem.asc(query.getSortColumns()));
        //}
        //page.setOrders(orderItems);
        IPage<HkmpFieldInfo> hkmpfieldinfoPage = hkmpfieldinfoMapper.list(page, query);
        return hkmpfieldinfoPage;
    }
}
