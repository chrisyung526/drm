package cn.tcsoft.drm.model.vo;

import cn.tcsoft.drm.model.QueryPageDO;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author
 * @version 1.0
 * @description
 * @updateRemark
 * @updateUser
 * @createDate 2022/5/6 11:00
 * @updateDate 2022/5/6 11:00
 **/
@Data
public class ViewQueryVO extends QueryPageDO {
    private String keyword;
    @ApiModelProperty(value = "视图英文名称;VIEWNAME")
    private String viewEName;
    @ApiModelProperty(value = "视图中文名称;VIEWDESC")
    private String viewCnName;
    private String createBy;
    @JsonFormat(pattern = "MM/dd/yyyy HH:mm:ss",timezone = "GMT+8")
    private Date createDt;
}
