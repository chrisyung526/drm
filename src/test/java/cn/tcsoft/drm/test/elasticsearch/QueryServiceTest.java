package cn.tcsoft.drm.test.elasticsearch;

import cn.tcsoft.drm.DrmServiceApplication;
import cn.tcsoft.drm.elasticsearch.query.BaseQuery;
import cn.tcsoft.drm.test.BaseTest;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.Operator;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author : laimin
 * create at:  2022/4/13  15:55
 * @description: 查询
 */
@Slf4j
public class QueryServiceTest extends BaseTest {
    private String index = "book-category-index";
    @Resource
    BaseQuery baseQuery;

    @Test
    public void testTerm(){
        List<Map<String, Object>> list = baseQuery.termQuery(index, "bibNo", "NC061611");
        log.debug("term查询数量：" + list.size());
    }

    @Test
    public void testTerms(){
        List<Map<String, Object>> list1 = baseQuery.termsQuery(index, "category", "book","Image");
        System.out.println("terms查询数量：" + list1.size());
        System.out.println(list1);
    }

    @Test
    public void testQueryMatch() throws IOException {
        //关键字精准匹配
        //baseQuery.queryMatch(index,"value","香港");
        //模糊匹配
        //baseQuery.queryMatch(index,"value","香港");
        //词拆分
        //List<Map<String, Object>> list=baseQuery.queryMatchWithOperate(index,"value","香港 演出", Operator.AND);

        //完全的一句话匹配
        //baseQuery.queryMatchPhrase(index,"value","香港 演出");
        //多个字段匹配
        List<Map<String, Object>> list=baseQuery.queryMulitMatch(index,"Book","value","category");
        log.debug(JSON.toJSONString(list));

    }

}