package cn.tcsoft.drm.service.admin.system.impl;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import cn.tcsoft.drm.entity.bo.BaseBO;
import cn.tcsoft.drm.mapper.admin.system.ViewMapper;
import cn.tcsoft.drm.model.vo.ViewQueryVO;
import cn.tcsoft.drm.service.HkmpFieldInfoService;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import cn.tcsoft.drm.service.admin.system.ViewService;
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import ma.glasnost.orika.MapperFacade;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 视图信息;XWCMVIEWINFO  服务实现类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
@Slf4j
@Service
public class ViewServiceImpl extends ServiceImpl<ViewMapper, View> implements ViewService {

    @Resource
    private ViewMapper viewMapper;
    @Resource
    private MapperFacade mapperFacade;
    @Resource
    private ViewFieldinfoRefService viewFieldinfoRefService;
    @Resource
    private HkmpFieldInfoService fieldInfoService;

    /**
     * 注意当前的id主键 是默认的"id"，具体情况根据数据库主键的名称进行修改
     */
    @Override
    public View getInfoById(Long id) {
        View view = viewMapper.selectById(id);
        List<ViewFieldinfoRef> infoByViewId = viewFieldinfoRefService.getInfoByViewId(view.getId());
        view.setRefList(infoByViewId);
        if (Objects.isNull(view)) {
            throw new ApiException(ApiErrorCode.DATA_NOT_FOUND);
        }
        return view;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateView(View view) {
        if (Objects.isNull(view.getId())) {
            throw new ApiException(ApiErrorCode.PARAMETER_CHECK_ERROR);
        }
        int row = 0;
        try {
            row = viewMapper.updateById(view);
            if(view.getRefList()!=null&&view.getRefList().size()>0) {
                viewFieldinfoRefService.saveOrUpdateBatch(view.getRefList());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{view}] 未知异常");
        }
        return row > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertView(View view) {
        int row = 0;
        try {
            row = viewMapper.insert(view);
            if(view.getRefList()!=null&&view.getRefList().size()>0) {
                List<ViewFieldinfoRef> viewRefList = view.getRefList();
                for (ViewFieldinfoRef viewFieldinfoRef : viewRefList) {
                    viewFieldinfoRef.setViewId(view.getId());
                    HkmpFieldInfo infoById = fieldInfoService.getInfoById(viewFieldinfoRef.getFieldId());
                    if (infoById == null) {
                        throw new RuntimeException("未找到关联字段");
                    }
                }
                viewFieldinfoRefService.saveBatch(viewRefList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{view}] 未知异常");
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
            row = viewMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{view}] 未知异常");
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
            row = viewMapper.deleteBatchIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[{view}] 未知异常");
        }
        return row > 0;
    }

    @Override
    public Page<View> getViewPage(ViewQueryVO query) {
        View view = mapperFacade.map(query, View.class);
        view.setCreateDt(null);
        LambdaQueryWrapper<View> viewQueryWrapper = new QueryWrapper<View>().setEntity(view).lambda();
        if (query.getCreateDt() != null) {
            viewQueryWrapper.ge(BaseBO::getCreateDt, query.getCreateDt());
        }
        if (StringUtils.isNotBlank(query.getKeyword())) {
            viewQueryWrapper.like(View::getViewEName, query.getKeyword())
                    .or()
                    .like(View::getViewCnName, query.getKeyword());
        }
        viewQueryWrapper.orderByDesc(BaseBO::getCreateDt);
        Page<View> viewPage = viewMapper.selectPage(new Page<>(query.getCurrent(), query.getSize()), viewQueryWrapper);
        return viewPage;
    }

    @Override
    public String inputFile(MultipartFile file) throws IOException {
        List<View> insertList = new ArrayList<>();
        StringBuilder msg = new StringBuilder();
        StringBuilder msgError = new StringBuilder();
        List<View> listRead = EasyExcel.read(file.getInputStream()).head(View.class).sheet().doReadSync();
        List<View> viewList = this.list();
        List<String> viewCnNameList = viewList.stream().map(View::getViewCnName).collect(Collectors.toList());
        for (View data : listRead) {
            boolean contains = viewCnNameList.contains(data.getViewCnName());
            if (contains) {
                msgError.append("\"").append(data.getViewCnName()).append("\"").append(":视图名称已存在").append("\n");
            } else {
                insertList.add(data);
            }
        }
        this.saveBatch(insertList);
        msg.append("导入完成!共").append(listRead.size()).append("条数据导入").append(insertList.size()).append("条").append("\n");
        msg.append(msgError);
        return msg.toString();
    }
}
