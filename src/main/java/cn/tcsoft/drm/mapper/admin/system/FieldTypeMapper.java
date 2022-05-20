package cn.tcsoft.drm.mapper.admin.system;

import cn.tcsoft.drm.entity.admin.system.FieldType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 字段类型;普通文本	Nornal text
密碼文本	Password
多行文本	Multi-Line text	
是非框		Yes No button
單選鈕		Radio button
多選鈕		Checkbox
下拉列表	Pulldown menu
可輸入下拉列表	Input pulldown menu
可輸入提示列表	Input select menu
日期		Date
分類法		Classification
簡易編輯器	Simple editor
複雜編輯器	Complex editor
附件		Attachment
相關文檔	File
自定義類型	User-define field
視頻		Video Mapper 接口
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-06
 */
public interface FieldTypeMapper extends BaseMapper<FieldType> {

}
