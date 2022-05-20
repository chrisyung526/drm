package cn.tcsoft.drm.util.ffmpeg;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.oro.text.regex.*;
import org.springframework.scheduling.annotation.Async;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * h264 对应表 https://www.jianshu.com/p/4da1265fa196
 * 名称	            视频宽高	    帧率(fps)	视频码率(Kbps)
 * "240*180"	    240*180	    20	        200
 * "320*180"	    320*180	    20	        300
 * "320*240"	    320*240	    20	        400
 * "480*360"	    480*360	    20	        400
 * "640*360"	    640*360	    20	        500
 * "640*480"	    640*480	    20	        600
 * "1280*720"	    1280*720	15	        1000
 * "1280*720_1"	    1280*720	15	        1500
 * "1280*720_2"	    1280*720	30	        2000
 * "1280*720_3"	    1280*720	5	        1000
 * "1920*1080"	    1920*1080	15	        1500
 * "1920*1080_1"	1920*1080	15	        2000
 * "1920*1080_2"	1920*1080	30	        2500
 * "1920*1080_3"	1920*1080	5	        1500
 * 360p    (480×360，20帧/秒) ，4：3，录制一分钟大约7MB；
 * 480p    (640×480，20帧/秒)，4：3，录制一分钟大约12MB；
 * 720p    (1280×720，30帧/秒)  ， 16:9，录制一分钟大约35MB；
 * 1080p  (1920×1080，30帧/秒) ，16:9 ， 录制一分钟大约80MB。
 *
 * 360p流畅    640×360  码率大于896Kbps
 * 480p清晰    848×480  码率大于1261Kbps
 * 720p高清    1280×720 码率大于2496Kbps
 * 1080p高清  1920×1080 码率大于4992Kbps
 *
 * 1 kB/s=8 kbps（kb/s）
 *
 */
@Slf4j
public class FfmpegUtil {
    /**
     * 提取音频、视频编码等信息
     *
     * @param filePath
     * @return
     */
    public static Map getEncodingFormat(String filePath) {
        List commend = new java.util.ArrayList();
        commend.add("ffmpeg");
        commend.add("-i");
        commend.add(filePath);
        String processFLVResult = process(commend);
        Map retMap = new HashMap();
        if (StringUtils.isNotBlank(processFLVResult)) {
            PatternCompiler compiler = new Perl5Compiler();
            try {
                String regexDuration = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
                String regexVideo = "Video: (.*?), (.*?), (.*?)[,\\s]";
                String regexAudio = "Audio: (\\w*), (\\d*) Hz";

                Pattern patternDuration = compiler.compile(regexDuration, Perl5Compiler.CASE_INSENSITIVE_MASK);
                PatternMatcher matcherDuration = new Perl5Matcher();
                if (matcherDuration.contains(processFLVResult, patternDuration)) {
                    MatchResult re = matcherDuration.getMatch();
                    //播放时间
                    retMap.put("duration", getTimelen(re.group(1)));
                    //开始时间
                    retMap.put("start", re.group(2));
                    //码率 单位 kb
                    retMap.put("bitrate", re.group(3));
                }

                Pattern patternVideo = compiler.compile(regexVideo, Perl5Compiler.CASE_INSENSITIVE_MASK);
                PatternMatcher matcherVideo = new Perl5Matcher();

                if (matcherVideo.contains(processFLVResult, patternVideo)) {
                    MatchResult re = matcherVideo.getMatch();
                    //编码格式
                    retMap.put("encodingFormat", re.group(1));
                    //视频格式
                    retMap.put("formats", re.group(2));
                    //分辨率
                    retMap.put("resolution", re.group(3));
                }

                Pattern patternAudio = compiler.compile(regexAudio, Perl5Compiler.CASE_INSENSITIVE_MASK);
                PatternMatcher matcherAudio = new Perl5Matcher();

                if (matcherAudio.contains(processFLVResult, patternAudio)) {
                    MatchResult re = matcherAudio.getMatch();
                    //音频编码
                    retMap.put("encoding", re.group(1));
                    //音频采样频率
                    retMap.put("frequency", re.group(2));
                }
            } catch (MalformedPatternException e) {
                e.printStackTrace();
            }
        }
        return retMap;

    }
    // 格式:"00:00:10.68"
    public static int getTimelen(String timelen) {
        int min = 0;
        String strs[] = timelen.split(":");
        if (strs[0].compareTo("0") > 0) {
            // 秒
            min += Integer.valueOf(strs[0]) * 60 * 60;
        }
        if (strs[1].compareTo("0") > 0) {
            min += Integer.valueOf(strs[1]) * 60;
        }
        if (strs[2].compareTo("0") > 0) {
            min += Math.round(Float.valueOf(strs[2]));
        }
        return min;
    }


    // ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
    public static String process(List<String> commend) {
        BufferedReader buf = null; // 保存ffmpeg的输出结果流
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commend);
            builder.redirectErrorStream(true);
            Process p = builder.start();
            String line = null;
            buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
            StringBuffer sb = new StringBuffer();
            while ((line = buf.readLine()) != null) {
                System.out.println(line);
                sb.append(line);
                continue;
            }
            int ret = p.waitFor();//这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
            return sb.toString();
        } catch (Exception e) {
            log.error("-- processFLV error, message is {}", e);
            return null;
        }finally {
            try {
                buf.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static int processInt(List<String> String) {
        BufferedReader buf = null; // 保存ffmpeg的输出结果流
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(String);
            builder.redirectErrorStream(true);
            Process p = builder.start();
            String line = null;
            buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
            StringBuffer sb = new StringBuffer();
            while ((line = buf.readLine()) != null) {
                System.out.println(line);
                sb.append(line);
                continue;
            }
            int ret = p.waitFor();//这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
            return p.exitValue();
        } catch (Exception e) {
            log.error("-- processFLV error, message is {}", e);
            return 1;
        }finally {
            try {
                buf.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    @Async
    public void convertBitRate(String source, String target,String minRate,String maxRate,String resolution,String logo){
        List commend = new ArrayList();
        commend.add("ffmpeg");
        commend.add("-i");
        commend.add(source);
        commend.add("-i");
        commend.add(logo);
        commend.add("-filter_complex");
        commend.add("overlay=main_w-overlay_w-10:10");
        commend.add("-b:v");
        commend.add(minRate);
        commend.add("-bufsize");
        commend.add(minRate);
        commend.add("-maxrate");
        commend.add(maxRate);
        commend.add("-s");
        commend.add(resolution);
        commend.add(target);
        process(commend);
        //ffmpeg -i VD18007.mp4 -i /home/miniodata/video/portallogo.jpg -filter_complex overlay=main_w-overlay_w-10:10 -b:v 4992k -bufsize 4992k -maxrate 20000k -s 1920x1080 2.mp4
        // 2.mp4
        //D:\work\hkproject\drm-admin-service\src\main\resources\static\logo\portallogo.jpg
    }

    //每2秒截取一个缩图  fps为1时按一秒一帧切分，按2秒一帧来切，1/2 = 0.5即可
    //  ffmpeg -y -i VD18007.mp4  -vf "fps=0.5,scale=160:90,tile=10x10" -an  out_%d.jpg
    public void convertThumbnail(String source, String target){
        List commend = new ArrayList();
        commend.add("ffmpeg");
        commend.add("-i");
        commend.add(source);
        commend.add("-vf");
        commend.add("fps=0.5,scale=160:90,tile=10x10");
        commend.add("-an");
        commend.add(target+"/thumbnail_%d.jpg");
        process(commend);
    }


}
