package cn.tcsoft.drm.mapper;

import cn.tcsoft.drm.entity.TFileInfo;
import cn.tcsoft.drm.model.dto.QueryInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TFileInfoMapper extends BaseMapper<TFileInfo>  {
	
    int deleteByPrimaryKey(String id);

    @Override
    int insert(TFileInfo record);

    int insertSelective(TFileInfo record);

    TFileInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TFileInfo record);

    int updateByPrimaryKey(TFileInfo record);

	List<TFileInfo> selectFileByParams(TFileInfo fileInfo);
	
	List<TFileInfo> selectFileList(QueryInfo query);

}