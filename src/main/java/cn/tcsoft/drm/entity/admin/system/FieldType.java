package cn.tcsoft.drm.entity.admin.system;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * 字段类型;普通文本	Nornal text
 * 密碼文本	Password
 * 多行文本	Multi-Line text
 * 是非框		Yes No button
 * 單選鈕		Radio button
 * 多選鈕		Checkbox
 * 下拉列表	Pulldown menu
 * 可輸入下拉列表	Input pulldown menu
 * 可輸入提示列表	Input select menu
 * 日期		Date
 * 分類法		Classification
 * 簡易編輯器	Simple editor
 * 複雜編輯器	Complex editor
 * 附件		Attachment
 * 相關文檔	File
 * 自定義類型	User-define field
 * 視頻		Video
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_hkmp_field_type")
@ApiModel(value = "FieldType对象", description = "字段类型")
public class FieldType extends BaseBO {

    private static final long serialVersionUID = 1L;
    private String nameEn;

    private String nameCn;

}