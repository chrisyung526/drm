package cn.tcsoft.drm.util.tools;
import cn.tcsoft.drm.enums.VideoFetchEnum;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.oro.text.regex.*;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.UUID;

/**
 * 本机要有ffmpeg服务
 * @author : hyman
 * create at:  2021/11/2  09:27
 * @description: 音频、视频获取时长、截取封面
 */
@Slf4j
public class VideoUtils {
    /**
     * 获取视频时长
     * @param videoPath 文件路径
     * @param fileName 文件名称
     * @return
     */
    @SneakyThrows
    public static String duration(String videoPath,String fileName){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
        return simpleDateFormat.format(simpleDateFormat.parse(processInfoCmd(videoPath+fileName, null, VideoFetchEnum.DURATION,null)));
    }

    /**
     * 截取封面图
     * @param videoPath 文件路径
     * @param fileName 文件名称
     * @return
     */
    public static String cover(String videoPath,String fileName){
        String coverName = UUID.randomUUID().toString().replaceAll("-", "") + ".png";
        processInfoCmd(videoPath+fileName, videoPath+coverName, VideoFetchEnum.COVER,null);
        return coverName;
    }
    /**
     * 截视频
     * @param videoPath 文件路径
     * @param fileName 文件名称
     * @return
     */
    public static String demo(String videoPath,String fileName){
        String videoName = UUID.randomUUID().toString().replaceAll("-", "") + "."+fileName.substring(fileName.lastIndexOf(".") + 1);
        processInfoCmd(videoPath+fileName, videoPath+videoName, VideoFetchEnum.DEMO,null);
        return videoName;
    }

    /**
     * 添加水印
     * @param videoPath 文件路径
     * @param fileName 文件名称
     * @param logo 水印地址
     * @return
     */
    public static String watermark(String videoPath,String fileName,String logo){
        String videoName = UUID.randomUUID().toString().replaceAll("-", "") + "."+fileName.substring(fileName.lastIndexOf(".") + 1);
        processInfoCmd(videoPath+fileName, videoPath+videoName, VideoFetchEnum.WATERMARK,logo);
        return videoName;
    }

    /**
     * 添加字幕
     * @param videoPath 文件路径
     * @param fileName 文件名称
     * @param subtitle 字幕文件地址
     * @return
     */
    public static String subtitle(String videoPath,String fileName,String subtitle){
        String videoName = UUID.randomUUID().toString().replaceAll("-", "") + "."+fileName.substring(fileName.lastIndexOf(".") + 1);
        processInfoCmd(videoPath+fileName, videoPath+videoName, VideoFetchEnum.SUBTITLE,subtitle);
        return videoName;
    }

    /**
     * 通过linux指令获取封面和时长
     * @param videoPath 视频路径
     * @param outPath 输出资源
     *
     * @param type 类型枚举
     */
    public static String processInfoCmd(String videoPath, String outPath, VideoFetchEnum type,String logo) {
        String command = null;
        switch (type){
            case COVER:
                //截取图片
                command = "ffmpeg -ss 00:00:05 -i " + videoPath + " -f image2 -y " + outPath;
                break;
            case DURATION:
                //获取时长
                command = "ffmpeg -i "+videoPath+" -hide_banner 2>&1 | grep 'Duration' | cut -b 13-23";
                break;
            case DEMO:
                //ffmpeg截取视频片段的两种方式 1） 按时间截取 2）按帧数截取 采用方式1
                command ="ffmpeg -i "+videoPath+" -acodec copy -vcodec copy -ss 00:00:00 -to 00:00:10 "+outPath+" -y";
                break;
            case WATERMARK:
                //添加水印
                command="ffmpeg -i "+videoPath+" -i "+logo+" -filter_complex 'overlay=x=10:y=main_h-overlay_h-10' "+outPath;
                break;
            case SUBTITLE:
                //添加字幕
                //command="ffmpeg -i  "+videoPath+" -vf subtitles="+logo+" -y "+outPath;
                command="ffmpeg -i  "+videoPath+" -vf ass="+logo+" -y "+outPath;
                break;
            default:
                break;
        }
        String result = null;
        try {
            Runtime rt = Runtime.getRuntime();
            Process proc;
            if(Objects.equals(System.getProperty("os.name"),"Window")){
                if(Objects.equals(type.getCode(),"watermark") || Objects.equals(type.getCode(),"subtitle")) {
                    proc = rt.exec(new String[]{"cmd", "/c", command});
                }else {
                    proc = rt.exec(command);
                }
            }else {
                if(Objects.equals(type.getCode(),"watermark") || Objects.equals(type.getCode(),"subtitle")) {
                    proc = rt.exec(new String[]{"/bin/sh", "-c", command});
                }else {
                    proc = rt.exec(command);
                }
            }

            InputStream stderr = proc.getErrorStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            StringBuilder sb=new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                if (Objects.equals(type.getCode(),"duration")) {
                    sb.append(line);
                    if (line.contains("Duration:")) {
                        int start = line.indexOf("Duration:");
                        int end = line.indexOf(", start:");
                        result = line.substring(start, end).substring("Duration:".length()).substring(0,9);

                    }
                }
            }
            if(Objects.nonNull(sb.toString())){
                formatResult(sb.toString());
            }
            int exitVal = proc.waitFor();
            stderr.close();
            isr.close();
            br.close();
        } catch (Throwable t) {
            t.printStackTrace();
        }
        return result;
    }

    @SneakyThrows
    private static void formatResult(String result){
        PatternCompiler compiler =new Perl5Compiler();
        String regexDuration ="Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
        String regexVideo ="Video: (.*?), (.*?), (.*?)[,\\s]";
        String regexAudio ="Audio: (.*?), (.*?) Hz";

        Pattern patternDuration = compiler.compile(regexDuration,Perl5Compiler.CASE_INSENSITIVE_MASK);
        PatternMatcher matcherDuration = new Perl5Matcher();
        if(matcherDuration.contains(result, patternDuration)){
            MatchResult re = matcherDuration.getMatch();
            log.info("提取出播放时间:" +re.group(1));
            log.info("开始时间:" +re.group(2));
            log.info("bitrate 码率 单位 kb:" +re.group(3));
        }

        Pattern patternVideo = compiler.compile(regexVideo,Perl5Compiler.CASE_INSENSITIVE_MASK);
        PatternMatcher matcherVideo = new Perl5Matcher();
        if(matcherVideo.contains(result, patternVideo)){
            MatchResult re = matcherVideo.getMatch();
            log.info("编码格式:" +re.group(1));
            log.info("视频格式:" +re.group(2));
            log.info("分辨率:" +re.group(3));
        }

        Pattern patternAudio = compiler.compile(regexAudio,Perl5Compiler.CASE_INSENSITIVE_MASK);
        PatternMatcher matcherAudio = new Perl5Matcher();
        if(matcherAudio.contains(result, patternAudio)){
            MatchResult re = matcherAudio.getMatch();
            log.info("音频编码:" +re.group(1));
            log.info("音频采样频率:" +re.group(2));
        }
    }
}