package cn.tcsoft.drm.service.impl;


import cn.tcsoft.drm.entity.TChunkInfo;
import cn.tcsoft.drm.mapper.TChunkInfoMapper;
import cn.tcsoft.drm.service.ChunkService;
import cn.tcsoft.drm.util.SnowflakeIdWorker;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class ChunkServiceImpl implements ChunkService {

	@Resource
	TChunkInfoMapper tChunkInfoMapper;
	
    @Override
    public int saveChunk(TChunkInfo chunk) {
    	chunk.setId(SnowflakeIdWorker.getUUID()+ SnowflakeIdWorker.getUUID());
    	return tChunkInfoMapper.insertSelective(chunk);
    }

    @Override
    public ArrayList<Integer> checkChunk(TChunkInfo chunk) {
    	return tChunkInfoMapper.selectChunkNumbers(chunk);
    }

	@Override
	public boolean checkChunk(String identifier, Integer chunkNumber) {
		return false;
	}

}
