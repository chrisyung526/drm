package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import cn.tcsoft.drm.entity.bo.BaseBO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author ZYS 2022-05-06 词库对象
 * @since 2022-05-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_maintain_thesaurus")
@ApiModel(value="MaintainThesaurus对象", description="词库对象")
public class MaintainThesaurus extends BaseBO {

    /**
     * 自定义字段
     */
    public static final String ORDER_BY_SYNONYMS = "Synonyms";
    public static final String ORDER_BY_CREATE_BY = "CreateBy";
    public static final String ORDER_BY_CREATE_DATE = "CreateDate";
    public static final String ORDER_BY_LAST_UPDATE_BY = "LastUpdatedBy";
    public static final String ORDER_BY_LAST_UPDATED_DATE = "LastUpdatedDate";

    private static final long serialVersionUID=1L;
    @ApiModelProperty(value = "同义词")
        private String synonyms;

}