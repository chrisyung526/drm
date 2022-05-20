/*
 Navicat Premium Data Transfer

 Source Server         : 10.10.6.28
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 10.10.6.28:3306
 Source Schema         : tcc_drm_dev

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 19/05/2022 19:18:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_common_category
-- ----------------------------
DROP TABLE IF EXISTS `biz_common_category`;
CREATE TABLE `biz_common_category` (
  `id` bigint NOT NULL COMMENT 'ID',
  `authority_name` varchar(80) COLLATE utf8mb4_bin NOT NULL COMMENT 'Type of Authority',
  `authority_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Controlled Misc ID',
  `attribute_type` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Attribute Type',
  `attribute_value` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Attribute Value',
  `description` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Description (English)',
  `description_cn` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Description (Chinese)',
  `item_mode` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Add Item Mode',
  `bib_ids` varchar(800) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Fill in DRM Bib ID',
  `status` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status',
  `share` varchar(70) COLLATE utf8mb4_bin NOT NULL COMMENT 'Share',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Category';

-- ----------------------------
-- Table structure for biz_common_country
-- ----------------------------
DROP TABLE IF EXISTS `biz_common_country`;
CREATE TABLE `biz_common_country` (
  `id` bigint NOT NULL COMMENT 'id',
  `name` varchar(75) DEFAULT NULL COMMENT 'Country Name',
  `a2` varchar(75) DEFAULT NULL,
  `a3` varchar(75) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `idd_` varchar(75) DEFAULT NULL,
  `ziprequired` int DEFAULT NULL,
  `active_` int DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Country';

-- ----------------------------
-- Table structure for biz_common_location
-- ----------------------------
DROP TABLE IF EXISTS `biz_common_location`;
CREATE TABLE `biz_common_location` (
  `id` bigint NOT NULL COMMENT 'ID',
  `location_id` bigint DEFAULT NULL COMMENT 'Location ID',
  `location_value` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Location Value',
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Name (English)',
  `name_cn` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Name (Chinese)',
  `other_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Other Name',
  `full_path` varchar(150) COLLATE utf8mb4_bin NOT NULL COMMENT 'Location Full Path (English)',
  `full_path_cn` varchar(150) COLLATE utf8mb4_bin NOT NULL COMMENT 'Location Full Path (Chinese)',
  `coordinates` varchar(70) COLLATE utf8mb4_bin NOT NULL COMMENT 'Map Coordinates Code',
  `share` varchar(70) COLLATE utf8mb4_bin NOT NULL COMMENT 'Share',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Location Info';

-- ----------------------------
-- Table structure for biz_common_region
-- ----------------------------
DROP TABLE IF EXISTS `biz_common_region`;
CREATE TABLE `biz_common_region` (
  `id` bigint NOT NULL COMMENT 'id',
  `country_id` bigint DEFAULT NULL COMMENT 'Country Id',
  `region_code` varchar(75) DEFAULT NULL COMMENT 'Country Code',
  `name` varchar(75) DEFAULT NULL COMMENT 'Region Name',
  `active_` int DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Region';

-- ----------------------------
-- Table structure for biz_file_upload_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_file_upload_log`;
CREATE TABLE `biz_file_upload_log` (
  `id` bigint NOT NULL COMMENT '主键id',
  `file_source_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件源名称',
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小',
  `file_path` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件访问地址',
  `org_id` bigint DEFAULT NULL COMMENT 'Unit ID',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Unit Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` timestamp NULL DEFAULT NULL COMMENT 'Created by Time',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete Tag',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Update by ',
  `last_upd_dt` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='文件上传日志表';

-- ----------------------------
-- Table structure for biz_hkmp_banner
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_banner`;
CREATE TABLE `biz_hkmp_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称(中文)',
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称(英文)',
  `collection_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目id',
  `poster_tc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '繁体海报url',
  `poster_sc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简体海报url',
  `poster_en_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '英文海报url',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提交状态',
  `org_id` bigint DEFAULT NULL COMMENT '租户id',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='走马灯列表';

-- ----------------------------
-- Table structure for biz_hkmp_batch_upload_job
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_batch_upload_job`;
CREATE TABLE `biz_hkmp_batch_upload_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批量操作任务编号',
  `batch_job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批量操作名称',
  `batch_job_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批量操作类型',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批量处理状态;1:新增,2:处理中,3处理成功,4:处理失败,5:已同步,6:已发布',
  `import_number` int DEFAULT NULL COMMENT '导入数量',
  `success_import_number` int DEFAULT NULL COMMENT '成功数量',
  `error_import_number` int DEFAULT NULL COMMENT '失败数量',
  `org_id` bigint DEFAULT NULL COMMENT '租户id',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='批量操作管理';

-- ----------------------------
-- Table structure for biz_hkmp_catalogue
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_catalogue`;
CREATE TABLE `biz_hkmp_catalogue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `catalogue_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源编号',
  `e_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '英文名称',
  `cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中文名称',
  `collection_id` bigint DEFAULT NULL COMMENT '栏目id',
  `view_id` bigint DEFAULT NULL COMMENT '视图id',
  `upload_cover_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '封面图片url',
  `upload_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上传文件;支持xslx，mp4，mp3，wav，pdf，png，jpg，gif，zip壓縮包',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地区(中文)',
  `is_download` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否支持下载',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题(中文)',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '街道(中文)',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键字(事件)',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '来源(中文)',
  `is_enable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否可用',
  `theme_type_id` bigint DEFAULT NULL COMMENT '主题类型',
  `material_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件类型',
  `method_of_copyright_clearance_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '版权信息(中文)',
  `method_of_copyright_clearance_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '清除版权的方法',
  `reference_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参考(中文)',
  `copyright_status_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '版权状况（中文）',
  `remarks_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注（中文）',
  `copyright_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '版权评论（中文）',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源后缀名',
  `description_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明（英文）',
  `description_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '说明（中文）',
  `keywords_by_place_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键词（地点）（英文）',
  `keywords_by_place_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键词（地点）（中文）',
  `publishing_date_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '出版日期（英文）',
  `publishing_date_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '出版日期（中文）',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地点',
  `grouping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分组',
  `original_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原始文件',
  `keywords_by_organization_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键词（组织）（英文）',
  `creator_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创作者（英文）',
  `creator_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创作者（中文）',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `editor_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编辑（中文）',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '网址',
  `sequence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `style_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '风格（英文）',
  `contributor_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '投稿人（英文）',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原文件名',
  `original_file_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原文件（英文）',
  `original_file_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原文件（中文）',
  `style_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '风格（中文）',
  `size_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小(英文)',
  `size_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '大小(中文)',
  `weight_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '宽带(英文)',
  `weight_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '宽带(中文)',
  `body_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容(英文)',
  `body_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容(中文)',
  `accessories_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配件（英文）',
  `accessories_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '配件（中文）',
  `lacquer_characteristice_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '漆器特性（英文）',
  `lacquer_characteristice_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '漆器特性（中文）',
  `inscription_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '铭文（英文）',
  `inscription_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '铭文（中文）',
  `makers_note_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '厂商备注（英文）',
  `makers_note_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '厂商备注（中文）',
  `stats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提交状态;新稿→审核中→否定（可发）→已发→下线',
  `org_id` bigint DEFAULT NULL COMMENT '租户id',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='资源记录表';

-- ----------------------------
-- Table structure for biz_hkmp_channel
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel`;
CREATE TABLE `biz_hkmp_channel` (
  `id` bigint NOT NULL COMMENT '栏目编号;CHANNELID',
  `pid` bigint DEFAULT NULL COMMENT '父栏目编号;PARENTID',
  `site_id` int NOT NULL COMMENT '?;SITEID',
  `chnl_table` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '无数据;CHNLTABLE',
  `chnl_query` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '无用数据;CHNLQUERY',
  `chnl_prop` int DEFAULT NULL COMMENT '?;CHNLPROP',
  `schedule` int DEFAULT NULL COMMENT '无数据;SCHEDULE',
  `chnl_datapath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '无数据;CHNLDATAPATH',
  `chnl_orderby` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '无数据;CHNLORDERBY',
  `attribute` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '无用列;ATTRIBUTE',
  `collection_e_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '英文名称;CHNLNAME',
  `collection_cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中文名称;CHNLDESC_CHT',
  `sort` int DEFAULT NULL COMMENT '排序(越大越靠前);CHNLORDER',
  `collection_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目类型;CHNLTYPE',
  `front_page_template_id` bigint DEFAULT NULL COMMENT '首页模板id;CHNLOUTLINETEMP',
  `detailed_temolater_id` bigint DEFAULT NULL COMMENT '详情模板id;CHNLDETAILTEMP',
  `content_add_edit_page` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '添加修改页面;CONTENTADDEDITPAGE',
  `content_list_page` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列表页面;CONTENTLISTPAGE',
  `content_show_page` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '展示页面;CONTENTSHOWPAGE',
  `catalogue_template` bigint DEFAULT NULL COMMENT '目录模板id;NO EXIST',
  `other_overview_template_id` bigint DEFAULT NULL COMMENT '其他预览模板id;NO EXIST',
  `upload_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '存放位置;NO EXIST',
  `thumbnail_en_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '英文封面url;NO EXIST',
  `thumbnail_sc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简体中文封面url;NO EXIST',
  `thumbnail_tc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '繁体中文封面url;NO EXIST',
  `recommended_collection_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '已選擇推介特藏id;使用_分隔符进行分割(2_3_5_1)',
  `recommended_exhibition_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '已選擇推介展覽id;使用_分隔符进行分割(2_3_5_1)',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核状态;新稿→審核中→否定（可發）→已發→下線',
  `collection_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目url(当栏目类型为链接栏目时必填);NO EXIST',
  `cn_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中文描述;CHNLDESC',
  `en_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '英文描述;CHNLDESC',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;OPERUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;OPERTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;STATUS',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Key_1` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='栏目管理;WCMCHANNEL';

-- ----------------------------
-- Table structure for biz_hkmp_channel_doc_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel_doc_ref`;
CREATE TABLE `biz_hkmp_channel_doc_ref` (
  `id` bigint NOT NULL,
  `chnl_id` int NOT NULL COMMENT '栏目id;CHNLID',
  `doc_id` int NOT NULL COMMENT 'doc_id;DOCID',
  `doc_order` int NOT NULL DEFAULT '0' COMMENT 'doc_order;DOCORDER',
  `doc_status` int NOT NULL DEFAULT '0' COMMENT 'doc_status;DOCSTATUS',
  `doc_pub_time` datetime DEFAULT NULL COMMENT 'doc_pub_time;DOCPUBTIME',
  `doc_pub_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_pub_url;DOCPUBURL',
  `rec_id` int NOT NULL COMMENT 'rec_id;RECID',
  `doc_order_pri` int NOT NULL DEFAULT '0' COMMENT 'doc_order_pri;DOCORDERPRI',
  `invalid_time` datetime DEFAULT NULL COMMENT 'invalid_time;INVALIDTIME',
  `oper_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'oper_user;OPERUSER',
  `oper_time` datetime DEFAULT NULL COMMENT 'oper_time;OPERTIME',
  `modal` int DEFAULT '1' COMMENT 'modal;MODAL',
  `doc_rel_time` datetime DEFAULT NULL COMMENT 'doc_rel_time;DOCRELTIME',
  `doc_channel` int DEFAULT NULL COMMENT 'doc_channel;DOCCHANNEL',
  `doc_flag` int DEFAULT NULL COMMENT 'doc_flag;DOCFLAG',
  `doc_kind` int DEFAULT '0' COMMENT 'doc_kind;DOCKIND',
  `site_id` int NOT NULL DEFAULT '0' COMMENT 'site_id;SITEID',
  `src_site_id` int NOT NULL DEFAULT '0' COMMENT 'src_site_id;SRCSITEID',
  `doc_first_pub_time` datetime DEFAULT NULL COMMENT 'doc_first_pub_time;DOCFIRSTPUBTIME',
  `node_id` int DEFAULT '0' COMMENT 'node_id;NODEID',
  `cr_dept` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'cr_dept;CRDEPT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='栏目文档关联;WCMCHNLDOC';

-- ----------------------------
-- Table structure for biz_hkmp_channel_view_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel_view_ref`;
CREATE TABLE `biz_hkmp_channel_view_ref` (
  `id` bigint NOT NULL COMMENT '主键;METAVIEWEMPLOYERID',
  `viewid` bigint NOT NULL DEFAULT '0' COMMENT '视图id;VIEWID',
  `channelid` bigint NOT NULL DEFAULT '0' COMMENT '栏目id;CHANNELID',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='栏目视图关联表;XWCMMETAVIEWEMPLOYER';

-- ----------------------------
-- Table structure for biz_hkmp_classinfo
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_classinfo`;
CREATE TABLE `biz_hkmp_classinfo` (
  `id` bigint NOT NULL COMMENT ';CLASSINFOID',
  `class_order` int NOT NULL COMMENT '排序;CLASSORDER',
  `cname` varchar(400) COLLATE utf8mb4_bin NOT NULL COMMENT '名称;CNAME',
  `cdesc` varchar(400) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述;CDESC',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '上一级id;PARENTID',
  `root_id` bigint NOT NULL DEFAULT '0' COMMENT '根id;ROOTID',
  `ccode` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '坐标;CCODE',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='香港地名选择表;XWCMCLASSINFO';

-- ----------------------------
-- Table structure for biz_hkmp_classinfo_view_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_classinfo_view_ref`;
CREATE TABLE `biz_hkmp_classinfo_view_ref` (
  `id` bigint NOT NULL COMMENT 'CLASSINFOVIEWID',
  `classinfo_id` bigint DEFAULT NULL COMMENT '地名id;CLASSINFOID',
  `metadata_id` bigint DEFAULT NULL COMMENT '元数据id;METADATAID',
  `view_id` bigint DEFAULT NULL COMMENT '视图id;VIEWID',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='地点关联视图;XWCMCLASSINFOVIEW';

-- ----------------------------
-- Table structure for biz_hkmp_data_items
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_data_items`;
CREATE TABLE `biz_hkmp_data_items` (
  `id` bigint NOT NULL COMMENT 'id;WCMMETATABLEITEMSID',
  `metadata_id` bigint DEFAULT NULL COMMENT 'metadata id;METADATAID',
  `channel_id` bigint DEFAULT NULL COMMENT 'channel id;CHANNELID',
  `document_id` bigint DEFAULT NULL COMMENT 'document id;DOCUMENTID',
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'title;TITLE',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'description;DESCRIPTION',
  `my_notes` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'my notes;MYNOTES',
  `set_id` bigint DEFAULT NULL COMMENT 'set id;SETID',
  `images` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'images;IMAGES',
  `doc_url` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc url;DOCURL',
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'username;USERNAME',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;USERID',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='馆藏信息表（含文件路径、图片路径）;WCMMETATABLEITEMS';

-- ----------------------------
-- Table structure for biz_hkmp_db_tableinfo
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_db_tableinfo`;
CREATE TABLE `biz_hkmp_db_tableinfo` (
  `id` bigint NOT NULL COMMENT '主键;TABLEINFOID',
  `table_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表名;TABLENAME',
  `table_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述;TABLEDESC',
  `another_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '显示名;ANOTHERNAME',
  `owner_type` int NOT NULL DEFAULT '1' COMMENT '所属人类型;OWNERTYPE',
  `owner_id` int NOT NULL DEFAULT '4' COMMENT '所属人id;OWNERIDOWNERID',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据库表名管理;XWCMTABLEINFO';

-- ----------------------------
-- Table structure for biz_hkmp_document
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_document`;
CREATE TABLE `biz_hkmp_document` (
  `id` int NOT NULL COMMENT '主键;DOCID',
  `channel_id` int NOT NULL COMMENT '栏目id;DOCCHANNEL',
  `doc_version` int NOT NULL DEFAULT '0' COMMENT '版本;DOCVERSION',
  `doc_type` int NOT NULL COMMENT '类型;DOCTYPE',
  `doc_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题;DOCTITLE',
  `doc_source` int NOT NULL DEFAULT '0' COMMENT '来源;DOCSOURCE',
  `doc_security` int NOT NULL COMMENT '权限;DOCSECURITY',
  `doc_status` int NOT NULL COMMENT '状态;DOCSTATUS',
  `doc_kind` int DEFAULT NULL COMMENT '种类;DOCKIND',
  `doc_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '内容;DOCCONTENT',
  `doc_html_con` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'html内容;DOCHTMLCON',
  `doc_ab_stract` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_ab_stract;DOCABSTRACT',
  `doc_keywords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关键字;DOCKEYWORDS',
  `doc_relwords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_relwords;DOCRELWORDS',
  `doc_people` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'people;DOCPEOPLE',
  `doc_place` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'place;DOCPLACE',
  `doc_author` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'author;DOCAUTHOR',
  `doc_editor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'editor;DOCEDITOR',
  `doc_auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'auditor;DOCAUDITOR',
  `doc_outupid` int DEFAULT NULL COMMENT 'outupid;DOCOUTUPID',
  `doc_valid` datetime DEFAULT NULL COMMENT 'valid;DOCVALID',
  `doc_puburl` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'puburl;DOCPUBURL',
  `doc_pubtime` datetime DEFAULT NULL COMMENT 'pubtime;DOCPUBTIME',
  `doc_reltime` datetime DEFAULT NULL COMMENT 'reltime;DOCRELTIME',
  `doc_words_count` int NOT NULL DEFAULT '0' COMMENT 'words_count;DOCWORDSCOUNT',
  `doc_pro` int DEFAULT '1' COMMENT 'doc_pro;DOCPRO',
  `right_defined` int NOT NULL DEFAULT '0' COMMENT 'right_defined;RIGHTDEFINED',
  `title_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'title_color;TITLECOLOR',
  `template_id` int DEFAULT '0' COMMENT 'template_id;TEMPLATEID',
  `schedule` int DEFAULT '0' COMMENT 'schedule;SCHEDULE',
  `doc_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'doc_no;DOCNO',
  `doc_flag` int NOT NULL DEFAULT '0' COMMENT 'doc_flag;DOCFLAG',
  `editor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'editor;EDITOR',
  `attribute` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'attribute;ATTRIBUTE',
  `hits_count` int NOT NULL DEFAULT '0' COMMENT 'hits_count;HITSCOUNT',
  `doc_pub_html_con` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'doc_pub_html_con;DOCPUBHTMLCON',
  `sub_doc_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'sub_doc_title;SUBDOCTITLE',
  `atta_chpic` int DEFAULT NULL COMMENT 'atta_chpic;ATTACHPIC',
  `doc_link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_link;DOCLINK',
  `doc_filename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_filename;DOCFILENAME',
  `doc_from_version` int DEFAULT NULL COMMENT 'doc_from_version;DOCFROMVERSION',
  `oper_time` datetime DEFAULT NULL COMMENT 'oper_time;OPERTIME',
  `oper_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'oper_user;OPERUSER',
  `flow_oper_ationmark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'flow_oper_ationmark;FLOWOPERATIONMARK',
  `flow_pre_oper_ationmark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'flow_pre_oper_ationmark;FLOWPREOPERATIONMARK',
  `flow_oper_ationmask_enum` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'flow_oper_ationmask_enum;FLOWOPERATIONMASKENUM',
  `doc_source_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_source_name;DOCSOURCENAME',
  `doc_link_to` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_link_to;DOCLINKTO',
  `doc_mirror_to` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'doc_mirror_to;DOCMIRRORTO',
  `random_serial` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'random_serial;RANDOMSERIAL',
  `post_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'post_user;POSTUSER',
  `is_page_img` int DEFAULT NULL COMMENT 'is_page_img;ISPAGEIMG',
  `publish_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'publish_date;PUBLISHDATE',
  `page_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page_num;PAGENUM',
  `page_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page_name;PAGENAME',
  `pdf_file_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pdf_file_name;PDFFILENAME',
  `page_image_filename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page_image_filename;PAGEIMAGEFILENAME',
  `map` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'map;MAP',
  `yinti` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'yinti;YINTI',
  `site_id` int NOT NULL DEFAULT '0' COMMENT 'site_id;SITEID',
  `src_site_id` int NOT NULL DEFAULT '0' COMMENT 'src_site_id;SRCSITEID',
  `doc_first_pub_time` datetime DEFAULT NULL COMMENT 'doc_first_pub_time;DOCFIRSTPUBTIME',
  `node_id` int DEFAULT '0' COMMENT 'nodeid;NODEID',
  `order_id` int DEFAULT '0' COMMENT 'orderid;ORDERID',
  `cr_dept` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'crdept;CRDEPT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'org name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文档表;WCMDOCUMENT';

-- ----------------------------
-- Table structure for biz_hkmp_field_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_field_info`;
CREATE TABLE `biz_hkmp_field_info` (
  `id` bigint NOT NULL COMMENT '主键;DBFIELDINFOID',
  `table_id` bigint NOT NULL COMMENT '表id;TABLEDESC',
  `table_name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '表名',
  `field_type_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '字段类型id;FIELDTYPE',
  `element_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元素类型id;METADATATYPEID',
  `field_name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '字段名称;FIELDNAME',
  `field_another_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段别名;ANOTHERNAME',
  `field_length` int DEFAULT NULL COMMENT '数据库中的数据大小;DBLENGTH',
  `evm_value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '枚举值(当字段类型为多选时填写_分割)',
  `frontend_field_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '前台显示名称',
  `default_value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段默认值;DEFAULTVALUE',
  `is_empty` smallint DEFAULT '0' COMMENT '是否可以为空;NOTNULL',
  `is_edit` smallint DEFAULT '0' COMMENT '是否可以编辑;NOTEDIT',
  `is_hidden` smallint DEFAULT '1' COMMENT '是否隐藏;HIDDENFIELD',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '1' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字段管理;XWCMDBFIELDINFO';

-- ----------------------------
-- Table structure for biz_hkmp_field_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_field_type`;
CREATE TABLE `biz_hkmp_field_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_en` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name_cn` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1526012277042573314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字段类型;普通文本	Nornal text\r\n密碼文本	Password\r\n多行文本	Multi-Line text	\r\n是非框		Yes No button\r\n單選鈕		Radio button\r\n多選鈕		Checkbox\r\n下拉列表	Pulldown menu\r\n可輸入下拉列表	Input pulldown menu\r\n可輸入提示列表	Input select menu\r\n日期		Date\r\n分類法		Classification\r\n簡易編輯器	Simple editor\r\n複雜編輯器	Complex editor\r\n附件		Attachment\r\n相關文檔	File\r\n自定義類型	User-define field\r\n視頻		Video';

-- ----------------------------
-- Table structure for biz_hkmp_meta_table
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table`;
CREATE TABLE `biz_hkmp_meta_table` (
  `id` bigint NOT NULL COMMENT 'ID',
  `metadata_id` bigint DEFAULT NULL COMMENT '元数据id;METADATAID',
  `channel_id` bigint DEFAULT NULL COMMENT '栏目id;CHANNELID',
  `place_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'place_id;PLACE_ID',
  `acc_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编号;ACC_NO',
  `evideo_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频 id;EVIDEO_ID',
  `collection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收藏;COLLECTION',
  `school_types_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'school_types(英文);SCHOOL_TYPES_ENG',
  `presented_by_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'presented_by_cht;PRESENTED_BY_CHT',
  `building_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'building_cht;BUILDING_CHT',
  `director_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'director_eng;DIRECTOR_ENG',
  `cast_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cast_eng;CAST_ENG',
  `subject_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'subject_cht;SUBJECT_CHT',
  `producer_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'producer_cht;PRODUCER_CHT',
  `assi_director_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'assi_director_cht;ASSI_DIRECTOR_CHT',
  `cast_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cast_cht;CAST_CHT',
  `url_name_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'url_name_cht;URL_NAME_CHT',
  `vocalist_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'vocalist_eng;VOCALIST_ENG',
  `ori_story_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ori_story_eng;ORI_STORY_ENG',
  `continuity_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'continuity_cht;CONTINUITY_CHT',
  `copyright_status_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_status_eng;COPYRIGHT_STATUS_ENG',
  `brand_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'brand_eng;BRAND_ENG',
  `original_file_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'original_file_name;ORIGINAL_FILE_NAME',
  `remark_contributor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_contributor_eng;REMARK_CONTRIBUTOR_ENG',
  `description_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'description_eng;DESCRIPTION_ENG',
  `original_title_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'original_title_cht;ORIGINAL_TITLE_CHT',
  `genres_type_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'genres_type_eng;GENRES_TYPE_ENG',
  `street_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'street_eng;STREET_ENG',
  `enable` int DEFAULT NULL COMMENT 'enable;ENABLE',
  `vocalist_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'vocalist_cht;VOCALIST_CHT',
  `place_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'place_cht;PLACE_CHT',
  `authors_note_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'authors_note_eng;AUTHORS_NOTE_ENG',
  `creator_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_cht;CREATOR_CHT',
  `prod_place_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_place_cht;PROD_PLACE_CHT',
  `original_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'original_file;ORIGINAL_FILE',
  `license_1_authorization_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'license_1_authorization_no;LICENSE_1_AUTHORIZATION_NO',
  `prod_place_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_place_eng;PROD_PLACE_ENG',
  `prod_crew_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_crew_cht;PROD_CREW_CHT',
  `music_director_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'music_director_eng;MUSIC_DIRECTOR_ENG',
  `document_type_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'document_type_eng;DOCUMENT_TYPE_ENG',
  `creator_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_eng;CREATOR_ENG',
  `lighting_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lighting_eng;LIGHTING_ENG',
  `license1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'license1;LICENSE1',
  `remark_contributor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '备注贡献者(中文);REMARK_CONTRIBUTOR_CHT',
  `kw_other_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '别名(英文);KW_OTHER_ENG',
  `hung_kungfu_instrcutor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'hung_kungfu_instrcutor_eng;HUNG_KUNGFU_INSTRCUTOR_ENG',
  `kw_place_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_place_eng;KW_PLACE_ENG',
  `tlf_kungfu_instructor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'tlf_kungfu_instructor_cht;TLF_KUNGFU_INSTRUCTOR_CHT',
  `place_manufacture_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'place_manufacture_eng;PLACE_MANUFACTURE_ENG',
  `ori_story_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ori_story_cht;ORI_STORY_CHT',
  `ori_sound_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ori_sound_cht;ORI_SOUND_CHT',
  `presented_by_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'presented_by_eng;PRESENTED_BY_ENG',
  `lyrics_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lyrics_eng;LYRICS_ENG',
  `remark_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_eng;REMARK_ENG',
  `line_producer_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'line_producer_cht;LINE_PRODUCER_CHT',
  `kw_school_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_school_cht;KW_SCHOOL_CHT',
  `source_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'source_cht;SOURCE_CHT',
  `contributor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_eng;CONTRIBUTOR_ENG',
  `format_medium_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'format_medium_cht;FORMAT_MEDIUM_CHT',
  `material_type_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'material_type_eng;MATERIAL_TYPE_ENG',
  `theme` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '主题;THEME',
  `kw_event_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '事件(中文);KW_EVENT_CHT',
  `boxing_instructor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '教练(英文);BOXING_INSTRUCTOR_ENG',
  `director_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '负责人(中文);DIRECTOR_CHT',
  `martial_arts_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'martial_arts_cht;MARTIAL_ARTS_CHT',
  `archive` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'archive;ARCHIVE',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'url;URL',
  `format_colour_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'format_colour_eng;FORMAT_COLOUR_ENG',
  `prod_crew_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_crew_eng;PROD_CREW_ENG',
  `media_type_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'media_type_cht;MEDIA_TYPE_CHT',
  `song_compo_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'song_compo_cht;SONG_COMPO_CHT',
  `creator_place_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_place_cht;CREATOR_PLACE_CHT',
  `collection_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'collection_eng;COLLECTION_ENG',
  `contributor_method_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_method_eng;CONTRIBUTOR_METHOD_ENG',
  `kw_industry_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_industry_eng;KW_INDUSTRY_ENG',
  `remark_other_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_other_eng;REMARK_OTHER_ENG',
  `sp_effect_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sp_effect_eng;SP_EFFECT_ENG',
  `theme_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'theme_cht;THEME_CHT',
  `kw_object_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_object_eng;KW_OBJECT_ENG',
  `remark_creator_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_creator_eng;REMARK_CREATOR_ENG',
  `production_controllrer_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_controllrer_eng;PRODUCTION_CONTROLLRER_ENG',
  `kw_activities_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_activities_eng;KW_ACTIVITIES_ENG',
  `creator_role_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_role_cht;CREATOR_ROLE_CHT',
  `date_pub_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_pub_eng;DATE_PUB_ENG',
  `region_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'region_eng;REGION_ENG',
  `school_types_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'school_types_cht;SCHOOL_TYPES_CHT',
  `copyright_clearance_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_clearance_cht;COPYRIGHT_CLEARANCE_CHT',
  `release_date_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'release_date_cht;RELEASE_DATE_CHT',
  `creator_role_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_role_eng;CREATOR_ROLE_ENG',
  `props_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'props_cht;PROPS_CHT',
  `description_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'description_cht;DESCRIPTION_CHT',
  `kw_event_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_event_eng;KW_EVENT_ENG',
  `city_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'city_cht;CITY_CHT',
  `contributor_method_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_method_cht;CONTRIBUTOR_METHOD_CHT',
  `building_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'building_eng;BUILDING_ENG',
  `boxing_instructor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'boxing_instructor_cht;BOXING_INSTRUCTOR_CHT',
  `download` int DEFAULT NULL COMMENT 'download;DOWNLOAD',
  `credits_title_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'credits_title_eng;CREDITS_TITLE_ENG',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'location;LOCATION',
  `contributor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_cht;CONTRIBUTOR_CHT',
  `original_title_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'original_title_eng;ORIGINAL_TITLE_ENG',
  `production_controllrer_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_controllrer_cht;PRODUCTION_CONTROLLRER_CHT',
  `tlf_kungfu_instructor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'tlf_kungfu_instructor_eng;TLF_KUNGFU_INSTRUCTOR_ENG',
  `continuity_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'continuity_eng;CONTINUITY_ENG',
  `kw_institution_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_institution_cht;KW_INSTITUTION_CHT',
  `topic_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'topic_cht;TOPIC_CHT',
  `colour_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'colour_eng;COLOUR_ENG',
  `editor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'editor_cht;EDITOR_CHT',
  `brand_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'brand_cht;BRAND_CHT',
  `makeup_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'makeup_eng;MAKEUP_ENG',
  `lang_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lang_eng;LANG_ENG',
  `ori_sound_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ori_sound_eng;ORI_SOUND_ENG',
  `sp_effect_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sp_effect_cht;SP_EFFECT_CHT',
  `url_name_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'url_name_eng;URL_NAME_ENG',
  `production_man_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_man_eng;PRODUCTION_MAN_ENG',
  `source_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'source_eng;SOURCE_ENG',
  `theme_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'theme_eng;THEME_ENG',
  `editing_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'editing_eng;EDITING_ENG',
  `contributor_remarks_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_remarks_cht;CONTRIBUTOR_REMARKS_CHT',
  `makeup_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'makeup_cht;MAKEUP_CHT',
  `place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'place;PLACE',
  `material_type_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'material_type_cht;MATERIAL_TYPE_CHT',
  `genres_type_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'genres_type_cht;GENRES_TYPE_CHT',
  `topic_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'topic_eng;TOPIC_ENG',
  `production_coordinator_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_coordinator_cht;PRODUCTION_COORDINATOR_CHT',
  `release_date_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'release_date_eng;RELEASE_DATE_ENG',
  `scriptwriter_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'scriptwriter_eng;SCRIPTWRITER_ENG',
  `media_type_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'media_type_eng;MEDIA_TYPE_ENG',
  `tag_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'tag_eng;TAG_ENG',
  `country_origin_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'country_origin_eng;COUNTRY_ORIGIN_ENG',
  `production_man_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_man_cht;PRODUCTION_MAN_CHT',
  `kw_people_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_people_cht;KW_PEOPLE_CHT',
  `extension` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'extension;EXTENSION',
  `kw_object_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_object_cht;KW_OBJECT_CHT',
  `credits_title_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'credits_title_cht;CREDITS_TITLE_CHT',
  `props_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'props_eng;PROPS_ENG',
  `lang_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lang_cht;LANG_CHT',
  `related` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'related;RELATED',
  `creator_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_type;CREATOR_TYPE',
  `song_compo_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'song_compo_eng;SONG_COMPO_ENG',
  `copyright_comment_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_comment_cht;COPYRIGHT_COMMENT_CHT',
  `place_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'place_eng;PLACE_ENG',
  `title_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'title_eng;TITLE_ENG',
  `lyrics_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lyrics_cht;LYRICS_CHT',
  `street_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'street_cht;STREET_CHT',
  `choreographer_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'choreographer_eng;CHOREOGRAPHER_ENG',
  `reference_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'reference_cht;REFERENCE_CHT',
  `digital_file_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'digital_file_no;DIGITAL_FILE_NO',
  `sound_rec_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sound_rec_cht;SOUND_REC_CHT',
  `costume_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'costume_cht;COSTUME_CHT',
  `celestial_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'celestial_key;CELESTIAL_KEY',
  `kw_activities_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_activities_cht;KW_ACTIVITIES_CHT',
  `production_company_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_company_eng;PRODUCTION_COMPANY_ENG',
  `remark_creator_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_creator_cht;REMARK_CREATOR_CHT',
  `date_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_cht;DATE_CHT',
  `contributor_role_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_role_cht;CONTRIBUTOR_ROLE_CHT',
  `kw_other_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_other_cht;KW_OTHER_CHT',
  `place_manufacture_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'place_manufacture_cht;PLACE_MANUFACTURE_CHT',
  `action_director_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'action_director_cht;ACTION_DIRECTOR_CHT',
  `district_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'district_cht;DISTRICT_CHT',
  `cinematographer_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cinematographer_cht;CINEMATOGRAPHER_CHT',
  `kw_place_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_place_cht;KW_PLACE_CHT',
  `duration_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'duration_eng;DURATION_ENG',
  `original_filename` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'original_filename;ORIGINAL_FILENAME',
  `material_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'material_type;MATERIAL_TYPE',
  `reference_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'reference_eng;REFERENCE_ENG',
  `scriptwriter_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'scriptwriter_cht;SCRIPTWRITER_CHT',
  `line_producer_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'line_producer_eng;LINE_PRODUCER_ENG',
  `region_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'region_cht;REGION_CHT',
  `contributor_remarks_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_remarks_eng;CONTRIBUTOR_REMARKS_ENG',
  `art_director_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'art_director_eng;ART_DIRECTOR_ENG',
  `authors_note_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'authors_note_cht;AUTHORS_NOTE_CHT',
  `kw_people_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_people_eng;KW_PEOPLE_ENG',
  `remark_other_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_other_cht;REMARK_OTHER_CHT',
  `martial_arts_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'martial_arts_eng;MARTIAL_ARTS_ENG',
  `art_director_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'art_director_cht;ART_DIRECTOR_CHT',
  `sound_rec_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sound_rec_eng;SOUND_REC_ENG',
  `choreographer_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'choreographer_cht;CHOREOGRAPHER_CHT',
  `tag_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'tag_cht;TAG_CHT',
  `collection_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'collection_cht;COLLECTION_CHT',
  `duration_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'duration_cht;DURATION_CHT',
  `producer_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'producer_eng;PRODUCER_ENG',
  `media_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'media_type;MEDIA_TYPE',
  `date_pub_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_pub_cht;DATE_PUB_CHT',
  `contributor_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_type;CONTRIBUTOR_TYPE',
  `license2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'license2;LICENSE2',
  `title_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'title_cht;TITLE_CHT',
  `kw_school_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_school_eng;KW_SCHOOL_ENG',
  `other_functions_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'other_functions_cht;OTHER_FUNCTIONS_CHT',
  `subject_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'subject_eng;SUBJECT_ENG',
  `production_coordinator_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_coordinator_eng;PRODUCTION_COORDINATOR_ENG',
  `extra_table` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'extra_table;EXTRA_TABLE',
  `cinematographer_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cinematographer_eng;CINEMATOGRAPHER_ENG',
  `date_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_eng;DATE_ENG',
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'time;TIME',
  `topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'topic;TOPIC',
  `music_director_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'music_director_cht;MUSIC_DIRECTOR_CHT',
  `lighting_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'lighting_cht;LIGHTING_CHT',
  `kw_organization_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_organization_eng;KW_ORGANIZATION_ENG',
  `repository_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'repository_cht;REPOSITORY_CHT',
  `city_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'city_eng;CITY_ENG',
  `format_medium_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'format_medium_eng;FORMAT_MEDIUM_ENG',
  `action_director_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'action_director_eng;ACTION_DIRECTOR_ENG',
  `format_colour_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'format_colour_cht;FORMAT_COLOUR_CHT',
  `remark_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'remark_cht;REMARK_CHT',
  `kw_organization_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_organization_cht;KW_ORGANIZATION_CHT',
  `repository_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'repository_eng;REPOSITORY_ENG',
  `kw_institution_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_institution_eng;KW_INSTITUTION_ENG',
  `district_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'district_eng;DISTRICT_ENG',
  `copyright_comment_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_comment_eng;COPYRIGHT_COMMENT_ENG',
  `editor_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'editor_eng;EDITOR_ENG',
  `grouping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'grouping;GROUPING',
  `kw_industry_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_industry_cht;KW_INDUSTRY_CHT',
  `contributor_role_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contributor_role_eng;CONTRIBUTOR_ROLE_ENG',
  `colour_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'colour_cht;COLOUR_CHT',
  `production_company_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'production_company_cht;PRODUCTION_COMPANY_CHT',
  `country_origin_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'country_origin_cht;COUNTRY_ORIGIN_CHT',
  `costume_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'costume_eng;COSTUME_ENG',
  `assi_director_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'assi_director_eng;ASSI_DIRECTOR_ENG',
  `camera_format_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'camera_format_cht;CAMERA_FORMAT_CHT',
  `method_copyright_clearance_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'method_copyright_clearance_eng;METHOD_COPYRIGHT_CLEARANCE_ENG',
  `copyright_status_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_status_cht;COPYRIGHT_STATUS_CHT',
  `copyright_clearance_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_clearance_eng;COPYRIGHT_CLEARANCE_ENG',
  `date_end` datetime DEFAULT NULL COMMENT 'date_end;DATE_END',
  `date_start` datetime DEFAULT NULL COMMENT 'date_start;DATE_START',
  `creator_place_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'creator_place_eng;CREATOR_PLACE_ENG',
  `hung_kungfu_instrcutor_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'hung_kungfu_instrcutor_cht;HUNG_KUNGFU_INSTRCUTOR_CHT',
  `document_type_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'document_type_cht;DOCUMENT_TYPE_CHT',
  `camera_format_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'camera_format_eng;CAMERA_FORMAT_ENG',
  `other_functions_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'other_functions_eng;OTHER_FUNCTIONS_ENG',
  `editing_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'editing_cht;EDITING_CHT',
  `editing_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'editing_chi;EDITING_CHI',
  `size_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'size_eng;SIZE_ENG',
  `size_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'size_cht;SIZE_CHT',
  `date_release_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_release_eng;DATE_RELEASE_ENG',
  `date_release_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'date_release_cht;DATE_RELEASE_CHT',
  `ctiy_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ctiy_eng;CTIY_ENG',
  `distrit_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'distrit_cht;DISTRIT_CHT',
  `poem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'poem;POEM',
  `sequence` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sequence;SEQUENCE',
  `content_category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'content_category;CONTENT_CATEGORY',
  `photography_category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'photography_category;PHOTOGRAPHY_CATEGORY',
  `poetic_photography` int DEFAULT NULL COMMENT 'poetic_photography;POETIC_PHOTOGRAPHY',
  `poetic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'poetic;POETIC',
  `img_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'img_no;IMG_NO',
  `author` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'author;AUTHOR',
  `google_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'google_map;GOOGLE_MAP',
  `size_rez` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'size_rez;SIZE_REZ',
  `prod_crew_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_crew_chi;PROD_CREW_CHI',
  `camera_format_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'camera_format_chi;CAMERA_FORMAT_CHI',
  `brand_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'brand_chi;BRAND_CHI',
  `prod_place_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'prod_place_chi;PROD_PLACE_CHI',
  `dimension_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'dimension_eng;DIMENSION_ENG',
  `copyright_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'copyright_comment;COPYRIGHT_COMMENT',
  `kw_company_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_company_eng;KW_COMPANY_ENG',
  `dimension_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'dimension_cht;DIMENSION_CHT',
  `kw_company_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'kw_company_cht;KW_COMPANY_CHT',
  `media_type_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'media_type_chi;MEDIA_TYPE_CHI',
  `period` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '时期;PERIOD',
  `type_of_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '物料种类;TYPE_OF_MATERIAL',
  `plot_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'plot(英文);PLOT_ENG',
  `plot_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'plot(中文);PLOT_CHT',
  `age_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'age(英文);AGE_ENG',
  `age_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'age(中文);AGE_CHT',
  `sex_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sex(英文);SEX_ENG',
  `sex_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'sex(中文);SEX_CHT',
  `place_of_birth_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '出生地(英文);PLACE_OF_BIRTH_ENG',
  `place_of_birth_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '出生地(中文);PLACE_OF_BIRTH_CHT',
  `rank_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'rank(英文);RANK_ENG',
  `rank_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'rank(中文);RANK_CHT',
  `occupation_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'occupation(英文);OCCUPATION_ENG',
  `occupation_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'occupation(中文);OCCUPATION_CHT',
  `cause_of_death_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cause_of_death_eng;CAUSE_OF_DEATH_ENG',
  `cause_of_death_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'cause_of_death_cht;CAUSE_OF_DEATH_CHT',
  `monument_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'monument_eng;MONUMENT_ENG',
  `monument_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'monument_cht;MONUMENT_CHT',
  `feature_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'feature_eng;FEATURE_ENG',
  `feature_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'feature_cht;FEATURE_CHT',
  `erected_by_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'erected_by_eng;ERECTED_BY_ENG',
  `erected_by_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'erected_by_cht;ERECTED_BY_CHT',
  `section_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'section_cht;SECTION_CHT',
  `section_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'section_cht;SECTION_CHT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'org name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='元数据集合表;主表 WCMMETATABLEICHIIHK';

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oral_hist_doc
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oral_hist_doc`;
CREATE TABLE `biz_hkmp_meta_table_oral_hist_doc` (
  `id` bigint NOT NULL COMMENT 'WCMMETATABLEORAL_HIST_DOCID',
  `metadata_id` bigint DEFAULT NULL COMMENT 'METADATAID',
  `channel_id` int DEFAULT NULL COMMENT 'CHANNELID',
  `acc_no` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ACC_NO',
  `enable` int DEFAULT NULL COMMENT 'ENABLE',
  `title_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_ENG',
  `title_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_CHT',
  `description_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DESCRIPTION_ENG',
  `description_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DESCRIPTION_CHT',
  `date_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DATE_ENG',
  `date_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DATE_CHT',
  `date_start` datetime DEFAULT NULL COMMENT 'DATE_START',
  `date_end` datetime DEFAULT NULL COMMENT 'DATE_END',
  `kw_people_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PEOPLE_ENG',
  `kw_people_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PEOPLE_CHT',
  `kw_object_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OBJECT_ENG',
  `kw_object_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OBJECT_CHT',
  `kw_product_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PRODUCT_ENG',
  `kw_product_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PRODUCT_CHT',
  `kw_event_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_EVENT_ENG',
  `kw_event_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_EVENT_CHT',
  `kw_other_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OTHER_ENG',
  `kw_other_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OTHER_CHT',
  `industry_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'INDUSTRY_ENG',
  `industry_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'INDUSTRY_CHT',
  `industry` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'INDUSTRY',
  `company_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COMPANY_ENG',
  `company_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COMPANY_CHT',
  `occupation_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'OCCUPATION_ENG',
  `occupation_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'OCCUPATION_CHT',
  `organization_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ORGANIZATION_ENG',
  `organization_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ORGANIZATION_CHT',
  `theme` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'THEME',
  `topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC',
  `topic_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC_2',
  `topic_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC_3',
  `topic_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC_4',
  `topic_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC_5',
  `place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'PLACE',
  `source_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SOURCE_ENG',
  `source_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SOURCE_CHT',
  `collection_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COLLECTION_ENG',
  `collection_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COLLECTION_CHT',
  `repository_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REPOSITORY_ENG',
  `repository_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REPOSITORY_CHT',
  `reference_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REFERENCE_ENG',
  `reference_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REFERENCE_CHT',
  `link_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LINK_ADDRESS',
  `link_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LINK_NAME',
  `material_type_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MATERIAL_TYPE_ENG',
  `material_type_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MATERIAL_TYPE_CHT',
  `material_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MATERIAL_TYPE',
  `media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MEDIA',
  `extension` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'EXTENSION',
  `archive` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'ARCHIVE',
  `evideo_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'EVIDEO_ID',
  `copyright_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_COMMENT',
  `copyright_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_STATUS',
  `full_report` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'FULL_REPORT',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LOCATION',
  `related` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'RELATED',
  `remark_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REMARK_ENG',
  `remark_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REMARK_CHT',
  `collection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COLLECTION',
  `download` int DEFAULT NULL COMMENT 'DOWNLOAD',
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TIME',
  `topic_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC_CHT',
  `copyright_comment_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_COMMENT_ENG',
  `copyright_comment_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_COMMENT_CHT',
  `copyright_status_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_STATUS_CHT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='元数据-口述历史图文;WCMMETATABLEORAL_HIST_DOC';

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oral_interview
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oral_interview`;
CREATE TABLE `biz_hkmp_meta_table_oral_interview` (
  `id` bigint NOT NULL COMMENT 'WCMMETATABLEORAL_INTERVIEWID',
  `metadata_id` bigint DEFAULT NULL COMMENT 'METADATAID',
  `channel_id` bigint DEFAULT NULL COMMENT 'CHANNELID',
  `acc_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ACC_NO',
  `enable` int DEFAULT NULL COMMENT 'ENABLE',
  `collection_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COLLECTION_ENG',
  `collection_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COLLECTION_CHT',
  `name_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NAME_ENG',
  `name_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NAME_CHT',
  `sex_eng` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SEX_ENG',
  `sex_cht` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SEX_CHT',
  `birthyear_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BIRTHYEAR_ENG',
  `birthyear_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BIRTHYEAR_CHT',
  `birthplace_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BIRTHPLACE_ENG',
  `birthplace_cht` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'BIRTHPLACE_CHT',
  `age_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'AGE_ENG',
  `age_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'AGE_CHT',
  `education_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'EDUCATION_ENG',
  `education_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'EDUCATION_CHT',
  `origin_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ORIGIN_ENG',
  `origin_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ORIGIN_CHT',
  `nationality_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NATIONALITY_ENG',
  `nationality_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NATIONALITY_CHT',
  `industry_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INDUSTRY_ENG',
  `industry_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INDUSTRY_CHT',
  `occupation_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'OCCUPATION_ENG',
  `occupation_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'OCCUPATION_CHT',
  `position_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'POSITION_ENG',
  `position_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'POSITION_CHT',
  `company_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COMPANY_ENG',
  `company_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COMPANY_CHT',
  `association_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ASSOCIATION_ENG',
  `association_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ASSOCIATION_CHT',
  `interviewer_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INTERVIEWER_ENG',
  `interviewer_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INTERVIEWER_CHT',
  `staff_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'STAFF_ENG',
  `staff_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'STAFF_CHT',
  `interviewdate_eng` datetime DEFAULT NULL COMMENT 'INTERVIEWDATE_ENG',
  `interviewdate_cht` datetime DEFAULT NULL COMMENT 'INTERVIEWDATE_CHT',
  `interviewtime_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INTERVIEWTIME_ENG',
  `interviewtime_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'INTERVIEWTIME_CHT',
  `venue_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'VENUE_ENG',
  `venue_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'VENUE_CHT',
  `bio_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'BIO_ENG',
  `bio_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'BIO_CHT',
  `title_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_ENG',
  `title_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_CHT',
  `synopsis_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SYNOPSIS_ENG',
  `synopsis_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SYNOPSIS_CHT',
  `timecover_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TIMECOVER_ENG',
  `timecover_cht` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TIMECOVER_CHT',
  `date_start` datetime DEFAULT NULL COMMENT 'DATE_START',
  `date_end` datetime DEFAULT NULL COMMENT 'DATE_END',
  `kw_place_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PLACE_ENG',
  `place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'PLACE',
  `kw_people_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PEOPLE_ENG',
  `kw_people_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_PEOPLE_CHT',
  `kw_event_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_EVENT_ENG',
  `kw_event_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_EVENT_CHT',
  `kw_other_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OTHER_ENG',
  `kw_other_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'KW_OTHER_CHT',
  `subject_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUBJECT_ENG',
  `subject_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUBJECT_CHT',
  `subtheme_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUBTHEME_ENG',
  `subtheme_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUBTHEME_CHT',
  `topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TOPIC',
  `media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MEDIA',
  `material_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MATERIAL_ENG',
  `material_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MATERIAL_CHT',
  `extension` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'EXTENSION',
  `filetype_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'FILETYPE_CHT',
  `medium_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MEDIUM_ENG',
  `medium_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'MEDIUM_CHT',
  `durwhole_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DURWHOLE_ENG',
  `durwhole_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DURWHOLE_CHT',
  `durseg_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DURSEG_ENG',
  `durseg_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DURSEG_CHT',
  `language_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LANGUAGE_ENG',
  `language_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LANGUAGE_CHT',
  `agreement_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'AGREEMENT_NO',
  `license_no` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'LICENSE_NO',
  `suppl_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUPPL_IMAGE',
  `suppl_video` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'SUPPL_VIDEO',
  `condition_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'CONDITION_ENG',
  `condition_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'CONDITION_CHT',
  `copyright_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_STATUS',
  `copyright_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_COMMENT',
  `repository_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REPOSITORY_ENG',
  `repository_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REPOSITORY_CHT',
  `remark_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REMARK_ENG',
  `remark_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REMARK_CHT',
  `video` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'VIDEO',
  `collection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COLLECTION',
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'TIME',
  `copyright_status_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'COPYRIGHT_STATUS_CHT',
  `reference_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REFERENCE_ENG',
  `reference_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'REFERENCE_CHT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='口述历史-采访;WCMMETATABLEORAL_INTERVIEW';

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oralhistory
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oralhistory`;
CREATE TABLE `biz_hkmp_meta_table_oralhistory` (
  `id` bigint NOT NULL COMMENT 'WCMMETATABLEORALHISTORYID',
  `metadata_id` bigint DEFAULT NULL COMMENT 'METADATAID',
  `channel_id` bigint DEFAULT NULL COMMENT 'CHANNELID',
  `acc_no` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ACC_NO',
  `enable` int DEFAULT NULL COMMENT 'ENABLE',
  `title_eng` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_ENG',
  `title_cht` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TITLE_CHT',
  `description_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DESCRIPTION_ENG',
  `description_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'DESCRIPTION_CHT',
  `source_eng` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SOURCE_ENG',
  `source_cht` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SOURCE_CHT',
  `collection` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COLLECTION',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='「香港留声」口述历史档案库;WCMMETATABLEORALHISTORY';

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_search
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_search`;
CREATE TABLE `biz_hkmp_meta_table_search` (
  `id` int NOT NULL COMMENT 'id;WCMMETATABLESEARCHID',
  `metadata_id` int DEFAULT NULL COMMENT 'metadata id;METADATAID',
  `channel_id` int DEFAULT NULL COMMENT 'channel id;CHANNELID',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url;URL',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'content;CONTENT',
  `doc_status` int DEFAULT NULL COMMENT 'doc status;DOCSTATUS',
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'name;NAME',
  `source` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'source;SOURCE',
  `language` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'language;LANGUAGE',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='展览-所有展览项集合;WCMMETATABLESEARCH';

-- ----------------------------
-- Table structure for biz_hkmp_tag_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_tag_info`;
CREATE TABLE `biz_hkmp_tag_info` (
  `id` bigint NOT NULL COMMENT 'WCMMETATABLETAGINFOID',
  `metadata_id` bigint DEFAULT NULL COMMENT 'METADATAID',
  `channel_id` bigint DEFAULT NULL COMMENT 'CHANNELID',
  `doc_id` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'DOCID',
  `tags` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TAGS',
  `username` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'USERNAME',
  `ip` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'IP',
  `enable` int DEFAULT NULL COMMENT 'ENABLE',
  `collection` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'COLLECTION',
  `language` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'LANGUAGE',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='标签数据?;WCMMETATABLETAGINFO';

-- ----------------------------
-- Table structure for biz_hkmp_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_template`;
CREATE TABLE `biz_hkmp_template` (
  `id` bigint NOT NULL COMMENT 'TEMPID',
  `pid` bigint NOT NULL DEFAULT '0' COMMENT '上级id;ROOTID',
  `temp_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模板名;TEMPNAME',
  `temp_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板描述;TEMPDESC',
  `temp_ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'htm' COMMENT '模板扩展;TEMPEXT',
  `temp_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '模板文本;TEMPTEXT',
  `attribute` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '属性;ATTRIBUTE',
  `apd_modified` int NOT NULL DEFAULT '0' COMMENT '修改;APDMODIFIED',
  `temp_type` int NOT NULL DEFAULT '0' COMMENT '模板类型;TEMPTYPE',
  `temp_form_id` bigint NOT NULL DEFAULT '0' COMMENT 'temp_form_id;TEMPFORMID',
  `is_parsed` int NOT NULL DEFAULT '0' COMMENT 'is_parsed;ISPARSED',
  `folder_type` int NOT NULL DEFAULT '103' COMMENT 'folder_type;FOLDERTYPE',
  `folder_id` bigint NOT NULL DEFAULT '0' COMMENT 'folder_id;FOLDERID',
  `output_file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成视图名;OUTPUTFILENAME',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;LASTMODIFIEDUSER',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;LASTMODIFIEDTIME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='模板管理;WCMTEMPLATE';

-- ----------------------------
-- Table structure for biz_hkmp_upload_file_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_upload_file_log`;
CREATE TABLE `biz_hkmp_upload_file_log` (
  `id` bigint NOT NULL COMMENT 'id;APPENDIXID',
  `app_doc_id` bigint DEFAULT NULL COMMENT '文档id;APPDOCID',
  `app_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件生成名;APPFILE',
  `app_file_type` int DEFAULT '-1' COMMENT '文件类型(-1);APPFILETYPE',
  `app_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上传名;APPDESC',
  `app_link_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'app_link_alt;APPLINKALT',
  `app_sern` int DEFAULT NULL COMMENT 'Is sern;APPSERN',
  `app_prop` int DEFAULT NULL COMMENT 'Is prop;APPPROP',
  `app_flag` int DEFAULT NULL COMMENT 'flag;APPFLAG',
  `app_time` datetime DEFAULT NULL COMMENT 'time;APPTIME',
  `app_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'author;APPAUTHOR',
  `app_editor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'editor;APPEDITOR',
  `attribute` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'attribute;ATTRIBUTE',
  `used_versions` int DEFAULT '1' COMMENT 'Version;USEDVERSIONS',
  `src_file` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Src File;SRCFILE',
  `file_ext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'file_ext;FILEEXT',
  `is_import_to_image_lib` int DEFAULT '0' COMMENT 'is_import_to_image_lib;ISIMPORTTOIMAGELIB',
  `related_column` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'related_column;RELATEDCOLUMN',
  `relate_photo_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'related_column;RELATEPHOTOIDS',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='图片记录;WCMAPPENDIX';

-- ----------------------------
-- Table structure for biz_hkmp_upload_job_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_upload_job_log`;
CREATE TABLE `biz_hkmp_upload_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批量操作任务编号',
  `tiele` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件类型',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '处理状态',
  `error_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提示信息',
  `org_id` bigint DEFAULT NULL COMMENT '租户id',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='上传日志';

-- ----------------------------
-- Table structure for biz_hkmp_video
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_video`;
CREATE TABLE `biz_hkmp_video` (
  `id` bigint NOT NULL COMMENT 'id;DOCID',
  `xvideo_id` bigint NOT NULL COMMENT 'Video id;XVIDEOID',
  `parent_id` bigint DEFAULT NULL COMMENT 'Parent id;PARENTID',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Token;TOKEN',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Thumb;THUMB',
  `duration` int DEFAULT NULL COMMENT 'Is Duration;DURATION',
  `width` int DEFAULT NULL COMMENT 'Is Width;WIDTH',
  `height` int DEFAULT NULL COMMENT 'Is Height;HEIGHT',
  `fps` int DEFAULT NULL COMMENT 'Is fps;FPS',
  `bitrate` int DEFAULT NULL COMMENT 'Is bitrate;BITRATE',
  `create_type` int DEFAULT NULL COMMENT 'Is create type;CREATETYPE',
  `convert_status` int DEFAULT NULL COMMENT 'Is convert_status;CONVERT_STATUS',
  `ref_count` int DEFAULT NULL COMMENT 'Is ref_count;REF_COUNT',
  `play_count` int DEFAULT NULL COMMENT 'Is play_count;PLAY_COUNT',
  `is_copied` int DEFAULT NULL COMMENT 'is copied;IS_COPIED',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Is file name;FILENAME',
  `src_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Is src file name;SRCFILENAME',
  `quality` int DEFAULT NULL COMMENT 'Is quality;QUALITY',
  `format` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Is format;FORMAT',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;no exist',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;no exist',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;no exist',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;no exist',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='视频文件信息;XWCMVIDEO_SP2';

-- ----------------------------
-- Table structure for biz_hkmp_view
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_view`;
CREATE TABLE `biz_hkmp_view` (
  `id` bigint NOT NULL COMMENT '视图编号;VIEWINFOID',
  `view_e_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视图英文名称;VIEWNAME',
  `view_cn_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视图中文名称;VIEWDESC',
  `db_tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据库后缀名;MAINTABLENAME',
  `db_tableinfo_id` bigint DEFAULT NULL COMMENT '数据库关联id;MAINTABLEID',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者id;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者id;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='视图信息;XWCMVIEWINFO';

-- ----------------------------
-- Table structure for biz_hkmp_view_fieldinfo_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_view_fieldinfo_ref`;
CREATE TABLE `biz_hkmp_view_fieldinfo_ref` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键;VIEWFIELDINFOID',
  `view_id` bigint NOT NULL COMMENT '视图id;VIEWID',
  `field_id` bigint NOT NULL COMMENT '字段id;FIELDNAME',
  `db_tableinfo_id` bigint DEFAULT NULL COMMENT '数据库关联id;MAINTABLEID',
  `image_frontend_field_name_en` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'image前台显示名称(英文)',
  `image_frontend_field_name_cn` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'image前台显示名称(中文)',
  `video_frontend_field_name_en` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'video前台显示名称(英文)',
  `video_frontend_field_name_cn` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'video前台显示名称(中文)',
  `audio_frontend_field_name_en` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'audio前台显示名称(英文)',
  `audio_frontend_field_name_cn` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'audio前台显示名称(中文)',
  `print_frontend_field_name_en` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'print前台显示名称(英文)',
  `print_frontend_field_name_cn` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'print前台显示名称(中文)',
  `is_display_front` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `is_display_backend` smallint NOT NULL DEFAULT '0' COMMENT '后台页面是否显示;NO EXIST',
  `is_hyperlink_search` smallint NOT NULL DEFAULT '1' COMMENT '是否支持超链接搜索;NO EXIST',
  `sort` int DEFAULT NULL COMMENT '排序;NO EXIST',
  `image_sort` int DEFAULT NULL COMMENT 'image排序;NO EXIST',
  `video_sort` int DEFAULT NULL COMMENT 'video排序;NO EXIST',
  `audio_sort` int DEFAULT NULL COMMENT 'audio排序;NO EXIST',
  `print_sort` int DEFAULT NULL COMMENT 'print排序;NO EXIST',
  `image_is_display_front_en` smallint NOT NULL DEFAULT '0' COMMENT 'image前台页面是否显示;NO EXIST',
  `video_is_display_front_en` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `audio_is_display_front_en` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `print_is_display_front_en` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `org_id` bigint DEFAULT NULL COMMENT '租户id;NO EXIST',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name;NO EXIST',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者;CRUSER',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
  `is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者;NO EXIST',
  `last_upd_dt` datetime DEFAULT NULL COMMENT '更新时间;NO EXIST',
  `image_is_display_front_cn` smallint NOT NULL DEFAULT '0' COMMENT 'image前台页面是否显示;NO EXIST',
  `video_is_display_front_cn` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `audio_is_display_front_cn` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `print_is_display_front_cn` smallint NOT NULL DEFAULT '0' COMMENT '前台页面是否显示;NO EXIST',
  `image_front_is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `video_front_is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `audio_front_is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  `print_front_is_delete` smallint NOT NULL DEFAULT '0' COMMENT '是否删除;NO EXIST',
  PRIMARY KEY (`id`),
  UNIQUE KEY `view_id` (`view_id`,`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1526141357226201090 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='视图字段关联表;XWCMVIEWFIELDINFO';

-- ----------------------------
-- Table structure for biz_mmis_access_rule
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_access_rule`;
CREATE TABLE `biz_mmis_access_rule` (
  `id` bigint NOT NULL COMMENT 'ID rule id',
  `ac_rule_id` bigint NOT NULL COMMENT 'Rule ID',
  `ac_rule_type` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Rule Type	Rule Type C - Content Type W - Workstation Type L - Location Type',
  `ac_usr_grp` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Patron Group',
  `ac_ws_grp` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Restricted Workstation Group	Workstation Group Not Accessible',
  `ac_cnt_grp` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Restricted Content Group	Content Group Not Accessible',
  `ac_remarks` varchar(254) COLLATE utf8mb4_bin NOT NULL COMMENT 'Remarks (English) English Remarks',
  `ac_remarks_ch` varchar(254) COLLATE utf8mb4_bin NOT NULL COMMENT 'Remarks (Chinese) Chinese Remarks',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Access Control Rules';

-- ----------------------------
-- Table structure for biz_mmis_auth_dis
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_auth_dis`;
CREATE TABLE `biz_mmis_auth_dis` (
  `id` bigint NOT NULL COMMENT 'id',
  `authority` varchar(100) DEFAULT NULL COMMENT 'Authority',
  `value` text COMMENT 'Value',
  `sort_value` text COMMENT 'Sort Value',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Authority dis';

-- ----------------------------
-- Table structure for biz_mmis_auth_marc_mapping
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_auth_marc_mapping`;
CREATE TABLE `biz_mmis_auth_marc_mapping` (
  `id` bigint NOT NULL COMMENT 'id',
  `auth_type` varchar(2) NOT NULL COMMENT 'Authority Type	NM - Name SJ - Subject UT - Uniform Title ST - Series Title',
  `auth_field` varchar(20) NOT NULL COMMENT 'Authority Field	Possible values:  ID AUTH SEE_FR SEE_ALSO_FR',
  `marc_format` varchar(20) NOT NULL COMMENT 'Marc Format	Format of MARC file:  MARC21 CNMARC etc？K.',
  `marc_field_notation` varchar(100) DEFAULT NULL COMMENT 'Marc Field Notation	string containing a MARC field notation in the ff. format:  [3 characters field][optional 2 characters indicators][optional subfields, each subfield preceded by a ''$'']  examples:    *    100       - field 100, no indicators, no subfields    *    100##$a$b - field 100, no indicators, with subfields a & b    *    1001#$a$b - field 100, with ind1 = 1, no indicator 2, with subfields a & b    *    10010$a$b - field 100, with ind1 = 1, ind2 = 0, with subfields a & b',
  `handler_class` varchar(100) DEFAULT NULL COMMENT 'HandlerClass	Fully qualified class name of mapping handler. This is for special cases. Do not specify any for normal cases.',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Authority Marc Mapping';

-- ----------------------------
-- Table structure for biz_mmis_auth_name_fr
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_auth_name_fr`;
CREATE TABLE `biz_mmis_auth_name_fr` (
  `id` bigint NOT NULL COMMENT 'id',
  `ctrl_name_id` varchar(8) NOT NULL COMMENT 'Controlled Name ID	Parent Controlled Name record',
  `rel_auth_name_id` varchar(8) NOT NULL COMMENT 'Related Authority Name ID	See Also From (FK to other Controlled Name records)',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='See Also From Name';

-- ----------------------------
-- Table structure for biz_mmis_auth_subjlocdist
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_auth_subjlocdist`;
CREATE TABLE `biz_mmis_auth_subjlocdist` (
  `id` bigint NOT NULL COMMENT 'id',
  `ctrl_subj_loc_dist_id` varchar(8) NOT NULL,
  `tier1` varchar(250) NOT NULL,
  `tier2` varchar(250) DEFAULT NULL,
  `tier3` varchar(250) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Authority ';

-- ----------------------------
-- Table structure for biz_mmis_auth_unif_fr
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_auth_unif_fr`;
CREATE TABLE `biz_mmis_auth_unif_fr` (
  `id` bigint NOT NULL COMMENT 'id',
  `ctrl_unif_title_id` varchar(8) NOT NULL COMMENT 'Controlled Uniform Title ID	Parent Controlled Name record',
  `see_fr_descrip` varchar(50) NOT NULL COMMENT 'See From Description	See From Description',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='See From Uniform Title';

-- ----------------------------
-- Table structure for biz_mmis_batch_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_batch_item`;
CREATE TABLE `biz_mmis_batch_item` (
  `id` bigint NOT NULL COMMENT 'id',
  `batch_id` bigint NOT NULL COMMENT 'Batch Id	ID of the parent Batch Upload record',
  `batch_item_status` varchar(2) NOT NULL COMMENT 'Batch Item Status	Status of the batch item:  For Batch Type ER: NW - New VN - Verified (New) CO - Checked-out VR - Verified (Removed) CI - Checked-in RM - Removed  For Batch Type AR: NW - New CI - Confirmed - Inserted CU - Confirmed - Updated VD - Validation Failed - Duplicate Record VN - Validation Failed - Non-existent Record VI - Validation Failed - Invalid See From  For type FL and MT: NW - New VN - Verified (New) TR - To Be Removed RM - Removed CO - Checked-out VC - Verified (Checked-out) VR - Verified (Removed) CI - Checked-in TB - To Be Rolled Back RB - Rolled Back',
  `type` varchar(10) NOT NULL COMMENT 'Batch Item Type	Possible Values: CR - Catalogue HR - Holding AR - Authority CT - Content',
  `ref_id` varchar(30) NOT NULL COMMENT 'Batch Item Type ID	ID of the type record (e.g. Catalogue Record.Item ID if the Batch Item Type is Catalogue)',
  `obj_ref_id` varchar(10) DEFAULT NULL COMMENT 'Original Object ID	Object ID of the Digitised Object record applicable only for Batch Item Type = Content during checkout.',
  `eresrc_action` varchar(1) DEFAULT NULL COMMENT 'e-Resource Action	For e-Resource Batch items only.  I - For Insertion U - For Update D - For Delete',
  `auth_action` varchar(1) DEFAULT NULL COMMENT 'Authority Action	For Authority Batch items only. I - For Insertion U - For Update',
  `watermark` varchar(1) DEFAULT NULL,
  `content_status` varchar(2) DEFAULT NULL,
  `main_content_count` bigint DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Batch Item';

-- ----------------------------
-- Table structure for biz_mmis_batch_item_status
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_batch_item_status`;
CREATE TABLE `biz_mmis_batch_item_status` (
  `id` bigint NOT NULL COMMENT 'id',
  `status_code` varchar(2) NOT NULL COMMENT 'Status Code',
  `status_name` varchar(50) NOT NULL COMMENT 'Status Name',
  `batch_item_type` varchar(2) NOT NULL COMMENT 'Batch Item Type',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Batch Item Status';

-- ----------------------------
-- Table structure for biz_mmis_batch_list
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_batch_list`;
CREATE TABLE `biz_mmis_batch_list` (
  `id` bigint NOT NULL COMMENT 'id',
  `batch_id` varchar(20) NOT NULL,
  `batch_mode` varchar(40) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Batch List';

-- ----------------------------
-- Table structure for biz_mmis_batch_upload_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_batch_upload_type`;
CREATE TABLE `biz_mmis_batch_upload_type` (
  `id` bigint NOT NULL COMMENT 'id',
  `material_type` varchar(20) NOT NULL COMMENT 'Material Type Id	PK for Material Type',
  `material_type_value` varchar(200) NOT NULL COMMENT 'Material Type Value	Value displayed in screen',
  `sort_order` int NOT NULL COMMENT 'Sort Order used for sorting table values',
  `storage_lvl` varchar(20) DEFAULT NULL COMMENT 'Storage Level	storage level for material type L1 - Level1 L2 - Level2 L3 - Level3',
  `av_indicator` varchar(1) DEFAULT NULL COMMENT 'Audio/Video Indicator	indicates if Material type is Audio/Video',
  `watermark` varchar(1) DEFAULT NULL COMMENT 'Watermark	indicates if material type can be optionally be watermarked',
  `upload_folder` varchar(100) DEFAULT NULL COMMENT 'Upload Folder	upload folder used in shared storage upload',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Batch Upload Material Type';

-- ----------------------------
-- Table structure for biz_mmis_catalogue_field_value
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_catalogue_field_value`;
CREATE TABLE `biz_mmis_catalogue_field_value` (
  `id` bigint NOT NULL COMMENT 'Item ID Internal unique ID',
  `item_id` bigint DEFAULT NULL COMMENT 'Item Id	ID of the parent Catalogue Record record source biz_mmis_catalogue_record',
  `metadata_field_id` bigint DEFAULT NULL COMMENT 'Metadata Field ID of the Dublin Core field sourcebiz_mmis_metadata_field',
  `text_value` text COMMENT 'Value	Value of the DC field',
  `text_lang` varchar(24) DEFAULT NULL,
  `place` bigint DEFAULT NULL COMMENT 'Place	Sequence for repeated fields',
  `authority` varchar(20) DEFAULT NULL COMMENT 'Authority Reference	Authority ID if the value is from Authority record',
  `confidence` bigint DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Catalogue Field Values';

-- ----------------------------
-- Table structure for biz_mmis_catalogue_record
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_catalogue_record`;
CREATE TABLE `biz_mmis_catalogue_record` (
  `id` bigint NOT NULL COMMENT 'Item ID Internal unique ID',
  `db_status` varchar(10) NOT NULL COMMENT 'Status	Possible Values: CV - ConversionPR - ProductionCO - Checkout',
  `dspace_item_id` bigint DEFAULT NULL COMMENT 'Dspace item Id Item ID of the corresponding record in DSpace',
  `title` text COMMENT 'Title	Corresponds to Title.Main metadata',
  `bib_no` varchar(20) DEFAULT NULL COMMENT 'Bib No.	Corresponds to Identifier.BIBNO metadata',
  `issue_dt` text COMMENT 'Issue Date	Corresponds to Date.Issued metadata',
  `template_id` bigint DEFAULT NULL COMMENT 'Template Id	ID of the used Catalogue Template record',
  `checkout_by` varchar(20) DEFAULT NULL COMMENT 'Checkout By	User ID who checked-out the record',
  `content_grp` varchar(100) DEFAULT NULL COMMENT 'Content Group - Full	Corresponds to Content Group - Full metadata',
  `cat_grp` text COMMENT 'Category	Corresponds to Category metadata',
  `author` text COMMENT 'Author	Contains 5 name authority values',
  `locked_by` varchar(20) DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
  `cat_grp_auth` varchar(20) DEFAULT NULL COMMENT 'Category Group Authority	Authority key of category group',
  `content_grp_auth` varchar(20) DEFAULT NULL COMMENT 'Content Group - Full Code	Code of the Content Group - Full',
  `intra_accs_link` text COMMENT 'Intranet Access Link	Intranet Access Link for the e-Database',
  `inter_accs_link` text COMMENT 'Internet Access Link	Internet Access Link for the e-Database',
  `url` text COMMENT 'URL	Cover page url of the item (used by report)',
  `url_status` varchar(1) DEFAULT NULL COMMENT 'URL Status	A - Active; B - Broken',
  `eresrc_src` bigint DEFAULT NULL COMMENT 'E-Resource Source	Refers to E-Resource Source if item is an e-resource',
  `digitised_obj_active_dir` varchar(1) DEFAULT NULL COMMENT 'Digitised Object Active Directory	Holds the current active directory of Digitised objects. The value should be prepended to the DS_REF of the DIGITISED_OBJ record',
  `content_grp_save` varchar(100) DEFAULT NULL COMMENT 'Content Group - Save/Download	Corresponds to Content Group - Save/Download metadata',
  `content_grp_save_cd` varchar(20) DEFAULT NULL COMMENT 'Content Group - Save/Download Code	Code of the Content Group - Save/Download',
  `content_grp_print` varchar(100) DEFAULT NULL COMMENT 'Content Group - Print	Corresponds to Content Group - Print',
  `content_grp_print_cd` varchar(20) DEFAULT NULL COMMENT 'Content Group - Print Code	Code of the Content Group - Print',
  `material_type` varchar(20) DEFAULT NULL,
  `issue_dt_date` datetime DEFAULT NULL,
  `oaipmh_src` bigint DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Catalogue Record';

-- ----------------------------
-- Table structure for biz_mmis_catalogue_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_catalogue_template`;
CREATE TABLE `biz_mmis_catalogue_template` (
  `id` bigint NOT NULL COMMENT 'ID',
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'Template Name Template Name',
  `template_descrip` text COLLATE utf8mb4_bin COMMENT 'Template Description Template Description',
  `material_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Material Type(Source Material Type Table)',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Catalogue Template';

-- ----------------------------
-- Table structure for biz_mmis_catalogue_template_field
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_catalogue_template_field`;
CREATE TABLE `biz_mmis_catalogue_template_field` (
  `id` bigint NOT NULL COMMENT 'ID',
  `template_id` bigint NOT NULL DEFAULT '0' COMMENT 'Template Id	ID of the parent Catalogue Template',
  `metadata_field_id` bigint NOT NULL DEFAULT '0' COMMENT 'Metadata Field Id	ID of the Dublin Core field（biz_mmis_metadata_field',
  `text_value` text COLLATE utf8mb4_bin COMMENT 'Value of the DC field',
  `place` bigint DEFAULT NULL COMMENT 'Place	Sequence for repeated fields',
  `authority` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Authority Reference	Authority ID if the value is from Authority record',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Catalogue Template Field';

-- ----------------------------
-- Table structure for biz_mmis_code_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_code_group`;
CREATE TABLE `biz_mmis_code_group` (
  `id` bigint NOT NULL COMMENT 'id',
  `ms_group_type` varchar(20) NOT NULL COMMENT 'Group Type	Group Type STAFFGROUP - Staff Group PLOCATION - Player Location WSLOCATION - Workstation Location LLOCATION - Library Location',
  `ms_group_code` varchar(20) NOT NULL COMMENT 'Group Code',
  `ms_group_desc` varchar(80) NOT NULL COMMENT 'Group Description',
  `ms_group_cdesc` varchar(80) DEFAULT NULL COMMENT 'Group Chinese Description',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Code Group';

-- ----------------------------
-- Table structure for biz_mmis_content_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_content_group`;
CREATE TABLE `biz_mmis_content_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `cg_code` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Content Group Code',
  `cg_desc` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Content Group Description',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Group';

-- ----------------------------
-- Table structure for biz_mmis_content_highlight_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_content_highlight_stat`;
CREATE TABLE `biz_mmis_content_highlight_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `item_id` bigint NOT NULL COMMENT 'Item ID',
  `part_id` varchar(14) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Part ID',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Statistics';

-- ----------------------------
-- Table structure for biz_mmis_content_highlight_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_content_highlight_summary`;
CREATE TABLE `biz_mmis_content_highlight_summary` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime DEFAULT NULL,
  `acs_hr` int DEFAULT NULL,
  `bib_no` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `content_lvl` bigint DEFAULT NULL,
  `cat_ctrl_misc_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `col_value` text COLLATE utf8mb4_bin,
  `dspace_item_subj_hdg` bigint DEFAULT NULL,
  `acs_method` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `media_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `total` int DEFAULT NULL,
  `title` text COLLATE utf8mb4_bin,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Summary';

-- ----------------------------
-- Table structure for biz_mmis_content_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_content_summary`;
CREATE TABLE `biz_mmis_content_summary` (
  `id` bigint NOT NULL COMMENT 'ID',
  `mon_yr` varchar(7) COLLATE utf8mb4_bin NOT NULL COMMENT 'Month',
  `media_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Media Type',
  `stg_lvl` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Storage Level',
  `cat_grp` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Category',
  `no_catalogue` int NOT NULL COMMENT 'No. of Catalogue',
  `no_holding` int NOT NULL COMMENT 'No. of Holding',
  `no_digitised_hr` int NOT NULL COMMENT 'No. of Digitised Hours',
  `no_page_digitised_images` int NOT NULL COMMENT 'No. of Page of Digitised Images',
  `collection` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Collection',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Summary';

-- ----------------------------
-- Table structure for biz_mmis_controlled_misc
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_misc`;
CREATE TABLE `biz_mmis_controlled_misc` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status New/Being Processed',
  `auth_type` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Type of Authority',
  `attr_type` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Attribute Type',
  `value` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Value of the Attribute Type',
  `eng_descrip` text COLLATE utf8mb4_bin COMMENT 'English Description',
  `chi_descrip` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Chinese Description',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active Indicator Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator Temporary Indicator Yes / No',
  `url` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `value_chi` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `share` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Digital Collection Only\r\nHKMP Only\r\nDRM',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled Misc';

-- ----------------------------
-- Table structure for biz_mmis_controlled_misc_attr_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_misc_attr_type`;
CREATE TABLE `biz_mmis_controlled_misc_attr_type` (
  `id` bigint NOT NULL COMMENT 'ID',
  `attr_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Attribute ID	',
  `attr_val` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Attribute Value Displayed Value of Attribute',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Authority Miscellaneous Attribute Type';

-- ----------------------------
-- Table structure for biz_mmis_controlled_misc_catalogue_record_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_misc_catalogue_record_ref`;
CREATE TABLE `biz_mmis_controlled_misc_catalogue_record_ref` (
  `id` bigint NOT NULL COMMENT '主键',
  `controlled_misc_id` bigint DEFAULT NULL COMMENT '权威记录 id',
  `catalogue_record_id` bigint DEFAULT NULL COMMENT '书目 ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='权威记录书目关联表';

-- ----------------------------
-- Table structure for biz_mmis_controlled_name
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_name`;
CREATE TABLE `biz_mmis_controlled_name` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status New / Being Processed',
  `auth_name` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Authorized Name',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active Active Indicator Yes / No',
  `ngils` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'NGILS	Indicator if record is from NGILS Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator Temporary Indicator Yes / No',
  `see_also_fr_created_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled Name';

-- ----------------------------
-- Table structure for biz_mmis_controlled_series_title
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_series_title`;
CREATE TABLE `biz_mmis_controlled_series_title` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status	New / Being Processed',
  `auth_ser_title` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Authorized Series Title	Authorized Series Title',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active Indicator Yes / No',
  `ngils` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'NGILS	Indicator if record is from NGILS Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled Series Title';

-- ----------------------------
-- Table structure for biz_mmis_controlled_subject
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_subject`;
CREATE TABLE `biz_mmis_controlled_subject` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status	New / Being Processed',
  `auth_subj` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Authorized Subject	Authorized Subject',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active	Active Indicator Yes / No',
  `ngils` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'NGILS Indicator if record is from NGILS Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
  `see_also_fr_created_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled Subject';

-- ----------------------------
-- Table structure for biz_mmis_controlled_uniform_title
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_uniform_title`;
CREATE TABLE `biz_mmis_controlled_uniform_title` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status	New / Being Processed',
  `auth_unif_title` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Authorized Uniform Title	Authorized Uniform Title',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active Indicator Yes / No',
  `ngils` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'NGILS Indicator if record is from NGILS Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
  `see_also_fr_created_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'See Also From Created Indicator	Indicator that the record was inserted from a See Also From of another authority record because it was non-existent at the time of import of that record',
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled Uniform Title';

-- ----------------------------
-- Table structure for biz_mmis_controlled_uri
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_controlled_uri`;
CREATE TABLE `biz_mmis_controlled_uri` (
  `id` bigint NOT NULL COMMENT 'ID',
  `db_status` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Status	New / Being Processed',
  `link` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Link	Link of the URI',
  `eng_descrip` text COLLATE utf8mb4_bin COMMENT 'English Description',
  `chi_descrip` text COLLATE utf8mb4_bin COMMENT 'Chinese Description',
  `valid` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Valid	Valid Indicator',
  `active` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Active	Active Indicator Yes / No',
  `temporary_ind` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Temporary Indicator	Temporary Indicator Yes / No',
  `duplicate_metadata` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Controlled URI';

-- ----------------------------
-- Table structure for biz_mmis_cover_image
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_cover_image`;
CREATE TABLE `biz_mmis_cover_image` (
  `id` bigint NOT NULL COMMENT 'ID',
  `ci_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Cover Image id',
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Cover Image Name',
  `description` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Description',
  `category` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Category',
  `cover_image_path` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Cover Image image Path',
  `cover_image_icon_path` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Cover Image Icon Path',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Cover Image';

-- ----------------------------
-- Table structure for biz_mmis_coverpage_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_coverpage_usage_stat`;
CREATE TABLE `biz_mmis_coverpage_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `item_id` bigint DEFAULT NULL COMMENT 'Item ID',
  `part_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Part ID',
  `login_id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Login ID',
  `session_id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Session ID',
  `accessed_from` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Accessed From',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Access Statistics';

-- ----------------------------
-- Table structure for biz_mmis_coverpage_usage_stat_summ
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_coverpage_usage_stat_summ`;
CREATE TABLE `biz_mmis_coverpage_usage_stat_summ` (
  `id` bigint NOT NULL COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'Item ID',
  `hit_count` int NOT NULL COMMENT 'Hit Count',
  `start_period_dt` datetime NOT NULL COMMENT 'Start Period Date',
  `title` text COLLATE utf8mb4_bin COMMENT 'Title	Title of the Item',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Access Statistics Summary';

-- ----------------------------
-- Table structure for biz_mmis_coverpage_usage_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_coverpage_usage_summary`;
CREATE TABLE `biz_mmis_coverpage_usage_summary` (
  `id` bigint NOT NULL COMMENT 'id',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `dly_hr` varchar(2) DEFAULT NULL COMMENT 'Daily hour',
  `collection` varchar(250) DEFAULT NULL COMMENT 'Collection',
  `media_type` varchar(20) DEFAULT NULL COMMENT 'Media type',
  `acs_method` varchar(5) DEFAULT NULL COMMENT 'Access method',
  `acs_library` varchar(20) DEFAULT NULL COMMENT 'Access library',
  `content_grp_auth` varchar(20) DEFAULT NULL COMMENT 'Content group auth',
  `total_count` int DEFAULT NULL COMMENT 'Total count',
  `cat_grp` varchar(20) DEFAULT NULL,
  `oaipmh_src` int DEFAULT NULL COMMENT 'OAIPMH src',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Coverpage Usage Summary';

-- ----------------------------
-- Table structure for biz_mmis_dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_dictionary_item`;
CREATE TABLE `biz_mmis_dictionary_item` (
  `id` bigint NOT NULL COMMENT 'ID',
  `mapped_to` text COLLATE utf8mb4_bin COMMENT 'Mapped To',
  `keyword` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Keyword',
  `orig_keyword` text COLLATE utf8mb4_bin COMMENT 'Original Keyword',
  `orig_mapped_to` text COLLATE utf8mb4_bin COMMENT 'Original Mapped To',
  `mod_type` varchar(4) COLLATE utf8mb4_bin NOT NULL COMMENT 'Modify Type',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Dictionary Item';

-- ----------------------------
-- Table structure for biz_mmis_digitised_object
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_digitised_object`;
CREATE TABLE `biz_mmis_digitised_object` (
  `id` bigint NOT NULL COMMENT 'Item ID Internal unique ID',
  `item_id` int DEFAULT NULL COMMENT 'Item Id	Item ID of the owning Catalogue Record',
  `seq_no` int DEFAULT NULL COMMENT 'Sequence no Reference to the Sequence No. in the parent Item Table of Contents',
  `ds_ref` varchar(250) DEFAULT NULL COMMENT 'Location of the digitised object in the server',
  `status` varchar(10) DEFAULT NULL COMMENT 'Status	Possible Values: Conversion Production Checkout',
  `cntrl_grp` varchar(250) DEFAULT NULL COMMENT 'Content Group	Reference to Content Group of the Catalogue',
  `checksum` varchar(64) DEFAULT NULL COMMENT 'Checksum	Calculated upon upload. This will be used for content corruption check.',
  `no_of_pages` int DEFAULT NULL COMMENT 'No. of Pages	Will be set by CMSB03 for eBooks while for other images this will be set to 1. Only applicable for image content (including ebook)',
  `rtl_seq` varchar(1) DEFAULT NULL COMMENT 'Right to Left Page Sequence flag	Applicable only for ebook contents, flag to determine if content has right to left page sequence, values ''Y'' or null',
  `parent_obj_id` varchar(8) DEFAULT NULL COMMENT 'Parent Object ID	Applicable only for ebook contents when a page is inserted. ID of the parent Digitised Object record corresponding to the pdf where this record is inserted to.',
  `disp_seq_no` int DEFAULT NULL COMMENT 'Displayed Sequence No.	Applicable only for multiple image content: - Newspaper clippings - UR & RC archive - Old HK Newspaper - House Programme This will represent the order/sequence of the images when viewed using the image custom viewer',
  `object_type` varchar(20) DEFAULT NULL COMMENT 'Object Type	Reference to Object Type',
  `place` varchar(100) DEFAULT NULL COMMENT 'Place	Will be used for content with multiple pages (e.g. Maps, house programme, newspaper)',
  `locked_by` varchar(20) DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
  `converted` varchar(1) DEFAULT NULL COMMENT 'Converted	flag if Digitised object is coverted Y converted else N',
  `file_size` bigint DEFAULT NULL COMMENT 'File Size	File Size',
  `x_position` int DEFAULT NULL COMMENT 'X Position	applicable for Split Images',
  `y_position` int DEFAULT NULL COMMENT 'Y Position		applicable for Split Images ',
  `pdf_color` varchar(1) DEFAULT NULL,
  `pdf_dpi` int DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `DIGITISED_OBJ$IDX1` (`object_type`,`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Digitised Object';

-- ----------------------------
-- Table structure for biz_mmis_ext_link_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_ext_link_usage_stat`;
CREATE TABLE `biz_mmis_ext_link_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `ext_link` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'External Link',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='External Link Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_fav_content
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_fav_content`;
CREATE TABLE `biz_mmis_fav_content` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item ID	Item ID - Mapped to Catalogue Record.Item ID',
  `login_id` varchar(50) DEFAULT NULL COMMENT 'Login ID ',
  `session_id` varchar(50) DEFAULT NULL COMMENT 'Session ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Favourite Content';

-- ----------------------------
-- Table structure for biz_mmis_func_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_func_usage_stat`;
CREATE TABLE `biz_mmis_func_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `func` varchar(5) COLLATE utf8mb4_bin NOT NULL COMMENT 'Function',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Function Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_highlight_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_highlight_template`;
CREATE TABLE `biz_mmis_highlight_template` (
  `id` bigint NOT NULL COMMENT 'id',
  `highlight_template_name` varchar(100) NOT NULL COMMENT 'Content Highlight Template Name',
  `highlight_template_page` varchar(200) NOT NULL COMMENT 'Content Highlight Template Page',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Template';

-- ----------------------------
-- Table structure for biz_mmis_highlight_topic
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_highlight_topic`;
CREATE TABLE `biz_mmis_highlight_topic` (
  `id` bigint NOT NULL COMMENT 'ID',
  `topic_type` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'TOPIC_TYPE',
  `eng` int DEFAULT NULL COMMENT 'English	Language indicator',
  `chi` int DEFAULT NULL COMMENT 'Chinese Language indicator',
  `topic_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Topic Name(English)',
  `topic_name_chi` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Topic Name(Traditional Chinese)',
  `topic_name_chi_simp` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Topic Name(Chinese)',
  `descrip` text COLLATE utf8mb4_bin COMMENT 'Description(Traditional Chinese)',
  `descrip_chi` text COLLATE utf8mb4_bin COMMENT 'Description(Simplified Chinese)',
  `descrip_chi_simp` text COLLATE utf8mb4_bin COMMENT 'Description(Chinese)',
  `eff_dt_fr` date DEFAULT NULL COMMENT 'Effective Date start',
  `eff_dt_to` date DEFAULT NULL COMMENT 'Effective Date end',
  `no_items` int DEFAULT '0' COMMENT 'No of Items',
  `prev_n_days` int DEFAULT '0' COMMENT 'Previous N days Previous N days',
  `highlight_template_id` bigint NOT NULL COMMENT 'Content Highlight Template ID Content Highlight Topic ID',
  `ids_popup` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Popup Template',
  `kids_popup` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Popup Template',
  `popup_descrip` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Popup Description(English)',
  `popup_descrip_chi` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Popup Description(Traditional Chinese)',
  `popup_descrip_chi_simp` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Popup Description(Chinese)',
  `cover_image` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Popup Description(Chinese)',
  `cat` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Category',
  `nav_path` varchar(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'NAV_PATH',
  `is_default` varchar(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'IS_DEFAULT',
  `collection` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Collection',
  `author` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'Author',
  `show_accessible` char(2) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT 'Show Accessible Items Only Y - Show accessible items, used only if Type = M',
  `status` char(2) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'Status',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Topic';

-- ----------------------------
-- Table structure for biz_mmis_highlight_topic_age_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_highlight_topic_age_group`;
CREATE TABLE `biz_mmis_highlight_topic_age_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `highlight_topic_id` bigint NOT NULL DEFAULT '0' COMMENT 'Content Highlight Topic ID',
  `age_grp_id` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'Age Group',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Topic Age Group';

-- ----------------------------
-- Table structure for biz_mmis_highlight_topic_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_highlight_topic_item`;
CREATE TABLE `biz_mmis_highlight_topic_item` (
  `id` bigint NOT NULL COMMENT 'ID',
  `highlight_topic_id` bigint NOT NULL DEFAULT '0' COMMENT 'Content Highlight Topic ID Content Highlight Topic ID',
  `item_id` bigint NOT NULL DEFAULT '0' COMMENT 'Item ID Item ID',
  `ord` int NOT NULL DEFAULT '0' COMMENT 'Order',
  `is_default` char(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Order',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Content Highlight Topic Item';

-- ----------------------------
-- Table structure for biz_mmis_holding_batch
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_holding_batch`;
CREATE TABLE `biz_mmis_holding_batch` (
  `id` bigint NOT NULL COMMENT 'id',
  `upl_mode` varchar(2) NOT NULL COMMENT 'Upload Mode',
  `status` varchar(2) NOT NULL COMMENT 'Status',
  `descrip` varchar(200) DEFAULT NULL COMMENT 'Desc',
  `material_type` varchar(20) NOT NULL COMMENT 'Material Type',
  `category_auth` varchar(20) DEFAULT NULL COMMENT 'Category Auth',
  `cms08_batch_id` bigint DEFAULT NULL,
  `cms09_batch_id` bigint DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Holding Batch';

-- ----------------------------
-- Table structure for biz_mmis_hypertext_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_hypertext_usage_stat`;
CREATE TABLE `biz_mmis_hypertext_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `hypertext` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Hypertext',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Hypertext Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_item_ocr
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_item_ocr`;
CREATE TABLE `biz_mmis_item_ocr` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
  `source_content` text COMMENT 'Source Content',
  `content` text COMMENT 'Content',
  `status` int DEFAULT NULL COMMENT 'Status: 1 ok 0 fail',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Ocr To Text';

-- ----------------------------
-- Table structure for biz_mmis_item_rel_docs
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_item_rel_docs`;
CREATE TABLE `biz_mmis_item_rel_docs` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
  `doc_name` varchar(100) NOT NULL COMMENT 'Document Name',
  `doc_location` varchar(250) NOT NULL COMMENT 'Document Location	Location of the document in the SAN',
  `file_size` int NOT NULL COMMENT 'File Size',
  `status` varchar(2) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Item Related Documents';

-- ----------------------------
-- Table structure for biz_mmis_item_stt
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_item_stt`;
CREATE TABLE `biz_mmis_item_stt` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item ID Item ID of the Catalogue record',
  `gcs_uri` varchar(120) DEFAULT NULL COMMENT 'gcs uri',
  `bucket_name` varchar(50) DEFAULT NULL COMMENT 'BucketName',
  `object_name` varchar(120) DEFAULT NULL COMMENT 'ObjectName',
  `source_content` text COMMENT 'Source Content',
  `content` text COMMENT 'Content',
  `status` int DEFAULT '2' COMMENT 'Status: 1 ok 0 fail 2 analyze',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Speech to Text';

-- ----------------------------
-- Table structure for biz_mmis_item_toc
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_item_toc`;
CREATE TABLE `biz_mmis_item_toc` (
  `id` bigint NOT NULL COMMENT 'id',
  `db_status` varchar(10) NOT NULL COMMENT 'Status	Possible Values: Conversion Production Checkout',
  `dspace_item_id` bigint DEFAULT NULL COMMENT 'Dspace Item Id	Item ID of the owning Item in DSpace',
  `item_id` bigint NOT NULL COMMENT 'Item Id	Item ID of the owning Catalogue Record',
  `seq_no` int NOT NULL COMMENT 'Sequence No',
  `chi_descrip` varchar(250) DEFAULT NULL COMMENT 'Chinese Description',
  `eng_descrip` varchar(250) DEFAULT NULL COMMENT 'English Description',
  `process` varchar(128) DEFAULT NULL COMMENT 'Process',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Item Table of Contents';

-- ----------------------------
-- Table structure for biz_mmis_lib_card
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_lib_card`;
CREATE TABLE `biz_mmis_lib_card` (
  `id` bigint NOT NULL COMMENT 'id',
  `ur_id` varchar(20) NOT NULL COMMENT 'Patron ID	Patron ID',
  `lib_card_no` varchar(20) NOT NULL COMMENT 'Library Card Number	Library Card No of Patron',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Patron Library Card';

-- ----------------------------
-- Table structure for biz_mmis_library_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_library_group`;
CREATE TABLE `biz_mmis_library_group` (
  `id` bigint NOT NULL COMMENT 'id',
  `lib_group_code` varchar(20) NOT NULL COMMENT 'Library Group Code',
  `lib_group_name` varchar(80) NOT NULL COMMENT 'Library Group Name',
  `lib_group_type` varchar(20) NOT NULL COMMENT 'Library Group Type	Library Group Type G - Geographic District L - Library Type',
  `lib_group_cname` varchar(80) NOT NULL COMMENT 'Library Group Chinese Name',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Library Group';

-- ----------------------------
-- Table structure for biz_mmis_library_profile
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_library_profile`;
CREATE TABLE `biz_mmis_library_profile` (
  `id` bigint NOT NULL COMMENT 'id',
  `lib_code` varchar(20) NOT NULL COMMENT 'Library Code',
  `lib_name` varchar(80) NOT NULL COMMENT 'Library Name',
  `lib_cname` varchar(80) NOT NULL COMMENT 'Library Chinese Name',
  `lib_group_code_1` varchar(20) NOT NULL COMMENT 'Geographic District',
  `lib_group_code_2` varchar(20) NOT NULL COMMENT 'Library Type',
  `lib_address` text COMMENT 'Address',
  `ms_group_code` varchar(20) NOT NULL COMMENT 'Location Area Code',
  `av_bb_available` varchar(1) NOT NULL COMMENT 'AV Booth Booking Available?	AV Booth Booking Available? Y - Yes N - No',
  `total_av_hkcl` int NOT NULL COMMENT 'Total no. of concurrent intranet A/V streams in HKCL	Use label if Library Type is "Central Library". Label changed to "Total no. of concurrent intranet A/V streams in this branch library" if Library Type is not "Central Library".',
  `total_av_all` int DEFAULT NULL COMMENT 'Total no. of concurrent intranet A/V streams in all branch libraries	Display only if Library Type is "Central Library".',
  `total_cd_all` int DEFAULT NULL COMMENT 'Total no. of concurrent CD-ROM playback in all branch libraries	Display only if Library Type is "Central Library".',
  `lib_prefix` varchar(3) NOT NULL COMMENT 'Library Prefix for Booking	Library Prefix for Booking reference ID',
  `max_book_hrs` int DEFAULT NULL COMMENT 'Maximum booking hours (workstation and content) per day	Maximum booking hours (workstation and content) (e.g. 2 hours) per day at a branch library (exclude HKCL)',
  `total_cd_lib` int NOT NULL COMMENT 'Total CD Lib	will hold Total no. of concurrent CD-ROM playback in HKCL or in a branch library',
  `total_level2_hkcl` int NOT NULL COMMENT 'Total Level 2 in HKCL	will hold Total no. of concurrent Level 2 A/V playback in HKCL (always 0 for branch library).',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Library Profile';

-- ----------------------------
-- Table structure for biz_mmis_live_channel
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_live_channel`;
CREATE TABLE `biz_mmis_live_channel` (
  `id` bigint NOT NULL COMMENT 'id',
  `channel_id` varchar(64) DEFAULT NULL COMMENT 'Channel ID',
  `channel_name` varchar(100) DEFAULT NULL COMMENT 'Channel Name',
  `stream_url` varchar(100) DEFAULT NULL COMMENT 'Streaming URL',
  `stream_key` varchar(100) DEFAULT NULL COMMENT 'Streaming Key',
  `playback_file` varchar(100) DEFAULT NULL COMMENT 'Playback file',
  `live_duration` varchar(30) DEFAULT NULL COMMENT 'Live Duration',
  `concurrent_intranet` int DEFAULT '0' COMMENT 'Concurrent Intranet Viewers',
  `intranet_viewer` int DEFAULT '0' COMMENT 'Total Intranet Viewers',
  `concurrent_internet` int DEFAULT '0' COMMENT 'Concurrent Internet Viewers',
  `internet_viewer` int DEFAULT '0' COMMENT 'Total Internet Viewers',
  `start_time` datetime NOT NULL COMMENT 'Live Start Time',
  `signal` varchar(30) DEFAULT NULL COMMENT 'Live Signal',
  `status` smallint NOT NULL DEFAULT '0' COMMENT 'Live Status:0/Not Started 1/Started 2/Ended',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Live Broadcast Channel';

-- ----------------------------
-- Table structure for biz_mmis_live_channel_viewer
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_live_channel_viewer`;
CREATE TABLE `biz_mmis_live_channel_viewer` (
  `id` bigint NOT NULL COMMENT 'id',
  `channel_id` bigint DEFAULT NULL COMMENT 'Channel ID',
  `connect_ip` varchar(30) DEFAULT NULL COMMENT 'Connect IP Address',
  `patron` varchar(30) NOT NULL DEFAULT 'Guest' COMMENT 'Stream Patron',
  `patron_location` varchar(50) DEFAULT NULL COMMENT 'Stream Patron Location',
  `duration` varchar(30) DEFAULT NULL COMMENT 'Connection Duration (S)',
  `start_time` datetime NOT NULL COMMENT 'Stream Start Time',
  `status` smallint NOT NULL DEFAULT '0' COMMENT 'Status:0/Alive 1/Dead',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Live Broadcast Channel Viewer';

-- ----------------------------
-- Table structure for biz_mmis_maintain_thesaurus
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_maintain_thesaurus`;
CREATE TABLE `biz_mmis_maintain_thesaurus` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键,唯一标识',
  `synonyms` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '同义词',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Create by',
  `create_dt` datetime DEFAULT NULL COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1526826964730552323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for biz_mmis_mapping_props
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_mapping_props`;
CREATE TABLE `biz_mmis_mapping_props` (
  `id` bigint NOT NULL COMMENT 'id',
  `table_name` varchar(30) DEFAULT NULL COMMENT 'Table Name',
  `field_name` varchar(30) DEFAULT NULL COMMENT 'Field Name',
  `dc_element` varchar(64) DEFAULT NULL COMMENT 'DC Element',
  `authority_copy` varchar(1) DEFAULT NULL COMMENT 'Authority',
  `dc_qualifier` varchar(64) DEFAULT NULL COMMENT 'DC Qualifier',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Mapping  Props';

-- ----------------------------
-- Table structure for biz_mmis_material_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_material_type`;
CREATE TABLE `biz_mmis_material_type` (
  `id` bigint NOT NULL COMMENT 'ID',
  `material_type` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Material Type reference to material type codes',
  `file_type` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'File Type reference to content object type',
  `sys_generated` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'System Generated	flag if file is system generated',
  `mandatory` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Mandatory flag if file is required',
  `min_count` bigint DEFAULT NULL COMMENT 'Minimum Count	minimum number of files',
  `max_count` bigint DEFAULT NULL COMMENT 'Maximum Count	maximum number of files',
  `sort_order` bigint DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Material Type Content';

-- ----------------------------
-- Table structure for biz_mmis_media_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_media_type`;
CREATE TABLE `biz_mmis_media_type` (
  `id` bigint NOT NULL COMMENT 'ID',
  `cd` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Code',
  `descrip` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Description',
  `stg_lvl` decimal(1,0) NOT NULL COMMENT 'Storage Level	Storage Level',
  `audio_only` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Audio Only Indicator Y if the media type only has audio.	Y or N',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Media Type';

-- ----------------------------
-- Table structure for biz_mmis_metadata_field
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_metadata_field`;
CREATE TABLE `biz_mmis_metadata_field` (
  `id` bigint NOT NULL COMMENT 'ID',
  `metadata_schema_id` bigint DEFAULT NULL COMMENT 'METADATA SCHEMA ID sourcebiz_mmis_metadata_schema',
  `element` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ELEMENT',
  `qualifier` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QUALIFIER',
  `scope_note` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SCOPE NOTE',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Metadata Type',
  `length` int DEFAULT NULL COMMENT 'Field Length',
  `effective_scope` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Metadata Effective Scope',
  `content_cover_page_label` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Cover Page Label',
  `content_cover_page_label_chi` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Cover Page Label(Chinese)',
  `content_cover_page_label_eng` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Cover Page Label(English)',
  `content_highlight_label` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Highlight Label',
  `content_highlight_label_chi` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Highlight Label(Chinese)',
  `content_highlight_label_eng` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Content Highlight Label(English)',
  `controlled_field` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'Controlled Field(Y N)',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Metadata Fields';

-- ----------------------------
-- Table structure for biz_mmis_metadata_field_controlled_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_metadata_field_controlled_group`;
CREATE TABLE `biz_mmis_metadata_field_controlled_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `field_id` bigint DEFAULT NULL COMMENT 'field id',
  `status` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'status',
  `controlled_group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Controlled Field Group',
  `controlled_attribute` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Miscellaneous Attribute',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Metadata property control';

-- ----------------------------
-- Table structure for biz_mmis_metadata_field_display
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_metadata_field_display`;
CREATE TABLE `biz_mmis_metadata_field_display` (
  `id` bigint NOT NULL COMMENT 'ID',
  `field_id` bigint DEFAULT NULL COMMENT 'field id',
  `updated_by_system` char(2) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'updated_by_system(1:Yes 0:No)',
  `brief` char(2) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Brief(1:Yes 0:No)',
  `order_brief` smallint DEFAULT '0' COMMENT 'Brief Order',
  `detail` char(2) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Detail(1:Yes 0:No)',
  `order_detail` smallint DEFAULT '0' COMMENT 'Detail Order',
  `hit_list` char(2) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Hit List(1:Yes 0:No)',
  `order_hit_list` smallint DEFAULT '0' COMMENT 'Hit List Order',
  `lock_tag` char(2) COLLATE utf8mb4_bin DEFAULT '0' COMMENT 'Lock Tag',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Metadata Properties Display';

-- ----------------------------
-- Table structure for biz_mmis_metadata_field_properties
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_metadata_field_properties`;
CREATE TABLE `biz_mmis_metadata_field_properties` (
  `id` bigint NOT NULL COMMENT 'ID',
  `field_id` bigint DEFAULT NULL COMMENT 'field id',
  `dc_element` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT 'DC Element Dublin Core Element',
  `dc_qualifier` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'DC Qualifier Dublin Core Qualifier',
  `ref_table_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Referenced Table',
  `repeatable` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Repeatable Signifies if field is repeatable on DC specs',
  `dc_mandatory` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Mandatory Signifies if field is mandatory on DC specs',
  `display_field` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Display Field	Signifies if field is displayed in content cover page',
  `internal` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Internal	Signifies if field is an internal field',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `FLD_PROPS$UK` (`dc_qualifier`,`dc_element`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Metadata Field Properties';

-- ----------------------------
-- Table structure for biz_mmis_metadata_schema
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_metadata_schema`;
CREATE TABLE `biz_mmis_metadata_schema` (
  `id` bigint NOT NULL COMMENT 'ID',
  `namespace` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NAMESPACE',
  `short_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SHORT ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Metadata Schema';

-- ----------------------------
-- Table structure for biz_mmis_news_highlight
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_news_highlight`;
CREATE TABLE `biz_mmis_news_highlight` (
  `id` bigint NOT NULL COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'ITEM ID',
  `highlight_dt` datetime DEFAULT NULL COMMENT 'Highlight Date',
  `ord` int DEFAULT NULL COMMENT 'Order',
  `section` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Section',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='News Highlight';

-- ----------------------------
-- Table structure for biz_mmis_news_hist_db
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_news_hist_db`;
CREATE TABLE `biz_mmis_news_hist_db` (
  `id` bigint NOT NULL COMMENT 'ID',
  `item_id` bigint DEFAULT NULL COMMENT 'Item ID',
  `news_hist_dt_id` bigint DEFAULT NULL COMMENT 'News History Date ID',
  `headline` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Headline',
  `status` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'Status',
  `page_no` int NOT NULL DEFAULT '0' COMMENT 'Page No.Page No.',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='News History Database';

-- ----------------------------
-- Table structure for biz_mmis_news_hist_dt
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_news_hist_dt`;
CREATE TABLE `biz_mmis_news_hist_dt` (
  `id` bigint NOT NULL COMMENT 'ID',
  `hist_day` int DEFAULT NULL COMMENT 'History Day',
  `hist_month` int DEFAULT NULL COMMENT 'History Month',
  `status` char(2) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'status(P:Published D:Draft)',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='News History Date';

-- ----------------------------
-- Table structure for biz_mmis_notif_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_notif_template`;
CREATE TABLE `biz_mmis_notif_template` (
  `id` bigint NOT NULL COMMENT 'id',
  `template_code` varchar(20) NOT NULL COMMENT 'Template Code',
  `template_header` longtext NOT NULL COMMENT 'Template Header',
  `template_body` longtext NOT NULL COMMENT 'Template Body',
  `template_footer` longtext NOT NULL COMMENT 'Template Footer',
  `incl_new_content` varchar(1) NOT NULL COMMENT 'Include New Content Reminder	Include New Content Reminder Y - Yes N - No',
  `enabled` varchar(1) NOT NULL COMMENT 'Enabled Indicator	Enabled? Y - Yes N - No',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Patron Notification Template';

-- ----------------------------
-- Table structure for biz_mmis_part_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_part_info`;
CREATE TABLE `biz_mmis_part_info` (
  `id` bigint NOT NULL COMMENT 'id',
  `db_status` varchar(10) NOT NULL COMMENT 'DB Status	Possible Values: Production Checkout',
  `item_id` bigint DEFAULT NULL COMMENT 'Item ID	Reference to owning Item Id in Conversion DB',
  `dspace_item_id` bigint DEFAULT NULL COMMENT 'Dspace Item Id	Reference to owning Item Id in Dspace DB',
  `vol` int NOT NULL COMMENT 'Volume',
  `bib_no` varchar(20) NOT NULL COMMENT 'Bib. No.	Bib No. of  the media.',
  `eng_descrip` varchar(80) DEFAULT NULL COMMENT 'English Description of  the Part.',
  `chi_descrip` varchar(80) DEFAULT NULL COMMENT 'Chinese Description of the Part',
  `media_type` varchar(20) NOT NULL COMMENT 'Media Type	Affect the player used to play this media, if assigned wrongly, the media cannot be played.',
  `media_std` varchar(20) DEFAULT NULL COMMENT 'Media Standard	Media Standard of this Part, only for VHS',
  `cntrl_grp` text NOT NULL COMMENT 'Content Group	Used for access control',
  `stg_lvl` int NOT NULL COMMENT 'Storage Level	Level 1/level 2/level 3',
  `has_2sides` varchar(1) DEFAULT NULL COMMENT 'Two-sided	When it is a two sided media',
  `lic_no` int NOT NULL COMMENT 'Total No. of Concurrent License	For Level 1, this number can be set to the maximum number of concurrent streams.  However, resource limitations and actual licensing consideration will affect the maximum that can be set. For level  2 :this number is the number of  copies of this part in jukebox. Note: All copies of a part should be put in the same jukebox for application to do load balancing.',
  `hkcl_lic` int DEFAULT NULL COMMENT 'HKCL License	No. of licenses allocated to HKCL',
  `all_branch_lic` int DEFAULT NULL COMMENT 'All Branches License	No. of licenses allocated to all branches',
  `internet_lic` int DEFAULT NULL COMMENT 'Internet License	No. of licenses allocated to Internet',
  `copy_no` int NOT NULL COMMENT 'Number of Copies	The number of copies for this part',
  `sub_part` int NOT NULL COMMENT 'Number of Sub-Parts	The number of sub-part for this part',
  `duration` int DEFAULT NULL COMMENT 'Duration (in min.)	The time allocated for this media to play. It can be different from the real media play time.',
  `media_loc` varchar(20) NOT NULL COMMENT 'Media Location	Actually it is a media location field. For level 1, it is the SAN storage system. For level 2, it is the jukebox ID.  For level 3, it is the floor location which  defines the floor location of this object.  It will be used to decide which player to play this media.',
  `locked_by` varchar(20) DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Part Information';

-- ----------------------------
-- Table structure for biz_mmis_patron_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_patron_group`;
CREATE TABLE `biz_mmis_patron_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `ur_group_code` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Patron Group Code',
  `ur_group_desc` varchar(80) COLLATE utf8mb4_bin NOT NULL COMMENT 'Patron Group Description',
  `ur_group_cdesc` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Patron Group Chinese Description',
  `ur_type` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Patron Type G - Guest L - Register Library Card Holder R - Research',
  `ur_loc` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Access Location	I - Internet H - HKPL',
  `ur_age_group` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Age Group',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Patron Group';

-- ----------------------------
-- Table structure for biz_mmis_patron_profile
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_patron_profile`;
CREATE TABLE `biz_mmis_patron_profile` (
  `id` bigint NOT NULL COMMENT 'id',
  `ur_id` varchar(20) NOT NULL COMMENT 'Patron ID ',
  `ur_login_id` bigint DEFAULT NULL COMMENT 'Portal Login ID',
  `ur_ss_login_id` bigint DEFAULT NULL COMMENT 'Self-Serve Login ID	Self-Serve Login ID',
  `ur_fname` varchar(40) NOT NULL COMMENT 'Patron Name',
  `ur_phone_num` varchar(20) NOT NULL COMMENT 'Phone Number(s)	Phone Number',
  `ur_sms_activate` varchar(1) DEFAULT NULL COMMENT 'SMS Activation	SMS Activation Y - Yes N - No',
  `ur_email` varchar(160) DEFAULT NULL COMMENT 'Email Address',
  `ur_email_activate` varchar(1) DEFAULT NULL COMMENT 'Email Activation	Email Activation Y - Yes N - No',
  `ur_libno` varchar(200) NOT NULL COMMENT 'Library Card Number(s)	Library no of patron',
  `pref_ws_grp` varchar(20) DEFAULT NULL COMMENT 'Preferred Workstation Group',
  `pref_lib_code` varchar(20) DEFAULT NULL COMMENT 'Preferred Library',
  `ur_email_notif` varchar(1) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Patron Profile';

-- ----------------------------
-- Table structure for biz_mmis_play_hist
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_play_hist`;
CREATE TABLE `biz_mmis_play_hist` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item ID',
  `login_id` varchar(50) DEFAULT NULL COMMENT 'Login ID',
  `session_id` varchar(50) DEFAULT NULL COMMENT 'Session ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Play History';

-- ----------------------------
-- Table structure for biz_mmis_popular_content_summ
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_popular_content_summ`;
CREATE TABLE `biz_mmis_popular_content_summ` (
  `id` bigint NOT NULL COMMENT 'id',
  `item_id` bigint NOT NULL COMMENT 'Item Id	reference to owning catalog',
  `hit_count` int DEFAULT NULL COMMENT 'hit count ',
  `title` text COMMENT 'hit count ',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Popular Content Summ';

-- ----------------------------
-- Table structure for biz_mmis_recommended_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_recommended_item`;
CREATE TABLE `biz_mmis_recommended_item` (
  `id` bigint NOT NULL COMMENT 'id',
  `recommended` text NOT NULL COMMENT 'Recommended Record',
  `type` varchar(1) NOT NULL COMMENT 'Type',
  `collection` varchar(100) DEFAULT NULL COMMENT 'Collection',
  `highlight_topic_id` bigint DEFAULT NULL COMMENT 'Content Highlight Topic ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Recommended Items';

-- ----------------------------
-- Table structure for biz_mmis_report_file
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_file`;
CREATE TABLE `biz_mmis_report_file` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_file_nm` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT 'Report File Name',
  `cont_data` longtext COLLATE utf8mb4_bin COMMENT 'Content Data ',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report File';

-- ----------------------------
-- Table structure for biz_mmis_report_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_group`;
CREATE TABLE `biz_mmis_report_group` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_grp_descrip` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'Report Group Description',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Group';

-- ----------------------------
-- Table structure for biz_mmis_report_history
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_history`;
CREATE TABLE `biz_mmis_report_history` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_id` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Report ID',
  `req_dt` datetime NOT NULL COMMENT 'Request Date',
  `requested_by_usr` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Requested By User',
  `generation_dt` datetime NOT NULL COMMENT 'Generation Date',
  `generation_status` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Generation Status',
  `file_content_id` int DEFAULT NULL COMMENT 'File Content ID',
  `rep_criteria` text COLLATE utf8mb4_bin COMMENT 'Report Criteria',
  `exception_message` text COLLATE utf8mb4_bin COMMENT 'Exception Message ',
  `rep_sched_id` bigint DEFAULT NULL COMMENT 'Report Schedule ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report History';

-- ----------------------------
-- Table structure for biz_mmis_report_history_recipient
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_history_recipient`;
CREATE TABLE `biz_mmis_report_history_recipient` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_hist_id` bigint NOT NULL COMMENT 'Report History ID biz_mmis_report_history',
  `email_add` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Email Address',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report History Recipient';

-- ----------------------------
-- Table structure for biz_mmis_report_parameter_history
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_parameter_history`;
CREATE TABLE `biz_mmis_report_parameter_history` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_hist_id` int NOT NULL COMMENT 'Report History ID',
  `par_cd` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Code',
  `par_descrip` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Parameter Description',
  `par_val` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Value',
  `par_lookup_val` text COLLATE utf8mb4_bin COMMENT 'Parameter Lookup Value',
  `par_type` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Type',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Parameter History';

-- ----------------------------
-- Table structure for biz_mmis_report_parameter_list
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_parameter_list`;
CREATE TABLE `biz_mmis_report_parameter_list` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_id` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `par_cd` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `par_descrip` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `ord` int NOT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Parameter List';

-- ----------------------------
-- Table structure for biz_mmis_report_schedule
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_schedule`;
CREATE TABLE `biz_mmis_report_schedule` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_id` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Report ID Source biz_mmis_report_setting',
  `template_nm` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Template Name ',
  `scheduled` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Scheduled ',
  `schd_type` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Schedule Type	Schedule Type; D - Daily;  M - Monthly;  Y - Yearly;',
  `GENERATION_PER_FROM` datetime DEFAULT NULL COMMENT 'Generation Period From Start date of report generation',
  `generation_per_to` datetime DEFAULT NULL COMMENT 'Generation Period To	End date of report generation',
  `generation_offset` int DEFAULT NULL COMMENT 'Generation Offset	No. of Days after the report period on which the report will be generated.',
  `rep_format` varchar(3) COLLATE utf8mb4_bin NOT NULL COMMENT 'Format	Format',
  `last_gen_dt` datetime DEFAULT NULL COMMENT 'Last Generation Date	Last Generation Date',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Schedule';

-- ----------------------------
-- Table structure for biz_mmis_report_schedule_library_rights
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_schedule_library_rights`;
CREATE TABLE `biz_mmis_report_schedule_library_rights` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_sched_id` bigint NOT NULL COMMENT 'Report Schedule ID',
  `lib_code` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Library Code',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Schedule Library Rights';

-- ----------------------------
-- Table structure for biz_mmis_report_schedule_parameter
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_schedule_parameter`;
CREATE TABLE `biz_mmis_report_schedule_parameter` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_sched_id` bigint NOT NULL COMMENT 'Report Schedule ID',
  `par_cd` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Code',
  `par_val` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Value',
  `par_type` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Parameter Type',
  `par_lookup_val` text COLLATE utf8mb4_bin COMMENT 'Parameter Lookup Value',
  `par_descrip` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Parameter Description',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Schedule Parameter';

-- ----------------------------
-- Table structure for biz_mmis_report_schedule_recipient
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_schedule_recipient`;
CREATE TABLE `biz_mmis_report_schedule_recipient` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_sched_id` bigint NOT NULL COMMENT 'Report Schedule ID',
  `email_add` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Email Address',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Schedule Recipient';

-- ----------------------------
-- Table structure for biz_mmis_report_setting
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_report_setting`;
CREATE TABLE `biz_mmis_report_setting` (
  `id` bigint NOT NULL COMMENT 'ID',
  `rep_grp_id` bigint NOT NULL COMMENT 'Report Group ID',
  `excel_exp_ind` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Excel Export Indicator',
  `text_exp_ind` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Text Export Indicator',
  `pdf_exp_ind` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'PDF Export Indicator',
  `alw_schedule` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Schedule Allowed',
  `rep_format` varchar(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'Report Format',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Report Setting';

-- ----------------------------
-- Table structure for biz_mmis_search_option
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_search_option`;
CREATE TABLE `biz_mmis_search_option` (
  `id` bigint NOT NULL COMMENT 'id',
  `option_name` varchar(80) NOT NULL COMMENT 'Option Name',
  `option_name_chi` varchar(80) NOT NULL COMMENT 'Option Name (chinese)',
  `option_name_eng` varchar(80) NOT NULL COMMENT 'Option Name (English)',
  `search_source` varchar(5) NOT NULL COMMENT 'Search Source Selection O:Only Digital Collection A:DRM',
  `search_type` varchar(5) NOT NULL COMMENT 'Search Type RS:Refine Search BS:Browse Search ASF:Advance Search Filter',
  `display_order` int NOT NULL COMMENT 'Display Order',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Search Option Setting';

-- ----------------------------
-- Table structure for biz_mmis_search_ref_field
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_search_ref_field`;
CREATE TABLE `biz_mmis_search_ref_field` (
  `id` bigint NOT NULL COMMENT 'id',
  `search_id` bigint NOT NULL COMMENT 'Search Id ref biz_mmis_search_option',
  `field_id` bigint NOT NULL COMMENT 'Field Id ref biz_mmis_metadata_field',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Search Option Setting Filed';

-- ----------------------------
-- Table structure for biz_mmis_search_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_search_stat`;
CREATE TABLE `biz_mmis_search_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `search_dt` datetime NOT NULL COMMENT 'Search Date',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `login_id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Login ID',
  `session_id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Session ID',
  `search_type` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Search Type',
  `sort_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Sort By',
  `no_results` int DEFAULT NULL COMMENT 'No. of Results',
  `params` longtext COLLATE utf8mb4_bin COMMENT 'Params',
  `marked_as_deleted` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `query_string` longtext COLLATE utf8mb4_bin,
  `refine_by` longtext COLLATE utf8mb4_bin,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Search Statistics';

-- ----------------------------
-- Table structure for biz_mmis_search_stat_keyword
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_search_stat_keyword`;
CREATE TABLE `biz_mmis_search_stat_keyword` (
  `id` bigint NOT NULL COMMENT 'ID',
  `search_stat_id` bigint NOT NULL COMMENT 'Search Statistics ID',
  `typ` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Type	Field not needed anymore.',
  `val` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Value',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Search Statistics Keyword';

-- ----------------------------
-- Table structure for biz_mmis_search_stat_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_search_stat_summary`;
CREATE TABLE `biz_mmis_search_stat_summary` (
  `id` bigint NOT NULL COMMENT 'id',
  `search_dt` datetime NOT NULL COMMENT 'Search date',
  `search_type` varchar(10) DEFAULT NULL COMMENT 'Search type',
  `search_keyword` text COMMENT 'Search keyword',
  `acs_method` varchar(5) DEFAULT NULL COMMENT 'Access method',
  `total_count` int NOT NULL COMMENT 'Total count',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Search Stat Summary';

-- ----------------------------
-- Table structure for biz_mmis_service_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_service_usage_stat`;
CREATE TABLE `biz_mmis_service_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `svc` varchar(5) COLLATE utf8mb4_bin NOT NULL COMMENT 'Service',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Service Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_staff_user
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_staff_user`;
CREATE TABLE `biz_mmis_staff_user` (
  `id` bigint NOT NULL COMMENT 'id',
  `sf_id` varchar(20) NOT NULL COMMENT 'Staff ID',
  `sf_remark` varchar(254) DEFAULT NULL COMMENT 'Remarks',
  `all_lib_rights` varchar(1) NOT NULL COMMENT 'All Library Rights	All Library Rights Y - Yes N - No',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Staff User Profile';

-- ----------------------------
-- Table structure for biz_mmis_sub_part
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_sub_part`;
CREATE TABLE `biz_mmis_sub_part` (
  `id` bigint NOT NULL COMMENT 'id',
  `part_id` varchar(20) NOT NULL COMMENT 'Part Id	e.g. level 2 song list is a sub-part',
  `descrip` text NOT NULL COMMENT 'Sub-Part Description	Description of the sub-part',
  `seq_no` int NOT NULL COMMENT 'Sub-Part No.	Sequence Number of the sub-part',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='SubPart';

-- ----------------------------
-- Table structure for biz_mmis_sys_pre
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_sys_pre`;
CREATE TABLE `biz_mmis_sys_pre` (
  `id` bigint NOT NULL COMMENT 'id',
  `pre_listen_start` varchar(20) NOT NULL COMMENT 'Audio Pre-listen Start Generation Time',
  `pre_listen` varchar(20) NOT NULL COMMENT 'Audio Pre-listen Generation Duration',
  `pre_view_start` varchar(20) NOT NULL COMMENT 'Video Preview Start Generation Time',
  `pre_view` varchar(20) NOT NULL COMMENT 'Video Preview Generation Duration',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='System Pre Parameter';

-- ----------------------------
-- Table structure for biz_mmis_tag_group
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_tag_group`;
CREATE TABLE `biz_mmis_tag_group` (
  `id` bigint NOT NULL COMMENT 'Age Group Code',
  `ag_group` varchar(20) NOT NULL COMMENT 'Age Group Code',
  `ag_desc` varchar(80) NOT NULL COMMENT 'Age Group Description',
  `ag_st_age` int NOT NULL COMMENT 'Starting Age (<=  this Age group)',
  `ag_ed_age` int NOT NULL COMMENT 'Ending Age (>  this Age group)',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Age Group';

-- ----------------------------
-- Table structure for biz_mmis_theme
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_theme`;
CREATE TABLE `biz_mmis_theme` (
  `id` bigint NOT NULL COMMENT 'ID',
  `theme_id` varchar(40) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Theme ID',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name',
  `chi_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name (Chinese)',
  `eng_name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Name (English)',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Description ',
  `chi_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Description (Chinese)',
  `eng_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Description (English)',
  `wallpaper_filename` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'Wallpaper',
  `wallpaper` text COLLATE utf8mb4_bin COMMENT 'Wallpaper',
  `collection_ids` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Collection IDS',
  `status` char(2) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'status',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Theme';

-- ----------------------------
-- Table structure for biz_mmis_theme_collection
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_theme_collection`;
CREATE TABLE `biz_mmis_theme_collection` (
  `id` bigint NOT NULL COMMENT 'ID',
  `theme_id` bigint NOT NULL DEFAULT '0' COMMENT 'Theme ID',
  `theme_rel_collection_id` bigint NOT NULL DEFAULT '0' COMMENT 'Collection ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Theme Rel Collection';

-- ----------------------------
-- Table structure for biz_mmis_usage_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_usage_summary`;
CREATE TABLE `biz_mmis_usage_summary` (
  `id` bigint NOT NULL COMMENT 'id',
  `dt` datetime NOT NULL COMMENT 'Date',
  `hour_09` bigint DEFAULT NULL COMMENT '09:00',
  `hour_10` bigint DEFAULT NULL COMMENT '10:00',
  `hour_11` bigint DEFAULT NULL COMMENT '11:00',
  `hour_12` bigint DEFAULT NULL COMMENT '12:00',
  `hour_13` bigint DEFAULT NULL COMMENT '13:00',
  `hour_14` bigint DEFAULT NULL COMMENT '14:00',
  `hour_15` bigint DEFAULT NULL COMMENT '15:00',
  `hour_16` bigint DEFAULT NULL COMMENT '16:00',
  `hour_17` bigint DEFAULT NULL COMMENT '17:00',
  `hour_18` bigint DEFAULT NULL COMMENT '18:00',
  `hour_19` bigint DEFAULT NULL COMMENT '19:00',
  `hour_20` bigint DEFAULT NULL COMMENT '20:00',
  `ws_usage_summary_id` bigint NOT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Usage Summary';

-- ----------------------------
-- Table structure for biz_mmis_watermark
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_watermark`;
CREATE TABLE `biz_mmis_watermark` (
  `id` bigint NOT NULL COMMENT 'ID',
  `wm_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Watermark id',
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Watermark Name',
  `description` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Watermark Description',
  `watermark_path` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'Watermark image Path',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Watermark';

-- ----------------------------
-- Table structure for biz_mmis_webpage_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_webpage_usage_stat`;
CREATE TABLE `biz_mmis_webpage_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `webpage_url` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Webpage URL',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Library',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Webpage Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_webpage_usg_stat_summary
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_webpage_usg_stat_summary`;
CREATE TABLE `biz_mmis_webpage_usg_stat_summary` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL,
  `webpage_url` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `acs_method` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `total` int DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Webpage Usage Statistics Summary';

-- ----------------------------
-- Table structure for biz_mmis_working_digitised_obj
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_working_digitised_obj`;
CREATE TABLE `biz_mmis_working_digitised_obj` (
  `id` bigint NOT NULL COMMENT 'id',
  `batch_id` bigint NOT NULL COMMENT 'Batch Id	reference to owning batch',
  `item_id` bigint NOT NULL COMMENT 'Item Id	reference to owning catalog',
  `seq_no` int NOT NULL COMMENT 'Sequence No	reference to TOC record',
  `ds_id` varchar(8) NOT NULL COMMENT 'Datastream Id	unique id',
  `cntrl_grp` varchar(250) DEFAULT NULL COMMENT 'Content Group	reference to catalog content group',
  `no_of_pages` int DEFAULT NULL COMMENT 'No. of Pages	page count for pdf',
  `rtl_seq` varchar(1) DEFAULT NULL COMMENT 'Right to Left Page Sequence flag		Applicable only for ebook contents, flag to determine if content has right to left page sequence, values ''Y'' or null ',
  `disp_seq_no` int DEFAULT NULL COMMENT 'Displayed Sequence No.		Applicable only for multiple image content: - Newspaper clippings - UR & RC archive - Old HK Newspaper - House Programme This will represent the order/sequence of the images when viewed using the image custom viewer',
  `object_type` varchar(20) NOT NULL COMMENT 'Object Type	refernce to content object type',
  `locked_by` varchar(20) DEFAULT NULL COMMENT 'Locked By	Locked By ',
  `converted` varchar(1) DEFAULT NULL COMMENT 'Converted	flag if Digitised object is coverted Y converted else N',
  `file_size` int DEFAULT NULL COMMENT 'File Size	File Size ',
  `x_position` int DEFAULT NULL COMMENT 'X Position	X Position ',
  `y_position` int DEFAULT NULL COMMENT 'Y Position	Y Position ',
  `ds_ref` varchar(250) DEFAULT NULL COMMENT 'Datastream reference	Location of the digitised object in the server ',
  `pdf_color` varchar(1) DEFAULT NULL,
  `pdf_dpi` int DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Working Digitised Object';

-- ----------------------------
-- Table structure for biz_mmis_working_part_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_working_part_info`;
CREATE TABLE `biz_mmis_working_part_info` (
  `id` bigint NOT NULL COMMENT 'id',
  `db_status` varchar(10) NOT NULL COMMENT 'DB Status	Possible Values: Production Checkout',
  `item_id` bigint DEFAULT NULL COMMENT 'Item ID	Reference to owning Item Id in Conversion DB',
  `dspace_item_id` bigint DEFAULT NULL COMMENT 'Dspace Item Id	Reference to owning Item Id in Dspace DB',
  `batch_id` bigint NOT NULL COMMENT 'Batch ID	Batch ID that owns the Working Part Info',
  `part_id` varchar(20) NOT NULL COMMENT 'Part ID	The Part ID is the external key for identifying MMIS parts.   It is generated by MMIS as a running sequence number when the part is released together with it associated item into MMIS.  Only playable objects required licensing control need to be defined in this table.',
  `vol` int NOT NULL COMMENT 'Volume',
  `bib_no` varchar(20) NOT NULL COMMENT 'Bib. No.	Bib No. of  the media.',
  `eng_descrip` varchar(80) DEFAULT NULL COMMENT 'English Description	English Description of  the Part.',
  `chi_descrip` varchar(80) DEFAULT NULL COMMENT 'Chinese Description	Chinese Description of the Part',
  `media_type` varchar(20) NOT NULL COMMENT 'Media Type	Affect the player used to play this media, if assigned wrongly, the media cannot be played.',
  `media_std` varchar(20) DEFAULT NULL COMMENT 'Media Standard	Media Standard of this Part, only for VHS',
  `cntrl_grp` text NOT NULL COMMENT 'Content Group	Used for access control',
  `stg_lvl` int NOT NULL COMMENT 'Storage Level	Level 1/level 2/level 3',
  `has_2sides` varchar(1) DEFAULT NULL COMMENT 'Two-sided	When it is a two sided media',
  `lic_no` int NOT NULL COMMENT 'Total No. of Concurrent License	For Level 1, this number can be set to the maximum number of concurrent streams.  However, resource limitations and actual licensing consideration will affect the maximum that can be set. For level  2 :this number is the number of  copies of this part in jukebox. Note: All copies of a part should be put in the same jukebox for application to do load balancing.',
  `hkcl_lic` int DEFAULT NULL COMMENT 'HKCL License	No. of licenses allocated to HKCL',
  `all_branch_lic` int DEFAULT NULL COMMENT 'All Branches License	No. of licenses allocated to all branches',
  `internet_lic` int DEFAULT NULL COMMENT 'Internet License	No. of licenses allocated to Internet',
  `copy_no` int NOT NULL COMMENT 'Number of Copies	The number of copies for this part',
  `sub_part` int NOT NULL COMMENT 'Number of Sub-Parts	The number of sub-part for this part',
  `duration` int DEFAULT NULL COMMENT 'Duration (in min.)	The time allocated for this media to play. It can be different from the real media play time.',
  `media_loc` varchar(20) NOT NULL COMMENT 'Media Location	Actually it is a media location field. For level 1, it is the SAN storage system. For level 2, it is the jukebox ID.  For level 3, it is the floor location which  defines the floor location of this object.  It will be used to decide which player to play this media.',
  `locked_by` varchar(20) DEFAULT NULL COMMENT 'Locked By	User ID who currently holds the lock',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Working Part Information';

-- ----------------------------
-- Table structure for biz_mmis_workstation
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_workstation`;
CREATE TABLE `biz_mmis_workstation` (
  `id` bigint NOT NULL COMMENT 'id',
  `ws_mode` varchar(1) NOT NULL COMMENT 'Workstation Mode	Workstation Mode P - Patron Workstation F - Frontdesk Workstation (for Staff)',
  `ws_grp_id` varchar(20) NOT NULL COMMENT 'Workstation Group	ID of the workstation group which the workstation belongs to',
  `machine_name` varchar(24) NOT NULL COMMENT 'Machine Name	Machine Name of the workstation',
  `ip_add` varchar(40) DEFAULT NULL COMMENT 'IP Address	IP address of the workstation',
  `loc_cd` varchar(20) NOT NULL COMMENT 'Location Code	Code of the location of the workstation',
  `lock_reset_dt` datetime DEFAULT NULL COMMENT 'Locking Reset Date	Dtae and Time when locking count was manually reset',
  `shut_sched` datetime DEFAULT NULL COMMENT 'Shutdown Schedule	Shutdown Schedule',
  `ref_db_file` longblob COMMENT 'Reference Database File	Reference Database File',
  `ref_db_filename` varchar(50) DEFAULT NULL COMMENT 'Reference Database Filename	Filename of Reference Database File',
  `attached_player1` varchar(20) DEFAULT NULL COMMENT 'Attached Player 1	ID of the 1st attached player used to play Level 3 media.',
  `attached_player2` varchar(20) DEFAULT NULL COMMENT 'Attached Player 2	ID of the 2nd attached player used to play Level 3 media.',
  `switch_port_id` varchar(20) DEFAULT NULL COMMENT 'Switch Port ID	The A/V switch Out-port to which the Workstation is attached.',
  `media_loc_l3_op` varchar(6) DEFAULT NULL COMMENT 'Media Location for Level 3 Operation	UMPS06 / UMPS10',
  `remarks` varchar(200) DEFAULT NULL COMMENT 'Remarks',
  `av_switch` varchar(1) DEFAULT NULL,
  `auto_print_ind` varchar(1) DEFAULT NULL,
  `ref_db_file_chi` longblob,
  `ref_db_file_schi` longblob,
  `ref_db_type` varchar(1) DEFAULT NULL,
  `ref_db_url` varchar(200) DEFAULT NULL,
  `ref_db_url_chi` varchar(200) DEFAULT NULL,
  `ref_db_url_schi` varchar(200) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Workstation';

-- ----------------------------
-- Table structure for biz_mmis_workstation_link_usage_stat
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_workstation_link_usage_stat`;
CREATE TABLE `biz_mmis_workstation_link_usage_stat` (
  `id` bigint NOT NULL COMMENT 'ID',
  `acs_dt` datetime NOT NULL COMMENT 'Access Date',
  `web_link` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT 'Web Link',
  `acs_method` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access Method',
  `acs_library` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Access LIbrary',
  `workstation_id` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Workstation ID',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Workstation Weblink Usage Statistics';

-- ----------------------------
-- Table structure for biz_mmis_zs_target
-- ----------------------------
DROP TABLE IF EXISTS `biz_mmis_zs_target`;
CREATE TABLE `biz_mmis_zs_target` (
  `id` bigint NOT NULL COMMENT 'id',
  `target_url` varchar(20) NOT NULL COMMENT 'Target URL	URL of target in <ip address>:<port> format',
  `target_name` varchar(50) NOT NULL COMMENT 'Target Name	Name of the target',
  `target_descrip` varchar(200) DEFAULT NULL COMMENT 'Target Description	Description for the target',
  `target_db` varchar(50) DEFAULT NULL,
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Z39.50 Targets';

-- ----------------------------
-- Table structure for biz_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_sys_log`;
CREATE TABLE `biz_sys_log` (
  `id` bigint NOT NULL COMMENT 'ID',
  `parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Parameter',
  `module_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Module name',
  `description` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Description',
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Type',
  `level` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Level',
  `system_name` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'System name',
  `msg` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Msg',
  `request_ip` varchar(70) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Request ip',
  `spend_time` int DEFAULT NULL COMMENT 'Spend time',
  `user_agent` varchar(70) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'User agent',
  `request_url` varchar(70) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Request Url',
  `start_time` datetime DEFAULT NULL COMMENT 'Start time',
  `end_time` datetime DEFAULT NULL COMMENT 'End time',
  `org_id` bigint DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint DEFAULT '0' COMMENT 'Delete tag',
  `last_upd_by` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='System log';

-- ----------------------------
-- Table structure for t_chunk_info
-- ----------------------------
DROP TABLE IF EXISTS `t_chunk_info`;
CREATE TABLE `t_chunk_info` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chunk_number` decimal(10,0) NOT NULL,
  `chunk_size` decimal(10,0) NOT NULL,
  `current_chunkSize` decimal(10,0) NOT NULL,
  `identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `relative_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_chunks` decimal(10,0) NOT NULL,
  `type` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_size` decimal(10,0) DEFAULT NULL,
  `location` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ref_project_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `upload_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `file_state` int DEFAULT '1' COMMENT '文件状态 1：解析中，2：解析完成',
  `m3u8_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'M3u8地址',
  `update_time` datetime DEFAULT NULL,
  `duration` bigint DEFAULT NULL COMMENT '视频时长（秒）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for tcc_live
-- ----------------------------
DROP TABLE IF EXISTS `tcc_live`;
CREATE TABLE `tcc_live` (
  `id` bigint NOT NULL,
  `live_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '直播标题',
  `room_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房间ID',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态 0未开始 1直播中 2已结束 3已取消 4已下架',
  `duration` int NOT NULL DEFAULT '0' COMMENT '时长，单位秒',
  `start_time` datetime DEFAULT NULL COMMENT '开播时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `client_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '客户端id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tcc_live_room_id` (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='线上直播';

-- ----------------------------
-- Table structure for tcc_live_watch_user
-- ----------------------------
DROP TABLE IF EXISTS `tcc_live_watch_user`;
CREATE TABLE `tcc_live_watch_user` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `live_id` bigint NOT NULL COMMENT '直播ID',
  `online_status` int NOT NULL DEFAULT '0' COMMENT '在线状态 0:离线 1:在线',
  `online_duration` int NOT NULL DEFAULT '0' COMMENT '在线时长，单位秒',
  `join_time` datetime DEFAULT NULL COMMENT '入群时间',
  `leave_time` datetime DEFAULT NULL COMMENT '退群时间',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tcc_live_watch_user_live_id` (`live_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='直播观看用户';

SET FOREIGN_KEY_CHECKS = 1;
