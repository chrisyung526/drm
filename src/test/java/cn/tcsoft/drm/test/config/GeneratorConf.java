package cn.tcsoft.drm.test.config;

/**
 * @author : laimin
 * create at:  2022/3/29  13:58
 * @description: 代码生成配置
 */
public class GeneratorConf {
    /**
     * 全局配置
     */
    public static String author = "CodeGenerator";
    public static String mapperName = "%sMapper";
    public static String serviceName = "%sService";
    public static String serviceImplName = "%sServiceImpl";
    public static String xmlName = "%sMapper";


    /**
     * 数据源配置 mysql
     */
    public static String url = "jdbc:mysql://10.10.6.118:13306/tcc_drm_dev?useUnicode=true&useSSL=false&characterEncoding=utf8&serverTimezone=GMT%2B8";
    public static String driverName = "com.mysql.cj.jdbc.Driver";
    public static String username = "tcc-ofa-dev";
    public static String password = "sjexn*ox";

    /**
     * 包配置
     */
    public static String basePackage = "cn.tcsoft.drm";
    public static String controllerPackageName = "controller";
    public static String mapperPackageName = "mapper";
    public static String xmlPackageName = "mapper";
    public static String entityPackageName = "entity";
    public static String superEntityClass="cn.tcsoft.drm.entity.bo.BaseBO";
    public static String[] superEntityColumns = {"id","org_id","org_name","create_dt","last_upd_dt","create_by","is_delete","last_upd_by"};

    /**
     * 配置模板
     */
    public static String controllerTemplatePath = "/template/controller.java";
    public static String serviceTemplatePath = "/template/service.java";
    public static String serviceImplTemplatePath = "/template/serviceImpl.java";
    public static String mapperTemplatePath = "/template/mapper.java";
    public static String xmlTemplatePath = "/template/mapper.xml.vm";
    public static String entityTemplatePath = "/template/entity.java";


}