package cn.tcsoft.drm.service.impl;


import cn.tcsoft.drm.config.properties.MediaStreamProperties;
import cn.tcsoft.drm.entity.TFileInfo;
import cn.tcsoft.drm.mapper.TFileInfoMapper;
import cn.tcsoft.drm.model.dto.QueryInfo;
import cn.tcsoft.drm.service.FileInfoService;
import cn.tcsoft.drm.util.SnowflakeIdWorker;
import cn.tcsoft.drm.util.ffmpeg.FfmpegUtil;
import cn.tcsoft.drm.util.ffmpeg.MediaStreamEncHlsUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;

/**
 * 文件处理类
 * @author 洋葱骑士
 *
 */
@Service
@EnableConfigurationProperties(MediaStreamProperties.class)
public class FileInfoServiceImpl extends ServiceImpl<TFileInfoMapper,TFileInfo> implements FileInfoService {

	@Value("${prop.hls-folder}")
	private String hlsPath;

	@Value("${prop.upload-folder}")
	private String uploadFolder;

	@Resource
	MediaStreamProperties mediaStreamProperties;

	@Resource
	TFileInfoMapper tFileInfoMapper;
	
    @Override
    public int addFileInfo(TFileInfo fileInfo) {
    	fileInfo.setId(SnowflakeIdWorker.getUUID()+SnowflakeIdWorker.getUUID());
        return tFileInfoMapper.insertSelective(fileInfo);
    }
    
    @Override
    public List<TFileInfo> selectFileByParams(TFileInfo fileInfo) {
        return tFileInfoMapper.selectFileByParams(fileInfo);
    }
    
    @Override
	public List<TFileInfo> selectFileList(QueryInfo query) {
		return tFileInfoMapper.selectFileList(query);
	}

	@Override
	public int deleteFile(TFileInfo tFileInfo) {
		TFileInfo t = new TFileInfo();
		t.setId(tFileInfo.getId());
		t.setDelFlag("1");
		return tFileInfoMapper.updateByPrimaryKeySelective(t);
	}


	@Override
    @Async
	@SneakyThrows
	public void convertM3u8(String identifier, String fileName) {
		//合一起命令
		//ffmpeg -i VD21034.mp4 -i "1.png" -filter_complex "[0]scale=1080:-2[bg];[bg][1]overlay=0:0" -c:v libx264 -b:v 4096k -b:a 384k -hls_time 10 -hls_list_size 0 -f hls hls/1080.m3u8 -async 1 -vsync 1
		//ffmpeg -i SAMPLE.webm -i "logo_720.png" -filter_complex "[0]scale=720:-2[bg];[bg][1]overlay=0:0" -c:v libx264 -b:v 2048k -b:a 192k -hls_time 10 -hls_list_size 0 -f hls 720.m3u8 -async 1 -vsync 1
		//ffmpeg -i SAMPLE.webm -i "logo_360.png" -filter_complex "[0]scale=360:-2[bg];[bg][1]overlay=0:0" -c:v libx264 -b:v 1024k -b:a 128k -hls_time 10 -hls_list_size 0 -f hls 360.m3u8 -async 1 -vsync 1
		String fileNoSuffix = getFileNoSuffix(fileName);
		String source = uploadFolder + "/" + identifier + "/" + fileName;
		String baseSourcePath = uploadFolder + "/" + identifier + "/" + fileNoSuffix;
		String baseTargetPath = hlsPath + "/" + identifier + "/";
		String logo = uploadFolder+"/portallogo.jpg";
		//转不同码率源
		//获取源码率
		//Integer bitrate = Integer.valueOf(FfmpegUtil.getEncodingFormat(source).get("bitrate").toString())*8;
		//视频时长（秒）
		long duration = Long.valueOf(FfmpegUtil.getEncodingFormat(source).get("duration").toString());

		//String source1 = source, source2 = source, source3 = source, source4 = source;
		String target1 = baseTargetPath + "h1080/" + fileNoSuffix + ".m3u8",
				target2 = baseTargetPath + "h720/" + fileNoSuffix + ".m3u8",
				//target3 = baseTargetPath + "h480/" + dto.getFileName() + ".m3u8",
				target4 = baseTargetPath + "h360/" + fileNoSuffix + ".m3u8";
		FfmpegUtil ffmpegUtil=new FfmpegUtil();
		//if (bitrate < 4992) {
			//source1 = baseSourcePath + "_1080p.mp4";
			//ffmpegUtil.convertBitRate(source, source1, "4992k", "20000k", "1920x1080",logo);
		//}

		//if (bitrate < 2496 || bitrate >= 4992) {
			//source2 = baseSourcePath + "_720p.mp4";
			//ffmpegUtil.convertBitRate(source, source2, "2496k", "4991k", "1280x720",logo);
		// }

       /* if (bitrate < 1261 || bitrate >= 2496) {
            source3 = baseSourcePath + "_480p.mp4";
            FfmpegUtil.converBitRate(source, source3, "1261k", "2495k", "848x480");
        }*/
		// if (bitrate < 896 || bitrate >= 1261) {
			//source4 = baseSourcePath + "_360p.mp4";
			//ffmpegUtil.convertBitRate(source, source4, "896k", "1260k", "640x360",logo);
		//}


		CompletableFuture<String> encFuture= MediaStreamEncHlsUtils.createEnc(baseTargetPath,source,target1,mediaStreamProperties,identifier);
		MediaStreamEncHlsUtils hlsUtils=new MediaStreamEncHlsUtils();
		//同一个视频共用一个加密秘钥
		hlsUtils.convert(encFuture,source, target1, "4992k", "20000k", "384k","1080",logo);
		hlsUtils.convert(encFuture,source, target2, "2496k", "4991k", "192k","720",logo);
		// FfmpegConvertM3u8EncUtils.convert(encFuture,source3, target3);
		hlsUtils.convert(encFuture,source, target4, "896k", "1260k", "128k","360",logo);


		//创建一级m3u8 索引
		String m3u8FileName = baseTargetPath+fileNoSuffix + ".m3u8";
		Path path = Paths.get(m3u8FileName);
		String m3u8Name=fileNoSuffix + ".m3u8";
		try (BufferedWriter writer = Files.newBufferedWriter(path, StandardCharsets.UTF_8)) {
			writer.write("#EXTM3U");
			writer.newLine();
			writer.write("#EXT-X-STREAM-INF:PROGRAM-ID=1, BANDWIDTH=4992000");
			writer.newLine();
			writer.write("h1080/"+m3u8Name+"?streamToken="+identifier);
			writer.newLine();
			writer.write("#EXT-X-STREAM-INF:PROGRAM-ID=1, BANDWIDTH=2496000");
			writer.newLine();
			writer.write("h720/"+m3u8Name+"?streamToken="+identifier);
			writer.newLine();
			//writer.write("#EXT-X-STREAM-INF:PROGRAM-ID=1, BANDWIDTH=1261000");
			//writer.newLine();
			//writer.write("h480/"+m3u8Name);
			//writer.newLine();
			writer.write("#EXT-X-STREAM-INF:PROGRAM-ID=1, BANDWIDTH=896000");
			writer.newLine();
			writer.write("h360/"+m3u8Name+"?streamToken="+identifier);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//每2秒截取一个缩略图并合并为一张图
		ffmpegUtil.convertThumbnail(source,baseTargetPath);
		TFileInfo fileInfo = baseMapper.selectOne(Wrappers.<TFileInfo>lambdaQuery().eq(TFileInfo::getFileName, fileName));
		if(fileInfo!=null) {
			fileInfo.setFileState(2);
			fileInfo.setDuration(duration);
			fileInfo.setM3u8Url("/" + identifier + "/"+fileNoSuffix + ".m3u8");
			fileInfo.setUpdateTime(new Date());
			baseMapper.updateById(fileInfo);
		}

	}

	private String getFileNoSuffix(String fileName){
		String suffix = fileName.substring(0,fileName.lastIndexOf("."));
		return suffix;
	}
}
