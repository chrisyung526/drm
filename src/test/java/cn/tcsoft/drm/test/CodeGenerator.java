package cn.tcsoft.drm.test;

import cn.tcsoft.drm.test.config.GeneratorConf;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

/**
 * 代码生成器
 * @author bo
 */
@Slf4j
public class CodeGenerator {
    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    public static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        StringBuilder help = new StringBuilder();
        help.append("请输入" + tip + "：");
        System.out.println(help.toString());
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if (Objects.nonNull(ipt)) {
                return ipt;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    /**
     * RUN THIS
     */
    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor(GeneratorConf.author);
        gc.setMapperName(GeneratorConf.mapperName);
        gc.setServiceName(GeneratorConf.serviceName);
        gc.setServiceImplName(GeneratorConf.serviceImplName);
        gc.setXmlName(GeneratorConf.xmlName);
        gc.setOpen(false);
        gc.setEnableCache(false);
        //是否覆盖已生成的文件
        gc.setFileOverride(false);
        //实体属性 Swagger2 注解
        gc.setSwagger2(true);
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(GeneratorConf.url);
        dsc.setDriverName(GeneratorConf.driverName);
        dsc.setUsername(GeneratorConf.username);
        dsc.setPassword(GeneratorConf.password);
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent(GeneratorConf.basePackage)
                .setController(GeneratorConf.controllerPackageName)
                .setMapper(GeneratorConf.mapperPackageName)
                .setXml(GeneratorConf.xmlPackageName)
                .setEntity(GeneratorConf.entityPackageName);
        gc.setFileOverride(true);//覆盖现有的
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                //  TODO  to do nothing
            }
        };


        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        // 自定义配置会被优先输出
        //指定自定义文件输出路径，是需要带上.ftl/.vm, 注意和下面的模板配置做区分
        focList.add(new FileOutConfig(GeneratorConf.xmlTemplatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/resources/mapper/" +
                        "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });

        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();

        templateConfig
                .setEntity(GeneratorConf.entityTemplatePath)
                .setMapper(GeneratorConf.mapperTemplatePath)
                .setService(GeneratorConf.serviceTemplatePath)
                .setServiceImpl(GeneratorConf.serviceImplTemplatePath)
                .setController(GeneratorConf.controllerTemplatePath)
                .setXml(null);
        mpg.setTemplate(templateConfig);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setSuperEntityClass(GeneratorConf.superEntityClass);
        strategy.setEntityLombokModel(true); //使用lombok
        strategy.setEntitySerialVersionUID(true);// 实体类的实现接口Serializable
        strategy.setRestControllerStyle(true);
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setInclude(scanner("表名,多个英文逗号分割").split(StringPool.COMMA));
        strategy.setSuperEntityColumns(GeneratorConf.superEntityColumns);
        strategy.setTablePrefix("biz_mmis_");
        mpg.setStrategy(strategy);

        mpg.setTemplateEngine(new VelocityTemplateEngine());

        //执行
        mpg.execute();
    }


}
