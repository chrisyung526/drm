package cn.tcsoft.drm.elasticsearch.document.impl;

import cn.tcsoft.drm.elasticsearch.document.IndexService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * @author : laimin
 * create at:  2022/4/13  10:34
 * @description: elasticsearch 索引接口实现
 */
@Service
@Slf4j
public class IndexServiceImpl implements IndexService {
    @Resource
    RestHighLevelClient restHighLevelClient;
    @Override
    @SneakyThrows
    public void createIndex(String index, CreateIndexRequest request) {
        log.debug("source:" + request.toString());
        if (!existsIndex(index)) {
            CreateIndexResponse response = restHighLevelClient.indices().create(request, RequestOptions.DEFAULT);
            log.debug("索引创建结果：" + response.isAcknowledged());
        } else {
            log.warn("索引：{}，已经存在，不能再创建。", index);
        }
    }

    @Override
    @SneakyThrows
    public void deleteIndex(String index) {
        if (existsIndex(index)) {
            AcknowledgedResponse response =restHighLevelClient.indices().delete(new DeleteIndexRequest(index),RequestOptions.DEFAULT);
            log.debug("索引删除结果：" + response.isAcknowledged());
        }
    }

    @Override
    @SneakyThrows
    public boolean existsIndex(String index) {
        boolean exists = restHighLevelClient.indices().exists(new GetIndexRequest(index),RequestOptions.DEFAULT);
        log.debug("existsIndex: " + exists);
        return exists;

    }
}