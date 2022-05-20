package cn.tcsoft.drm.controller.admin;

import cn.tcsoft.drm.DrmServiceApplication;
import cn.tcsoft.drm.entity.ControlledMisc;
import cn.tcsoft.drm.model.vo.ControlledMiscVO;
import cn.tcsoft.drm.service.ControlledMiscService;
import cn.tcsoft.drm.test.BaseTest;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class ControlledMiscControllerTest extends BaseTest {
    @Resource
    private ControlledMiscService controlledmiscService;
    static ControlledMisc controlledMisc;
    static ControlledMisc controlledMisc1;
    static ControlledMisc controlledMisc2;
    static ControlledMisc controlledMisc3;

    @Test()
    @DisplayName("init")
    public void test1() {
        controlledMisc = new ControlledMisc();
        controlledMisc.setDbStatus("0");
        controlledMisc.setAuthType("Controlled Miscellaneous");
        controlledMisc.setAttrType("Category.Category");
        controlledMisc.setValue("Value");
        controlledMisc.setEngDescrip("EngDescrip");
        controlledMisc.setChiDescrip("ChiDescrip");
        controlledMisc.setActive("0");
        controlledMisc.setTemporaryInd("1");
        controlledMisc.setUrl("Url");
        controlledMisc.setValueChi("ValueChi");
        controlledMisc.setDuplicateMetadata("0");
        controlledMisc.setShare("Digital Collection Only");
        controlledMisc.setBibIds(Lists.newArrayList());
        controlledMisc.setOrgId(0L);
        controlledMisc.setOrgName("OrgName");
        controlledMisc.setCreateBy("test");
        //ArrayList<ControlledMisc> controlledMiscs = new ArrayList<>();
        //controlledMisc1=controlledMisc;
        //controlledMisc1.setId(null);
        //controlledMisc1.setEngDescrip("test");
        //controlledMiscs.add(controlledMisc1);
        //controlledMisc.setMargeList(controlledMiscs);

        controlledMisc1 = new ControlledMisc();
        controlledMisc1.setDbStatus("0");
        controlledMisc1.setAuthType("Controlled Miscellaneous");
        controlledMisc1.setAttrType("Category.Category");
        controlledMisc1.setValue("Value");
        controlledMisc1.setEngDescrip("EngDescrip1");
        controlledMisc1.setChiDescrip("ChiDescrip1");
        controlledMisc1.setActive("0");
        controlledMisc1.setTemporaryInd("1");
        controlledMisc1.setUrl("Url");
        controlledMisc1.setValueChi("ValueChi");
        controlledMisc1.setDuplicateMetadata("0");
        controlledMisc1.setShare("Digital Collection Only");
        controlledMisc1.setBibIds(Lists.newArrayList());
        controlledMisc1.setOrgId(0L);
        controlledMisc1.setOrgName("OrgName");
        controlledMisc1.setCreateBy("test");

        controlledMisc2 = new ControlledMisc();
        controlledMisc2.setDbStatus("0");
        controlledMisc2.setAuthType("Controlled Miscellaneous");
        controlledMisc2.setAttrType("Category.Category");
        controlledMisc2.setValue("Value");
        controlledMisc2.setEngDescrip("EngDescrip2");
        controlledMisc2.setChiDescrip("ChiDescrip2");
        controlledMisc2.setActive("0");
        controlledMisc2.setTemporaryInd("1");
        controlledMisc2.setUrl("Url");
        controlledMisc2.setValueChi("ValueChi");
        controlledMisc2.setDuplicateMetadata("0");
        controlledMisc2.setShare("Digital Collection Only");
        controlledMisc2.setBibIds(Lists.newArrayList());
        controlledMisc2.setOrgId(0L);
        controlledMisc2.setOrgName("OrgName");
        controlledMisc2.setCreateBy("test");

        controlledmiscService.insertControlledMisc(controlledMisc);
        controlledmiscService.insertControlledMisc(controlledMisc1);
        controlledmiscService.insertControlledMisc(controlledMisc2);
    }


    @Test
    @DisplayName("queryControlledMiscList")
    public void test2() {
        ControlledMiscVO query = new ControlledMiscVO();
        query.setCurrent(1L);
        query.setSize(10L);
        Page<ControlledMisc> controlledMiscPage = controlledmiscService.getControlledMiscPage(query);
        System.out.println(controlledMiscPage);
    }

    @Test
    @DisplayName("getControlledMiscInfoById")
    public void test3() {
        ControlledMisc infoById = controlledmiscService.getInfoById(controlledMisc.getId());
        log.info(infoById.toString());
    }

    @Test
    @DisplayName("insertControlledMisc")
    public void test4() {
        controlledMisc3 = new ControlledMisc();
        controlledMisc3.setDbStatus("0");
        controlledMisc3.setAuthType("Controlled Miscellaneous");
        controlledMisc3.setAttrType("Category.Category");
        controlledMisc3.setValue("Value");
        controlledMisc3.setEngDescrip("EngDescrip3");
        controlledMisc3.setChiDescrip("ChiDescrip3");
        controlledMisc3.setActive("0");
        controlledMisc3.setTemporaryInd("1");
        controlledMisc3.setUrl("Url");
        controlledMisc3.setValueChi("ValueChi");
        controlledMisc3.setDuplicateMetadata("0");
        controlledMisc3.setShare("Digital Collection Only");
        controlledMisc3.setBibIds(Lists.newArrayList());
        controlledMisc3.setOrgId(0L);
        controlledMisc3.setOrgName("OrgName");
        controlledMisc3.setCreateBy("test");
        controlledmiscService.insertControlledMisc(controlledMisc3);
    }

    @Test
    @DisplayName("updateControlledMisc")
    public void test6() {
        controlledmiscService.updateControlledMisc(controlledMisc);
    }


    @Test
    @DisplayName("delete")
    public void test7() {
        controlledmiscService.delete(controlledMisc2.getId());
        controlledmiscService.delete(controlledMisc3.getId());
    }

    @After
    @Test
    @DisplayName("batchDelete")
    public void test99() {

        //controlledmiscService.delete(controlledMisc.getId());
        //controlledmiscService.delete(controlledMisc1.getId());
    }

    @Test
    @DisplayName("mergeControlledMisc")
    public void test5() {
        List<ControlledMisc> controlledMiscs = new ArrayList<>();
        controlledMiscs.add(controlledMisc1);
        controlledMiscs.add(controlledMisc2);
        controlledMiscs.add(controlledMisc);
        controlledMisc.setMargeList(controlledMiscs);
        controlledmiscService.mergeControlledMisc(controlledMisc);
    }
}