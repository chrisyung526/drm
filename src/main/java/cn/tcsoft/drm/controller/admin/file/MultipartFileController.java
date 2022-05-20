package cn.tcsoft.drm.controller.admin.file;

import cn.tcsoft.drm.ApiErrorCode;
import cn.tcsoft.drm.config.log.Loggable;
import cn.tcsoft.drm.config.log.enums.LogTypeEnum;
import cn.tcsoft.drm.entity.TChunkInfo;
import cn.tcsoft.drm.entity.TFileInfo;
import cn.tcsoft.drm.model.dto.QueryInfo;
import cn.tcsoft.drm.model.vo.ApiResult;
import cn.tcsoft.drm.model.vo.TFileInfoVO;
import cn.tcsoft.drm.model.vo.UploadResult;
import cn.tcsoft.drm.service.ChunkService;
import cn.tcsoft.drm.service.FileInfoService;
import cn.tcsoft.drm.service.FileUploadService;
import cn.tcsoft.drm.util.RequestUtils;
import cn.tcsoft.drm.util.tools.FileInfoUtils;
import cn.tcsoft.drm.util.tools.FileUtils;
import cn.tcsoft.drm.util.tools.UZipFileUtils;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.exceptions.ApiException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/client-api/file")
@Api(tags = "文件分片上传管理")
public class MultipartFileController {
    @Value("${prop.upload-folder}")
    private String uploadFolder;

    @Resource
    private FileInfoService fileInfoService;
    @Resource
    FileUploadService fileUploadService;

    @Resource
    private ChunkService chunkService;

    private final Logger logger = LoggerFactory.getLogger(MultipartFileController.class);

    /**
     * 上传文件块 断点续传的话一个文件只能上传一次并只会产生一条记录
     * @param chunk
     * @return
     */
    @PostMapping("/chunk")
    public String uploadChunk(TChunkInfo chunk) {
        String apiRlt = "200";

        MultipartFile file = chunk.getUpfile();
        logger.info("file originName: {}, chunkNumber: {}", file.getOriginalFilename(), chunk.getChunkNumber());

        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(FileInfoUtils.generatePath(uploadFolder, chunk));
            //文件写入指定路径
            Files.write(path, bytes);
            if(chunkService.saveChunk(chunk) < 0) {
                apiRlt = "415";
            }

        } catch (IOException e) {
            e.printStackTrace();
            apiRlt = "415";
        }
        return apiRlt;
    }

    @GetMapping("/chunk")
    public UploadResult checkChunk(TChunkInfo chunk, HttpServletResponse response) {
        UploadResult ur = new UploadResult();

        //默认返回其他状态码，前端不进去checkChunkUploadedByResponse函数，正常走标准上传
        response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);

        String file = uploadFolder + "/" + chunk.getIdentifier() + "/" + chunk.getFilename();

        //先判断整个文件是否已经上传过了，如果是，则告诉前端跳过上传，实现秒传
        if(FileInfoUtils.fileExists(file)) {
            ur.setSkipUpload(true);
            ur.setLocation(file);
            response.setStatus(HttpServletResponse.SC_OK);
            ur.setMessage("完整文件已存在，直接跳过上传，实现秒传");
            return ur;
        }

        //如果完整文件不存在，则去数据库判断当前哪些文件块已经上传过了，把结果告诉前端，跳过这些文件块的上传，实现断点续传
        ArrayList<Integer> list = chunkService.checkChunk(chunk);
        if (list !=null && list.size() > 0) {
            ur.setSkipUpload(false);
            ur.setUploadedChunks(list);
            response.setStatus(HttpServletResponse.SC_OK);
            ur.setMessage("部分文件块已存在，继续上传剩余文件块，实现断点续传");
            return ur;
        }
        return ur;
    }

    @PostMapping("/mergeFile")
    public String mergeFile(@RequestBody TFileInfoVO fileInfoVO){

        String rlt = "FALURE";

        //前端组件参数转换为model对象
        TFileInfo fileInfo = new TFileInfo();
        fileInfo.setFileName(fileInfoVO.getName());
        fileInfo.setIdentifier(fileInfoVO.getUniqueIdentifier());
        fileInfo.setId(fileInfoVO.getId());
        fileInfo.setTotalSize(fileInfoVO.getSize());
        fileInfo.setRefProjectId(fileInfoVO.getRefProjectId());

        //进行文件的合并操作
        String filename = fileInfo.getFileName();
        String file = uploadFolder + "/" + fileInfo.getIdentifier() + "/" + filename;
        String folder = uploadFolder + "/" + fileInfo.getIdentifier();
        String fileSuccess = FileInfoUtils.merge(file, folder, filename);
        fileInfo.setLocation("/" + fileInfo.getIdentifier() + "/" + filename);
        //文件合并成功后，保存记录至数据库
        if("200".equals(fileSuccess)) {
            if(fileInfoService.addFileInfo(fileInfo) > 0) {
                rlt = "SUCCESS";
                fileInfoService.convertM3u8(fileInfo.getIdentifier(),filename);
            }
        }
        //如果已经存在，则判断是否同一个项目，同一个项目的不用新增记录，否则新增
        if("300".equals(fileSuccess)) {
            rlt = "repeat";
            List<TFileInfo> tfList = fileInfoService.selectFileByParams(fileInfo);
            if(tfList != null) {
                if(tfList.size() == 0 || (tfList.size() > 0 && !fileInfo.getRefProjectId().equals(tfList.get(0).getRefProjectId()))) {
                    if(fileInfoService.addFileInfo(fileInfo) > 0){
                        rlt = "SUCCESS";
                        fileInfoService.convertM3u8(fileInfo.getIdentifier(),filename);
                    }
                }
            }
        }

        return rlt;
    }

    /**
     * 查询列表
     *
     * @return ApiResult
     */
    @RequestMapping(value = "/selectFileList", method = RequestMethod.POST)
    @Loggable(description = "文件管理>文件列表",type = LogTypeEnum.CLIENT_API)
    public ApiResult selectFileList(@RequestBody QueryInfo query){
       /* PageHelper.startPage(query.getPageIndex(), query.getPageSize());
        List<TFileInfo> list =  fileInfoService.selectFileList(query);
        PageInfo<TFileInfo> pageResult = new PageInfo<>(list);*/
        List<TFileInfo> list =  fileInfoService.selectFileList(query);
        return ApiResult.success(list);
    }

    /**
     * 下载文件
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void download(HttpServletRequest req, HttpServletResponse resp){
        String location = req.getParameter("location");
        String fileName = req.getParameter("filename");
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        OutputStream fos = null;
        try {
            bis = new BufferedInputStream(new FileInputStream(uploadFolder+location));
            fos = resp.getOutputStream();
            bos = new BufferedOutputStream(fos);
            RequestUtils.setFileDownloadHeader(req, resp, fileName);
            int byteRead = 0;
            byte[] buffer = new byte[8192];
            while ((byteRead = bis.read(buffer, 0, 8192)) != -1) {
                bos.write(buffer, 0, byteRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                bos.flush();
                bis.close();
                fos.close();
                bos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    public ApiResult deleteFile(@RequestBody TFileInfo tFileInfo ){
        int result = fileInfoService.deleteFile(tFileInfo);
        return ApiResult.success(result);
    }
    @RequestMapping(value = "/detail{id}", method = RequestMethod.GET)
    public TFileInfo download(@PathVariable String id){
        return fileInfoService.getById(id);
    }


    @PostMapping("upload")
    @ApiOperation("文件上传")
    public R upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
           throw new ApiException(ApiErrorCode.FILE_NOT_FOUND);
        }
        try {
            return R.restResult(fileUploadService.uploadFile(file),ApiErrorCode.SUCCESS);
            //return R.restResult(UZipFileUtils.unZipFiles(FileUtils.saveFile(file),"/Users/hyman/Desktop/zipfile/"),ApiErrorCode.SUCCESS);
        } catch (IOException e) {
            logger.error(e.toString(), e);
        }
        return R.failed(ApiErrorCode.BAD_ERROR);

    }

}
