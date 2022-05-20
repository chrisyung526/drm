package cn.tcsoft.drm.util.tools;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.text.DecimalFormat;

/**
 * @author : hyman
 * create at:  2022/1/10  13:53
 * @description: 文件操作
 */
public class FileUtils {
    /**
     * 文件路径 示例（ Windows配置D:/ruoyi/uploadPath，Linux配置 /home/ruoyi/uploadPath）
     */
    public static final String basePath = "/Users/hyman/res";

    /**
     * 文上传保存
     *
     * @param file 单个文件
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String saveFile(MultipartFile file) throws IllegalStateException, IOException {

        // 获取上传的文件名称，并结合存放路径，构建新的文件名称
        String filename = file.getOriginalFilename();
        File filepath = new File(basePath, filename);

        // 判断路径是否存在，不存在则新创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        String filePath = basePath + File.separator + filename;
        // 将上传文件保存到目标文件目录
        file.transferTo(new File(filePath));
        return filePath;
    }

    /**
     * 文上传保存
     *
     * @param file 单个文件 basePath 上传路径
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    public static String saveHkmpFile(MultipartFile file, String basePath) throws IllegalStateException, IOException {
        // 获取上传的文件名称，并结合存放路径，构建新的文件名称
        String filename = file.getOriginalFilename();
        assert filename != null;
        File filepath = new File(basePath, filename);

        // 判断路径是否存在，不存在则新创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        String filePath = basePath + File.separator + filename;
        // 将上传文件保存到目标文件目录
        file.transferTo(new File(filePath));
        return filePath;
    }

    /**
     * 图片格式判断
     *
     * @param prefix
     * @return
     */
    public static boolean imageType(String prefix) {
        if ("JPG".equalsIgnoreCase(prefix) || "JPEG".equalsIgnoreCase(prefix) || "GIF".equalsIgnoreCase(prefix)
                || "PNG".equalsIgnoreCase(prefix) || "BMP".equalsIgnoreCase(prefix) || "PCX".equalsIgnoreCase(prefix)
                || "TGA".equalsIgnoreCase(prefix) || "PSD".equalsIgnoreCase(prefix) || "TIFF".equalsIgnoreCase(prefix)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 2017-11-16 09:48:22 张
     * <p>
     * 音频格式判断
     *
     * @param prefix
     * @return
     */
    public static boolean audioType(String prefix) {
        if ("mp3".equalsIgnoreCase(prefix) || "OGG".equalsIgnoreCase(prefix) || "WAV".equalsIgnoreCase(prefix)
                || "REAL".equalsIgnoreCase(prefix) || "APE".equalsIgnoreCase(prefix) || "MODULE".equalsIgnoreCase(prefix)
                || "MIDI".equalsIgnoreCase(prefix) || "VQF".equalsIgnoreCase(prefix) || "CD".equalsIgnoreCase(prefix)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 视频格式判断
     *
     * @return
     */
    public static boolean videoType(String prefix) {
        if ("mp4".equalsIgnoreCase(prefix) || "avi".equalsIgnoreCase(prefix) || "MPEG-1".equalsIgnoreCase(prefix)
                || "RM".equalsIgnoreCase(prefix) || "ASF".equalsIgnoreCase(prefix) || "WMV".equalsIgnoreCase(prefix)
                || "qlv".equalsIgnoreCase(prefix) || "MPEG-2".equalsIgnoreCase(prefix) || "MPEG4".equalsIgnoreCase(prefix)
                || "mov".equalsIgnoreCase(prefix) || "3gp".equalsIgnoreCase(prefix)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 文档类型
     *
     * @param prefix
     * @return
     */
    public static boolean documentType(String prefix) {
        if ("doc".equalsIgnoreCase(prefix) || "docx".equalsIgnoreCase(prefix) || "xls".equalsIgnoreCase(prefix)
                || "xlsx".equalsIgnoreCase(prefix) || "ppt".equalsIgnoreCase(prefix) || "pptx".equalsIgnoreCase(prefix)
        ) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 文件类型
     *
     * @param prefix
     * @return
     */
    public static String fileType(String prefix) {
        if (imageType(prefix)) {
            return "Image";
        } else if (audioType(prefix)) {
            return "Audio";
        } else if (videoType(prefix)) {
            return "Video";
        } else if (documentType(prefix)) {
            return "Document";
        } else {
            return "Other";
        }
    }


    /**
     * 将文件转换成byte数组
     *
     * @param filePath
     * @return
     */
    public static byte[] fileToByte(File tradeFile) {
        byte[] buffer = null;
        try {
            FileInputStream fis = new FileInputStream(tradeFile);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }

    //获取文件大小单位为B的double值
    public static final int SIZE_TYPE_B = 1;
    //获取文件大小单位为KB的double值
    public static final int SIZE_TYPE_KB = 2;
    //获取文件大小单位为MB的double值
    public static final int SIZE_TYPE_MB = 3;
    //获取文件大小单位为GB的double值
    public static final int SIZE_TYPE_GB = 4;

    private static File newFile(String filePath) {
        return new File(filePath);
    }

    /**
     * 获取文件指定文件的指定单位的大小
     *
     * @param filePath 文件路径
     * @param sizeType 获取大小的类型1为B、2为KB、3为MB、4为GB
     * @return double值的大小
     */
    public static double getFileOrFilesSize(String filePath, int sizeType) {
        File file = newFile(filePath);
        long blockSize = 0;
        try {
            if (file.isDirectory()) {
                blockSize = getFileSizes(file);
            } else {
                blockSize = getFileSize(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formatFileSize(blockSize, sizeType);
    }

    /**
     * 调用此方法自动计算指定文件或指定文件夹的大小
     *
     * @param filePath 文件路径
     * @return 计算好的带B、KB、MB、GB的字符串
     */
    public static String getAutoFileOrFilesSize(String filePath) {
        File file = newFile(filePath);
        long blockSize = 0;
        try {
            if (file.isDirectory()) {
                blockSize = getFileSizes(file);
            } else {
                blockSize = getFileSize(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formatFileSize(blockSize);
    }

    /**
     * 获取指定文件大小
     */
    private static long getFileSize(File file) throws Exception {
        long size = 0;
        if (file.exists()) {
            FileInputStream fis = null;
            fis = new FileInputStream(file);
            size = fis.available();
        } else {
            file.createNewFile();
        }
        return size;
    }

    /**
     * 获取指定文件夹
     */
    private static long getFileSizes(File f) throws Exception {
        long size = 0;
        File listFiles[] = f.listFiles();
        assert listFiles != null;
        for (File file : listFiles) {
            if (file.isDirectory()) {
                size = size + getFileSizes(file);
            } else {
                size = size + getFileSize(file);
            }
        }
        return size;
    }

    /**
     * 转换文件大小
     */
    public static String formatFileSize(long size) {
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString;
        String wrongSize = "0B";
        if (size == 0) {
            return wrongSize;
        }
        if (size < 1024) {
            fileSizeString = df.format((double) size) + "B";
        } else if (size < 1048576) {
            fileSizeString = df.format((double) size / 1024) + "KB";
        } else if (size < 1073741824) {
            fileSizeString = df.format((double) size / 1048576) + "MB";
        } else {
            fileSizeString = df.format((double) size / 1073741824) + "GB";
        }
        return fileSizeString;
    }

    /**
     * 转换文件大小,指定转换的类型
     */
    private static double formatFileSize(long size, int sizeType) {
        DecimalFormat df = new DecimalFormat("#.00");
        double fileSizeLong = 0;
        switch (sizeType) {
            case SIZE_TYPE_B:
                fileSizeLong = Double.parseDouble(df.format((double) size));
                break;
            case SIZE_TYPE_KB:
                fileSizeLong = Double.parseDouble(df.format((double) size / 1024));
                break;
            case SIZE_TYPE_MB:
                fileSizeLong = Double.parseDouble(df.format((double) size / 1048576));
                break;
            case SIZE_TYPE_GB:
                fileSizeLong = Double.parseDouble(df.format((double) size / 1073741824));
                break;
            default:
                break;
        }
        return fileSizeLong;
    }
}