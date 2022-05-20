package cn.tcsoft.drm.util.ffmpeg;

import cn.tcsoft.drm.config.properties.MediaStreamProperties;
import cn.tcsoft.drm.util.tools.AESEncryptionUtil;
import cn.tcsoft.drm.util.threadpool.ThreadPoolExecutorUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * @author : hyman
 * create at:  2022/2/22  11:19
 * @description: 流媒体加密
 */
@Slf4j
public class MediaStreamEncHlsUtils {
    //执行成功0,失败1
    private static int CODE_SUCCESS = 0;
    private static int CODE_FAIL = 1;

    /**
     * 创建enc.key enc.keyinfo
     * @param basePath
     * @param source
     * @param target
     * @param mediaStreamProperties
     */
    @SneakyThrows
    public static CompletableFuture<String> createEnc(String basePath, String source, String target, MediaStreamProperties mediaStreamProperties, String identifier){
        CompletableFuture<String> completableFutureEncTask = CompletableFuture.supplyAsync(() -> {
            //创建enc.keyinfo文件,返回文件地址
            String encKeyInfoFilePath;
            //写入文件内容enc.key
            BufferedWriter encKey = null;
            //写入文件内容enc.keyinfo
            BufferedWriter encKeyInfo = null;
            try {
                //文件
                File encKeyFile = new File(basePath,mediaStreamProperties.getKeyName()+mediaStreamProperties.getFileExtension());
                File encKeyInfoFile = new File(basePath,mediaStreamProperties.getKeyName()+mediaStreamProperties.getInfoFileExtension());
                encKeyInfoFilePath=encKeyInfoFile.getPath();
                File fileParent = encKeyFile.getParentFile();
                if(!fileParent.exists()){
                    fileParent.mkdirs();
                }
                //初始化存在删除
                if (encKeyFile.exists()) {
                    encKeyFile.delete();
                }
                if (encKeyInfoFile.exists()) {
                    encKeyInfoFile.delete();
                }
                encKey = new BufferedWriter(new FileWriter(encKeyFile));
                encKeyInfo = new BufferedWriter(new FileWriter(encKeyInfoFile));

                //写入key--自定义的AES128加密的密匙
                encKey.write(AESEncryptionUtil.encrypt(basePath+source+target));
                //写入keyInfo
                //密匙URL地址，可以对该URL鉴权
                encKeyInfo.write(String.format(mediaStreamProperties.getUri(),identifier,identifier));
                encKeyInfo.newLine();
                //全路径，绝对路径
                encKeyInfo.write(encKeyFile.getPath());

                encKey.flush();
                encKeyInfo.flush();
            } catch (IOException e) {
                e.printStackTrace();
                //恢复默认
                encKeyInfoFilePath = null;
            } finally {
                try {
                    //一定要关闭文件
                    encKey.close();
                    encKeyInfo.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return encKeyInfoFilePath;
        }, ThreadPoolExecutorUtils.pool);

        return completableFutureEncTask;
    }

    //将荣耀视频测试.MP4 --> HLS m3u8 AES128 加密（//////注意绝对路径///////）
    //$encInfoPath、$encPath是需要替换的ENC_DIRECTORY文件路径
    //ffmpeg -i test.mp4 -c:v libx264 -hls_time 60 -hls_list_size 0 -c:a aac -strict -2 -f hls output.m3u8
    //加水印 转码 切割m3u8 加密
    // ffmpeg -i VD21034.mp4 -i "1.png" -filter_complex "[0]scale=1080:-2[bg];[bg][1]overlay=0:0" -c:v libx264 -b:v 4096k -b:a 384k -hls_time 10 -hls_list_size 0 -f hls hls/1080.m3u8 -async 1 -vsync 1
    @Async
    public void convert(CompletableFuture<String> completableFutureTask, String source, String target,String minRate,String maxRate,String audioRate,String resolution,String logo) {
        //异步执行
        //HLS m3u8 AES128 加密
        CompletableFuture<Integer> completableFutureTaskHls = completableFutureTask.thenApplyAsync((String encKeyInfoFilePath) -> {
            if (Objects.isNull(encKeyInfoFilePath)) {
                log.error("enc.key 文件创建失败");
                return CODE_FAIL;
            }
            File targetFile = new File(target);
            File fileParent = targetFile.getParentFile();
            if(!fileParent.exists()){
                fileParent.mkdirs();
            }

            List<String> script=script(source,target,encKeyInfoFilePath,minRate,maxRate,resolution,logo);
            Integer codeTmp =FfmpegUtil.processInt(script);
            if (CODE_SUCCESS != codeTmp) {
                return CODE_FAIL;
            }
            return codeTmp;
        }, ThreadPoolExecutorUtils.pool);

        //获取执行结果
        //code=0表示正常
        try {
            log.info(String.format(target+">获取最终执行结果:%s", completableFutureTaskHls.get() == CODE_SUCCESS ? "成功！" : "失败！"));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

    }

    /**
     * 脚本组装
     * @param source
     * @param target
     * @param encKeyInfoFilePath
     * @return
     */
    private static List<String> script(String source, String target, String encKeyInfoFilePath,String minRate,String maxRate,String resolution,String logo){
       //ffmpeg -i VD21034.mp4 -i "1.png" -filter_complex "[0]scale=1080:-2[bg];[bg][1]overlay=0:0" -c:v libx264 -b:v 4096k -b:a 384k -hls_time 10 -hls_list_size 0 -f hls hls/1080.m3u8 -async 1 -vsync 1
        List<String> command=new ArrayList<>();
        command.add("ffmpeg");

        command.add("-i");
        command.add(source);
        command.add("-i");
        command.add(logo);
        command.add("-filter_complex");
        command.add("[0]scale="+resolution+":-2[bg];[bg][1]overlay=0:0");
        command.add("-c:v");
        command.add("libx264");
        command.add("-b:v");
        command.add(minRate);
        command.add("-bufsize");
        command.add(minRate);
        command.add("-maxrate");
        command.add(maxRate);
        command.add("-b:a");
        command.add(maxRate);
        command.add("-hls_time");
        command.add("10");
        command.add("-hls_list_size");
        command.add("0");
        command.add("-c:a");
        command.add("aac");
        command.add("-strict");
        command.add("-2");
        command.add("-hls_key_info_file");
        command.add(encKeyInfoFilePath);
        command.add("-hls_playlist_type");
        command.add("vod");
        command.add("-f");
        command.add("hls");
        command.add(target);
        command.add("-async");
        command.add("1");
        command.add("-vsync");
        command.add("1");
        return command;
    }

}