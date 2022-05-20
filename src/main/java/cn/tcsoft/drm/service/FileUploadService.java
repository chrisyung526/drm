package cn.tcsoft.drm.service;


import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * @author : hyman
 * create at:  2022/1/10  14:03
 * @description: 文件上传服务
 */
public interface FileUploadService {
    /**
     * 文件删除
     * @param filePath 文件路径
     * @return
     */
    boolean deleteFile(String filePath);

    /**
     * 单个文件上传
     * @param file 单个文件
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    String uploadFile(MultipartFile file) throws IllegalStateException, IOException;

    /**
     * 多个文件上传
     * @param file 多个文件
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    List<String> uploadFile(MultipartFile[] file) throws IllegalStateException, IOException;
}