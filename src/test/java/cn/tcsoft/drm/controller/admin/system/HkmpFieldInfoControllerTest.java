package cn.tcsoft.drm.controller.admin.system;

import cn.tcsoft.drm.entity.admin.system.HkmpFieldInfo;
import cn.tcsoft.drm.model.vo.HkmpFieldInfoQueryVO;
import cn.tcsoft.drm.service.HkmpFieldInfoService;
import cn.tcsoft.drm.test.BaseTest;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.junit.FixMethodOrder;
import org.junit.jupiter.api.Test;
import org.junit.runners.MethodSorters;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class HkmpFieldInfoControllerTest extends BaseTest {

    @Resource
    private HkmpFieldInfoService hkmpfieldinfoService;

    static HkmpFieldInfo hkmpFieldInfo = new HkmpFieldInfo();

    @Test
    public void test1() {
        HkmpFieldInfoQueryVO query = new HkmpFieldInfoQueryVO();
        query.setCurrent(Long.valueOf(1));
        query.setSize(Long.valueOf(10));
        IPage<HkmpFieldInfo> hkmpFieldInfoPage = hkmpfieldinfoService.getHkmpFieldInfoPage(query);
        hkmpFieldInfo = hkmpFieldInfoPage.getRecords().get(0);
    }

    @Test
    public void test2() {
        hkmpFieldInfo = hkmpfieldinfoService.getInfoById(hkmpFieldInfo.getId());
    }

    @Test
    public void test3() {
        hkmpFieldInfo.setId(null);
        hkmpFieldInfo.setFieldName("test");
        hkmpfieldinfoService.insertHkmpFieldInfo(hkmpFieldInfo);
    }

    @Test
    public void test4() {
        hkmpfieldinfoService.delete(hkmpFieldInfo.getId());
    }


    @Test
    public void test5() {
        hkmpFieldInfo.setFieldName("testupdate");
        hkmpfieldinfoService.updateHkmpFieldInfo(hkmpFieldInfo);

    }

    @Test
    public void test6() {
        List<Long> longs = new ArrayList<>();
        longs.add(hkmpFieldInfo.getId());
        hkmpfieldinfoService.deleteList(longs);
    }

}