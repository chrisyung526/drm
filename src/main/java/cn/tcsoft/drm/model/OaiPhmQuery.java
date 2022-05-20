package cn.tcsoft.drm.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author : laimin
 * create at:  2022/5/17  17:43
 * @description: OaiPmh接口搜索条件
 */
@Data
public class OaiPhmQuery implements Serializable {
    @ApiModelProperty(value = "指定调用方法",example = "GetRecord|identify|ListIdentifiers|ListMetadataFormats|ListRecords|ListSets",required = true)
    String verb;
    String identifier;
    @ApiModelProperty(value = "指定metadata的返回格式",example = "oai_dc",required = false)
    String metadataPrefix;
    @ApiModelProperty(value = "指定日期(datestamp)的下限。以YYYY, YYYY-MM, YYYY-MM-DD形式指定",example = "2016-10-01",required = false)
    String from;
    @ApiModelProperty(value = "指定日期(datestamp)的上限。\n" +
            "以YYYY, YYYY-MM, YYYY-MM-DD形式指定。\n" +
            "※不指定until的情况，退还期间是从from365日",example = "2016-10-01",required = false)
    String until;
    String set;
    @ApiModelProperty(value = "如果1要求的退还metadata件数超过作为取得上限数的200件，取得第201件以后的metadata指定。全部要取得metadata，每200事需要指定resumptionToken。\n" +
            "指定的resumptionToken的参数价值，是每200事的metadata的最后被表示的resumptionToken标签的价值",example = "2016-10-01",required = false)
    String resumptionToken;
}