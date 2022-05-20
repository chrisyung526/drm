package cn.tcsoft.drm.xlsx.listener;

import cn.tcsoft.drm.entity.MaintainThesaurus;
import cn.tcsoft.drm.service.MaintainThesaurusService;
import cn.tcsoft.drm.xlsx.model.MaintainThesaurusModel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import ma.glasnost.orika.MapperFacade;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * easyExcel 监听器
 * @author 12094
 */
@Component
@Scope("prototype")
public class MaintainThesaurusModelListener extends AnalysisEventListener<MaintainThesaurusModel> {

    @Resource
    private MaintainThesaurusService maintainThesaurusService;

    @Resource
    private MapperFacade mapperFacade;

    /**
     * 设定每读取到两条数据就往数据库进行持久化操作
     */
    public static final int BATCH_COUNT = 2;

    /**
     * 使用list集合对数据进行缓存操作
     */
    List<MaintainThesaurus> maintainThesaurusList = new ArrayList<>();

    /**
     * 计数器
     */
    private int count = 0;

    /**
     * 每读取一行执行一次invoke操作
     * @param maintainThesaurusModel excel词库模板对象
     * @param analysisContext excel内置
     */
    @Override
    public void invoke(MaintainThesaurusModel maintainThesaurusModel, AnalysisContext analysisContext) {
        /**
         * 使用工具类对数据对象进行转换 --> 复制属性
         * map(maintainThesaurusModel,maintainThesaurus);
         */
        maintainThesaurusList.add(mapperFacade.map(maintainThesaurusModel,MaintainThesaurus.class));

        if (++count % BATCH_COUNT == 0) {
            /**
             * 当集合中存储的数据有两条的时候,对数据进行持久化操作
             */
            maintainThesaurusService.saveModel(maintainThesaurusList);
            /**
             * 清空缓存的数据
             */
            maintainThesaurusList.clear();
        }

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        System.out.println("解析完成....");
    }
}
