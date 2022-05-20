package cn.tcsoft.drm.elasticsearch.document;

import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.update.UpdateResponse;

import java.util.Map;

/**
 * @author : laimin
 * create at:  2022/4/13  10:31
 * @description: elasticsearch 文本操作(新增 修改 删除)
 */
public interface DocService {
    /**
     * 新增数据
     * @param index 索引名称
     * @param json json数据
     */
    void add(String index,String json);

    /**
     * 新增数据指定id
     * @param index 索引名称
     * @param json json数据
     * @param id id主键唯一
     */
    void add(String index,String json,String id);

    /**
     * 批量新增
     * @param index 索引名称
     * @param builder
     * @return
     */
    BulkResponse bulkUpdateOrInsertDoc(String index,  BulkRequest builder);

    /**
     * 删除数据指定id
     * @param index 索引名称
     * @param docId id主键唯一
     */
    void deleteDocWithId(String index,  String docId);

    /**
     * 删除数据指定多个id
     * @param index 索引名称
     * @param docIdArr 多个id主键唯一
     */
    void bulkDeleteDoc(String index,  String[] docIdArr);

    /**
     * 刷新
     * @param index 索引名称
     */
    void refresh(String index);

    /**
     * 统计数量
     * @param index 索引名称
     */
    long countDoc(String index);

    /**
     * 更新数据
     * @param index 索引名称
     * @param map 更新内容
     * @param id 主键
     * @return
     */
    UpdateResponse update(String index,  Map<String, Object> map, String id);

    /**
     * 删除
     * @param index 索引名称
     * @param fieldName 字段名称
     * @param fieldValue 字段值
     */
    void deleteByQuery(String index, String fieldName,String fieldValue);
}
