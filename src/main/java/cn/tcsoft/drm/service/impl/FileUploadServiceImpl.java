package cn.tcsoft.drm.service.impl;

import cn.tcsoft.drm.service.FileUploadLogService;
import cn.tcsoft.drm.entity.FileUploadLog;
import cn.tcsoft.drm.service.FileUploadService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

/**
 * @author : hyman
 * create at:  2022/1/10  14:19
 * @description: 文件上传
 */
@Service
@Slf4j
public class FileUploadServiceImpl implements FileUploadService {

    @Value("${prop.upload-folder:/Users/hyman/res}")
    String baseUrl;
    @Resource
    FileUploadLogService fileUploadLogService;

    @Override
    public boolean deleteFile(String filePath) {
        File file = new File(baseUrl+File.separator+filePath);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                fileUploadLogService.remove(Wrappers.<FileUploadLog>lambdaQuery().eq(FileUploadLog::getFilePath,filePath));
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    @Override
    public String uploadFile(MultipartFile file) throws IllegalStateException, IOException {
        // 获取上传的文件名称
        String fileSourceName = file.getOriginalFilename();
        //真实文件名称
        String fileName=fileName(fileSourceName);
        //文件保存路径
        String filePath=renameToUUID(fileName);
        File existsFilePath = new File(baseUrl, filePath);
        // 判断路径是否存在，不存在则新创建一个
        if (!existsFilePath.getParentFile().exists()) {
            existsFilePath.getParentFile().mkdirs();
        }
        //文件上传路径
        String uploadFilePath=baseUrl + File.separator + filePath;
        // 将上传文件保存到目标文件目录
        file.transferTo(new File(uploadFilePath));
        FileUploadLog uploadLog=new FileUploadLog();
        uploadLog.setFileName(fileName)
                .setFileSourceName(fileSourceName)
                .setFilePath(filePath)
                .setFileType(fileSuffix(fileSourceName))
                .setFileSize(file.getSize());
        fileUploadLogService.save(uploadLog);
        return filePath;
    }

    @Override
    public List<String> uploadFile(MultipartFile[] file) throws IllegalStateException, IOException {
        List<String> list= Lists.newArrayList();
        if(file!=null && file.length>0){
            for(MultipartFile multipartFile:file){
                list.add(uploadFile(multipartFile));
            }
        }
        return list;
    }

    /**
     * 获取UUID文件名称
     * @param uuidName uuid文件名称
     * @return
     */
    private String renameToUUID(String uuidName) {
        SimpleDateFormat FORMATTER = new SimpleDateFormat("ddMMyyyy/");
        return FORMATTER.format(System.currentTimeMillis())+uuidName;
    }

    /**
     * 文件名称
     * @param fileSourceName 源文件名称
     * @return
     */
    private String fileName(String fileSourceName) {
        return UUID.randomUUID().toString().replace("-","") + "." + fileSuffix(fileSourceName);
    }

    /**
     * 文件后缀
     * @param fileSourceName 源文件名称
     * @return
     */
    private String fileSuffix(String fileSourceName) {
        return fileSourceName.substring(fileSourceName.lastIndexOf(".") + 1);
    }
}