
-- 流媒体监控
drop table if exists `biz_mmis_live_channel`;
CREATE TABLE `biz_mmis_live_channel`  (
                                          `id` bigint(20) NOT NULL COMMENT 'id',
                                          `channel_id` varchar(64) NULL DEFAULT NULL COMMENT 'Channel ID',
                                          `channel_name` varchar(100) NULL DEFAULT NULL COMMENT 'Channel Name',
                                          `stream_url` varchar(100) NULL DEFAULT NULL COMMENT 'Streaming URL',
                                          `stream_key` varchar(100) NULL DEFAULT NULL COMMENT 'Streaming Key',
                                          `playback_file` varchar(100) NULL DEFAULT NULL COMMENT 'Playback file',
                                          `live_duration` varchar(30) NULL DEFAULT NULL COMMENT 'Live Duration',
                                          `concurrent_intranet` int(10) NULL DEFAULT 0 COMMENT 'Concurrent Intranet Viewers',
                                          `intranet_viewer` int(10) NULL DEFAULT 0 COMMENT 'Total Intranet Viewers',
                                          `concurrent_internet` int(10) NULL DEFAULT 0 COMMENT 'Concurrent Internet Viewers',
                                          `internet_viewer` int(10) NULL DEFAULT 0 COMMENT 'Total Internet Viewers',
                                          `start_time` datetime NOT NULL COMMENT 'Live Start Time',
                                          `signal` varchar(30) COMMENT 'Live Signal',
                                          `status` smallint(2) NOT NULL DEFAULT 0 COMMENT 'Live Status:0/Not Started 1/Started 2/Ended',
                                          `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                          `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                          `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                          `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                          `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                          `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                          `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Live Broadcast Channel' ROW_FORMAT = Dynamic;

drop table if exists `biz_mmis_live_channel_viewer`;
CREATE TABLE `biz_mmis_live_channel_viewer`  (
                                                 `id` bigint(20) NOT NULL COMMENT 'id',
                                                 `channel_id` bigint(20) NULL DEFAULT NULL COMMENT 'Channel ID',
                                                 `connect_ip` varchar(30) NULL DEFAULT NULL COMMENT 'Connect IP Address',
                                                 `patron` varchar(30) NOT NULL DEFAULT 'Guest' COMMENT 'Stream Patron',
                                                 `patron_location` varchar(50) NULL DEFAULT NULL COMMENT 'Stream Patron Location',
                                                 `duration` varchar(30) NULL DEFAULT NULL COMMENT 'Connection Duration (S)',
                                                 `start_time` datetime NOT NULL COMMENT 'Stream Start Time',
                                                 `status` smallint(2) NOT NULL DEFAULT 0 COMMENT 'Status:0/Alive 1/Dead',
                                                 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                                 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                                 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                                 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                                 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                                 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                                 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Live Broadcast Channel Viewer' ROW_FORMAT = Dynamic;

-- Maintain Preview & Pre-listen Parameter
drop table if exists `biz_mmis_sys_pre`;
CREATE TABLE `biz_mmis_sys_pre`  (
                                     `id` bigint(20) NOT NULL COMMENT 'id',
                                     `pre_listen_start` varchar(20)  NOT NULL COMMENT 'Audio Pre-listen Start Generation Time',
                                     `pre_listen` varchar(20)  NOT NULL COMMENT 'Audio Pre-listen Generation Duration',
                                     `pre_view_start` varchar(20) NOT NULL COMMENT 'Video Preview Start Generation Time',
                                     `pre_view` varchar(20) NOT NULL COMMENT 'Video Preview Generation Duration',
                                     `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                     `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                     `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                     `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                     `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                     `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                     `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'System Pre Parameter' ROW_FORMAT = Dynamic;

-- Search Option Setting
drop table if exists `biz_mmis_search_option`;
CREATE TABLE `biz_mmis_search_option`  (
                                           `id` bigint(20) NOT NULL COMMENT 'id',
                                           `option_name` varchar(80)  NOT NULL COMMENT 'Option Name',
                                           `option_name_chi` varchar(80)  NOT NULL COMMENT 'Option Name (chinese)',
                                           `option_name_eng` varchar(80)  NOT NULL COMMENT 'Option Name (English)',
                                           `search_source` varchar(5)  NOT NULL COMMENT 'Search Source Selection O:Only Digital Collection A:DRM',
                                           `search_type` varchar(5) NOT NULL COMMENT 'Search Type RS:Refine Search BS:Browse Search ASF:Advance Search Filter',
                                           `display_order` int(6) NOT NULL COMMENT 'Display Order',
                                           `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                           `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                           `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                           `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                           `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                           `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                           `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Search Option Setting' ROW_FORMAT = Dynamic;

drop table if exists `biz_mmis_search_ref_field`;
CREATE TABLE `biz_mmis_search_ref_field`  (
                                              `id` bigint(20) NOT NULL COMMENT 'id',
                                              `search_id` bigint(20) NOT NULL COMMENT 'Search Id ref biz_mmis_search_option',
                                              `field_id` bigint(20)  NOT NULL COMMENT 'Field Id ref biz_mmis_metadata_field',
                                              `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                              `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                              `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                              `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                              `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                              `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                              `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Search Option Setting Filed' ROW_FORMAT = Dynamic;

drop table if exists `biz_mmis_item_stt`;
CREATE TABLE `biz_mmis_item_stt`  (
                                      `id` bigint(20) NOT NULL COMMENT 'id',
                                      `item_id` bigint(20) NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
                                      `gcs_uri` varchar(120) COMMENT 'gcs uri',
                                      `bucket_name` varchar(50) COMMENT 'BucketName',
                                      `object_name` varchar(120) COMMENT 'ObjectName',
                                      `source_content` text COMMENT 'Source Content',
                                      `content` text COMMENT 'Content',
                                      `status` int(2) NULL DEFAULT 2 COMMENT 'Status: 1 ok 0 fail 2 analyze',
                                      `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                      `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                      `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                      `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                      `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                      `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                      `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Speech to Text' ROW_FORMAT = Dynamic;

drop table if exists `biz_mmis_item_ocr`;
CREATE TABLE `biz_mmis_item_ocr`  (
                                      `id` bigint(20) NOT NULL COMMENT 'id',
                                      `item_id` bigint(20) NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
                                      `source_content` text COMMENT 'Source Content',
                                      `content` text COMMENT 'Content',
                                      `status` int(2) NULL DEFAULT NULL COMMENT 'Status: 1 ok 0 fail',
                                      `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                      `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                      `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                      `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                      `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                      `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                      `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Ocr To Text' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `biz_mmis_metadata_field_display`;
CREATE TABLE `biz_mmis_metadata_field_display`  (
                                                    `id` bigint(0) NOT NULL COMMENT 'ID',
                                                    `field_id` bigint(0) NULL DEFAULT NULL COMMENT 'field id',
                                                    `updated_by_system` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'updated_by_system(1:Yes 0:No)',
                                                    `brief` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Brief(1:Yes 0:No)',
                                                    `order_brief` smallint(0) NULL DEFAULT 0 COMMENT 'Brief Order',
                                                    `detail` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Detail(1:Yes 0:No)',
                                                    `order_detail` smallint(0) NULL DEFAULT 0 COMMENT 'Detail Order',
                                                    `hit_list` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Hit List(1:Yes 0:No)',
                                                    `order_hit_list` smallint(0) NULL DEFAULT 0 COMMENT 'Hit List Order',
                                                    `lock_tag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT 'Lock Tag',
                                                    `org_id` bigint(0) NULL DEFAULT NULL COMMENT 'Org ID',
                                                    `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Org Name',
                                                    `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Created by ',
                                                    `create_dt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Create Date',
                                                    `is_delete` smallint(0) NULL DEFAULT 0 COMMENT 'Delete tag',
                                                    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Last Updated By',
                                                    `last_upd_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Last Update Date',
                                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Metadata Properties Display' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `biz_mmis_metadata_field_controlled_group`;
CREATE TABLE `biz_mmis_metadata_field_controlled_group`  (
                                                             `id` bigint(0) NOT NULL COMMENT 'ID',
                                                             `field_id` bigint(0) NULL DEFAULT NULL COMMENT 'field id',
                                                             `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'status',
                                                             `controlled_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Controlled Field Group',
                                                             `controlled_attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Miscellaneous Attribute',
                                                             `org_id` bigint(0) NULL DEFAULT NULL COMMENT 'Org ID',
                                                             `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Org Name',
                                                             `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Created by ',
                                                             `create_dt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Create Date',
                                                             `is_delete` smallint(0) NULL DEFAULT 0 COMMENT 'Delete tag',
                                                             `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Last Updated By',
                                                             `last_upd_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Last Update Date',
                                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Metadata property control' ROW_FORMAT = Dynamic;
-- 水印配置
drop table if exists `biz_mmis_watermark`;
CREATE TABLE `biz_mmis_watermark`  (
                                       `id` bigint(20) NOT NULL  COMMENT 'ID',
                                       `wm_id` varchar(20) COMMENT 'Watermark id',
                                       `name` varchar(20)  NOT NULL COMMENT 'Watermark Name',
                                       `description` varchar(100)  COMMENT 'Watermark Description',
                                       `watermark_path` varchar(100)  NOT NULL COMMENT 'Watermark image Path',
                                       `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
                                       `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
                                       `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
                                       `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
                                       `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
                                       `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
                                       `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Watermark' ROW_FORMAT = Dynamic;

drop table if exists `biz_mmis_cover_image`;
CREATE TABLE `biz_mmis_cover_image`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `ci_id` varchar(20) COMMENT 'Cover Image id',
 `name` varchar(20)  NOT NULL COMMENT 'Cover Image Name',
 `description` varchar(100)  COMMENT 'Description',
 `category` varchar(100)  NOT NULL COMMENT 'Category',
 `cover_image_path` varchar(100)  NOT NULL COMMENT 'Cover Image image Path',
 `cover_image_icon_path` varchar(100)  NOT NULL COMMENT 'Cover Image Icon Path',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cover Image' ROW_FORMAT = Dynamic;

-- 位置信息
drop table if exists `biz_common_location`;
CREATE TABLE `biz_common_location`  (
 `id` bigint(20) NOT NULL  COMMENT 'ID',
 `location_id` bigint(20) COMMENT 'Location ID',
 `location_value` varchar(100) NOT NULL COMMENT 'Location Value',
 `name` varchar(100) NOT NULL  COMMENT 'Name (English)',
 `name_cn` varchar(100) NOT NULL  COMMENT 'Name (Chinese)',
 `other_name` varchar(100)  COMMENT 'Other Name',
 `full_path` varchar(150)  NOT NULL COMMENT 'Location Full Path (English)',
 `full_path_cn` varchar(150) NOT NULL  COMMENT 'Location Full Path (Chinese)',
 `coordinates` varchar(70) NOT NULL  COMMENT 'Map Coordinates Code',
 `share` varchar(70) NOT NULL  COMMENT 'Share',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Location Info' ROW_FORMAT = Dynamic;


drop table if exists `biz_common_category`;
CREATE TABLE `biz_common_category`  (
`id` bigint(20) NOT NULL  COMMENT 'ID',
`authority_name` varchar(80) NOT NULL COMMENT 'Type of Authority',
`authority_id` varchar(50) NOT NULL  COMMENT 'Controlled Misc ID',
`attribute_type` varchar(50) NOT NULL  COMMENT 'Attribute Type',
`attribute_value` varchar(50) NOT NULL  COMMENT 'Attribute Value',
`description` varchar(200)   COMMENT 'Description (English)',
`description_cn` varchar(200)  COMMENT 'Description (Chinese)',
`item_mode` varchar(200)  COMMENT 'Add Item Mode',
`bib_ids` varchar(800)  COMMENT 'Fill in DRM Bib ID',
`status` varchar(20) NOT NULL  COMMENT 'Status',
`share` varchar(70) NOT NULL  COMMENT 'Share',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Category' ROW_FORMAT = Dynamic;


drop table if exists `biz_sys_log`;
CREATE TABLE `biz_sys_log`  (
`id` bigint(20) NOT NULL  COMMENT 'ID',
`parameter` varchar(100) COMMENT 'Parameter',
`module_name` varchar(100)  COMMENT 'Module name',
`description` varchar(100)  COMMENT 'Description',
`type` varchar(100)  COMMENT 'Type',
`level` varchar(150) COMMENT 'Level',
`system_name` varchar(150)  COMMENT 'System name',
`msg` varchar(300)  COMMENT 'Msg',
`request_ip` varchar(70)  COMMENT 'Request ip',
`spend_time` int(10)  COMMENT 'Spend time',
`user_agent` varchar(70)   COMMENT 'User agent',
`request_url` varchar(70)   COMMENT 'Request Url',
`start_time` datetime NULL DEFAULT NULL COMMENT 'Start time',
`end_time` datetime NULL DEFAULT NULL COMMENT 'End time',
`org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
`org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
`create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
`create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
`is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Delete tag',
`last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
`last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'System log' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `biz_mmis_theme`;
CREATE TABLE `biz_mmis_theme`  (
                                   `id` bigint(0) NOT NULL COMMENT 'ID',
                                   `theme_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Theme ID',
                                   `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name',
                                   `chi_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name (Chinese)',
                                   `eng_name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name (English)',
                                   `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'Description ',
                                   `chi_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'Description (Chinese)',
                                   `eng_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'Description (English)',
                                   `wallpaper_filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Wallpaper',
                                   `wallpaper` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'Wallpaper',
                                   `collection_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Collection IDS',
                                   `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'status',
                                   `org_id` bigint(0) NULL DEFAULT NULL COMMENT 'Org ID',
                                   `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Org Name',
                                   `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Created by ',
                                   `create_dt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Create Date',
                                   `is_delete` smallint(0) NULL DEFAULT 0 COMMENT 'Delete tag',
                                   `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Last Updated By',
                                   `last_upd_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Last Update Date',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Theme' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `biz_mmis_maintain_thesaurus`;
CREATE TABLE `biz_mmis_maintain_thesaurus`  (
                                                `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键,唯一标识',
                                                `synonyms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '同义词',
                                                `org_id` bigint(0) NULL DEFAULT NULL COMMENT 'Org ID',
                                                `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Org Name',
                                                `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Create by',
                                                `create_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Create Date',
                                                `is_delete` smallint(0) NULL DEFAULT 0 COMMENT 'Delete tag',
                                                `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Last Updated By',
                                                `last_upd_dt` datetime(0) NULL DEFAULT NULL COMMENT 'Last Update Date',
                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524994187794108419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;



