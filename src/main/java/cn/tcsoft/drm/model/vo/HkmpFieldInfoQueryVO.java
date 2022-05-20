package cn.tcsoft.drm.model.vo;

import cn.tcsoft.drm.model.QueryPageDO;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

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
public class HkmpFieldInfoQueryVO extends QueryPageDO {
    @ApiModelProperty(value = "模糊查询关键字")
    private String keyword;
    @ApiModelProperty(value = "字段名称;FIELDNAME")
    private String fieldName;

    @ApiModelProperty(value = "字段别名;ANOTHERNAME")
    private String fieldAnotherName;

    @ApiModelProperty(value = "创建人")
    private String createBy;
    @JsonFormat(pattern = "MM/dd/yyyy HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    @ApiModelProperty(value = "创建时间")
    private Date createDt;

    @ApiModelProperty(value = "字段类型id;FIELDTYPE")
    private String fieldTypeId;

}
