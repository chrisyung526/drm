package cn.tcsoft.drm.xlsx.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.*;

/**
 * 词库Excel模板对象
 * @author ZYS
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@ApiModel(value="MaintainThesaurus Excel模板对象", description="")
public class MaintainThesaurusModel {

    @ApiModelProperty(value = "同义词")
    private String synonyms;

    @ApiModelProperty(value = "创建用户")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createDt;

    @ApiModelProperty(value = "更新用户")
    private String lastUpdBy;

    @ApiModelProperty(value = "更新时间")
    private Date lastUpdDt;

    /**
     * 循环生成模板对象 ---> 文件模板数据初始化
     * @return 上传词库的模板数据
     */
    public static List<MaintainThesaurusModel> initData() {
        List<MaintainThesaurusModel> maintainThesaurusModels = new ArrayList<>();
        for (int i = 0; i < 2; i++) {

            MaintainThesaurusModel data = new MaintainThesaurusModel();
            data.setSynonyms("同义词" + i);
            maintainThesaurusModels.add(data);
        }
        return maintainThesaurusModels;
    }

    /**
     * 用于设置在Excel导出的字段
     * @return field字段set集合
     */
    public static Set<String> setField(){
        Set<String> field = new HashSet<>();
        field.add("createBy");
        field.add("createDt");
        field.add("lastUpdBy");
        field.add("lastUpdDt");
        return field;
    }

}
