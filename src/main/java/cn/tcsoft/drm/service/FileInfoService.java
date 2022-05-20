package cn.tcsoft.drm.service;


import cn.tcsoft.drm.entity.TFileInfo;
import cn.tcsoft.drm.model.dto.QueryInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface FileInfoService  extends IService<TFileInfo> {
	
	 int addFileInfo(TFileInfo fileInfo);

	 List<TFileInfo> selectFileByParams(TFileInfo fileInfo);
	
	 /**
     * 查询
     *
     * @param query 查询条件
     * @return List
     */
    List<TFileInfo> selectFileList(QueryInfo query);
                    
    
    /**
     * 删除
     * @param TFileInfo
     * @return
     */
    int deleteFile(TFileInfo tFileInfo);

    void convertM3u8(String identifier, String fileName);
}
