//package cn.tcsoft.drm.util.ffmpeg;
//
//
//import cn.tcsoft.drm.util.tools.AESEncryptionUtil;
//import cn.tcsoft.drm.util.threadpool.ThreadPoolExecutorUtils;
//
//import java.io.*;
//import java.util.concurrent.CompletableFuture;
//import java.util.concurrent.ExecutionException;
//
///**
// * 优点：各种浏览器，手机，小程序都能兼容，通用性很好。
// * 缺点：公开的算法，还原也十分简单，有很多影音嗅探工具能直接下载还原，加密效果很弱，防小白可以。
// * <p>
// * ①新建一个记事本，取名enc.key（名字可以随便取），添加16个字节的自定义的AES128加密的密匙，如：
// * hsjissmart123456
// * <p>
// * ②新建一个文件，enc.keyinfo，添加如下内容（注意：enc.keyinfo里面的enc.key路径绝对路径）
// * http://localhost:8080/enc.key
// * xxx\enc.key
// * <p>
// * ③这里需要把enc.key和enc.keyinfo放在同一目录下
// *
// * @Description:(MP4 转码 HLS m3u8 AES128 加密)
// * @Copyright:
// */
//public class FfmpegConvertM3u8EncUtils {
//    //执行成功0,失败1
//    private static int CODE_SUCCESS = 0;
//    private static int CODE_FAIL = 1;
//    /**
//     * 第一步：创建enc.keyinfo文件
//     * 第二步：HLS m3u8 AES128 加密
//     *
//     * @throws
//     * @param: @param args
//     * @return: void
//     */
//    public static void conver(String basePath, String source, String target) {
//        //将荣耀视频测试.MP4 --> HLS m3u8 AES128 加密（//////注意绝对路径///////）
//        //$encInfoPath、$encPath是需要替换的ENC_DIRECTORY文件路径
//        //ffmpeg -i test.mp4 -c:v libx264 -hls_time 60 -hls_list_size 0 -c:a aac -strict -2 -f hls output.m3u8
//        String cmd_enc = " -y -i "+source+" -c:v libx264 -hls_time 10 -hls_list_size 0 -c:a aac -strict -2 -hls_key_info_file $encInfoPath -hls_playlist_type vod -f hls "+target;
//
//        //异步执行
//        //第一步：创建enc.keyinfo文件等
//        CompletableFuture<String> completableFutureTask = CompletableFuture.supplyAsync(() -> {
//            //创建enc.keyinfo文件,返回文件地址
//            String encKeyInfoFilePath = null;
//
//            //目录enc
//            File encFilePathDir = new File(basePath);
//            if (!encFilePathDir.exists()) {// 判断目录是否存在
//                encFilePathDir.mkdir();
//            }
//
//            //写入文件内容enc.key
//            BufferedWriter bwkey = null;
//            //写入文件内容enc.keyinfo
//            BufferedWriter bwkeyInfo = null;
//
//            try {//文件
//                String encKeyFilePath = basePath + "\\enc.key";
//                encKeyInfoFilePath = basePath + "\\enc.keyinfo";
//                File fileKey = new File(encKeyFilePath);
//                File fileKeyInfo = new File(encKeyInfoFilePath);
//
//                //初始化存在删除
//                if (fileKey.exists()) {
//                    fileKey.delete();
//                }
//                if (fileKeyInfo.exists()) {
//                    fileKeyInfo.delete();
//                }
//                bwkey = new BufferedWriter(new FileWriter(fileKey));
//                bwkeyInfo = new BufferedWriter(new FileWriter(fileKeyInfo));
//
//                //写入key--自定义的AES128加密的密匙
//                bwkey.write(AESEncryptionUtil.encrypt(basePath+source+target));
//                //写入keyInfo
//                //密匙URL地址，可以对该URL鉴权
//                bwkeyInfo.write("http://localhost:8000/enc.key");
//                bwkeyInfo.newLine();
//                //全路径，绝对路径
//                bwkeyInfo.write(encKeyFilePath);
//
//                bwkey.flush();
//                bwkeyInfo.flush();
//            } catch (IOException e) {
//                e.printStackTrace();
//                //恢复默认
//                encKeyInfoFilePath = null;
//            } finally {
//                try {
//                    //一定要关闭文件
//                    bwkey.close();
//                    bwkeyInfo.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//            return encKeyInfoFilePath;
//        }, ThreadPoolExecutorUtils.pool);
//        //异步执行
//        //第二步：HLS m3u8 AES128 加密
//        CompletableFuture<Integer> completableFutureTaskHls = completableFutureTask.thenApplyAsync((String encKeyInfoFilePath) -> {
//            if (encKeyInfoFilePath == null || encKeyInfoFilePath.length() == 0) {
//                return CODE_FAIL;
//            }
//            System.out.println("第一步：创建enc.keyinfo文件,成功！");
//            Integer codeTmp = cmdExecut(cmd_enc.replace("$encInfoPath", encKeyInfoFilePath));
//            if (CODE_SUCCESS != codeTmp) {
//                return CODE_FAIL;
//            }
//            System.out.println("第二步：HLS m3u8 AES128 加密,成功！");
//            return codeTmp;
//        }, ThreadPoolExecutorUtils.pool);
//
//        //获取执行结果
//        //code=0表示正常
//        try {
//            System.out.println(String.format("获取最终执行结果:%s", completableFutureTaskHls.get() == CODE_SUCCESS ? "成功！" : "失败！"));
//        } catch (InterruptedException e) {
//            Thread.currentThread().interrupt();
//            e.printStackTrace();
//        } catch (ExecutionException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    /**
//     * @throws
//     * @Description: (执行ffmpeg自定义命令)
//     * @param: @param cmdStr
//     * @param: @return
//     * @return: Integer
//     */
//    public static Integer cmdExecut(String cmdStr) {
//        //code=0表示正常
//        Integer code = null;
//        FfmpegCmd ffmpegCmd = new FfmpegCmd();
//        /**
//         * 错误流
//         */
//        InputStream errorStream = null;
//        try {
//            //destroyOnRuntimeShutdown表示是否立即关闭Runtime
//            //如果ffmpeg命令需要长时间执行，destroyOnRuntimeShutdown = false
//
//            //openIOStreams表示是不是需要打开输入输出流:
//            //	       inputStream = processWrapper.getInputStream();
//            //	       outputStream = processWrapper.getOutputStream();
//            //	       errorStream = processWrapper.getErrorStream();
//            ffmpegCmd.execute(false, true, cmdStr);
//            errorStream = ffmpegCmd.getErrorStream();
//
//            //打印过程
//            int len = 0;
//            while ((len = errorStream.read()) != -1) {
//                System.out.print((char) len);
//            }
//
//            //code=0表示正常
//            code = ffmpegCmd.getProcessExitCode();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            //关闭资源
//            ffmpegCmd.close();
//        }
//        //返回
//        return code;
//    }
//
//}
