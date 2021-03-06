package cn.tcsoft.drm.util.ffmpeg;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * ffmpeg 切割视频文件为m3u8
 */
public class FfmpegConvertM3u8Utils {
    Logger log = LoggerFactory.getLogger(FfmpegConvertM3u8Utils.class);

    private String ffmpeg = "ffmpeg";
    private List<String> cmdList;
    private static Process p;
    private String status;

    private String source;
    private String target;
    public FfmpegConvertM3u8Utils() {
    }

    /**
     * 初始化：指定ffmpeg路径
     *
     * @param ffmpegPath
     */
    public FfmpegConvertM3u8Utils(String ffmpegPath) {
        this.ffmpeg = ffmpegPath;
    }

    /**
     * 开始转换
     *
     * @param source 目前只支持mp4格式，源视频路径
     * @param target 输出路径，必须是m3u8格式。
     * @throws InterruptedException
     * @throws FileNotFoundException
     */

    public void start(String source, String target){
        this.source = source;
        this.target = target;
//        checkFfmpeg();
        try {
            checkSource();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        processM3U8(source, target);
    }

    public void stop() {
        p.destroy();
    }

    private void checkSource() throws FileNotFoundException {
        File fm = new File(source);
        if (!fm.exists()) {
            throw new FileNotFoundException("source不存在：" + source);
        }
    }

    /**
     * 拼接ffmpeg命令：ffmpeg -i test.mp4 -c:v libx264 -hls_time 60 -hls_list_size 0 -c:a aac -strict -2 -f hls output.m3u8
     *
     * @param source
     * @return
     */
    private boolean processM3U8(String source, String target) {
        File targetFile = new File(target);
        File parentDir = targetFile.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }
        List<String> commend = new ArrayList<String>();
        commend.add(ffmpeg);
        commend.add("-i");
        commend.add(source);
        //commend.add("-force_key_frames 'expr:gte(t,n_forced*10)'");
        commend.add("-c:v");
        commend.add("libx264");
        commend.add("-hls_time");
        commend.add("10");
        commend.add("-hls_list_size");
        commend.add("0");
        commend.add("-c:a");
        commend.add("aac");
        commend.add("-strict");
        commend.add("-2");
        commend.add("-f");
        commend.add("hls");
        commend.add(target);
        this.cmdList = commend;
        // 通过ProcessBuilder创建
//        processBuilder(commend);

        // 通过runtime创建
        runtimeBuilder(getCommand());
        return true;
    }

    /**
     * 使用ProcessBuilder类调用cmd
     *
     * @param command cmd命令组合，list集合，元素不能包含空格，否则可能会报错
     * @return
     */
    private static boolean processBuilder(List<String> command) {
        try {
            final ProcessBuilder builder = new ProcessBuilder(command);
            builder.command(command);
            new Thread() {
                @Override
                public void run() {
                    try {
                        Process p = builder.start();
                        FfmpegConvertM3u8Utils.p = p;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 检查ffmpeg是否有效
     * 1.检查是否有路径
     * 2.检查环境变量是否包含ffmpeg，包含则可能有，反之不包含也可能有。包含则判断路径下是否有文件。ffmpeg.exe或ffmpeg.sh
     *
     * @throws FileNotFoundException
     */
    private void checkFfmpeg() throws FileNotFoundException {
        File fm = new File(ffmpeg);
        if (!fm.exists()) {
            throw new FileNotFoundException("ffmpeg 不存在：" + ffmpeg);
        }
    }

    /**
     * 获取状态
     *
     * @return
     */
    public String getStatus() {
        if (p == null) {
            setStatus(VideoStatus.NO_STARTED);
        }
        if (p.isAlive()) {
            setStatus(VideoStatus.PROCESSING);
        } else {
            setStatus(VideoStatus.COMPLETED);
        }
        return status;
    }


    /**
     * 使用runtime形式调用cmd
     *
     * @param cmdStr
     */
    private void runtimeBuilder(String cmdStr) {
        BufferedReader err = null;
        try {
            Process process = Runtime.getRuntime().exec(cmdStr);
            FfmpegConvertM3u8Utils.p = process;
           /* VideoThread myThread = new VideoThread(process,serviceId,drmFileService);
            myThread.start();*/
            err = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String line = null;
            while ((line = err.readLine()) != null) {
                log.info("转换m3u8:"+line);
            }
            p.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            try {
                if (err != null) {
                    err.close();
                }
                try {
                    p.waitFor();
                    p.destroy();
                    log.info("video convert completed...");
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    e.printStackTrace();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取执行的cmd命令
     *
     * @return
     */
    public String getCommand() {
        StringBuffer bf = new StringBuffer();
        for (String str : cmdList) {
            bf.append(" ").append(str);
        }
        System.out.println("命令："+bf.toString());
        return bf.toString();
    }

    public static class VideoStatus {
        public static final String COMPLETED = "completed";
        public static final String PROCESSING = "processing";
        public static final String NO_STARTED = "no started";
    }
}
