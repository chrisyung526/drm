package cn.tcsoft.drm.util.ffmpeg;
//
//import ws.schild.jave.EncoderException;
//import ws.schild.jave.MultimediaObject;
//import ws.schild.jave.info.MultimediaInfo;

import java.io.File;
import java.util.logging.Logger;

/**
 * 
 * @Description:(官方的API获取视频信息)   
 * @Copyright:
 */
public class FileInfoUtil {

	private static Logger logger = Logger.getLogger(FileInfoUtil.class.getName());
	/*public static void main(String[] args) throws InputFormatException, EncoderException {
	    File file = new File("I:\\test-ffmpeg\\荣耀视频测试.mp4");
	    MultimediaObject instance = new MultimediaObject(file);
	    MultimediaInfo result = instance.getInfo();

	    logger.info(String.format("视频大小（Byte）:%s", file.length()));
	    logger.info(String.format("视频大小（KB）:%s", new BigDecimal(file.length() + "").divide(new BigDecimal("1024"), BigDecimal.ROUND_UP).doubleValue()));
	    logger.info(String.format("视频真实格式:%s", result.getFormat()));
	    logger.info(String.format("视频时长（毫秒）:%s", result.getDuration()));
	    logger.info(String.format("视频宽：%s，高:%s", result.getVideo().getSize().getWidth(),result.getVideo().getSize().getHeight()));
	    logger.info(String.format("视频比特率（bit rate）:%s", result.getVideo().getBitRate()));
	    logger.info(String.format("视频信息:%s", JSON.toJSONString(result.getMetadata())));
	    logger.info(String.format("视频Video信息:%s", JSON.toJSONString(result.getVideo())));
	    logger.info(String.format("视频Audio信息:%s", JSON.toJSONString(result.getAudio())));
	}*/
	public static long getFileSize(String path){
		File file = new File(path);
//		MultimediaObject instance = new MultimediaObject(file);
//		try {
//			MultimediaInfo result = instance.getInfo();
//			return  file.length();
//		} catch (EncoderException e) {
//			e.printStackTrace();
//		}
		return file.length();
	}
}
