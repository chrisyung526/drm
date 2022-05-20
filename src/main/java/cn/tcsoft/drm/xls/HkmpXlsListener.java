package cn.tcsoft.drm.xls;


import cn.tcsoft.drm.entity.HkmpMetadata;
import cn.tcsoft.drm.service.HkmpMetadataService;
import cn.tcsoft.drm.xls.model.HkmpDataModel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import ma.glasnost.orika.MapperFacade;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2021/12/21  14:54
 * @description:
 */
@Slf4j
public class HkmpXlsListener implements ReadListener<HkmpDataModel> {
    HkmpMetadataService hkmpMetadataService;
    MapperFacade mapperFacade;
    String sheetName;
    public HkmpXlsListener(){}

    public HkmpXlsListener(HkmpMetadataService hkmpMetadataService, MapperFacade mapperFacade){
        this.hkmpMetadataService=hkmpMetadataService;
        this.mapperFacade=mapperFacade;
    }
    List<HkmpDataModel> list= Lists.newArrayList();
    @Override
    public void invokeHead(Map headMap, AnalysisContext analysisContext) {
        sheetName=analysisContext.getCurrentSheet().getSheetName();
        log.debug("sheetName："+sheetName);
        log.debug("headMap"+JSON.toJSONString(headMap));
        log.debug("数据条数："+analysisContext.getTotalCount());
        //log.debug("文件类型："+analysisContext.getExcelType().getValue());
    }


    @Override
    public void onException(Exception e, AnalysisContext analysisContext) throws Exception {

    }

    @Override
    public void invoke(HkmpDataModel dataModel, AnalysisContext analysisContext) {
        if(Objects.isNull(dataModel)){
            return;
        }
        list.add(dataModel);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        log.info("所有数据解析完成！"+list.size());
        if(Objects.nonNull(list)) {

            List<HkmpMetadata> dbList=mapperFacade.mapAsList(list, HkmpMetadata.class);
            Boolean flag = hkmpMetadataService.saveBatch(dbList);
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