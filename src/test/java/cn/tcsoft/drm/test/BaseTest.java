package cn.tcsoft.drm.test;

import cn.tcsoft.drm.DrmServiceApplication;
import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.util.UserInfoHolder;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author : laimin
 * create at:  2022/5/13  11:58
 * @description: 基类测试类
 */
@RunWith(SpringRunner.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@SpringBootTest(classes = DrmServiceApplication.class,webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class BaseTest {
    @Before
    public void init(){
        UserInfoDto userInfoDto=new UserInfoDto();
        userInfoDto.setOrgId(1001L);
        userInfoDto.setOrgName("香港记忆");
        userInfoDto.setUserName("Test");
        UserInfoHolder.set(userInfoDto);
    }

    @Test
    public void testCase(){

    }
}