package cn.tcsoft.drm.controller.admin.system;

import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.model.vo.ViewQueryVO;
import cn.tcsoft.drm.service.admin.system.ViewFieldinfoRefService;
import cn.tcsoft.drm.service.admin.system.ViewService;
import cn.tcsoft.drm.test.BaseTest;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;

import javax.annotation.Resource;

public class ViewControllerTest extends BaseTest {
    @Resource
    private ViewService viewService;

    @Resource
    private ViewFieldinfoRefService viewFieldinfoRefService;
    static View view;

    @Test
    public void test1() {
        ViewQueryVO viewQueryVO = new ViewQueryVO();
        viewQueryVO.setCurrent(Long.valueOf(1));
        viewQueryVO.setSize(Long.valueOf(10));
        Page<View> viewPage = viewService.getViewPage(viewQueryVO);
        view = viewPage.getRecords().get(0);
    }

    @Test
    public void test2() {
        viewService.getInfoById(view.getId());
    }


    @Test
    public void test3() {
        viewService.insertView(view);
    }

    @Test
    public void test4() {
        view.setViewCnName(view.getViewCnName()+"test");
        viewService.updateView(view);
    }

    @Test
    public void test5() {
        viewService.delete(view.getId());
    }

}