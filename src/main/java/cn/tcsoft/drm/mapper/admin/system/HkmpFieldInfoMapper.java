package cn.tcsoft.drm.mapper.admin.system;

import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.model.dto.HkmpFieldInfoDto;
import cn.tcsoft.drm.model.vo.HkmpFieldInfoQueryVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.sql.Wrapper;

/**
 * <p>
 * 字段管理;XWCMDBFIELDINFO Mapper 接口
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
public interface HkmpFieldInfoMapper extends BaseMapper<HkmpFieldInfo> {

    /**
     * 分页获取
     * @param page
     * @return
     */
    IPage<HkmpFieldInfo> list(Page page, @Param("vo") HkmpFieldInfoQueryVO vo);
}
