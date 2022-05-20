package cn.tcsoft.drm.test.test.theme;

import cn.tcsoft.drm.entity.Theme;
import cn.tcsoft.drm.model.dto.ThemeQuery;
import cn.tcsoft.drm.service.ThemeService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 主题相关方法测试
 */
@SpringBootTest
public class ThemeTest {

    @Resource
    private ThemeService themeService;

    /**
     * Theme ---> getInfoById 根据主题主键ID 获取对应的主题对象
     */
    @Test
    public void test1(){
        Theme theme = themeService.getInfoById(1526855879264055297L);
        System.out.println(theme.toString());
    }

    /**
     * Theme ---> insertTheme 新增主题对象
     */
    @Test
    public void test2(){
        Theme theme = new Theme();
        theme.setCollectionIds("1,2");
        theme.setName("王五");
        boolean flag = themeService.insertTheme(theme);
        System.out.println(flag);
    }

    /**
     * Theme ---> updateTheme 更新主题对象
     */
    @Test
    public void test3(){
        Theme theme = new Theme();
        theme.setId(1L);
        theme.setName("liu2");
        boolean flag = themeService.updateTheme(theme);
        System.out.println(flag);
    }

    /**
     * Theme ---> delete 删除主题对象
     */
    @Test
    public void test4(){
        boolean flag = themeService.delete(1526855879264055297L);
        System.out.println(flag);
    }

    /**
     * Theme ---> deleteList 删除主题列表对象
     */
    @Test
    public void test5(){
        List<Long> longs = new ArrayList<>();
        longs.add(1526855879264055297L);
        longs.add(1L);
        boolean b = themeService.deleteList(longs);
        System.out.println(b);
    }

    /**
     * Theme ---> page 主题分页
     */
    @Test
    public void test6(){
        ThemeQuery themeQuery = new ThemeQuery();
        themeQuery.setCurrent(1L);
        themeQuery.setSize(3L);
        themeQuery.setSortColumns(Theme.ORDER_BY_THEME_ID);
        themeQuery.setSortDesc(true);
        Page<Theme> themePage = themeService.getThemePage(themeQuery);
        System.out.println(themePage.getTotal());
        System.out.println(themePage.toString());
    }

}
