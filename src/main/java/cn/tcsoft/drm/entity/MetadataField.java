package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

    /**
     * <p>
     * Metadata Fields
     * </p>
     *
     * @author ZYS 元数据
     * @since 2022-05-11
     */
    @Data
    @EqualsAndHashCode(callSuper = true)
    @Accessors(chain = true)
    @TableName("biz_mmis_metadata_field")
    @ApiModel(value = "MetadataField对象", description = "Metadata Fields")
    public class MetadataField extends BaseBO {

        private static final long serialVersionUID = 1L;
        @ApiModelProperty(value = "METADATA SCHEMA ID sourcebiz_mmis_metadata_schema")
        private Long metadataSchemaId;

        @ApiModelProperty(value = "ELEMENT")
        private String element;

        @ApiModelProperty(value = "QUALIFIER")
        private String qualifier;

        @ApiModelProperty(value = "SCOPE NOTE")
        private String scopeNote;

        @ApiModelProperty(value = "Metadata Type")
        private String type;

        @ApiModelProperty(value = "Field Length")
        private Integer length;

        @ApiModelProperty(value = "Metadata Effective Scope")
        private String effectiveScope;

        @ApiModelProperty(value = "Content Cover Page Label")
        private String contentCoverPageLabel;

        @ApiModelProperty(value = "Content Cover Page Label(Chinese)")
        private String contentCoverPageLabelChi;

        @ApiModelProperty(value = "Content Cover Page Label(English)")
        private String contentCoverPageLabelEng;

        @ApiModelProperty(value = "Content Highlight Label")
        private String contentHighlightLabel;

        @ApiModelProperty(value = "Content Highlight Label(Chinese)")
        private String contentHighlightLabelChi;

        @ApiModelProperty(value = "Content Highlight Label(English)")
        private String contentHighlightLabelEng;

        @ApiModelProperty(value = "Controlled Field(Y N)")
        private String controlledField;


}