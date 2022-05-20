package cn.tcsoft.drm.test.elasticsearch;

import cn.tcsoft.drm.DrmServiceApplication;
import cn.tcsoft.drm.elasticsearch.document.DocService;
import cn.tcsoft.drm.entity.MmisMetadata;
import cn.tcsoft.drm.service.MmisMetadataService;
import cn.tcsoft.drm.test.BaseTest;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.bulk.BulkItemResponse;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.common.xcontent.XContentType;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author : laimin
 * create at:  2022/4/13  15:26
 * @description:
 */
@Slf4j
public class DocServiceTest extends BaseTest {
    private String index = "book-category-index";
    @Resource
    DocService docService;
    @Resource
    MmisMetadataService metadataService;

    @Test
    public void batchInert(){
//        BulkRequest bulkRequestBuilder = new BulkRequest();
//        List<MmisMetadata> list=metadataService.list();
//        for(MmisMetadata map:list){
//            bulkRequestBuilder.add(new IndexRequest(index).id(map.getId().toString()).source(JSON.toJSONString(map), XContentType.JSON));
//        }
//        BulkResponse bulkResponse = docService.bulkUpdateOrInsertDoc(index, bulkRequestBuilder);
//        BulkItemResponse[] bulkItemResponseArr = bulkResponse.getItems();
//        for (BulkItemResponse bulkItemResponse :bulkItemResponseArr) {
//            log.debug("操作是否失败:"+ bulkItemResponse.isFailed() + " 文档版本：" + bulkItemResponse.getVersion());
//        }

    }
}