package cn.tcsoft.drm.test.test.maintainThesaurus;

import cn.tcsoft.drm.entity.MaintainThesaurus;
import cn.tcsoft.drm.model.dto.MaintainThesaurusQuery;
import cn.tcsoft.drm.service.MaintainThesaurusService;
import cn.tcsoft.drm.service.ThemeService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class MaintainThesaurusTest {

    @Resource
    private MaintainThesaurusService maintainThesaurusService;

    @Resource
    private ThemeService themeService;
    /**
     * MaintainThesaurus ---> getInfoById 获取指定id数据
     */
    @Test
    public void test1(){
        MaintainThesaurus maintainThesaurus = maintainThesaurusService.getInfoById(1524993287289577473L);
        System.out.println(maintainThesaurus.toString());
    }

    /**
     * MaintainThesaurus ---> insertMaintainThesaurus 新增
     */
    @Test
    public void test2(){
        MaintainThesaurus maintainThesaurus = new MaintainThesaurus();
        maintainThesaurus.setSynonyms("张三");
        boolean flag = maintainThesaurusService.insertMaintainThesaurus(maintainThesaurus);
        System.out.println(flag);
    }

    /**
     * MaintainThesaurus ---> updateMaintainThesaurus 修改
     */
    @Test
    public void test3(){
        MaintainThesaurus maintainThesaurus = new MaintainThesaurus();
        maintainThesaurus.setSynonyms("李四");
        maintainThesaurus.setId(1526816768515977218L);
        boolean flag = maintainThesaurusService.updateMaintainThesaurus(maintainThesaurus);
        System.out.println(flag);
    }

    /**
     * MaintainThesaurus ---> delete 删除
     */
    @Test
    public void test4(){
        boolean flag = maintainThesaurusService.delete(1526816768515977218L);
        System.out.println(flag);
    }

    /**
     * MaintainThesaurus ---> deleteList 批量删除
     */
    @Test
    public void test5(){
        List<Long> longs = new ArrayList<>();
        longs.add(1524993287289577473L);
        longs.add(1526816768515977218L);
        boolean flag = maintainThesaurusService.deleteList(longs);
        System.out.println(flag);
    }

    /**
     * MaintainThesaurus ---> getMaintainThesaurusPage 获取分页数据
     */
    @Test
    public void test6(){
        MaintainThesaurusQuery maintainThesaurusQuery = new MaintainThesaurusQuery();
        maintainThesaurusQuery.setCurrent(1L);
        maintainThesaurusQuery.setSize(2L);
        Page<MaintainThesaurus> page = maintainThesaurusService.getMaintainThesaurusPage(maintainThesaurusQuery);
        System.out.println(page.toString());
    }

    /**
     * MaintainThesaurus ---> getMaintainThesaurusPage 批量插入词库数据
     */
    @Test
    public void test7(){
        MaintainThesaurus maintainThesaurus = new MaintainThesaurus();
        maintainThesaurus.setSynonyms("张三");
        MaintainThesaurus maintainThesaurus2 = new MaintainThesaurus();
        maintainThesaurus2.setSynonyms("李四");
        List<MaintainThesaurus> list = new ArrayList<>();
        list.add(maintainThesaurus);
        list.add(maintainThesaurus2);
        maintainThesaurusService.saveModel(list);
    }

}
