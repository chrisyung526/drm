package cn.tcsoft.drm.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import cn.tcsoft.drm.entity.bo.BaseBO;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.elasticsearch.common.text.Text;
import org.springframework.util.StringUtils;

/**
 * <p>
 * Theme
 * </p>
 *
 * @author ZYS 主题管理
 * @since 2022-05-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("biz_mmis_theme")
@ApiModel(value = "Theme对象", description = "Theme主题实体类")
public class Theme extends BaseBO {

    /**
     * 自定义字段
     */
    public static final String ORDER_BY_THEME_ID = "ThemeID";
    public static final String ORDER_BY_NAME_ENG = "Name(English)";
    public static final String ORDER_BY_NAME_CHI = "Name(Chinese)";
    public static final String ORDER_BY_DESCRIPTION_ENG = "Description(English)";
    public static final String ORDER_BY_DESCRIPTION_CHI = "Description(Chinese)";
    public static final String ORDER_BY_CREATE_BY = "CreateBy";
    public static final String ORDER_BY_CREATE_DATE = "CreateDate";
    public static final String ORDER_BY_LAST_UPDATE_BY = "LastUpdatedBy";
    public static final String ORDER_BY_LAST_UPDATED_DATE = "LastUpdatedDate";

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "Theme ID")
    private String themeId;

    @ApiModelProperty(value = "Name")
    private String name;

    @ApiModelProperty(value = "Name (Chinese)")
    private String chiName;

    @ApiModelProperty(value = "Name (English)")
    private String engName;

    @ApiModelProperty(value = "Description ")
    private String description;

    @ApiModelProperty(value = "Description (Chinese)")
    private String chiDescription;

    @ApiModelProperty(value = "Description (English)")
    private String engDescription;

    @ApiModelProperty(value = "WallpaperFilename")
    private String wallpaperFilename;

    @ApiModelProperty(value = "Wallpaper")
    private String wallpaper;

    @ApiModelProperty(value = "status")
    private String status;

    @ApiModelProperty(value = "collectionIds")
    private String collectionIds;

    @TableField(exist = false)
    @ApiModelProperty(value = "主题关联列表集合")
    private List<ThemeCollection> themeCollectionList = new ArrayList<>();
    /**
     * 分割字符串
     * @return 返回collectionIds列表集合
     */
    public List<Long> parseCollectionIds(){
        List<Long> ids = new ArrayList<>();
        if(StringUtils.hasLength(collectionIds)){
            String[] split = collectionIds.split(",");
            if(split != null && split.length > 0){
                for (int i = 0;i <split.length; i++) {
                    ids.add(Long.parseLong(split[i]));
                }
            }
        }
        return ids;
    }
}