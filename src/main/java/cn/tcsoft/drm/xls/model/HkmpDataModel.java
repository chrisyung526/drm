package cn.tcsoft.drm.xls.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author : hyman
 * create at:  2022/2/28  10:27
 * @description:
 */
@Data
public class HkmpDataModel {
    private Long id;
    @ApiModelProperty(value = "Accession No.")
    private String accNo;

    @ApiModelProperty(value = "Title (English)")
    private String titleEng;

    @ApiModelProperty(value = "Title (Chinese)")
    private String titleCht;

    @ApiModelProperty(value = "Description (English)")
    private String descriptionEng;

    @ApiModelProperty(value = "Description (Chinese)")
    private String descriptionCht;

    @ApiModelProperty(value = "Date (English)")
    private String dateEng;

    @ApiModelProperty(value = "Date (Chinese)")
    private String dateCht;

    @ApiModelProperty(value = "Date (Start)")
    private String dateStart;

    @ApiModelProperty(value = "Date (End)")
    private String dateEnd;

    @ApiModelProperty(value = "Time")
    private String time;

    @ApiModelProperty(value = "Region (English)")
    private String regionEng;

    @ApiModelProperty(value = "Region (Chinese)")
    private String regionCht;

    @ApiModelProperty(value = "District (English)")
    private String districtEng;

    @ApiModelProperty(value = "District (Chinese)")
    private String districtCht;

    @ApiModelProperty(value = "City (English)")
    private String cityEng;

    @ApiModelProperty(value = "City (Chinese)")
    private String cityCht;

    @ApiModelProperty(value = "Street (English)")
    private String streetEng;

    @ApiModelProperty(value = "Street (Chinese)")
    private String streetCht;

    @ApiModelProperty(value = "Building (English)")
    private String buildingEng;

    @ApiModelProperty(value = "Building (Chinese)")
    private String buildingCht;

    @ApiModelProperty(value = "Place")
    private String place;

    @ApiModelProperty(value = "Place (English)")
    private String placeEng;

    @ApiModelProperty(value = "Place (Chinese)")
    private String placeCht;

    @ApiModelProperty(value = "Topic")
    private String topic;

    @ApiModelProperty(value = "Topic (English)")
    private String topicEng;

    @ApiModelProperty(value = "Topic (Chinese)")
    private String topicCht;

    @ApiModelProperty(value = "Theme")
    private String theme;

    @ApiModelProperty(value = "Theme (English)")
    private String themeEng;

    @ApiModelProperty(value = "Theme (Chinese)")
    private String themeCht;

    @ApiModelProperty(value = "Collection")
    private String collection;

    @ApiModelProperty(value = "Collection (English)")
    private String collectionEng;

    @ApiModelProperty(value = "Collection (Chinese)")
    private String collectionCht;

    @ApiModelProperty(value = "Material Type (English)")
    private String materialTypeEng;

    @ApiModelProperty(value = "Material Type (Chinese)")
    private String materialTypeCht;

    @ApiModelProperty(value = "MMaterial Type")
    private String materialType;

    @ApiModelProperty(value = "Media Type (English)")
    private String mediaTypeEng;

    @ApiModelProperty(value = "Media Type (Chinese)")
    private String mediaTypeChi;

    @ApiModelProperty(value = "Media Type")
    private String mediaType;

    @ApiModelProperty(value = "Keywords (Place) (English)")
    private String kwPlaceEng;

    @ApiModelProperty(value = "Keywords (Place) (Chinese)")
    private String kwPlaceCht;

    @ApiModelProperty(value = "Keywords (Object) (English)")
    private String kwObjectEng;

    @ApiModelProperty(value = "Keywords (Object) (Chinese)")
    private String kwObjectCht;

    @ApiModelProperty(value = "Keywords (People) (English)")
    private String kwPeopleEng;

    @ApiModelProperty(value = "Keywords (People) (Chinese)")
    private String kwPeopleCht;

    @ApiModelProperty(value = "Keywords (Event) (English)")
    private String kwEventEng;

    @ApiModelProperty(value = "Keywords (Event) (Chinese)")
    private String kwEventCht;

    @ApiModelProperty(value = "Keywords (Others) (English)")
    private String kwOtherEng;

    @ApiModelProperty(value = "Keywords (Others) (Chinese)")
    private String kwOtherCht;

    @ApiModelProperty(value = "Source (English)")
    private String sourceEng;

    @ApiModelProperty(value = "Source (Chinese)")
    private String sourceCht;

    @ApiModelProperty(value = "Repository (English)")
    private String repositoryEng;

    @ApiModelProperty(value = "Repository (Chinese)")
    private String repositoryCht;

    @ApiModelProperty(value = "Reference (English)")
    private String referenceEng;

    @ApiModelProperty(value = "Reference (Chinese)")
    private String referenceCht;

    @ApiModelProperty(value = "Copyright Status (English)")
    private String copyrightStatusEng;

    @ApiModelProperty(value = "Copyright Status (Chinese)")
    private String copyrightStatusCht;

    @ApiModelProperty(value = "Copyright Comment (English)")
    private String copyrightCommentEng;

    @ApiModelProperty(value = "Copyright Comment (Chinese)")
    private String copyrightCommentCht;

    @ApiModelProperty(value = "Remarks (English)")
    private String remarkEng;

    @ApiModelProperty(value = "Remarks (Chinese)")
    private String remarkCht;

    @ApiModelProperty(value = "Remarks (Creator) (English)")
    private String remarkCreatorEng;

    @ApiModelProperty(value = "Remarks (Creator) (Chinese)")
    private String remarkCreatorCht;

    @ApiModelProperty(value = "Remarks (Contributor) (English)")
    private String remarkContributorEng;

    @ApiModelProperty(value = "Remarks (Contributor) (Chinese)")
    private String remarkContributorCht;

    @ApiModelProperty(value = "Remarks (Other) (English)")
    private String remarkOtherEng;

    @ApiModelProperty(value = "Remarks (Other) (Chinese)")
    private String remarkOtherCht;

    @ApiModelProperty(value = "Enable")
    private String enable;

    @ApiModelProperty(value = "Extension")
    private String extension;

    @ApiModelProperty(value = "Download")
    private String download;

    @ApiModelProperty(value = "archive")
    private String archive;

    @ApiModelProperty(value = "location")
    private String location;

    @ApiModelProperty(value = "related")
    private String related;

    @ApiModelProperty(value = "evideo_id")
    private String evideoId;

    @ApiModelProperty(value = "Original Filename")
    private String originalFilename;

    @ApiModelProperty(value = "Original Title (English)")
    private String originalTitleEng;

    @ApiModelProperty(value = "Original Title (Chinese)")
    private String originalTitleCht;

    @ApiModelProperty(value = "Duration (English)")
    private String durationEng;

    @ApiModelProperty(value = "Duration (Chinese)")
    private String durationCht;

    @ApiModelProperty(value = "Language (English)")
    private String languageEng;

    @ApiModelProperty(value = "Language (Chinese)")
    private String languageCht;

}