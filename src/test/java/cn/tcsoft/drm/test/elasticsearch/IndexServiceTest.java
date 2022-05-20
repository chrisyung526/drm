package cn.tcsoft.drm.test.elasticsearch;

import cn.tcsoft.drm.DrmServiceApplication;
import cn.tcsoft.drm.elasticsearch.document.IndexService;
import cn.tcsoft.drm.test.BaseTest;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.json.JsonXContent;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author : laimin
 * create at:  2022/4/12  15:54
 * @description: 测试elasticsearch
 */
@Slf4j
@RunWith(SpringRunner.class)
@FixMethodOrder(MethodSorters.JVM)
@SpringBootTest(classes = DrmServiceApplication.class,webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class IndexServiceTest extends BaseTest {
    private String index = "book-category-index";

    @Resource
    IndexService indexService;


    @Test
    public void createIndex1(){
//        indexService.deleteIndex(index);
//        CreateIndexRequest request = new CreateIndexRequest(index);
//        buildSetting(request);
//        buildIndexMapping(request);
//        indexService.createIndex(index,request);
    }
    @Test
    public void testDelIndex2(){
        //indexService.deleteIndex(index);
    }

    //设置分片
    private void buildSetting(CreateIndexRequest request) {
        request.settings(Settings.builder().put("index.number_of_shards", 3)
                .put("index.number_of_replicas", 2));
    }


    @SneakyThrows
    private void  buildIndexMapping(CreateIndexRequest request){
        XContentBuilder mappingBuilder = JsonXContent.contentBuilder()
                .startObject()
                .startObject("properties")
                .startObject("category")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("createDt")
                .field("type", "date")
                .field("index", "true")
                .endObject()

                .startObject("lastUpdDt")
                .field("type", "date")
                .field("index", "true")
                .endObject()

                .startObject("bibNo")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("metadataField")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("value")
                .field("type", "text")
                .field("index", "true")
                //.field("analyzer", "ik_max_word") // ik_max_word 这个分词器是ik的，可以去github上搜索安装es的ik分词器插件
                .endObject()

                .startObject("sequence")
                .field("type", "integer")
                .field("index", "true")
                .endObject()

                .startObject("isDelete")
                .field("type", "integer")
                .field("index", "true")
                .endObject()

                .startObject("orgName")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("createBy")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("lastUpdBy")
                .field("type", "keyword")
                .field("index", "true")
                .endObject()

                .startObject("id")
                .field("type", "long")
                .field("index", "true")
                .endObject()

                .startObject("orgId")
                .field("type", "long")
                .field("index", "true")
                .endObject()



                .endObject()
                .endObject();
        request.mapping(mappingBuilder);
    }
}