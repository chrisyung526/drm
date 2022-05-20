package cn.tcsoft.drm.elasticsearch.document.impl;

import cn.tcsoft.drm.elasticsearch.document.DocService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import org.elasticsearch.action.admin.indices.refresh.RefreshRequest;
import org.elasticsearch.action.admin.indices.refresh.RefreshResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.reindex.BulkByScrollResponse;
import org.elasticsearch.index.reindex.DeleteByQueryRequest;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author : laimin
 * create at:  2022/4/13  11:33
 * @description: elasticsearch 文本操作接口实现
 */
@Service
@Slf4j
public class DocServiceImpl implements DocService {

    @Resource
    private RestHighLevelClient restHighLevelClient;

    @Override
    @SneakyThrows
    public void add(String index,String json){
        IndexRequest indexRequest = new IndexRequest(index);
        indexRequest.source(json, XContentType.JSON);
        IndexResponse indexResponse = restHighLevelClient.index(indexRequest, RequestOptions.DEFAULT);
        log.debug("add: " + JSON.toJSONString(indexResponse));
    }

    @Override
    @SneakyThrows
    public void add(String index,String json,String id){
        IndexRequest indexRequest = new IndexRequest(index);
        indexRequest.id(id);
        indexRequest.source(json, XContentType.JSON);
        IndexResponse indexResponse = restHighLevelClient.index(indexRequest, RequestOptions.DEFAULT);
        log.debug("add: " + JSON.toJSONString(indexResponse));
    }

    /**
     * 删除
     * @param index 索引名称
     * @param docId    文档ID
     */
    @Override
    @SneakyThrows
    public void deleteDocWithId(String index, String docId){
        DeleteRequest request = new DeleteRequest(index, docId);
        DeleteResponse response = restHighLevelClient.delete(request, RequestOptions.DEFAULT);
        log.debug(response+""+response.getResult());
    }

    @Override
    @SneakyThrows
    public void refresh(String index){
        RefreshRequest refreshRequest = new RefreshRequest(index);
        RefreshResponse refresh = restHighLevelClient.indices().refresh(refreshRequest, RequestOptions.DEFAULT);
        log.info(refresh.toString());
    }

    @Override
    @SneakyThrows
    public long countDoc(String index){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchAllQuery());
        searchRequest.source(searchSourceBuilder);
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        SearchHits hits = searchResponse.getHits();
        return hits.getTotalHits().value;
    }

    @Override
    @SneakyThrows
    public UpdateResponse update(String index,  Map<String, Object> map, String id){
        UpdateRequest request = new UpdateRequest(index,id).doc(map);
        UpdateResponse updateResponse = restHighLevelClient.update(request, RequestOptions.DEFAULT);
        log.debug("update: " + JSON.toJSONString(updateResponse));
        return updateResponse;
    }

    /**
     *  批量增加与修改
     * @param index 索引名称
     * @param builder 批量请求
     */
    @Override
    @SneakyThrows
    public BulkResponse bulkUpdateOrInsertDoc(String index, BulkRequest builder){
        BulkResponse bulkResponse = restHighLevelClient.bulk(builder, RequestOptions.DEFAULT);
        return bulkResponse;
    }

    /**
     *  批量删除
     * @param index 索引名称
     * @param docIdArr _ID数组
     */
    @Override
    @SneakyThrows
    public void bulkDeleteDoc(String index,  String[] docIdArr){
        BulkRequest  bulkRequestBuilder = new BulkRequest();
        for (String docId : docIdArr) {
            bulkRequestBuilder.add(new DeleteRequest(index, docId));
        }
        BulkResponse bulkResponse = restHighLevelClient.bulk(bulkRequestBuilder, RequestOptions.DEFAULT);
        log.info(bulkResponse.toString());
    }

    /**
     * 删除查询的数据
     * @param index 索引名称
     * @param fieldName   查询字段名称
     * @param fieldValue  查询字段值
     */
    @Override
    @SneakyThrows
    public void deleteByQuery(String index, String fieldName,String  fieldValue){
        DeleteByQueryRequest deleteByQueryRequest = new DeleteByQueryRequest(index).setQuery(QueryBuilders.termQuery(fieldName, fieldValue));
        BulkByScrollResponse bulkByScrollResponse = restHighLevelClient.deleteByQuery(deleteByQueryRequest, RequestOptions.DEFAULT);

    }
}