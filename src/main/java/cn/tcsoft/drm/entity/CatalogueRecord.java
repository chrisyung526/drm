package cn.tcsoft.drm.entity;

import cn.tcsoft.drm.entity.bo.BaseBO;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * Catalogue Record
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
//@Accessors(chain = true)
@TableName("biz_mmis_catalogue_record")
@ApiModel(value = "CatalogueRecord对象", description = "Catalogue Record")
public class CatalogueRecord extends BaseBO {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "Status	Possible Values: CV - ConversionPR - ProductionCO - Checkout")
    private String dbStatus;

    @ApiModelProperty(value = "Dspace item Id Item ID of the corresponding record in DSpace")
    private Long dspaceItemId;

    @ApiModelProperty(value = "Title	Corresponds to Title.Main metadata")
    private String title;

    @ApiModelProperty(value = "Bib No.	Corresponds to Identifier.BIBNO metadata")
    @ExcelProperty(index = 0)
    private String bibNo;

    @ApiModelProperty(value = "Issue Date	Corresponds to Date.Issued metadata")
    private String issueDt;

    @ApiModelProperty(value = "Template Id	ID of the used Catalogue Template record")
    private Long templateId;

    @ApiModelProperty(value = "Checkout By	User ID who checked-out the record")
    private String checkoutBy;

    @ApiModelProperty(value = "Content Group - Full	Corresponds to Content Group - Full metadata")
    private String contentGrp;

    @ApiModelProperty(value = "Category	Corresponds to Category metadata")
    private String catGrp;

    @ApiModelProperty(value = "Author	Contains 5 name authority values")
    private String author;

    @ApiModelProperty(value = "Locked By	User ID who currently holds the lock")
    private String lockedBy;

    @ApiModelProperty(value = "Category Group Authority	Authority key of category group")
    private String catGrpAuth;

    @ApiModelProperty(value = "Content Group - Full Code	Code of the Content Group - Full")
    private String contentGrpAuth;

    @ApiModelProperty(value = "Intranet Access Link	Intranet Access Link for the e-Database")
    private String intraAccsLink;

    @ApiModelProperty(value = "Internet Access Link	Internet Access Link for the e-Database")
    private String interAccsLink;

    @ApiModelProperty(value = "URL	Cover page url of the item (used by report)")
    private String url;

    @ApiModelProperty(value = "URL Status	A - Active; B - Broken")
    private String urlStatus;

    @ApiModelProperty(value = "E-Resource Source	Refers to E-Resource Source if item is an e-resource")
    private Long eresrcSrc;

    @ApiModelProperty(value = "Digitised Object Active Directory	Holds the current active directory of Digitised objects. The value should be prepended to the DS_REF of the DIGITISED_OBJ record")
    private String digitisedObjActiveDir;

    @ApiModelProperty(value = "Content Group - Save/Download	Corresponds to Content Group - Save/Download metadata")
    private String contentGrpSave;

    @ApiModelProperty(value = "Content Group - Save/Download Code	Code of the Content Group - Save/Download")
    private String contentGrpSaveCd;

    @ApiModelProperty(value = "Content Group - Print	Corresponds to Content Group - Print")
    private String contentGrpPrint;

    @ApiModelProperty(value = "Content Group - Print Code	Code of the Content Group - Print")
    private String contentGrpPrintCd;

    private String materialType;

    private LocalDateTime issueDtDate;

    private Long oaipmhSrc;


}