package cn.tcsoft.drm.mapper.admin.system;

import cn.tcsoft.drm.entity.admin.system.ViewFieldinfoRef;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 视图字段关联表;XWCMVIEWFIELDINFO Mapper 接口
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
public interface ViewFieldinfoRefMapper extends BaseMapper<ViewFieldinfoRef> {

    List<ViewFieldinfoRef> selectByViewId(Long vid);
}
