package cn.tcsoft.drm.elasticsearch.query.impl;

import cn.tcsoft.drm.elasticsearch.query.BaseQuery;

import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.search.*;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.core.TimeValue;
import org.elasticsearch.index.query.Operator;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.Scroll;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static org.elasticsearch.index.query.QueryBuilders.matchAllQuery;

/**
 * @author : laimin
 * create at:  2022/4/13  13:48
 * @description: elasticsearch 查询相关接口实现
 */
@Service("baseQuery")
@Slf4j
public class BaseQueryImpl implements BaseQuery {
    
    @Resource
    private RestHighLevelClient restHighLevelClient;


    /**
     * 高亮显示配置
     * @return
     */
    private HighlightBuilder highlightBuilder(){
        HighlightBuilder highlightBuilder = new HighlightBuilder();

        HighlightBuilder.Field field = new HighlightBuilder.Field("value");
        highlightBuilder.field(field);
        field = new HighlightBuilder.Field("category");
        highlightBuilder.field(field);

        highlightBuilder.preTags("<font color=\"#FF0000\">").postTags("</font>");
        return highlightBuilder;
    }

    /**
     * 查询某个字段里含有某个关键词的文档
     * @param index   索引名
     * @param fieldName   字段名称
     * @param fieldValue  字段值
     * @return 返回结果列表

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> termQuery(String index, String fieldName, String fieldValue){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(QueryBuilders.termQuery(fieldName, fieldValue));
        //分页
        sourceBuilder.from(0);
        sourceBuilder.size(10);
        searchRequest.source(sourceBuilder);
        log.info("source:" + searchRequest.toString());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 查询某个字段里含有多个关键词的文档
     * @param index   索引名
     * @param fieldName   字段名称
     * @param fieldValues  字段值
     * @return 返回结果列表

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> termsQuery(String index,  String fieldName, String... fieldValues){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(QueryBuilders.termsQuery(fieldName,fieldValues));
        sourceBuilder.from(0);
        sourceBuilder.size(10);
        searchRequest.source(sourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 查询所有文档
     * @param index   索引名称
     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryAll(String index){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(matchAllQuery());
        searchSourceBuilder.from(0);
        searchSourceBuilder.size(20);
        searchRequest.source(searchSourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * match 搜索
     * @param index 索引名称
     * @param field     字段
     * @param keyWord   搜索关键词

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryMatch(String index,  String field,String keyWord){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchQuery(field,keyWord));

        searchRequest.source(searchSourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 布尔match查询
     * @param index    索引名称
     * @param field        字段名称
     * @param keyWord      关键词
     * @param op           该参数取值为or 或 and
     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryMatchWithOperate(String index,  String field,String keyWord,Operator op){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.highlighter(highlightBuilder());
        searchSourceBuilder.query(QueryBuilders.matchQuery(field,keyWord).operator(op));
        searchRequest.source(searchSourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     *该查询通过字段fields参数作用在多个字段上。
     * @param index  索引名称
     * @param keyWord    关键字
     * @param fieldNames  字段

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryMulitMatch(String index, String keyWord,String ...fieldNames){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.highlighter(highlightBuilder());
        searchSourceBuilder.query(QueryBuilders.multiMatchQuery(keyWord,fieldNames));
        searchRequest.source(searchSourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 对查询词语分析后构建一个短语查询
     * @param index    索引名称
     * @param fieldName    字段名称
     * @param keyWord      关键字

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryMatchPhrase(String index, String fieldName,String keyWord){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.highlighter(highlightBuilder());
        searchSourceBuilder.query(QueryBuilders.matchPhraseQuery(fieldName,keyWord));
        searchRequest.source(searchSourceBuilder);
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    @Override
    @SneakyThrows
    public List<Map<String,Object>> queryMatchPrefixQuery(String index, String fieldName,String keyWord){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchPhrasePrefixQuery(fieldName,keyWord).maxExpansions(1));
        searchRequest.source(searchSourceBuilder);
        log.info("source:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 查出指定_id的文档
     * @param index   索引名称
     * @param ids         _id值

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> idsQuery(String index, String ... ids){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.idsQuery().addIds(ids));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 查找某字段以某个前缀开头的文档
     * @param index 索引名称
     * @param field     字段
     * @param prefix    前缀

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> prefixQuery(String index,  String field, String prefix){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.prefixQuery(field,prefix));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 查找某字段以某个前缀开头的文档
     * @param index 索引名称
     * @param field     字段
     * @param value     查询关键字

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> fuzzyQuery(String index, String field,String value){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.fuzzyQuery(field,value).prefixLength(2));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 以通配符来查询
     * @param index     索引名称
     * @param fieldName     字段名称
     * @param wildcard      通配符
     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> wildCardQuery(String index,  String fieldName, String wildcard){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.wildcardQuery(fieldName, wildcard));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     * 范围查询
     * @param index     索引名称
     * @param fieldName     字段名称
     * @param from
     * @param to
     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> rangeQuery(String index,  String fieldName, int from,int to){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.rangeQuery(fieldName).from(from).to(to));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    /**
     *正则表达示查询
     * @param index     索引名称
     * @param fieldName     字段名称
     * @param regexp        正则表达示

     */
    @Override
    @SneakyThrows
    public List<Map<String,Object>> regexpQuery(String index, String fieldName, String regexp){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.regexpQuery(fieldName,regexp));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        return getResponse(searchResponse);
    }

    @Override
    @SneakyThrows
    public List<Map<String,Object>> moreLikeThisQuery(String index,  String[] fieldNames, String[] likeTexts){
        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.moreLikeThisQuery(likeTexts).minTermFreq(1));
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse =  restHighLevelClient.search(searchRequest,RequestOptions.DEFAULT);
        
        return getResponse(searchResponse);
    }

    @Override
    @SneakyThrows
    public void scrollQuery(String index){
        SearchRequest searchRequest = new SearchRequest(index);
        //初始化scroll
        //值不需要足够长来处理所有数据—它只需要足够长来处理前一批结果。每个滚动请求(带有滚动参数)设置一个新的过期时间。
        final Scroll scroll = new Scroll(TimeValue.timeValueMinutes(1L)); //设定滚动时间间隔
        searchRequest.scroll(scroll);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(matchAllQuery());
        searchSourceBuilder.size(5); //设定每次返回多少条数据
        searchRequest.source(searchSourceBuilder);
        log.info("string:" + searchRequest.source());
        SearchResponse searchResponse = null;
        try {
            searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String scrollId = searchResponse.getScrollId();
        SearchHit[] searchHits = searchResponse.getHits().getHits();
        for (SearchHit searchHit : searchHits) {
            log.debug(searchHit.getSourceAsString());
        }
        //遍历搜索命中的数据，直到没有数据
        while (searchHits != null && searchHits.length > 0) {
            SearchScrollRequest scrollRequest = new SearchScrollRequest(scrollId);
            scrollRequest.scroll(scroll);
            log.info("string:" + scrollRequest.toString());
            try {
                searchResponse = restHighLevelClient.scroll(scrollRequest, RequestOptions.DEFAULT);
            } catch (IOException e) {
                e.printStackTrace();
            }
            scrollId = searchResponse.getScrollId();
            searchHits = searchResponse.getHits().getHits();
            if (searchHits != null && searchHits.length > 0) {
                log.debug("-----下一页-----");
                for (SearchHit searchHit : searchHits) {
                    log.debug(searchHit.getSourceAsString());
                }
            }

        }
        //清除滚屏
        ClearScrollRequest clearScrollRequest = new ClearScrollRequest();
        clearScrollRequest.addScrollId(scrollId);//也可以选择setScrollIds()将多个scrollId一起使用
        ClearScrollResponse clearScrollResponse = null;
        try {
            clearScrollResponse = restHighLevelClient.clearScroll(clearScrollRequest,RequestOptions.DEFAULT);
        } catch (IOException e) {
            e.printStackTrace();
        }
        boolean succeeded = clearScrollResponse.isSucceeded();
        log.debug("succeeded:" + succeeded);
    }
    
    private List<Map<String,Object>> getResponse(SearchResponse searchResponse){
        List<Map<String,Object>> response=new ArrayList<>();
        SearchHits hits = searchResponse.getHits();
        log.debug("count:"+hits.getTotalHits().value);
        SearchHit[] h =  hits.getHits();
        if(Objects.nonNull(h) && h.length>0) {
            for (SearchHit hit : h) {
                Map<String,Object> sourceAsMap=hit.getSourceAsMap();
                Map<String, HighlightField> highlightFieldMap = hit.getHighlightFields();
                if(highlightFieldMap!=null && !highlightFieldMap.isEmpty()) {
                    highlightFieldMap.forEach((k,v)->{
                        HighlightField highlightField = highlightFieldMap.get(k);
                        if (Objects.nonNull(highlightField)) {
                            String fieldText = "";
                            Text[] fragments = highlightField.fragments();
                            for (Text text : fragments) {
                                fieldText += text;
                            }
                            sourceAsMap.put(k, fieldText);
                        }
                    });

                }

                response.add(sourceAsMap);
            }
        }
        return response;
    }
}
