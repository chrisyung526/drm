package cn.tcsoft.drm.xls;

import cn.tcsoft.drm.service.MmisMetadataService;
import cn.tcsoft.drm.entity.MmisMetadata;
import cn.tcsoft.drm.xls.model.MmisDataModel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import ma.glasnost.orika.MapperFacade;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2021/12/21  14:54
 * @description:
 */
@Slf4j
public class MmisXlsListener implements ReadListener<MmisDataModel> {
    MmisMetadataService mmisMetadataService;
    MapperFacade mapperFacade;
    String sheetName;
    public MmisXlsListener(){}

    public MmisXlsListener(MmisMetadataService mmisMetadataService, MapperFacade mapperFacade){
        this.mmisMetadataService=mmisMetadataService;
        this.mapperFacade=mapperFacade;
    }
    List<MmisDataModel> list= Lists.newArrayList();
    @Override
    public void invokeHead(Map headMap, AnalysisContext analysisContext) {
        sheetName=analysisContext.getCurrentSheet().getSheetName();
        log.debug("sheetName："+sheetName);
        log.debug("数据条数："+analysisContext.getTotalCount());
        //log.debug("文件类型："+analysisContext.getExcelType().getValue());
    }


    @Override
    public void onException(Exception e, AnalysisContext analysisContext) throws Exception {

    }

    @Override
    public void invoke(MmisDataModel excelMode, AnalysisContext analysisContext) {
        if(Objects.isNull(excelMode) || Objects.isNull(excelMode.getBibNo())){
            return;
        }
        list.add(excelMode);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        log.info("所有数据解析完成！"+list.size());
        if(Objects.nonNull(list)) {
            List<MmisMetadata> dbList=mapperFacade.mapAsList(list, MmisMetadata.class);
            Boolean flag = mmisMetadataService.saveBatch(dbList);
            if (flag) {
                log.info(sheetName+",插入成功!");
            }
        }
        list=Lists.newArrayList();
    }

    @Override
    public boolean hasNext(AnalysisContext analysisContext) {
        return Boolean.TRUE;
    }
}