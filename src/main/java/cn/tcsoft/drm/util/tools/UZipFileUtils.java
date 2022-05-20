package cn.tcsoft.drm.util.tools;

import cn.tcsoft.drm.model.vo.ZipFileInfoVO;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.charset.Charset;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * @author : hyman
 * create at:  2022/3/3  16:22
 * @description: zip压缩包解压
 */
@Slf4j
public class UZipFileUtils {
    /**
     * 解压到指定目录
     */
    @SneakyThrows
    public static  List<ZipFileInfoVO> unZipFiles(String zipPath,String descDir) {
        return unZipFiles(new File(zipPath), descDir);
    }
    /**
     * 解压文件到指定目录
     */
    @SneakyThrows
    public static List<ZipFileInfoVO> unZipFiles(File zipFile,String descDir) {
        List<ZipFileInfoVO> list= Lists.newArrayList();
        log.debug("解析开始："+ LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        File pathFile = new File(descDir);
        if(!pathFile.exists()) {
            pathFile.mkdirs();
        }
        //解决zip文件中有中文目录或者中文文件
        ZipFile zip = new ZipFile(zipFile, Charset.forName("UTF-8"));
        //排除 MACOSX psd
        List<ZipEntry> entryList=zip.stream().filter(z->!z.getName().toLowerCase().startsWith("__macosx/") && !z.getName().toLowerCase().contains(".ds_store") && !z.getName().toLowerCase().endsWith("psd")).collect(Collectors.toList());
        log.debug("压缩文件："+zip.getName()+" | 文件数量:"+entryList.size()+" | 文件大小："+zipFile.length());
        for(ZipEntry entry:entryList) {
            //ZipEntry entry = (ZipEntry) entries.nextElement();
            String zipEntryName = entry.getName();
            InputStream in = zip.getInputStream(entry);
            String outPath = (descDir+zipEntryName).replaceAll("\\*", "/");;
            //判断路径是否存在,不存在则创建文件路径
            File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));
            if(!file.exists()) {
                file.mkdirs();
            }
            //判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
            if(new File(outPath).isDirectory()) {
                continue;
            }
            OutputStream out = new FileOutputStream(outPath);
            byte[] buf = new byte[1024];
            int len;
            while((len=in.read(buf))>0) {
                out.write(buf ,0 , len);
            }
            in.close();
            out.close();
            String fileSuffix=zipEntryName.split("\\.")[1];
            //输出文件路径信息
            log.debug("文件名称："+zipEntryName+" | 文件路径信息:"+outPath+ " | 文件大小："+entry.getSize()+" | 文件后缀："+fileSuffix);
            list.add(ZipFileInfoVO.builder()
                    .fromZipName(zip.getName())
                    .fileName(zipEntryName)
                    .filePath(outPath)
                    .fileSize(entry.getSize())
                    .fileSuffix(fileSuffix)
                    .fileType(FileUtils.fileType(fileSuffix))
                    .build());
        }
        log.debug("解析完成："+ LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        return list;
    }

//    public static void main(String[] args) throws IOException {
//        /**
//         * 解压文件
//         */
//        File zipFile = new File("/Users/hyman/Desktop/STT.zip");
//        String path = "/Users/hyman/Desktop/zipfile/";
//        List<ZipFileInfoVO> list=unZipFiles(zipFile, path);
//        log.debug(JSON.toJSONString(list));
//
//
//    }
}