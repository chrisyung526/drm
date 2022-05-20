package cn.tcsoft.drm.elasticsearch.query;

import org.elasticsearch.index.query.Operator;


import java.util.List;
import java.util.Map;

public interface BaseQuery {
    List<Map<String, Object>> termQuery(String index, String fieldName, String fieldValue);
    List<Map<String,Object>> termsQuery(String index, String fieldName, String... fieldValues);
    List<Map<String,Object>> queryAll(String index);
    List<Map<String,Object>> queryMatch(String index,  String field,String keyWord) ;
    List<Map<String,Object>> queryMatchWithOperate(String index,  String field, String keyWord, Operator op);
    List<Map<String,Object>> queryMulitMatch(String index, String keyWord,String ...fieldNames);
    List<Map<String,Object>> queryMatchPhrase(String index, String fieldName,String keyWord) ;
    List<Map<String,Object>> queryMatchPrefixQuery(String index, String fieldName,String keyWord);
    List<Map<String,Object>> idsQuery(String index, String ... ids) ;
    List<Map<String,Object>> prefixQuery(String index,  String field, String prefix) ;
    List<Map<String,Object>> fuzzyQuery(String index, String field,String value) ;
    List<Map<String,Object>> wildCardQuery(String index,  String fieldName, String wildcard);
    List<Map<String,Object>> rangeQuery(String index,  String fieldName, int from,int to) ;
    List<Map<String,Object>> regexpQuery(String index,  String fieldName, String regexp);
    List<Map<String,Object>> moreLikeThisQuery(String index,  String[] fieldNames, String[] likeTexts);
    void scrollQuery(String index) ;
}
