package cn.tcsoft.drm.elasticsearch.document;


import org.elasticsearch.client.indices.CreateIndexRequest;

/**
 * @author : laimin
 * create at:  2022/4/13  10:31
 * @description: elasticsearch 索引接口
 */
public interface IndexService {
    /**
     *  创建索引
     * @param index       索引名称
     * @param request     创建索引的REQUEST
     */
    void createIndex(String index, CreateIndexRequest request);

    /**
     * 删除索引
     * @param index 索引名称
     */
    void deleteIndex(String index);

    /**
     * 判断索引是否存在
     * @param index 索引名称
     */
    boolean existsIndex(String index);
}