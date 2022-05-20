
-- 对应来系统 mmis->item
drop table if exists `biz_mmis_catalogue_record`;
CREATE TABLE `biz_mmis_catalogue_record`  (
   `id` bigint(22) NOT NULL COMMENT 'Item ID Internal unique ID',
   `db_status` varchar(10)  NOT NULL COMMENT 'Status	Possible Values: CV - ConversionPR - ProductionCO - Checkout',
   `dspace_item_id` bigint(22) NULL DEFAULT NULL COMMENT 'Dspace item Id Item ID of the corresponding record in DSpace',
   `title` text  NULL COMMENT 'Title	Corresponds to Title.Main metadata',
   `bib_no` varchar(20)  NULL DEFAULT NULL COMMENT 'Bib No.	Corresponds to Identifier.BIBNO metadata',
   `issue_dt` text  NULL COMMENT 'Issue Date	Corresponds to Date.Issued metadata',
   `template_id` bigint(22) NULL DEFAULT NULL COMMENT 'Template Id	ID of the used Catalogue Template record',
   `checkout_by` varchar(20)  NULL DEFAULT NULL COMMENT 'Checkout By	User ID who checked-out the record',
   `content_grp` varchar(100)  NULL DEFAULT NULL COMMENT 'Content Group - Full	Corresponds to Content Group - Full metadata',
   `cat_grp` text  NULL COMMENT 'Category	Corresponds to Category metadata',
   `author` text  NULL COMMENT 'Author	Contains 5 name authority values',
   `locked_by` varchar(20)  NULL DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
   `cat_grp_auth` varchar(20)  NULL DEFAULT NULL COMMENT 'Category Group Authority	Authority key of category group',
   `content_grp_auth` varchar(20)  NULL DEFAULT NULL COMMENT 'Content Group - Full Code	Code of the Content Group - Full',
   `intra_accs_link` text  NULL COMMENT 'Intranet Access Link	Intranet Access Link for the e-Database',
   `inter_accs_link` text  NULL COMMENT 'Internet Access Link	Internet Access Link for the e-Database',
   `url` text  NULL COMMENT 'URL	Cover page url of the item (used by report)',
   `url_status` varchar(1)  NULL DEFAULT NULL COMMENT 'URL Status	A - Active; B - Broken',
   `eresrc_src` bigint(10) NULL DEFAULT NULL COMMENT 'E-Resource Source	Refers to E-Resource Source if item is an e-resource',
   `digitised_obj_active_dir` varchar(1)  NULL DEFAULT NULL COMMENT 'Digitised Object Active Directory	Holds the current active directory of Digitised objects. The value should be prepended to the DS_REF of the DIGITISED_OBJ record',
   `content_grp_save` varchar(100)  NULL DEFAULT NULL COMMENT 'Content Group - Save/Download	Corresponds to Content Group - Save/Download metadata',
   `content_grp_save_cd` varchar(20)  NULL DEFAULT NULL COMMENT 'Content Group - Save/Download Code	Code of the Content Group - Save/Download',
   `content_grp_print` varchar(100)  NULL DEFAULT NULL COMMENT 'Content Group - Print	Corresponds to Content Group - Print',
   `content_grp_print_cd` varchar(20)  NULL DEFAULT NULL COMMENT 'Content Group - Print Code	Code of the Content Group - Print',
   `material_type` varchar(20)  NULL DEFAULT NULL,
   `issue_dt_date` datetime NULL DEFAULT NULL,
   `oaipmh_src` bigint(10) NULL DEFAULT NULL,
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Catalogue Record' ROW_FORMAT = Dynamic;

-- 对应来系统 mmis->DIGITISED_OBJ
drop table if exists `biz_mmis_digitised_object`;
CREATE TABLE `biz_mmis_digitised_object`  (
  `id` bigint(22) NOT NULL COMMENT 'Item ID Internal unique ID',
  `item_id` int(10) NULL DEFAULT NULL COMMENT 'Item Id	Item ID of the owning Catalogue Record',
  `seq_no` int(9) NULL DEFAULT NULL COMMENT 'Sequence no Reference to the Sequence No. in the parent Item Table of Contents',
  `ds_ref` varchar(250)  NULL DEFAULT NULL COMMENT 'Location of the digitised object in the server',
  `status` varchar(10)  NULL DEFAULT NULL COMMENT 'Status	Possible Values: Conversion Production Checkout',
  `cntrl_grp` varchar(250)  NULL DEFAULT NULL COMMENT 'Content Group	Reference to Content Group of the Catalogue',
  `checksum` varchar(64)  NULL DEFAULT NULL COMMENT 'Checksum	Calculated upon upload. This will be used for content corruption check.',
  `no_of_pages` int(8) NULL DEFAULT NULL COMMENT 'No. of Pages	Will be set by CMSB03 for eBooks while for other images this will be set to 1. Only applicable for image content (including ebook)',
  `rtl_seq` varchar(1)  NULL DEFAULT NULL COMMENT 'Right to Left Page Sequence flag	Applicable only for ebook contents, flag to determine if content has right to left page sequence, values \'Y\' or null',
  `parent_obj_id` varchar(8)  NULL DEFAULT NULL COMMENT 'Parent Object ID	Applicable only for ebook contents when a page is inserted. ID of the parent Digitised Object record corresponding to the pdf where this record is inserted to.',
  `disp_seq_no` int(3) NULL DEFAULT NULL COMMENT 'Displayed Sequence No.	Applicable only for multiple image content: - Newspaper clippings - UR & RC archive - Old HK Newspaper - House Programme This will represent the order/sequence of the images when viewed using the image custom viewer',
  `object_type` varchar(20)  NULL DEFAULT NULL COMMENT 'Object Type	Reference to Object Type',
  `place` varchar(100)  NULL DEFAULT NULL COMMENT 'Place	Will be used for content with multiple pages (e.g. Maps, house programme, newspaper)',
  `locked_by` varchar(20)  NULL DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
  `converted` varchar(1)  NULL DEFAULT NULL COMMENT 'Converted	flag if Digitised object is coverted Y converted else N',
  `file_size` bigint(10) NULL DEFAULT NULL COMMENT 'File Size	File Size',
  `x_position` int(2) NULL DEFAULT NULL COMMENT 'X Position	applicable for Split Images',
  `y_position` int(2) NULL DEFAULT NULL COMMENT 'Y Position		applicable for Split Images ',
  `pdf_color` varchar(1)  NULL DEFAULT NULL,
  `pdf_dpi` int(4) NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DIGITISED_OBJ$IDX1`(`object_type`, `item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Digitised Object' ROW_FORMAT = Dynamic;

-- 对应来系统 mmis->METADATAVALUE DSPACE->METADATAVALU
drop table if exists `biz_mmis_catalogue_field_value`;
CREATE TABLE `biz_mmis_catalogue_field_value`  (
  `id` bigint(22) NOT NULL COMMENT 'Item ID Internal unique ID',
  `item_id` bigint(22) NULL DEFAULT NULL COMMENT 'Item Id	ID of the parent Catalogue Record record source biz_mmis_catalogue_record',
  `metadata_field_id` bigint(22) NULL DEFAULT NULL COMMENT 'Metadata Field ID of the Dublin Core field sourcebiz_mmis_metadata_field',
  `text_value` text  NULL COMMENT 'Value	Value of the DC field',
  `text_lang` varchar(24) NULL DEFAULT NULL,
  `place` bigint(22) NULL DEFAULT NULL COMMENT 'Place	Sequence for repeated fields',
  `authority` varchar(20)  NULL DEFAULT NULL COMMENT 'Authority Reference	Authority ID if the value is from Authority record',
  `confidence` bigint(22) NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Catalogue Field Values' ROW_FORMAT = Dynamic;

-- dspace>METADATASCHEMAREGISTRY
drop table if exists `biz_mmis_metadata_schema`;
CREATE TABLE `biz_mmis_metadata_schema`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `namespace` varchar(200) NULL DEFAULT NULL COMMENT 'NAMESPACE',
 `short_id` varchar(32) DEFAULT NULL COMMENT 'SHORT ID',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Metadata Schema' ROW_FORMAT = Dynamic;

-- dspace>METADATAFIELDREGISTRY
drop table if exists `biz_mmis_metadata_field`;
CREATE TABLE `biz_mmis_metadata_field`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `metadata_schema_id` bigint(20) NULL DEFAULT NULL COMMENT 'METADATA SCHEMA ID sourcebiz_mmis_metadata_schema',
 `element` varchar(64) DEFAULT NULL COMMENT 'ELEMENT',
 `qualifier` varchar(64) DEFAULT NULL COMMENT 'QUALIFIER',
 `scope_note` varchar(200) DEFAULT NULL COMMENT 'SCOPE NOTE',
 `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Metadata Type',
 `length` int(9) NULL DEFAULT NULL COMMENT 'Field Length',
 `effective_scope` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Metadata Effective Scope',
 `content_cover_page_label` varchar(80) DEFAULT NULL COMMENT 'Content Cover Page Label',
 `content_cover_page_label_chi` varchar(80) DEFAULT NULL COMMENT 'Content Cover Page Label(Chinese)',
 `content_cover_page_label_eng` varchar(80) DEFAULT NULL COMMENT 'Content Cover Page Label(English)',
 `content_highlight_label` varchar(80) DEFAULT NULL COMMENT 'Content Highlight Label',
 `content_highlight_label_chi` varchar(80) DEFAULT NULL COMMENT 'Content Highlight Label(Chinese)',
 `content_highlight_label_eng` varchar(80) DEFAULT NULL COMMENT 'Content Highlight Label(English)',
 `controlled_field` char(2) NOT NULL DEFAULT 0 COMMENT 'Controlled Field(Y N)',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Metadata Fields' ROW_FORMAT = Dynamic;

-- mmis>FLD_PROPS
drop table if exists `biz_mmis_metadata_field_properties`;
CREATE TABLE `biz_mmis_metadata_field_properties`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `field_id` bigint(20)  COMMENT 'field id',
    `dc_element` varchar(64)  NOT NULL COMMENT 'DC Element Dublin Core Element',
    `dc_qualifier` varchar(64)  NULL DEFAULT NULL COMMENT 'DC Qualifier Dublin Core Qualifier',
    `ref_table_name` varchar(200)  NULL DEFAULT NULL COMMENT 'Referenced Table',
    `repeatable` varchar(1)  NULL DEFAULT NULL COMMENT 'Repeatable Signifies if field is repeatable on DC specs',
    `dc_mandatory` varchar(1)  NULL DEFAULT NULL COMMENT 'Mandatory Signifies if field is mandatory on DC specs',
    `display_field` varchar(1)  NULL DEFAULT NULL COMMENT 'Display Field	Signifies if field is displayed in content cover page',
    `internal` varchar(1)  NULL DEFAULT NULL COMMENT 'Internal	Signifies if field is an internal field',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `FLD_PROPS$UK`(`dc_qualifier`, `dc_element`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Metadata Field Properties' ROW_FORMAT = Dynamic;

-- mmis>auth_name
drop table if exists `biz_mmis_controlled_name`;
CREATE TABLE `biz_mmis_controlled_name`  (
   `id` bigint(20) NOT NULL COMMENT 'ID',
   `db_status` varchar(10)  NOT NULL COMMENT 'Status New / Being Processed',
   `auth_name` varchar(250)  NOT NULL COMMENT 'Authorized Name',
   `active` varchar(1)  NOT NULL COMMENT 'Active Active Indicator Yes / No',
   `ngils` varchar(1)  NOT NULL COMMENT 'NGILS	Indicator if record is from NGILS Yes / No',
   `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator Temporary Indicator Yes / No',
   `see_also_fr_created_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
   `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled Name' ROW_FORMAT = Dynamic;

-- mmis>auth_subj
drop table if exists `biz_mmis_controlled_subject`;
CREATE TABLE `biz_mmis_controlled_subject`  (
 `id` bigint(20) NOT NULL COMMENT 'ID',
 `db_status` varchar(10)  NOT NULL COMMENT 'Status	New / Being Processed',
 `auth_subj` varchar(250)  NOT NULL COMMENT 'Authorized Subject	Authorized Subject',
 `active` varchar(1)  NOT NULL COMMENT 'Active	Active Indicator Yes / No',
 `ngils` varchar(1)  NOT NULL COMMENT 'NGILS Indicator if record is from NGILS Yes / No',
 `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
 `see_also_fr_created_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
 `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled Subject' ROW_FORMAT = Dynamic;

-- mmis>auth_misc
drop table if exists `biz_mmis_controlled_misc`;
CREATE TABLE `biz_mmis_controlled_misc`  (
    `id` bigint(20) NOT NULL COMMENT 'ID',
    `db_status` varchar(10)  NOT NULL COMMENT 'Status New/Being Processed',
    `attr_type` varchar(64)  NOT NULL COMMENT 'Attribute Type',
    `value` varchar(250)  NOT NULL COMMENT 'Value of the Attribute Type',
    `eng_descrip` text  NULL COMMENT 'English Description',
    `chi_descrip` varchar(250)  NULL DEFAULT NULL COMMENT 'Chinese Description',
    `active` varchar(1)  NOT NULL COMMENT 'Active Indicator Yes / No',
    `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator Temporary Indicator Yes / No',
    `url` varchar(100)  NULL DEFAULT NULL,
    `value_chi` varchar(250)  NULL DEFAULT NULL,
    `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled Misc' ROW_FORMAT = Dynamic;

-- mmis>auth_misc_attr_type
drop table if exists `biz_mmis_controlled_misc_attr_type`;
CREATE TABLE `biz_mmis_controlled_misc_attr_type`  (
 `id` bigint(20) NOT NULL COMMENT 'ID',
 `attr_id` varchar(64)  NOT NULL COMMENT 'Attribute ID	',
 `attr_val` varchar(64)  NOT NULL COMMENT 'Attribute Value Displayed Value of Attribute',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Authority Miscellaneous Attribute Type' ROW_FORMAT = Dynamic;

-- mmis>auth_unif_title
drop table if exists `biz_mmis_controlled_uniform_title`;
CREATE TABLE `biz_mmis_controlled_uniform_title`  (
 `id` bigint(20) NOT NULL COMMENT 'ID',
 `db_status` varchar(10)  NOT NULL COMMENT 'Status	New / Being Processed',
 `auth_unif_title` varchar(250)  NOT NULL COMMENT 'Authorized Uniform Title	Authorized Uniform Title',
 `active` varchar(1)  NOT NULL COMMENT 'Active Indicator Yes / No',
 `ngils` varchar(1)  NOT NULL COMMENT 'NGILS Indicator if record is from NGILS Yes / No',
 `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
 `see_also_fr_created_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
 `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled Uniform Title' ROW_FORMAT = Dynamic;

-- mmis>auth_uri
drop table if exists `biz_mmis_controlled_uri`;
CREATE TABLE `biz_mmis_controlled_uri`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `db_status` varchar(10)  NOT NULL COMMENT 'Status	New / Being Processed',
  `link` varchar(250)  NOT NULL COMMENT 'Link	Link of the URI',
  `eng_descrip` text  NULL COMMENT 'English Description',
  `chi_descrip` text  NULL COMMENT 'Chinese Description',
  `valid` varchar(1)  NULL DEFAULT NULL COMMENT 'Valid	Valid Indicator',
  `active` varchar(1)  NOT NULL COMMENT 'Active	Active Indicator Yes / No',
  `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
  `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled URI' ROW_FORMAT = Dynamic;

-- mmis>auth_ser_title
drop table if exists `biz_mmis_controlled_series_title`;
CREATE TABLE `biz_mmis_controlled_series_title`  (
    `id` bigint(20) NOT NULL COMMENT 'ID',
    `db_status` varchar(10)  NOT NULL COMMENT 'Status	New / Being Processed',
    `auth_ser_title` varchar(250)  NOT NULL COMMENT 'Authorized Series Title	Authorized Series Title',
    `active` varchar(1)  NOT NULL COMMENT 'Active Indicator Yes / No',
    `ngils` varchar(1)  NOT NULL COMMENT 'NGILS	Indicator if record is from NGILS Yes / No',
    `temporary_ind` varchar(1)  NULL DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
    `duplicate_metadata` varchar(1)  NULL DEFAULT NULL,
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Controlled Series Title' ROW_FORMAT = Dynamic;

-- 旧表：mmis->TEMPLATE_ITEM
drop table if exists `biz_mmis_catalogue_template`;
CREATE TABLE `biz_mmis_catalogue_template`  (
     `id` bigint(20) NOT NULL  COMMENT 'ID',
     `template_name` varchar(50)  NOT NULL COMMENT 'Template Name Template Name',
     `template_descrip` text  NULL COMMENT 'Template Description Template Description',
     `material_type` varchar(20) DEFAULT NULL COMMENT 'Material Type(Source Material Type Table)',
     `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
     `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
     `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
     `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
     `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
     `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
     `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Catalogue Template' ROW_FORMAT = Dynamic;

-- 旧表：mmis->TEMPLATE_METADATAVALUE
drop table if exists `biz_mmis_catalogue_template_field`;
CREATE TABLE `biz_mmis_catalogue_template_field`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `template_id` bigint(20) NOT NULL COMMENT 'Template Id	ID of the parent Catalogue Template',
    `metadata_field_id` bigint(20) NOT NULL COMMENT 'Metadata Field Id	ID of the Dublin Core field（biz_mmis_metadata_field',
    `text_value` text NULL COMMENT 'Value of the DC field',
    `place` bigint(20) NULL DEFAULT NULL COMMENT 'Place	Sequence for repeated fields',
    `authority` varchar(100) NULL DEFAULT NULL COMMENT 'Authority Reference	Authority ID if the value is from Authority record',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Catalogue Template Field' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->theme
drop table if exists `biz_mmis_theme`;
CREATE TABLE `biz_mmis_theme`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `theme_id` varchar(40) NOT NULL DEFAULT '' COMMENT 'Theme ID',
  `nm` varchar(80) NOT NULL DEFAULT '' COMMENT 'Name',
  `name_chi` varchar(80) NOT NULL DEFAULT '' COMMENT 'Name (Chinese)',
  `eng_nm` varchar(180) NOT NULL DEFAULT '' COMMENT 'Name (English)',
  `descrip` text COMMENT 'Description ',
  `chi_descrip` text COMMENT 'Description (Chinese)',
  `eng_descrip` text COMMENT 'Description (English)',
  `wallpaper_filename` varchar(100) NOT NULL DEFAULT '' COMMENT 'Wallpaper',
  `wallpaper` blob COMMENT 'Wallpaper',
  `status` char(2) NOT NULL DEFAULT 0 COMMENT 'status',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Theme' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->theme_rel_collection
drop table if exists `biz_mmis_theme_collection`;
CREATE TABLE `biz_mmis_theme_collection`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `theme_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Theme ID',
   `theme_rel_collection_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Collection ID',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Theme Rel Collection' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->HIGHLIGHT_TOPIC
drop table if exists `biz_mmis_highlight_topic`;
CREATE TABLE `biz_mmis_highlight_topic`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `topic_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'TOPIC_TYPE',
  `eng` int(2) COMMENT 'English	Language indicator',
  `chi` int(2) COMMENT 'Chinese Language indicator',
  `topic_name` varchar(100) DEFAULT '' COMMENT 'Topic Name(English)',
  `topic_name_chi` varchar(100) DEFAULT '' COMMENT 'Topic Name(Traditional Chinese)',
  `topic_name_chi_simp` varchar(100) DEFAULT '' COMMENT 'Topic Name(Chinese)',
  `descrip` text COMMENT 'Description(Traditional Chinese)',
  `descrip_chi` text COMMENT 'Description(Simplified Chinese)',
  `descrip_chi_simp` text COMMENT 'Description(Chinese)',
  `eff_dt_fr` date  COMMENT 'Effective Date start',
  `eff_dt_to` date COMMENT 'Effective Date end',
  `no_items` int(3) DEFAULT 0 COMMENT 'No of Items',
  `prev_n_days` int(2) DEFAULT 0 COMMENT 'Previous N days Previous N days',
  `highlight_template_id` bigint(20) NOT NULL COMMENT 'Content Highlight Template ID Content Highlight Topic ID',
  `ids_popup` varchar(30) DEFAULT '' COMMENT 'Popup Template',
  `kids_popup` varchar(30) DEFAULT '' COMMENT 'Popup Template',
  `popup_descrip` varchar(20) DEFAULT '' COMMENT 'Popup Description(English)',
  `popup_descrip_chi` varchar(20) DEFAULT '' COMMENT 'Popup Description(Traditional Chinese)',
  `popup_descrip_chi_simp` varchar(20) DEFAULT '' COMMENT 'Popup Description(Chinese)',
  `cover_image` varchar(80) COMMENT 'Popup Description(Chinese)',
  `cat` varchar(30) DEFAULT '' COMMENT 'Category',
  `nav_path` varchar(2) DEFAULT '' COMMENT 'NAV_PATH',
  `is_default` varchar(2) DEFAULT '' COMMENT 'IS_DEFAULT',
  `collection` varchar(30) DEFAULT '' COMMENT 'Collection',
  `author` varchar(30) DEFAULT '' COMMENT 'Author',
  `show_accessible` char(2)  DEFAULT 'N' COMMENT 'Show Accessible Items Only Y - Show accessible items, used only if Type = M',
  `status` char(2)  DEFAULT 0 COMMENT 'Status',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Highlight Topic' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->HIGHLIGHT_TOPIC_ITEM
drop table if exists `biz_mmis_highlight_topic_item`;
CREATE TABLE `biz_mmis_highlight_topic_item`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `highlight_topic_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Content Highlight Topic ID Content Highlight Topic ID',
  `item_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Item ID Item ID',
  `ord` int(5) NOT NULL DEFAULT 0 COMMENT 'Order',
  `is_default` char(5) COMMENT 'Order',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Highlight Topic Item' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->HIGHLIGHT_TOPIC_AGE_GRP
drop table if exists `biz_mmis_highlight_topic_age_group`;
CREATE TABLE `biz_mmis_highlight_topic_age_group`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `highlight_topic_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'Content Highlight Topic ID',
  `age_grp_id` varchar(20) NOT NULL DEFAULT 0 COMMENT 'Age Group',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Highlight Topic Age Group' ROW_FORMAT = Dynamic;


-- 对应老系统 mmis->news_hist_db
drop table if exists `biz_mmis_news_hist_db`;
CREATE TABLE `biz_mmis_news_hist_db`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `item_id` bigint(20) COMMENT 'Item ID',
   `news_hist_dt_id` bigint(20) COMMENT 'News History Date ID',
   `headline` varchar(20) COMMENT 'Headline',
   `status` char(2) NOT NULL DEFAULT 0 COMMENT 'Status',
   `page_no` int(6) NOT NULL DEFAULT 0 COMMENT 'Page No.Page No.',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'News History Database' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->news_hist_dt
drop table if exists `biz_mmis_news_hist_dt`;
CREATE TABLE `biz_mmis_news_hist_dt`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `hist_day` int(3) COMMENT 'History Day',
  `hist_month` int(3) COMMENT 'History Month',
  `status` char(2) COMMENT 'status(P:Published D:Draft)',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'News History Date' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->news_highlight
drop table if exists `biz_mmis_news_highlight`;
CREATE TABLE `biz_mmis_news_highlight`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `item_id` bigint(20) COMMENT 'ITEM ID',
  `highlight_dt` datetime COMMENT 'Highlight Date',
  `ord` int(5) COMMENT 'Order',
  `section` varchar(20) COMMENT 'Section',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'News Highlight' ROW_FORMAT = Dynamic;


-- 对应老系统 mmis->MEDIA_TYPE
drop table if exists `biz_mmis_media_type`;
CREATE TABLE `biz_mmis_media_type`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `cd` varchar(20)  NOT NULL COMMENT 'Code',
    `descrip` varchar(100)  NOT NULL COMMENT 'Description',
    `stg_lvl` decimal(1, 0) NOT NULL COMMENT 'Storage Level	Storage Level',
    `audio_only` varchar(1)  NULL DEFAULT NULL COMMENT 'Audio Only Indicator Y if the media type only has audio.	Y or N',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Media Type' ROW_FORMAT = Dynamic;


-- 对应老系统 mmis->material_type_content
drop table if exists `biz_mmis_material_type`;
CREATE TABLE `biz_mmis_material_type`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `material_type` varchar(20)  NOT NULL COMMENT 'Material Type reference to material type codes',
    `file_type` varchar(20)  NOT NULL COMMENT 'File Type reference to content object type',
    `sys_generated` varchar(1)  NULL DEFAULT NULL COMMENT 'System Generated	flag if file is system generated',
    `mandatory` varchar(1)  NULL DEFAULT NULL COMMENT 'Mandatory flag if file is required',
    `min_count` bigint(22) NULL DEFAULT NULL COMMENT 'Minimum Count	minimum number of files',
    `max_count` bigint(22) NULL DEFAULT NULL COMMENT 'Maximum Count	maximum number of files',
    `sort_order` bigint(3) NULL DEFAULT NULL,
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Material Type Content' ROW_FORMAT = Dynamic;

-- 对应老系统 mmis->DICT_ITEM
drop table if exists `biz_mmis_dictionary_item`;
CREATE TABLE `biz_mmis_dictionary_item`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `mapped_to` text  NULL COMMENT 'Mapped To',
    `keyword` text  NOT NULL COMMENT 'Keyword',
    `orig_keyword` text  NULL COMMENT 'Original Keyword',
    `orig_mapped_to` text  NULL COMMENT 'Original Mapped To',
    `mod_type` varchar(4)  NOT NULL COMMENT 'Modify Type',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Dictionary Item' ROW_FORMAT = Dynamic;

-- mmis->REP_GRP
drop table if exists `biz_mmis_report_group`;
CREATE TABLE `biz_mmis_report_group`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `rep_grp_descrip` varchar(50)  NOT NULL COMMENT 'Report Group Description',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Group' ROW_FORMAT = Dynamic;

-- mmis->REP_HIST
drop table if exists `biz_mmis_report_history`;
CREATE TABLE `biz_mmis_report_history`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `rep_id` varchar(10)  NOT NULL COMMENT 'Report ID',
  `req_dt` datetime NOT NULL COMMENT 'Request Date',
  `requested_by_usr` varchar(20)  NOT NULL COMMENT 'Requested By User',
  `generation_dt` datetime NOT NULL COMMENT 'Generation Date',
  `generation_status` varchar(1)  NOT NULL COMMENT 'Generation Status',
  `file_content_id` int(10) NULL DEFAULT NULL COMMENT 'File Content ID',
  `rep_criteria` text  NULL COMMENT 'Report Criteria',
  `exception_message` text  NULL COMMENT 'Exception Message ',
  `rep_sched_id` bigint(20) NULL DEFAULT NULL COMMENT 'Report Schedule ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report History' ROW_FORMAT = Dynamic;

-- mmis->REP_HIST_RECIPIENT
drop table if exists `biz_mmis_report_history_recipient`;
CREATE TABLE `biz_mmis_report_history_recipient`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `rep_hist_id` bigint(38) NOT NULL COMMENT 'Report History ID biz_mmis_report_history',
    `email_add` varchar(100)  NOT NULL COMMENT 'Email Address',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report History Recipient' ROW_FORMAT = Dynamic;


-- mmis->REP_PAR_HIST
drop table if exists `biz_mmis_report_parameter_history`;
CREATE TABLE `biz_mmis_report_parameter_history`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `rep_hist_id` int(10) NOT NULL COMMENT 'Report History ID',
   `par_cd` varchar(30)  NOT NULL COMMENT 'Parameter Code',
   `par_descrip` varchar(100)  NULL DEFAULT NULL COMMENT 'Parameter Description',
   `par_val` text  NOT NULL COMMENT 'Parameter Value',
   `par_lookup_val` text  NULL COMMENT 'Parameter Lookup Value',
   `par_type` varchar(1)  NOT NULL COMMENT 'Parameter Type',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Parameter History' ROW_FORMAT = Dynamic;


-- mmis->REP_PAR_LIST
drop table if exists `biz_mmis_report_parameter_list`;
CREATE TABLE `biz_mmis_report_parameter_list`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `rep_id` varchar(10)  NOT NULL,
  `par_cd` varchar(20)  NOT NULL,
  `par_descrip` varchar(100)  NOT NULL,
  `ord` int(3) NOT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Parameter List' ROW_FORMAT = Dynamic;


-- mmis->REP_SETTING
drop table if exists `biz_mmis_report_setting`;
CREATE TABLE `biz_mmis_report_setting`  (
     `id` bigint(20) NOT NULL  COMMENT 'ID',
     `rep_grp_id` bigint(20) NOT NULL COMMENT 'Report Group ID',
     `excel_exp_ind` varchar(1)  NOT NULL COMMENT 'Excel Export Indicator',
     `text_exp_ind` varchar(1)  NOT NULL COMMENT 'Text Export Indicator',
     `pdf_exp_ind` varchar(1)  NOT NULL COMMENT 'PDF Export Indicator',
     `alw_schedule` varchar(1)  NOT NULL COMMENT 'Schedule Allowed',
     `rep_format` varchar(1)  NOT NULL COMMENT 'Report Format',
     `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
     `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
     `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
     `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
     `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
     `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
     `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Setting' ROW_FORMAT = Dynamic;

-- mmis->report_file
drop table if exists `biz_mmis_report_file`;
CREATE TABLE `biz_mmis_report_file`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `rep_file_nm` varchar(200)  NOT NULL COMMENT 'Report File Name',
    `cont_data` longtext NULL COMMENT 'Content Data ',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report File' ROW_FORMAT = Dynamic;

-- mmis->REP_SCHEDULE
drop table if exists `biz_mmis_report_schedule`;
CREATE TABLE `biz_mmis_report_schedule`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `rep_id` varchar(20)  NOT NULL COMMENT 'Report ID Source biz_mmis_report_setting',
    `template_nm` varchar(100)  NOT NULL COMMENT 'Template Name ',
    `scheduled` varchar(1)  NOT NULL COMMENT 'Scheduled ',
    `schd_type` varchar(1)  NULL DEFAULT NULL COMMENT 'Schedule Type	Schedule Type; D - Daily;  M - Monthly;  Y - Yearly;',
    `GENERATION_PER_FROM` datetime NULL DEFAULT NULL COMMENT 'Generation Period From Start date of report generation',
    `generation_per_to` datetime NULL DEFAULT NULL COMMENT 'Generation Period To	End date of report generation',
    `generation_offset` int(3) NULL DEFAULT NULL COMMENT 'Generation Offset	No. of Days after the report period on which the report will be generated.',
    `rep_format` varchar(3)  NOT NULL COMMENT 'Format	Format',
    `last_gen_dt` datetime NULL DEFAULT NULL COMMENT 'Last Generation Date	Last Generation Date',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Schedule' ROW_FORMAT = Dynamic;


-- mmis->REP_SCHED_RECIPIENT
drop table if exists `biz_mmis_report_schedule_recipient`;
CREATE TABLE `biz_mmis_report_schedule_recipient`  (
     `id` bigint(20) NOT NULL  COMMENT 'ID',
     `rep_sched_id` bigint(20) NOT NULL COMMENT 'Report Schedule ID',
     `email_add` varchar(100)  NOT NULL COMMENT 'Email Address',
     `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
     `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
     `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
     `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
     `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
     `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
     `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Schedule Recipient' ROW_FORMAT = Dynamic;


-- mmis->REP_SCHED_PAR
drop table if exists `biz_mmis_report_schedule_parameter`;
CREATE TABLE `biz_mmis_report_schedule_parameter`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `rep_sched_id` bigint(20) NOT NULL COMMENT 'Report Schedule ID',
   `par_cd` varchar(30)  NOT NULL COMMENT 'Parameter Code',
   `par_val` text  NOT NULL COMMENT 'Parameter Value',
   `par_type` varchar(1)  NOT NULL COMMENT 'Parameter Type',
   `par_lookup_val` text  NULL COMMENT 'Parameter Lookup Value',
   `par_descrip` varchar(100)  NULL DEFAULT NULL COMMENT 'Parameter Description',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Schedule Parameter' ROW_FORMAT = Dynamic;


-- mmis->REP_SCHED_LIB_RIGHTS
drop table if exists `biz_mmis_report_schedule_library_rights`;
CREATE TABLE `biz_mmis_report_schedule_library_rights`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `rep_sched_id` bigint(20) NOT NULL COMMENT 'Report Schedule ID',
   `lib_code` varchar(20)  NOT NULL COMMENT 'Library Code',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Report Schedule Library Rights' ROW_FORMAT = Dynamic;

--
-- 统计相关的

-- mmis->CONTENT_HIGHLIGHT_STAT
drop table if exists `biz_mmis_content_highlight_stat`;
CREATE TABLE `biz_mmis_content_highlight_stat`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `item_id` bigint(22) NOT NULL COMMENT 'Item ID',
  `part_id` varchar(14)  NULL DEFAULT NULL COMMENT 'Part ID',
  `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Highlight Statistics' ROW_FORMAT = Dynamic;

-- mmis->COVERPAGE_USAGE_STAT
drop table if exists `biz_mmis_coverpage_usage_stat`;
CREATE TABLE `biz_mmis_coverpage_usage_stat`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `acs_dt` datetime NOT NULL COMMENT 'Access Date',
    `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
    `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
    `item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Item ID',
    `part_id` varchar(20)  NULL DEFAULT NULL COMMENT 'Part ID',
    `login_id` varchar(50)  NULL DEFAULT NULL COMMENT 'Login ID',
    `session_id` varchar(50)  NULL DEFAULT NULL COMMENT 'Session ID',
    `accessed_from` varchar(8)  NULL DEFAULT NULL COMMENT 'Accessed From',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Access Statistics' ROW_FORMAT = Dynamic;

-- mmis->COVERPAGE_USAGE_STAT_SUMM
drop table if exists `biz_mmis_coverpage_usage_stat_summ`;
CREATE TABLE `biz_mmis_coverpage_usage_stat_summ`  (
    `id` bigint(20) NOT NULL  COMMENT 'ID',
    `item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Item ID',
    `hit_count` int(10) NOT NULL COMMENT 'Hit Count',
    `start_period_dt` datetime NOT NULL COMMENT 'Start Period Date',
    `title` text  NULL COMMENT 'Title	Title of the Item',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Access Statistics Summary' ROW_FORMAT = Dynamic;

-- mmis->EXT_LINK_USAGE_STAT
drop table if exists `biz_mmis_ext_link_usage_stat`;
CREATE TABLE `biz_mmis_ext_link_usage_stat`  (
   `id` bigint(20) NOT NULL  COMMENT 'ID',
   `acs_dt` datetime NOT NULL COMMENT 'Access Date',
   `ext_link` varchar(250)  NOT NULL COMMENT 'External Link',
   `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
   `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'External Link Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->FUNC_USAGE_STAT
drop table if exists `biz_mmis_func_usage_stat`;
CREATE TABLE `biz_mmis_func_usage_stat`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `acs_dt` datetime NOT NULL COMMENT 'Access Date',
 `func` varchar(5)  NOT NULL COMMENT 'Function',
 `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
 `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Function Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->HYPERTEXT_USAGE_STAT
drop table if exists `biz_mmis_hypertext_usage_stat`;
CREATE TABLE `biz_mmis_hypertext_usage_stat`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `acs_dt` datetime NOT NULL COMMENT 'Access Date',
 `hypertext` varchar(250)  NOT NULL COMMENT 'Hypertext',
 `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
 `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Hypertext Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->SEARCH_STAT
drop table if exists `biz_mmis_search_stat`;
CREATE TABLE `biz_mmis_search_stat`  (
`id` bigint(20) NOT NULL  COMMENT 'ID',
`search_dt` datetime NOT NULL COMMENT 'Search Date',
`acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
`acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
`login_id` varchar(50)  NULL DEFAULT NULL COMMENT 'Login ID',
`session_id` varchar(50)  NULL DEFAULT NULL COMMENT 'Session ID',
`search_type` varchar(10)  NULL DEFAULT NULL COMMENT 'Search Type',
`sort_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Sort By',
`no_results` int(10) NULL DEFAULT NULL COMMENT 'No. of Results',
`params` longtext  NULL COMMENT 'Params',
`marked_as_deleted` varchar(1)  NULL DEFAULT NULL,
`query_string` longtext  NULL,
`refine_by` longtext  NULL,
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Search Statistics' ROW_FORMAT = Dynamic;

-- mmis->SEARCH_STAT_KEYWORD
drop table if exists `biz_mmis_search_stat_keyword`;
CREATE TABLE `biz_mmis_search_stat_keyword`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `search_stat_id` bigint(10) NOT NULL COMMENT 'Search Statistics ID',
 `typ` varchar(200)  NULL DEFAULT NULL COMMENT 'Type	Field not needed anymore.',
 `val` text  NOT NULL COMMENT 'Value',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Search Statistics Keyword' ROW_FORMAT = Dynamic;


-- mmis->SVC_USAGE_STAT
drop table if exists `biz_mmis_service_usage_stat`;
CREATE TABLE `biz_mmis_service_usage_stat`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `acs_dt` datetime NOT NULL COMMENT 'Access Date',
 `svc` varchar(5)  NOT NULL COMMENT 'Service',
 `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
 `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Service Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->WEBPAGE_USAGE_STAT
drop table if exists `biz_mmis_webpage_usage_stat`;
CREATE TABLE `biz_mmis_webpage_usage_stat`  (
`id` bigint(20) NOT NULL  COMMENT 'ID',
`acs_dt` datetime NOT NULL COMMENT 'Access Date',
`webpage_url` varchar(250)  NOT NULL COMMENT 'Webpage URL',
`acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
`acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access Library',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Webpage Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->WEBPAGE_USG_STAT_SUMMARY
drop table if exists `biz_mmis_webpage_usg_stat_summary`;
CREATE TABLE `biz_mmis_webpage_usg_stat_summary`  (
`id` bigint(20) NOT NULL  COMMENT 'ID',
`acs_dt` datetime NOT NULL,
`webpage_url` varchar(250)  NULL DEFAULT NULL,
`acs_method` varchar(1)  NULL DEFAULT NULL,
`acs_library` varchar(20)  NULL DEFAULT NULL,
`total` int(10) NULL DEFAULT NULL,
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Webpage Usage Statistics Summary' ROW_FORMAT = Dynamic;


-- mmis->WS_LINK_USAGE_STAT
drop table if exists `biz_mmis_workstation_link_usage_stat`;
CREATE TABLE `biz_mmis_workstation_link_usage_stat`  (
  `id` bigint(20) NOT NULL  COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `web_link` varchar(250)  NOT NULL COMMENT 'Web Link',
  `acs_method` varchar(5)  NULL DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20)  NULL DEFAULT NULL COMMENT 'Access LIbrary',
  `workstation_id` varchar(20)  NULL DEFAULT NULL COMMENT 'Workstation ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Workstation Weblink Usage Statistics' ROW_FORMAT = Dynamic;

-- mmis->CONTENT_SUMMARY
drop table if exists `biz_mmis_content_summary`;
CREATE TABLE `biz_mmis_content_summary`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `mon_yr` varchar(7)  NOT NULL COMMENT 'Month',
 `media_type` varchar(20)  NULL DEFAULT NULL COMMENT 'Media Type',
 `stg_lvl` varchar(1)  NULL DEFAULT NULL COMMENT 'Storage Level',
 `cat_grp` varchar(250)  NULL DEFAULT NULL COMMENT 'Category',
 `no_catalogue` int(10) NOT NULL COMMENT 'No. of Catalogue',
 `no_holding` int(10) NOT NULL COMMENT 'No. of Holding',
 `no_digitised_hr` int(10) NOT NULL COMMENT 'No. of Digitised Hours',
 `no_page_digitised_images` int(10) NOT NULL COMMENT 'No. of Page of Digitised Images',
 `collection` varchar(250)  NULL DEFAULT NULL COMMENT 'Collection',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Summary' ROW_FORMAT = Dynamic;


-- mmis->CONTENT_HIGHLIGHT_SUMMARY
drop table if exists `biz_mmis_content_highlight_summary`;
CREATE TABLE `biz_mmis_content_highlight_summary`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `acs_dt` datetime NULL DEFAULT NULL,
 `acs_hr` int(2) NULL DEFAULT NULL,
 `bib_no` varchar(20)  NULL DEFAULT NULL,
 `content_lvl` bigint(11) NULL DEFAULT NULL,
 `cat_ctrl_misc_id` varchar(20)  NULL DEFAULT NULL,
 `col_value` text  NULL,
 `dspace_item_subj_hdg` bigint(22) NULL DEFAULT NULL,
 `acs_method` varchar(1)  NULL DEFAULT NULL,
 `media_type` varchar(20)  NULL DEFAULT NULL,
 `total` int(10) NULL DEFAULT NULL,
 `title` text  NULL,
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Highlight Summary' ROW_FORMAT = Dynamic;

-- mmis->TAC_ACCS_CTRL 对应
drop table if exists `biz_mmis_access_rule`;
CREATE TABLE `biz_mmis_access_rule`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID rule id',
 `ac_rule_id` bigint(20) NOT NULL COMMENT 'Rule ID',
 `ac_rule_type` varchar(10)  NOT NULL COMMENT 'Rule Type	Rule Type C - Content Type W - Workstation Type L - Location Type',
 `ac_usr_grp` varchar(20)  NULL DEFAULT NULL COMMENT 'Patron Group',
 `ac_ws_grp` varchar(20)  NULL DEFAULT NULL COMMENT 'Restricted Workstation Group	Workstation Group Not Accessible',
 `ac_cnt_grp` varchar(20)  NULL DEFAULT NULL COMMENT 'Restricted Content Group	Content Group Not Accessible',
 `ac_remarks` varchar(254)  NOT NULL COMMENT 'Remarks (English) English Remarks',
 `ac_remarks_ch` varchar(254)  NOT NULL COMMENT 'Remarks (Chinese) Chinese Remarks',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Access Control Rules' ROW_FORMAT = Dynamic;

-- mmis->TUR_GROUP 对应
drop table if exists `biz_mmis_patron_group`;
CREATE TABLE `biz_mmis_patron_group`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `ur_group_code` varchar(20)  NOT NULL COMMENT 'Patron Group Code',
 `ur_group_desc` varchar(80)  NOT NULL COMMENT 'Patron Group Description',
 `ur_group_cdesc` varchar(80)  NULL DEFAULT NULL COMMENT 'Patron Group Chinese Description',
 `ur_type` varchar(1)  NOT NULL COMMENT 'Patron Type G - Guest L - Register Library Card Holder R - Research',
 `ur_loc` varchar(1)  NOT NULL COMMENT 'Access Location	I - Internet H - HKPL',
 `ur_age_group` varchar(20)  NULL DEFAULT NULL COMMENT 'Age Group',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Patron Group' ROW_FORMAT = Dynamic;

-- mmis->CONTENT_GROUP 对应
drop table if exists `biz_mmis_content_group`;
CREATE TABLE `biz_mmis_content_group`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `cg_code` varchar(20)  NOT NULL COMMENT 'Content Group Code',
 `cg_desc` varchar(100)  NOT NULL COMMENT 'Content Group Description',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Content Group' ROW_FORMAT = Dynamic;


-- mmis>TAG_GROUP
drop table if exists `biz_mmis_tag_group`;
CREATE TABLE `biz_mmis_tag_group`  (
   `id` bigint(20) NOT NULL COMMENT 'Age Group Code',
   `ag_group` varchar(20)  NOT NULL COMMENT 'Age Group Code',
   `ag_desc` varchar(80)  NOT NULL COMMENT 'Age Group Description',
   `ag_st_age` int(7) NOT NULL COMMENT 'Starting Age (<=  this Age group)',
   `ag_ed_age` int(7) NOT NULL COMMENT 'Ending Age (>  this Age group)',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Age Group' ROW_FORMAT = Dynamic;


-- MMIS ->COUNTRY
drop table if exists `biz_common_country`;
CREATE TABLE `biz_common_country`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(75)  NULL DEFAULT NULL COMMENT 'Country Name',
  `a2` varchar(75)  NULL DEFAULT NULL,
  `a3` varchar(75)  NULL DEFAULT NULL,
  `number_` varchar(75)  NULL DEFAULT NULL,
  `idd_` varchar(75)  NULL DEFAULT NULL,
  `ziprequired` int(1) NULL DEFAULT NULL,
  `active_` int(1) NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Country' ROW_FORMAT = Dynamic;

-- MMIS ->REGION
drop table if exists `biz_common_region`;
CREATE TABLE `biz_common_region`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `country_id` bigint(20) NULL DEFAULT NULL COMMENT 'Country Id',
   `region_code` varchar(75)  NULL DEFAULT NULL COMMENT 'Country Code',
   `name` varchar(75)  NULL DEFAULT NULL COMMENT 'Region Name',
   `active_` int(1) NULL DEFAULT NULL,
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Region' ROW_FORMAT = Dynamic;

-- MMIS>ITEM_TOC
drop table if exists `biz_mmis_item_toc`;
CREATE TABLE `biz_mmis_item_toc`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `db_status` varchar(10) NOT NULL COMMENT 'Status	Possible Values: Conversion Production Checkout',
  `dspace_item_id` bigint(22) NULL DEFAULT NULL COMMENT 'Dspace Item Id	Item ID of the owning Item in DSpace',
  `item_id` bigint(20) NOT NULL COMMENT 'Item Id	Item ID of the owning Catalogue Record',
  `seq_no` int(9) NOT NULL COMMENT 'Sequence No',
  `chi_descrip` varchar(250) NULL DEFAULT NULL COMMENT 'Chinese Description',
  `eng_descrip` varchar(250) NULL DEFAULT NULL COMMENT 'English Description',
  `process` varchar(128) NULL DEFAULT NULL COMMENT 'Process',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Table of Contents' ROW_FORMAT = Dynamic;

-- MMIS>ITEM_REL_DOCS
drop table if exists `biz_mmis_item_rel_docs`;
CREATE TABLE `biz_mmis_item_rel_docs`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `item_id` bigint(20) NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
  `doc_name` varchar(100) NOT NULL COMMENT 'Document Name',
  `doc_location` varchar(250) NOT NULL COMMENT 'Document Location	Location of the document in the SAN',
  `file_size` int(10) NOT NULL COMMENT 'File Size',
  `status` varchar(2) NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Item Related Documents' ROW_FORMAT = Dynamic;

-- MMIS>WS_USAGE_SUMMARY
drop table if exists `biz_mmis_usage_summary`;
CREATE TABLE `biz_mmis_usage_summary`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `dt` datetime NOT NULL COMMENT 'Date',
  `hour_09` bigint(5) NULL DEFAULT NULL COMMENT '09:00',
  `hour_10` bigint(5) NULL DEFAULT NULL COMMENT '10:00',
  `hour_11` bigint(5) NULL DEFAULT NULL COMMENT '11:00',
  `hour_12` bigint(5) NULL DEFAULT NULL COMMENT '12:00',
  `hour_13` bigint(5) NULL DEFAULT NULL COMMENT '13:00',
  `hour_14` bigint(5) NULL DEFAULT NULL COMMENT '14:00',
  `hour_15` bigint(5) NULL DEFAULT NULL COMMENT '15:00',
  `hour_16` bigint(5) NULL DEFAULT NULL COMMENT '16:00',
  `hour_17` bigint(5) NULL DEFAULT NULL COMMENT '17:00',
  `hour_18` bigint(5) NULL DEFAULT NULL COMMENT '18:00',
  `hour_19` bigint(5) NULL DEFAULT NULL COMMENT '19:00',
  `hour_20` bigint(5) NULL DEFAULT NULL COMMENT '20:00',
  `ws_usage_summary_id` bigint(22) NOT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Usage Summary' ROW_FORMAT = Dynamic;

-- MMIS>BATCH_ITEM
drop table if exists `biz_mmis_batch_item`;
CREATE TABLE `biz_mmis_batch_item`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `batch_id` bigint(20) NOT NULL COMMENT 'Batch Id	ID of the parent Batch Upload record',
   `batch_item_status` varchar(2) NOT NULL COMMENT 'Batch Item Status	Status of the batch item:  For Batch Type ER: NW - New VN - Verified (New) CO - Checked-out VR - Verified (Removed) CI - Checked-in RM - Removed  For Batch Type AR: NW - New CI - Confirmed - Inserted CU - Confirmed - Updated VD - Validation Failed - Duplicate Record VN - Validation Failed - Non-existent Record VI - Validation Failed - Invalid See From  For type FL and MT: NW - New VN - Verified (New) TR - To Be Removed RM - Removed CO - Checked-out VC - Verified (Checked-out) VR - Verified (Removed) CI - Checked-in TB - To Be Rolled Back RB - Rolled Back',
   `type` varchar(10) NOT NULL COMMENT 'Batch Item Type	Possible Values: CR - Catalogue HR - Holding AR - Authority CT - Content',
   `ref_id` varchar(30) NOT NULL COMMENT 'Batch Item Type ID	ID of the type record (e.g. Catalogue Record.Item ID if the Batch Item Type is Catalogue)',
   `obj_ref_id` varchar(10) NULL DEFAULT NULL COMMENT 'Original Object ID	Object ID of the Digitised Object record applicable only for Batch Item Type = Content during checkout.',
   `eresrc_action` varchar(1) NULL DEFAULT NULL COMMENT 'e-Resource Action	For e-Resource Batch items only.  I - For Insertion U - For Update D - For Delete',
   `auth_action` varchar(1) NULL DEFAULT NULL COMMENT 'Authority Action	For Authority Batch items only. I - For Insertion U - For Update',
   `watermark` varchar(1) NULL DEFAULT NULL,
   `content_status` varchar(2) NULL DEFAULT NULL,
   `main_content_count` bigint(20) NULL DEFAULT NULL,
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Batch Item' ROW_FORMAT = Dynamic;

-- MMIS> BATCH_UPLOAD_MATERIAL_TYPE
drop table if exists `biz_mmis_batch_upload_type`;
CREATE TABLE `biz_mmis_batch_upload_type`  (
    `id` bigint(20) NOT NULL COMMENT 'id',
    `material_type` varchar(20) NOT NULL COMMENT 'Material Type Id	PK for Material Type',
    `material_type_value` varchar(200) NOT NULL COMMENT 'Material Type Value	Value displayed in screen',
    `sort_order` int(12) NOT NULL COMMENT 'Sort Order used for sorting table values',
    `storage_lvl` varchar(20) NULL DEFAULT NULL COMMENT 'Storage Level	storage level for material type L1 - Level1 L2 - Level2 L3 - Level3',
    `av_indicator` varchar(1) NULL DEFAULT NULL COMMENT 'Audio/Video Indicator	indicates if Material type is Audio/Video',
    `watermark` varchar(1) NULL DEFAULT NULL COMMENT 'Watermark	indicates if material type can be optionally be watermarked',
    `upload_folder` varchar(100) NULL DEFAULT NULL COMMENT 'Upload Folder	upload folder used in shared storage upload',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Batch Upload Material Type' ROW_FORMAT = Dynamic;

-- MMIS>PART_INFO
drop table if exists `biz_mmis_part_info`;
CREATE TABLE `biz_mmis_part_info`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`db_status` varchar(10) NOT NULL COMMENT 'DB Status	Possible Values: Production Checkout',
`item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Item ID	Reference to owning Item Id in Conversion DB',
`dspace_item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Dspace Item Id	Reference to owning Item Id in Dspace DB',
`vol` int(11) NOT NULL COMMENT 'Volume',
`bib_no` varchar(20) NOT NULL COMMENT 'Bib. No.	Bib No. of  the media.',
`eng_descrip` varchar(80) NULL DEFAULT NULL COMMENT 'English Description of  the Part.',
`chi_descrip` varchar(80) NULL DEFAULT NULL COMMENT 'Chinese Description of the Part',
`media_type` varchar(20) NOT NULL COMMENT 'Media Type	Affect the player used to play this media, if assigned wrongly, the media cannot be played.',
`media_std` varchar(20) NULL DEFAULT NULL COMMENT 'Media Standard	Media Standard of this Part, only for VHS',
`cntrl_grp` text NOT NULL COMMENT 'Content Group	Used for access control',
`stg_lvl` int(11) NOT NULL COMMENT 'Storage Level	Level 1/level 2/level 3',
`has_2sides` varchar(1) NULL DEFAULT NULL COMMENT 'Two-sided	When it is a two sided media',
`lic_no` int(11) NOT NULL COMMENT 'Total No. of Concurrent License	For Level 1, this number can be set to the maximum number of concurrent streams.  However, resource limitations and actual licensing consideration will affect the maximum that can be set. For level  2 :this number is the number of  copies of this part in jukebox. Note: All copies of a part should be put in the same jukebox for application to do load balancing.',
`hkcl_lic` int(11) NULL DEFAULT NULL COMMENT 'HKCL License	No. of licenses allocated to HKCL',
`all_branch_lic` int(11) NULL DEFAULT NULL COMMENT 'All Branches License	No. of licenses allocated to all branches',
`internet_lic` int(11) NULL DEFAULT NULL COMMENT 'Internet License	No. of licenses allocated to Internet',
`copy_no` int(11) NOT NULL COMMENT 'Number of Copies	The number of copies for this part',
`sub_part` int(11) NOT NULL COMMENT 'Number of Sub-Parts	The number of sub-part for this part',
`duration` int(7) NULL DEFAULT NULL COMMENT 'Duration (in min.)	The time allocated for this media to play. It can be different from the real media play time.',
`media_loc` varchar(20) NOT NULL COMMENT 'Media Location	Actually it is a media location field. For level 1, it is the SAN storage system. For level 2, it is the jukebox ID.  For level 3, it is the floor location which  defines the floor location of this object.  It will be used to decide which player to play this media.',
`locked_by` varchar(20) NULL DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Part Information' ROW_FORMAT = Dynamic;

-- MMIS>SEARCH_STAT_SUMMARY
drop table if exists `biz_mmis_search_stat_summary`;
CREATE TABLE `biz_mmis_search_stat_summary`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`search_dt` datetime NOT NULL COMMENT 'Search date',
`search_type` varchar(10) NULL DEFAULT NULL COMMENT 'Search type',
`search_keyword` text NULL COMMENT 'Search keyword',
`acs_method` varchar(5) NULL DEFAULT NULL COMMENT 'Access method',
`total_count` int(10) NOT NULL COMMENT 'Total count',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Search Stat Summary' ROW_FORMAT = Dynamic;

-- MMIS>COVERPAGE_USAGE_SUMMARY
drop table if exists `biz_mmis_coverpage_usage_summary`;
CREATE TABLE `biz_mmis_coverpage_usage_summary`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `acs_dt` datetime NOT NULL COMMENT 'Access Date',
 `dly_hr` varchar(2) NULL DEFAULT NULL COMMENT 'Daily hour',
 `collection` varchar(250) NULL DEFAULT NULL COMMENT 'Collection',
 `media_type` varchar(20) NULL DEFAULT NULL COMMENT 'Media type',
 `acs_method` varchar(5) NULL DEFAULT NULL COMMENT 'Access method',
 `acs_library` varchar(20) NULL DEFAULT NULL COMMENT 'Access library',
 `content_grp_auth` varchar(20) NULL DEFAULT NULL COMMENT 'Content group auth',
 `total_count` int(10) NULL DEFAULT NULL COMMENT 'Total count',
 `cat_grp` varchar(20) NULL DEFAULT NULL COMMENT '',
 `oaipmh_src` int(10) NULL DEFAULT NULL COMMENT 'OAIPMH src',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Coverpage Usage Summary' ROW_FORMAT = Dynamic;

-- MMIS>WORKING_PART_INFO
drop table if exists `biz_mmis_working_part_info`;
CREATE TABLE `biz_mmis_working_part_info`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `db_status` varchar(10) NOT NULL COMMENT 'DB Status	Possible Values: Production Checkout',
 `item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Item ID	Reference to owning Item Id in Conversion DB',
 `dspace_item_id` bigint(20) NULL DEFAULT NULL COMMENT 'Dspace Item Id	Reference to owning Item Id in Dspace DB',
 `batch_id` bigint(220) NOT NULL COMMENT 'Batch ID	Batch ID that owns the Working Part Info',
 `part_id` varchar(20) NOT NULL COMMENT 'Part ID	The Part ID is the external key for identifying MMIS parts.   It is generated by MMIS as a running sequence number when the part is released together with it associated item into MMIS.  Only playable objects required licensing control need to be defined in this table.',
 `vol` int(11) NOT NULL COMMENT 'Volume',
 `bib_no` varchar(20) NOT NULL COMMENT 'Bib. No.	Bib No. of  the media.',
 `eng_descrip` varchar(80) NULL DEFAULT NULL COMMENT 'English Description	English Description of  the Part.',
 `chi_descrip` varchar(80) NULL DEFAULT NULL COMMENT 'Chinese Description	Chinese Description of the Part',
 `media_type` varchar(20) NOT NULL COMMENT 'Media Type	Affect the player used to play this media, if assigned wrongly, the media cannot be played.',
 `media_std` varchar(20) NULL DEFAULT NULL COMMENT 'Media Standard	Media Standard of this Part, only for VHS',
 `cntrl_grp` text NOT NULL COMMENT 'Content Group	Used for access control',
 `stg_lvl` int(11) NOT NULL COMMENT 'Storage Level	Level 1/level 2/level 3',
 `has_2sides` varchar(1) NULL DEFAULT NULL COMMENT 'Two-sided	When it is a two sided media',
 `lic_no` int(11) NOT NULL COMMENT 'Total No. of Concurrent License	For Level 1, this number can be set to the maximum number of concurrent streams.  However, resource limitations and actual licensing consideration will affect the maximum that can be set. For level  2 :this number is the number of  copies of this part in jukebox. Note: All copies of a part should be put in the same jukebox for application to do load balancing.',
 `hkcl_lic` int(11) NULL DEFAULT NULL COMMENT 'HKCL License	No. of licenses allocated to HKCL',
 `all_branch_lic` int(11) NULL DEFAULT NULL COMMENT 'All Branches License	No. of licenses allocated to all branches',
 `internet_lic` int(11) NULL DEFAULT NULL COMMENT 'Internet License	No. of licenses allocated to Internet',
 `copy_no` int(11) NOT NULL COMMENT 'Number of Copies	The number of copies for this part',
 `sub_part` int(11) NOT NULL COMMENT 'Number of Sub-Parts	The number of sub-part for this part',
 `duration` int(7) NULL DEFAULT NULL COMMENT 'Duration (in min.)	The time allocated for this media to play. It can be different from the real media play time.',
 `media_loc` varchar(20) NOT NULL COMMENT 'Media Location	Actually it is a media location field. For level 1, it is the SAN storage system. For level 2, it is the jukebox ID.  For level 3, it is the floor location which  defines the floor location of this object.  It will be used to decide which player to play this media.',
 `locked_by` varchar(20) NULL DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Working Part Information' ROW_FORMAT = Dynamic;

-- MMIS>SUBPART
drop table if exists `biz_mmis_sub_part`;
CREATE TABLE `biz_mmis_sub_part`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `part_id` varchar(20) NOT NULL COMMENT 'Part Id	e.g. level 2 song list is a sub-part',
 `descrip` text NOT NULL COMMENT 'Sub-Part Description	Description of the sub-part',
 `seq_no` int(10) NOT NULL COMMENT 'Sub-Part No.	Sequence Number of the sub-part',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SubPart' ROW_FORMAT = Dynamic;

-- MMIS>PLAY_HIST
drop table if exists `biz_mmis_play_hist`;
CREATE TABLE `biz_mmis_play_hist`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`item_id` bigint(20) NOT NULL COMMENT 'Item ID',
`login_id` varchar(50) NULL DEFAULT NULL COMMENT 'Login ID',
`session_id` varchar(50) NULL DEFAULT NULL COMMENT 'Session ID',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Play History' ROW_FORMAT = Dynamic;

-- MMIS>WORKING_DIGITISED_OBJ
drop table if exists `biz_mmis_working_digitised_obj`;
CREATE TABLE `biz_mmis_working_digitised_obj`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`batch_id` bigint(20) NOT NULL COMMENT 'Batch Id	reference to owning batch',
`item_id` bigint(20) NOT NULL COMMENT 'Item Id	reference to owning catalog',
`seq_no` int(9) NOT NULL COMMENT 'Sequence No	reference to TOC record',
`ds_id` varchar(8) NOT NULL COMMENT 'Datastream Id	unique id',
`cntrl_grp` varchar(250) NULL DEFAULT NULL COMMENT 'Content Group	reference to catalog content group',
`no_of_pages` int(8) NULL DEFAULT NULL COMMENT 'No. of Pages	page count for pdf',
`rtl_seq` varchar(1) NULL DEFAULT NULL COMMENT 'Right to Left Page Sequence flag		Applicable only for ebook contents, flag to determine if content has right to left page sequence, values \'Y\' or null ',
`disp_seq_no` int(3) NULL DEFAULT NULL COMMENT 'Displayed Sequence No.		Applicable only for multiple image content: - Newspaper clippings - UR & RC archive - Old HK Newspaper - House Programme This will represent the order/sequence of the images when viewed using the image custom viewer',
`object_type` varchar(20) NOT NULL COMMENT 'Object Type	refernce to content object type',
`locked_by` varchar(20) NULL DEFAULT NULL COMMENT 'Locked By	Locked By ',
`converted` varchar(1) NULL DEFAULT NULL COMMENT 'Converted	flag if Digitised object is coverted Y converted else N',
`file_size` int(10) NULL DEFAULT NULL COMMENT 'File Size	File Size ',
`x_position` int(2) NULL DEFAULT NULL COMMENT 'X Position	X Position ',
`y_position` int(2) NULL DEFAULT NULL COMMENT 'Y Position	Y Position ',
`ds_ref` varchar(250) NULL DEFAULT NULL COMMENT 'Datastream reference	Location of the digitised object in the server ',
`pdf_color` varchar(1) NULL DEFAULT NULL,
`pdf_dpi` int(4) NULL DEFAULT NULL,
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Working Digitised Object' ROW_FORMAT = Dynamic;

-- MMIS>POPULAR_CONTENT_SUMM
drop table if exists `biz_mmis_popular_content_summ`;
CREATE TABLE `biz_mmis_popular_content_summ`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `item_id` bigint(20) NOT NULL COMMENT 'Item Id	reference to owning catalog',
   `hit_count` int(10) NULL DEFAULT NULL COMMENT 'hit count ',
   `title` text NULL COMMENT 'hit count ',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Popular Content Summ' ROW_FORMAT = Dynamic;

-- MMIS>TUR_USER_LIB_CARD
drop table if exists `biz_mmis_lib_card`;
CREATE TABLE `biz_mmis_lib_card`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`ur_id` varchar(20) NOT NULL COMMENT 'Patron ID	Patron ID',
`lib_card_no` varchar(20) NOT NULL COMMENT 'Library Card Number	Library Card No of Patron',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Patron Library Card' ROW_FORMAT = Dynamic;

-- MMIS>FAV_CONTENT
drop table if exists `biz_mmis_fav_content`;
CREATE TABLE `biz_mmis_fav_content`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `item_id` bigint(20) NOT NULL COMMENT 'Item ID	Item ID - Mapped to Catalogue Record.Item ID',
  `login_id` varchar(50) NULL DEFAULT NULL COMMENT 'Login ID ',
  `session_id` varchar(50) NULL DEFAULT NULL COMMENT 'Session ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Favourite Content' ROW_FORMAT = Dynamic;

-- MMIS>TUR_USER
drop table if exists `biz_mmis_patron_profile`;
CREATE TABLE `biz_mmis_patron_profile`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `ur_id` varchar(20) NOT NULL COMMENT 'Patron ID ',
 `ur_login_id` bigint(20) NULL DEFAULT NULL COMMENT 'Portal Login ID',
 `ur_ss_login_id` bigint(20) NULL DEFAULT NULL COMMENT 'Self-Serve Login ID	Self-Serve Login ID',
 `ur_fname` varchar(40) NOT NULL COMMENT 'Patron Name',
 `ur_phone_num` varchar(20) NOT NULL COMMENT 'Phone Number(s)	Phone Number',
 `ur_sms_activate` varchar(1) NULL DEFAULT NULL COMMENT 'SMS Activation	SMS Activation Y - Yes N - No',
 `ur_email` varchar(160) NULL DEFAULT NULL COMMENT 'Email Address',
 `ur_email_activate` varchar(1) NULL DEFAULT NULL COMMENT 'Email Activation	Email Activation Y - Yes N - No',
 `ur_libno` varchar(200) NOT NULL COMMENT 'Library Card Number(s)	Library no of patron',
 `pref_ws_grp` varchar(20) NULL DEFAULT NULL COMMENT 'Preferred Workstation Group',
 `pref_lib_code` varchar(20) NULL DEFAULT NULL COMMENT 'Preferred Library',
 `ur_email_notif` varchar(1) NULL DEFAULT NULL,
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Patron Profile' ROW_FORMAT = Dynamic;

-- MMIS->AUTH_NAME_SEE_ALSO_FR
drop table if exists `biz_mmis_auth_name_fr`;
CREATE TABLE `biz_mmis_auth_name_fr`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `ctrl_name_id` varchar(8) NOT NULL COMMENT 'Controlled Name ID	Parent Controlled Name record',
 `rel_auth_name_id` varchar(8) NOT NULL COMMENT 'Related Authority Name ID	See Also From (FK to other Controlled Name records)',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'See Also From Name' ROW_FORMAT = Dynamic;

-- MMIS->AUTH_UNIF_SEE_FR
drop table if exists `biz_mmis_auth_unif_fr`;
CREATE TABLE `biz_mmis_auth_unif_fr`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `ctrl_unif_title_id` varchar(8) NOT NULL COMMENT 'Controlled Uniform Title ID	Parent Controlled Name record',
  `see_fr_descrip` varchar(50) NOT NULL COMMENT 'See From Description	See From Description',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'See From Uniform Title' ROW_FORMAT = Dynamic;


-- MMIS>HOLDING_BATCH
drop table if exists `biz_mmis_holding_batch`;
CREATE TABLE `biz_mmis_holding_batch`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `upl_mode` varchar(2) NOT NULL  COMMENT 'Upload Mode',
  `status` varchar(2) NOT NULL COMMENT 'Status',
  `descrip` varchar(200) NULL DEFAULT NULL COMMENT 'Desc',
  `material_type` varchar(20) NOT NULL COMMENT 'Material Type',
  `category_auth` varchar(20) NULL DEFAULT NULL COMMENT 'Category Auth',
  `cms08_batch_id` bigint(20) NULL DEFAULT NULL,
  `cms09_batch_id` bigint(20) NULL DEFAULT NULL,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Holding Batch' ROW_FORMAT = Dynamic;

-- MMIS>WORKSTATION
drop table if exists `biz_mmis_workstation`;
CREATE TABLE `biz_mmis_workstation`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`ws_mode` varchar(1) NOT NULL COMMENT 'Workstation Mode	Workstation Mode P - Patron Workstation F - Frontdesk Workstation (for Staff)',
`ws_grp_id` varchar(20) NOT NULL COMMENT 'Workstation Group	ID of the workstation group which the workstation belongs to',
`machine_name` varchar(24) NOT NULL COMMENT 'Machine Name	Machine Name of the workstation',
`ip_add` varchar(40) NULL DEFAULT NULL COMMENT 'IP Address	IP address of the workstation',
`loc_cd` varchar(20) NOT NULL COMMENT 'Location Code	Code of the location of the workstation',
`lock_reset_dt` datetime NULL DEFAULT NULL COMMENT 'Locking Reset Date	Dtae and Time when locking count was manually reset',
`shut_sched` datetime NULL DEFAULT NULL COMMENT 'Shutdown Schedule	Shutdown Schedule',
`ref_db_file` longblob NULL COMMENT 'Reference Database File	Reference Database File',
`ref_db_filename` varchar(50) NULL DEFAULT NULL COMMENT 'Reference Database Filename	Filename of Reference Database File',
`attached_player1` varchar(20) NULL DEFAULT NULL COMMENT 'Attached Player 1	ID of the 1st attached player used to play Level 3 media.',
`attached_player2` varchar(20) NULL DEFAULT NULL COMMENT 'Attached Player 2	ID of the 2nd attached player used to play Level 3 media.',
`switch_port_id` varchar(20) NULL DEFAULT NULL COMMENT 'Switch Port ID	The A/V switch Out-port to which the Workstation is attached.',
`media_loc_l3_op` varchar(6) NULL DEFAULT NULL COMMENT 'Media Location for Level 3 Operation	UMPS06 / UMPS10',
`remarks` varchar(200) NULL DEFAULT NULL COMMENT 'Remarks',
`av_switch` varchar(1) NULL DEFAULT NULL,
`auto_print_ind` varchar(1) NULL DEFAULT NULL,
`ref_db_file_chi` longblob NULL,
`ref_db_file_schi` longblob NULL,
`ref_db_type` varchar(1) NULL DEFAULT NULL,
`ref_db_url` varchar(200) NULL DEFAULT NULL,
`ref_db_url_chi` varchar(200) NULL DEFAULT NULL,
`ref_db_url_schi` varchar(200) NULL DEFAULT NULL,
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Workstation' ROW_FORMAT = Dynamic;

-- MMIS>BATCH_LIST
drop table if exists `biz_mmis_batch_list`;
CREATE TABLE `biz_mmis_batch_list`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `batch_id` varchar(20) NOT NULL,
   `batch_mode` varchar(40) NULL DEFAULT NULL,
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Batch List' ROW_FORMAT = Dynamic;

-- MMIS>TUR_STAFF
drop table if exists `biz_mmis_staff_user`;
CREATE TABLE `biz_mmis_staff_user`  (
    `id` bigint(20) NOT NULL COMMENT 'id',
    `sf_id` varchar(20) NOT NULL COMMENT 'Staff ID',
    `sf_remark` varchar(254) NULL DEFAULT NULL COMMENT 'Remarks',
    `all_lib_rights` varchar(1) NOT NULL COMMENT 'All Library Rights	All Library Rights Y - Yes N - No',
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Staff User Profile' ROW_FORMAT = Dynamic;

-- MMIS>AUTH_MARC_MAPPING
drop table if exists `biz_mmis_auth_marc_mapping`;
CREATE TABLE `biz_mmis_auth_marc_mapping`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`auth_type` varchar(2) NOT NULL COMMENT 'Authority Type	NM - Name SJ - Subject UT - Uniform Title ST - Series Title',
`auth_field` varchar(20) NOT NULL COMMENT 'Authority Field	Possible values:  ID AUTH SEE_FR SEE_ALSO_FR',
`marc_format` varchar(20) NOT NULL COMMENT 'Marc Format	Format of MARC file:  MARC21 CNMARC etc？K.',
`marc_field_notation` varchar(100) NULL DEFAULT NULL COMMENT 'Marc Field Notation	string containing a MARC field notation in the ff. format:  [3 characters field][optional 2 characters indicators][optional subfields, each subfield preceded by a \'$\']  examples:    *    100       - field 100, no indicators, no subfields    *    100##$a$b - field 100, no indicators, with subfields a & b    *    1001#$a$b - field 100, with ind1 = 1, no indicator 2, with subfields a & b    *    10010$a$b - field 100, with ind1 = 1, ind2 = 0, with subfields a & b',
`handler_class` varchar(100) NULL DEFAULT NULL COMMENT 'HandlerClass	Fully qualified class name of mapping handler. This is for special cases. Do not specify any for normal cases.',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Authority Marc Mapping' ROW_FORMAT = Dynamic;


-- MMIS>BATCH_ITEM_STATUS
drop table if exists `biz_mmis_batch_item_status`;
CREATE TABLE `biz_mmis_batch_item_status`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `status_code` varchar(2) NOT NULL COMMENT 'Status Code',
   `status_name` varchar(50) NOT NULL COMMENT 'Status Name',
   `batch_item_type` varchar(2) NOT NULL COMMENT 'Batch Item Type',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Batch Item Status' ROW_FORMAT = Dynamic;


-- MMIS>TMS_GROUP
drop table if exists `biz_mmis_code_group`;
CREATE TABLE `biz_mmis_code_group`  (
   `id` bigint(20) NOT NULL COMMENT 'id',
   `ms_group_type` varchar(20) NOT NULL COMMENT 'Group Type	Group Type STAFFGROUP - Staff Group PLOCATION - Player Location WSLOCATION - Workstation Location LLOCATION - Library Location',
   `ms_group_code` varchar(20) NOT NULL COMMENT 'Group Code',
   `ms_group_desc` varchar(80) NOT NULL COMMENT 'Group Description',
   `ms_group_cdesc` varchar(80) NULL DEFAULT NULL COMMENT 'Group Chinese Description',
   `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
   `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
   `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
   `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
   `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
   `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
   `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Code Group' ROW_FORMAT = Dynamic;

-- MMIS>AUTH_SUBJLOCDIST
drop table if exists `biz_mmis_auth_subjlocdist`;
CREATE TABLE `biz_mmis_auth_subjlocdist`  (
    `id` bigint(20) NOT NULL COMMENT 'id',
    `ctrl_subj_loc_dist_id` varchar(8) NOT NULL,
    `tier1` varchar(250) NOT NULL,
    `tier2` varchar(250) NULL DEFAULT NULL,
    `tier3` varchar(250) NULL DEFAULT NULL,
    `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
    `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
    `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
    `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
    `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
    `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
    `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Authority ' ROW_FORMAT = Dynamic;

-- MMIS>LIBRARY_GROUP
drop table if exists `biz_mmis_library_group`;
CREATE TABLE `biz_mmis_library_group`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `lib_group_code` varchar(20) NOT NULL COMMENT 'Library Group Code',
  `lib_group_name` varchar(80) NOT NULL COMMENT 'Library Group Name',
  `lib_group_type` varchar(20) NOT NULL COMMENT 'Library Group Type	Library Group Type G - Geographic District L - Library Type',
  `lib_group_cname` varchar(80) NOT NULL COMMENT 'Library Group Chinese Name',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Library Group' ROW_FORMAT = Dynamic;

-- MMIS>RECOMMENDED_ITEMS
drop table if exists `biz_mmis_recommended_item`;
CREATE TABLE `biz_mmis_recommended_item`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`recommended` text NOT NULL COMMENT 'Recommended Record',
`type` varchar(1) NOT NULL COMMENT 'Type',
`collection` varchar(100) NULL DEFAULT NULL COMMENT 'Collection',
`highlight_topic_id` bigint(20) NULL DEFAULT NULL COMMENT 'Content Highlight Topic ID',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Recommended Items' ROW_FORMAT = Dynamic;

-- MMIS>NOTIF_TEMPLATE
drop table if exists `biz_mmis_notif_template`;
CREATE TABLE `biz_mmis_notif_template`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`template_code` varchar(20) NOT NULL COMMENT 'Template Code',
`template_header` longtext NOT NULL COMMENT 'Template Header',
`template_body` longtext NOT NULL COMMENT 'Template Body',
`template_footer` longtext NOT NULL COMMENT 'Template Footer',
`incl_new_content` varchar(1) NOT NULL COMMENT 'Include New Content Reminder	Include New Content Reminder Y - Yes N - No',
`enabled` varchar(1) NOT NULL COMMENT 'Enabled Indicator	Enabled? Y - Yes N - No',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Patron Notification Template' ROW_FORMAT = Dynamic;


-- MMIS>LIBRARY_PROFILE
drop table if exists `biz_mmis_library_profile`;
CREATE TABLE `biz_mmis_library_profile`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`lib_code` varchar(20) NOT NULL COMMENT 'Library Code',
`lib_name` varchar(80) NOT NULL COMMENT 'Library Name',
`lib_cname` varchar(80) NOT NULL COMMENT 'Library Chinese Name',
`lib_group_code_1` varchar(20) NOT NULL COMMENT 'Geographic District',
`lib_group_code_2` varchar(20) NOT NULL COMMENT 'Library Type',
`lib_address` text NULL COMMENT 'Address',
`ms_group_code` varchar(20) NOT NULL COMMENT 'Location Area Code',
`av_bb_available` varchar(1) NOT NULL COMMENT 'AV Booth Booking Available?	AV Booth Booking Available? Y - Yes N - No',
`total_av_hkcl` int(5) NOT NULL COMMENT 'Total no. of concurrent intranet A/V streams in HKCL	Use label if Library Type is \"Central Library\". Label changed to \"Total no. of concurrent intranet A/V streams in this branch library\" if Library Type is not \"Central Library\".',
`total_av_all` int(5) NULL DEFAULT NULL COMMENT 'Total no. of concurrent intranet A/V streams in all branch libraries	Display only if Library Type is \"Central Library\".',
`total_cd_all` int(5) NULL DEFAULT NULL COMMENT 'Total no. of concurrent CD-ROM playback in all branch libraries	Display only if Library Type is \"Central Library\".',
`lib_prefix` varchar(3) NOT NULL COMMENT 'Library Prefix for Booking	Library Prefix for Booking reference ID',
`max_book_hrs` int(3) NULL DEFAULT NULL COMMENT 'Maximum booking hours (workstation and content) per day	Maximum booking hours (workstation and content) (e.g. 2 hours) per day at a branch library (exclude HKCL)',
`total_cd_lib` int(5) NOT NULL COMMENT 'Total CD Lib	will hold Total no. of concurrent CD-ROM playback in HKCL or in a branch library',
`total_level2_hkcl` int(5) NOT NULL COMMENT 'Total Level 2 in HKCL	will hold Total no. of concurrent Level 2 A/V playback in HKCL (always 0 for branch library).',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Library Profile' ROW_FORMAT = Dynamic;

-- MMIS>Z3950_TARGETS
drop table if exists `biz_mmis_zs_target`;
CREATE TABLE `biz_mmis_zs_target`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`target_url` varchar(20) NOT NULL COMMENT 'Target URL	URL of target in <ip address>:<port> format',
`target_name` varchar(50) NOT NULL COMMENT 'Target Name	Name of the target',
`target_descrip` varchar(200) NULL DEFAULT NULL COMMENT 'Target Description	Description for the target',
`target_db` varchar(50) NULL DEFAULT NULL,
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Z39.50 Targets' ROW_FORMAT = Dynamic;

-- MMIS>HIGHLIGHT_TEMPLATE
drop table if exists `biz_mmis_highlight_template`;
CREATE TABLE `biz_mmis_highlight_template`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`highlight_template_name` varchar(100) NOT NULL COMMENT 'Content Highlight Template Name',
`highlight_template_page` varchar(200) NOT NULL COMMENT 'Content Highlight Template Page',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Content Highlight Template' ROW_FORMAT = Dynamic;

-- MMIS>MV_TO_FLD_MAP_PROPS
drop table if exists `biz_mmis_mapping_props`;
CREATE TABLE `biz_mmis_mapping_props`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`table_name` varchar(30) NULL DEFAULT NULL COMMENT 'Table Name',
`field_name` varchar(30) NULL DEFAULT NULL COMMENT 'Field Name',
`dc_element` varchar(64) NULL DEFAULT NULL COMMENT 'DC Element',
`authority_copy` varchar(1) NULL DEFAULT NULL COMMENT 'Authority',
`dc_qualifier` varchar(64) NULL DEFAULT NULL COMMENT 'DC Qualifier',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Mapping  Props' ROW_FORMAT = Dynamic;

-- DSPACE>BI_4_DIS
drop table if exists `biz_mmis_auth_dis`;
CREATE TABLE `biz_mmis_auth_dis`  (
`id` bigint(20) NOT NULL COMMENT 'id',
`authority` varchar(100) NULL DEFAULT NULL COMMENT 'Authority',
`value` text NULL DEFAULT NULL COMMENT 'Value',
`sort_value` text NULL DEFAULT NULL COMMENT 'Sort Value',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Authority dis' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `biz_mmis_controlled_misc_bib_ref`;
CREATE TABLE `biz_mmis_controlled_misc_bib_ref`  (
                                                 `id` bigint(0) NOT NULL,
                                                 `controlled_misc_id` bigint DEFAULT NULL COMMENT '权威记录 id',
                                                 `catalogue_record_id` bigint DEFAULT NULL COMMENT '书目 ID',
                                                 `org_id` bigint(0) NULL DEFAULT NULL COMMENT 'Org ID',
                                                 `org_name` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT 'Org Name',
                                                 `create_by` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT 'Created by ',
                                                 `create_dt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Create Date',
                                                 `is_delete` smallint(0) NULL DEFAULT 0 COMMENT 'Delete tag',
                                                 `last_upd_by` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                                 `last_upd_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Last Update Date',
                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic COMMENT='权威记录书目关联表';

ALTER TABLE `tcc_drm_dev`.`biz_mmis_controlled_misc`
    ADD COLUMN `share` varchar(50) NULL COMMENT 'Digital Collection Only\r\nHKMP Only\r\nDRM' AFTER `duplicate_metadata`;

ALTER TABLE `tcc_drm_dev`.`biz_mmis_controlled_misc`
    ADD COLUMN `auth_type` varchar(50) NULL COMMENT 'Type of Authority' AFTER `db_status`;