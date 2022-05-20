package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 词库列表高级查询
 * @author ZYS 2022-05-07 词库条件查询
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value = "词库高级查询对象",description = "用于对数据进行条件查询")
public class MaintainThesaurusQuery extends QueryPageDO {

    /**
     * 关键字
     */
    @ApiModelProperty(value = "关键字")
    private String Keyword;

    /**
     * 词库数据创建人
     */
    @ApiModelProperty(value = "创建人")
    private String creator;

    /**
     * 词库数据创建的时间范围
     */
    @ApiModelProperty(value = "创建的开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginCreateDate;

    @ApiModelProperty(value = "创建的结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endCreateDate;

    /**
     * 修改词库数据的修改人
     */
    @ApiModelProperty(value = "最后的创建人")
    private String lastCreator;

    /**
     * 词库最后修改的时间
     */
    @ApiModelProperty(value = "最后的创建的开始时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginLastCreateDate;

    @ApiModelProperty(value = "最后的创建的结束时间(数据更新后)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endLastCreateDate;


}
