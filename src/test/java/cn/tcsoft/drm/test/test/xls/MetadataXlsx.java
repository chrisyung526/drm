//package cn.tcsoft.drm.test.test.xls;
//
//import cn.tcsoft.drm.DrmServiceApplication;
//import cn.tcsoft.drm.model.dto.UserInfoDto;
//import cn.tcsoft.drm.service.HkmpMetadataService;
//import cn.tcsoft.drm.service.MmisMetadataService;
//import cn.tcsoft.drm.util.UserInfoHolder;
//import cn.tcsoft.drm.xls.HkmpXlsListener;
//import cn.tcsoft.drm.xls.MmisXlsListener;
//import cn.tcsoft.drm.xls.model.HkmpDataModel;
//import cn.tcsoft.drm.xls.model.MmisDataModel;
//import com.alibaba.excel.EasyExcel;
//import com.alibaba.fastjson.JSONObject;
//import lombok.extern.slf4j.Slf4j;
//import ma.glasnost.orika.MapperFacade;
//import org.junit.Before;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.MethodSorters;
//import org.redisson.api.RedissonClient;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import javax.annotation.Resource;
//import java.util.List;
//import java.util.Map;
//
///**
// * @author : hyman
// * create at:  2021/12/21  14:00
// * @description:
// */
//
//@Slf4j
//@RunWith(SpringRunner.class)
//@FixMethodOrder(MethodSorters.JVM)
//@SpringBootTest(classes = DrmServiceApplication.class,webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
//public class MetadataXlsx {
//    @Resource
//    MmisMetadataService mmisMetadataService;
//    @Resource
//    MapperFacade mapperFacade;
//    @Resource
//    HkmpMetadataService hkmpMetadataService;
//    @Resource
//    RedissonClient redissonClient;
//
//
///**
//     * mmis 测试数据导入到数据库
//     */
//
//    @Test
//    public void toMmidDb(){
//        String fileName ="/Users/hyman/Desktop/图书馆/MMIS.xlsx";
//        EasyExcel.read(fileName, MmisDataModel.class, new MmisXlsListener(mmisMetadataService,mapperFacade)).doReadAll();
//    }
//
//    @Before
//    public void init(){
//        UserInfoDto userInfoDto=new UserInfoDto();
//        userInfoDto.setOrgId(1001L);
//        userInfoDto.setOrgName("香港记忆");
//        userInfoDto.setUserName("张三");
//        UserInfoHolder.set(userInfoDto);
//    }
//
//   /**
//     * hkmp 测试数据导入到数据库
//     */
//
//    @Test
//    public void toHkmpDb(){
//        String fileName ="/Users/hyman/Desktop/文档/HKMP.xlsx";
//        EasyExcel.read(fileName, HkmpDataModel.class, new HkmpXlsListener(hkmpMetadataService,mapperFacade)).sheet(0).doRead();
//    }
//
//
//
//    public static void main(String[] args) {
//        String fileName ="/Users/hyman/Desktop/HKMP.xlsx";
//        // 读取全部sheet
//        List<Map<Object,Object>> list=EasyExcel.read(fileName).sheet(0).doReadSync();
//        list.forEach(po->{
//            log.info(JSONObject.toJSONString(po));
//        });
////        log.info("备注："+JSONObject.toJSONString(list.get(0)));
////        StringBuilder sb=new StringBuilder("create table hkmp(");
////        list.get(0).forEach((k,v)->{
////            log.info(""+k);
////            log.info(""+v);
////            sb.append(v).append(" ").append("VARCHAR(1000)").append(" DEFAULT NULL COMMENT ''").append("").append(",\r\n");
////        });
////        sb.append(");");
////        log.info(sb.toString());
////        StringBuilder sb=new StringBuilder("create table hkmp(id bitint(64),");
////        list.forEach(po->{
////            if(po.size()>=2) {
////                //log.warn(JSONObject.toJSONString(po));
////                sb.append(po.get(1)).append(" ").append("VARCHAR(1000)").append(" DEFAULT NULL COMMENT '"+po.get(0)+"'").append("").append(",\r\n");
////            }
////        });
////        sb.append(");");
////        log.info(sb.toString());
//        //log.info(JSONObject.toJSONString(list.get(1)));
//
//
//    }
//}
