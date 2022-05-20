DROP TABLE IF EXISTS `biz_hkml_classinfo`;
CREATE TABLE `biz_hkmp_classinfo`
(
    `id`          bigint(20)                                             NOT NULL COMMENT ';CLASSINFOID',
    `class_order` int(10)                                                NOT NULL COMMENT '排序;CLASSORDER',
    `cname`       varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '名称;CNAME',
    `cdesc`       varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '描述;CDESC',
    `parent_id`   bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '上一级id;PARENTID',
    `root_id`     bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '根id;ROOTID',
    `ccode`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '坐标;CCODE',
    `org_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`   datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`   smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt` datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '香港地名选择表;XWCMCLASSINFO'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_banner
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_banner`;
CREATE TABLE `biz_hkmp_banner`
(
    `id`            bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name_cn`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '名称(中文)',
    `name_en`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '名称(英文)',
    `collection_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '栏目id',
    `poster_tc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '繁体海报url',
    `poster_sc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '简体海报url',
    `poster_en_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '英文海报url',
    `status`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '提交状态',
    `org_id`        bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id',
    `org_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name',
    `create_by`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id',
    `create_dt`     datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `is_delete`     smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除',
    `last_upd_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id',
    `last_upd_dt`   datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '走马灯列表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_batch_upload_job
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_batch_upload_job`;
CREATE TABLE `biz_hkmp_batch_upload_job`
(
    `id`                    bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `batch_job_id`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '批量操作任务编号',
    `batch_job_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '批量操作名称',
    `batch_job_type`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '批量操作类型',
    `status`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '批量处理状态;1:新增,2:处理中,3处理成功,4:处理失败,5:已同步,6:已发布',
    `import_number`         int(11)                                                NULL     DEFAULT NULL COMMENT '导入数量',
    `success_import_number` int(11)                                                NULL     DEFAULT NULL COMMENT '成功数量',
    `error_import_number`   int(11)                                                NULL     DEFAULT NULL COMMENT '失败数量',
    `org_id`                bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id',
    `org_name`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name',
    `create_by`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id',
    `create_dt`             datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `is_delete`             smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除',
    `last_upd_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id',
    `last_upd_dt`           datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '批量操作管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_catalogue
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_catalogue`;
CREATE TABLE `biz_hkmp_catalogue`
(
    `id`                               bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `catalogue_id`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '资源编号',
    `e_name`                           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '英文名称',
    `cn_name`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '中文名称',
    `collection_id`                    bigint(20)                                             NULL     DEFAULT NULL COMMENT '栏目id',
    `view_id`                          bigint(20)                                             NULL     DEFAULT NULL COMMENT '视图id',
    `upload_cover_img_url`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '封面图片url',
    `upload_file`                      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '上传文件;支持xslx，mp4，mp3，wav，pdf，png，jpg，gif，zip壓縮包',
    `district`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '地区(中文)',
    `is_download`                      varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否支持下载',
    `title`                            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '标题(中文)',
    `start_date`                       datetime(0)                                            NULL     DEFAULT NULL COMMENT '开始时间',
    `end_date`                         datetime(0)                                            NULL     DEFAULT NULL COMMENT '结束时间',
    `street`                           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '街道(中文)',
    `keywords`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '关键字(事件)',
    `source`                           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '来源(中文)',
    `is_enable`                        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否可用',
    `theme_type_id`                    bigint(20)                                             NULL     DEFAULT NULL COMMENT '主题类型',
    `material_type`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '文件类型',
    `method_of_copyright_clearance_cn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '版权信息(中文)',
    `method_of_copyright_clearance_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '清除版权的方法',
    `reference_cn`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '参考(中文)',
    `copyright_status_cn`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '版权状况（中文）',
    `remarks_cn`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '备注（中文）',
    `copyright_comment`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '版权评论（中文）',
    `extension`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '资源后缀名',
    `description_en`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '说明（英文）',
    `description_cn`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '说明（中文）',
    `keywords_by_place_en`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '关键词（地点）（英文）',
    `keywords_by_place_cn`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '关键词（地点）（中文）',
    `publishing_date_en`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '出版日期（英文）',
    `publishing_date_cn`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '出版日期（中文）',
    `location`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '地点',
    `grouping`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '分组',
    `original_file`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '原始文件',
    `keywords_by_organization_en`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '关键词（组织）（英文）',
    `creator_en`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '创作者（英文）',
    `creator_cn`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '创作者（中文）',
    `time`                             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL,
    `editor_cn`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '编辑（中文）',
    `url`                              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '网址',
    `sequence`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL,
    `style_en`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '风格（英文）',
    `contributor_en`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '投稿人（英文）',
    `original_file_name`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '原文件名',
    `original_file_en`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '原文件（英文）',
    `original_file_cn`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '原文件（中文）',
    `style_cn`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '风格（中文）',
    `size_en`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '大小(英文)',
    `size_cn`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '大小(中文)',
    `weight_en`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '宽带(英文)',
    `weight_cn`                        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '宽带(中文)',
    `body_en`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '内容(英文)',
    `body_cn`                          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '内容(中文)',
    `accessories_en`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '配件（英文）',
    `accessories_cn`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '配件（中文）',
    `lacquer_characteristice_en`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '漆器特性（英文）',
    `lacquer_characteristice_cn`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '漆器特性（中文）',
    `inscription_en`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '铭文（英文）',
    `inscription_cn`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '铭文（中文）',
    `makers_note_en`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '厂商备注（英文）',
    `makers_note_cn`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '厂商备注（中文）',
    `stats`                            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '提交状态;新稿→审核中→否定（可发）→已发→下线',
    `org_id`                           bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id',
    `org_name`                         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name',
    `create_by`                        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id',
    `create_dt`                        datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `is_delete`                        smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除',
    `last_upd_by`                      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id',
    `last_upd_dt`                      datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '资源记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_channel
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel`;
CREATE TABLE `biz_hkmp_channel`
(
    `id`                         bigint(20)                                             NOT NULL COMMENT '栏目编号;CHANNELID',
    `pid`                        bigint(20)                                             NULL     DEFAULT NULL COMMENT '父栏目编号;PARENTID',
    `site_id`                    int(10)                                                NOT NULL COMMENT '?;SITEID',
    `chnl_table`                 varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '无数据;CHNLTABLE',
    `chnl_query`                 varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '无用数据;CHNLQUERY',
    `chnl_prop`                  int(10)                                                NULL     DEFAULT NULL COMMENT '?;CHNLPROP',
    `schedule`                   int(10)                                                NULL     DEFAULT NULL COMMENT '无数据;SCHEDULE',
    `chnl_datapath`              varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '无数据;CHNLDATAPATH',
    `chnl_orderby`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '无数据;CHNLORDERBY',
    `attribute`                  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '无用列;ATTRIBUTE',
    `collection_e_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '英文名称;CHNLNAME',
    `collection_cn_name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '中文名称;CHNLDESC_CHT',
    `sort`                       int(11)                                                NULL     DEFAULT NULL COMMENT '排序(越大越靠前);CHNLORDER',
    `collection_type`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '栏目类型;CHNLTYPE',
    `front_page_template_id`     bigint(20)                                             NULL     DEFAULT NULL COMMENT '首页模板id;CHNLOUTLINETEMP',
    `detailed_temolater_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT '详情模板id;CHNLDETAILTEMP',
    `content_add_edit_page`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '添加修改页面;CONTENTADDEDITPAGE',
    `content_list_page`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '列表页面;CONTENTLISTPAGE',
    `content_show_page`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '展示页面;CONTENTSHOWPAGE',
    `catalogue_template`         bigint(20)                                             NULL     DEFAULT NULL COMMENT '目录模板id;NO EXIST',
    `other_overview_template_id` bigint(20)                                             NULL     DEFAULT NULL COMMENT '其他预览模板id;NO EXIST',
    `upload_url`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '存放位置;NO EXIST',
    `thumbnail_en_url`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '英文封面url;NO EXIST',
    `thumbnail_sc_url`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '简体中文封面url;NO EXIST',
    `thumbnail_tc_url`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '繁体中文封面url;NO EXIST',
    `recommended_collection_id`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '已選擇推介特藏id;使用_分隔符进行分割(2_3_5_1)',
    `recommended_exhibition_id`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '已選擇推介展覽id;使用_分隔符进行分割(2_3_5_1)',
    `status`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '审核状态;新稿→審核中→否定（可發）→已發→下線',
    `collection_url`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '栏目url(当栏目类型为链接栏目时必填);NO EXIST',
    `cn_desc`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '中文描述;CHNLDESC',
    `en_desc`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '英文描述;CHNLDESC',
    `org_id`                     bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`                   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`                  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;OPERUSER',
    `create_dt`                  datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;OPERTIME',
    `is_delete`                  smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;STATUS',
    `last_upd_by`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`                datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `Key_1` (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '栏目管理;WCMCHANNEL'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_channel_doc_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel_doc_ref`;
CREATE TABLE `biz_hkmp_channel_doc_ref`
(
    `id`                 bigint(20)                                             NOT NULL,
    `chnl_id`            int(10)                                                NOT NULL COMMENT '栏目id;CHNLID',
    `doc_id`             int(10)                                                NOT NULL COMMENT 'doc_id;DOCID',
    `doc_order`          int(10)                                                NOT NULL DEFAULT 0 COMMENT 'doc_order;DOCORDER',
    `doc_status`         int(10)                                                NOT NULL DEFAULT 0 COMMENT 'doc_status;DOCSTATUS',
    `doc_pub_time`       datetime(0)                                            NULL     DEFAULT NULL COMMENT 'doc_pub_time;DOCPUBTIME',
    `doc_pub_url`        varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'doc_pub_url;DOCPUBURL',
    `rec_id`             int(10)                                                NOT NULL COMMENT 'rec_id;RECID',
    `doc_order_pri`      int(10)                                                NOT NULL DEFAULT 0 COMMENT 'doc_order_pri;DOCORDERPRI',
    `invalid_time`       datetime(0)                                            NULL     DEFAULT NULL COMMENT 'invalid_time;INVALIDTIME',
    `oper_user`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'oper_user;OPERUSER',
    `oper_time`          datetime(0)                                            NULL     DEFAULT NULL COMMENT 'oper_time;OPERTIME',
    `modal`              int(10)                                                NULL     DEFAULT 1 COMMENT 'modal;MODAL',
    `doc_rel_time`       datetime(0)                                            NULL     DEFAULT NULL COMMENT 'doc_rel_time;DOCRELTIME',
    `doc_channel`        int(10)                                                NULL     DEFAULT NULL COMMENT 'doc_channel;DOCCHANNEL',
    `doc_flag`           int(10)                                                NULL     DEFAULT NULL COMMENT 'doc_flag;DOCFLAG',
    `doc_kind`           int(10)                                                NULL     DEFAULT 0 COMMENT 'doc_kind;DOCKIND',
    `site_id`            int(10)                                                NOT NULL DEFAULT 0 COMMENT 'site_id;SITEID',
    `src_site_id`        int(10)                                                NOT NULL DEFAULT 0 COMMENT 'src_site_id;SRCSITEID',
    `doc_first_pub_time` datetime(0)                                            NULL     DEFAULT NULL COMMENT 'doc_first_pub_time;DOCFIRSTPUBTIME',
    `node_id`            int(11)                                                NULL     DEFAULT 0 COMMENT 'node_id;NODEID',
    `cr_dept`            varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'cr_dept;CRDEPT',
    `org_id`             bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;no exist',
    `create_by`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`          datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`          smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt`        datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '栏目文档关联;WCMCHNLDOC'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_channel_view_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_channel_view_ref`;
CREATE TABLE `biz_hkmp_channel_view_ref`
(
    `id`          bigint(20)                                            NOT NULL COMMENT '主键;METAVIEWEMPLOYERID',
    `viewid`      bigint(20)                                            NOT NULL DEFAULT 0 COMMENT '视图id;VIEWID',
    `channelid`   bigint(20)                                            NOT NULL DEFAULT 0 COMMENT '栏目id;CHANNELID',
    `org_id`      bigint(20)                                            NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`   datetime(0)                                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`   smallint(2)                                           NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt` datetime(0)                                           NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '栏目视图关联表;XWCMMETAVIEWEMPLOYER'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_classinfo_view_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_classinfo_view_ref`;
CREATE TABLE `biz_hkmp_classinfo_view_ref`
(
    `id`           bigint(20)                                            NOT NULL COMMENT 'CLASSINFOVIEWID',
    `classinfo_id` bigint(20)                                            NULL     DEFAULT NULL COMMENT '地名id;CLASSINFOID',
    `metadata_id`  bigint(20)                                            NULL     DEFAULT NULL COMMENT '元数据id;METADATAID',
    `view_id`      bigint(20)                                            NULL     DEFAULT NULL COMMENT '视图id;VIEWID',
    `org_id`       bigint(20)                                            NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`    datetime(0)                                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`    smallint(2)                                           NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`  datetime(0)                                           NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '地点关联视图;XWCMCLASSINFOVIEW'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_data_items
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_data_items`;
CREATE TABLE `biz_hkmp_data_items`
(
    `id`          bigint(20)                                              NOT NULL COMMENT 'id;WCMMETATABLEITEMSID',
    `metadata_id` bigint(20)                                              NULL     DEFAULT NULL COMMENT 'metadata id;METADATAID',
    `channel_id`  bigint(20)                                              NULL     DEFAULT NULL COMMENT 'channel id;CHANNELID',
    `document_id` bigint(20)                                              NULL     DEFAULT NULL COMMENT 'document id;DOCUMENTID',
    `title`       varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'title;TITLE',
    `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'description;DESCRIPTION',
    `my_notes`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'my notes;MYNOTES',
    `set_id`      bigint(20)                                              NULL     DEFAULT NULL COMMENT 'set id;SETID',
    `images`      varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'images;IMAGES',
    `doc_url`     varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc url;DOCURL',
    `username`    varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'username;USERNAME',
    `org_id`      bigint(20)                                              NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '创建者id;USERID',
    `create_dt`   datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`   smallint(2)                                             NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt` datetime(0)                                             NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '馆藏信息表（含文件路径、图片路径）;WCMMETATABLEITEMS'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_db_tableinfo
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_db_tableinfo`;
CREATE TABLE `biz_hkmp_db_tableinfo`
(
    `id`           bigint(20)                                             NOT NULL COMMENT '主键;TABLEINFOID',
    `table_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '表名;TABLENAME',
    `table_desc`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '描述;TABLEDESC',
    `another_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '显示名;ANOTHERNAME',
    `owner_type`   int(10)                                                NOT NULL DEFAULT 1 COMMENT '所属人类型;OWNERTYPE',
    `owner_id`     int(10)                                                NOT NULL DEFAULT 4 COMMENT '所属人id;OWNERIDOWNERID',
    `org_id`       bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`    datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`    smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`  datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '数据库表名管理;XWCMTABLEINFO'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_document
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_document`;
CREATE TABLE `biz_hkmp_document`
(
    `id`                       int(10)                                                 NOT NULL COMMENT '主键;DOCID',
    `channel_id`               int(10)                                                 NOT NULL COMMENT '栏目id;DOCCHANNEL',
    `doc_version`              int(10)                                                 NOT NULL DEFAULT 0 COMMENT '版本;DOCVERSION',
    `doc_type`                 int(10)                                                 NOT NULL COMMENT '类型;DOCTYPE',
    `doc_title`                varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题;DOCTITLE',
    `doc_source`               int(10)                                                 NOT NULL DEFAULT 0 COMMENT '来源;DOCSOURCE',
    `doc_security`             int(10)                                                 NOT NULL COMMENT '权限;DOCSECURITY',
    `doc_status`               int(10)                                                 NOT NULL COMMENT '状态;DOCSTATUS',
    `doc_kind`                 int(10)                                                 NULL     DEFAULT NULL COMMENT '种类;DOCKIND',
    `doc_content`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          NULL COMMENT '内容;DOCCONTENT',
    `doc_html_con`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          NULL COMMENT 'html内容;DOCHTMLCON',
    `doc_ab_stract`            varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'doc_ab_stract;DOCABSTRACT',
    `doc_keywords`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '关键字;DOCKEYWORDS',
    `doc_relwords`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc_relwords;DOCRELWORDS',
    `doc_people`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'people;DOCPEOPLE',
    `doc_place`                varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'place;DOCPLACE',
    `doc_author`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'author;DOCAUTHOR',
    `doc_editor`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'editor;DOCEDITOR',
    `doc_auditor`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'auditor;DOCAUDITOR',
    `doc_outupid`              int(10)                                                 NULL     DEFAULT NULL COMMENT 'outupid;DOCOUTUPID',
    `doc_valid`                datetime(0)                                             NULL     DEFAULT NULL COMMENT 'valid;DOCVALID',
    `doc_puburl`               varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'puburl;DOCPUBURL',
    `doc_pubtime`              datetime(0)                                             NULL     DEFAULT NULL COMMENT 'pubtime;DOCPUBTIME',
    `doc_reltime`              datetime(0)                                             NULL     DEFAULT NULL COMMENT 'reltime;DOCRELTIME',
    `doc_words_count`          int(10)                                                 NOT NULL DEFAULT 0 COMMENT 'words_count;DOCWORDSCOUNT',
    `doc_pro`                  int(10)                                                 NULL     DEFAULT 1 COMMENT 'doc_pro;DOCPRO',
    `right_defined`            int(5)                                                  NOT NULL DEFAULT 0 COMMENT 'right_defined;RIGHTDEFINED',
    `title_color`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'title_color;TITLECOLOR',
    `template_id`              int(10)                                                 NULL     DEFAULT 0 COMMENT 'template_id;TEMPLATEID',
    `schedule`                 int(10)                                                 NULL     DEFAULT 0 COMMENT 'schedule;SCHEDULE',
    `doc_no`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          NULL COMMENT 'doc_no;DOCNO',
    `doc_flag`                 int(10)                                                 NOT NULL DEFAULT 0 COMMENT 'doc_flag;DOCFLAG',
    `editor`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'editor;EDITOR',
    `attribute`                varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'attribute;ATTRIBUTE',
    `hits_count`               int(10)                                                 NOT NULL DEFAULT 0 COMMENT 'hits_count;HITSCOUNT',
    `doc_pub_html_con`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          NULL COMMENT 'doc_pub_html_con;DOCPUBHTMLCON',
    `sub_doc_title`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'sub_doc_title;SUBDOCTITLE',
    `atta_chpic`               int(5)                                                  NULL     DEFAULT NULL COMMENT 'atta_chpic;ATTACHPIC',
    `doc_link`                 varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc_link;DOCLINK',
    `doc_filename`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'doc_filename;DOCFILENAME',
    `doc_from_version`         int(10)                                                 NULL     DEFAULT NULL COMMENT 'doc_from_version;DOCFROMVERSION',
    `oper_time`                datetime(0)                                             NULL     DEFAULT NULL COMMENT 'oper_time;OPERTIME',
    `oper_user`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'oper_user;OPERUSER',
    `flow_oper_ationmark`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'flow_oper_ationmark;FLOWOPERATIONMARK',
    `flow_pre_oper_ationmark`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'flow_pre_oper_ationmark;FLOWPREOPERATIONMARK',
    `flow_oper_ationmask_enum` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'flow_oper_ationmask_enum;FLOWOPERATIONMASKENUM',
    `doc_source_name`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc_source_name;DOCSOURCENAME',
    `doc_link_to`              varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc_link_to;DOCLINKTO',
    `doc_mirror_to`            varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'doc_mirror_to;DOCMIRRORTO',
    `random_serial`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'random_serial;RANDOMSERIAL',
    `post_user`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'post_user;POSTUSER',
    `is_page_img`              int(5)                                                  NULL     DEFAULT NULL COMMENT 'is_page_img;ISPAGEIMG',
    `publish_date`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'publish_date;PUBLISHDATE',
    `page_num`                 varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'page_num;PAGENUM',
    `page_name`                varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'page_name;PAGENAME',
    `pdf_file_name`            varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'pdf_file_name;PDFFILENAME',
    `page_image_filename`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'page_image_filename;PAGEIMAGEFILENAME',
    `map`                      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'map;MAP',
    `yinti`                    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'yinti;YINTI',
    `site_id`                  int(10)                                                 NOT NULL DEFAULT 0 COMMENT 'site_id;SITEID',
    `src_site_id`              int(10)                                                 NOT NULL DEFAULT 0 COMMENT 'src_site_id;SRCSITEID',
    `doc_first_pub_time`       datetime(0)                                             NULL     DEFAULT NULL COMMENT 'doc_first_pub_time;DOCFIRSTPUBTIME',
    `node_id`                  int(11)                                                 NULL     DEFAULT 0 COMMENT 'nodeid;NODEID',
    `order_id`                 int(11)                                                 NULL     DEFAULT 0 COMMENT 'orderid;ORDERID',
    `cr_dept`                  varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'crdept;CRDEPT',
    `org_id`                   bigint(20)                                              NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT 'org name;no exist',
    `create_by`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`                datetime(0)                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`                smallint(2)                                             NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt`              datetime(0)                                             NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '文档表;WCMDOCUMENT'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_field_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_field_info`;
CREATE TABLE `biz_hkmp_field_info`
(
    `id`                     bigint(20)                                             NOT NULL COMMENT '主键;DBFIELDINFOID',
    `table_name`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '表名;TABLENAME',
    `table_desc`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '描述;TABLEDESC',
    `metadata_name`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '字段名称;FIELDNAME',
    `physical_metadata_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '物理字段名称;PHYSICALMETADATANAME',
    `metadata_type_id`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '字段类型id;FIELDTYPE',
    `element_id`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '元素类型id;METADATATYPEID',
    `class_id`               int(10)                                                NOT NULL DEFAULT 0 COMMENT '地名id;CLASSID',
    `database_type_id`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '数据库中数据类型id;DBTYPE',
    `database_data_length`   int(11)                                                NULL     DEFAULT NULL COMMENT '数据库中的数据大小;DBLENGTH',
    `default_value`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '字段默认值;DEFAULTVALUE',
    `anothername`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'anothername;ANOTHERNAME',
    `field_type`             int(10)                                                NOT NULL DEFAULT 0 COMMENT 'field_type;FIELDTYPE',
    `is_empty`               varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否可以为空;NOTNULL',
    `is_edit`                varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否可以编辑;NOTEDIT',
    `is_hidder`              varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否隐藏;HIDDENFIELD',
    `org_id`                 bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`              datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`              smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`            datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '字段管理;XWCMDBFIELDINFO'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_meta_table
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table`;
CREATE TABLE `biz_hkmp_meta_table`
(
    `id`                             bigint(20)                                             NOT NULL COMMENT 'ID',
    `metadata_id`                    bigint(20)                                             NULL     DEFAULT NULL COMMENT '元数据id;METADATAID',
    `channel_id`                     bigint(20)                                             NULL     DEFAULT NULL COMMENT '栏目id;CHANNELID',
    `place_id`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'place_id;PLACE_ID',
    `acc_no`                         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '编号;ACC_NO',
    `evideo_id`                      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '视频 id;EVIDEO_ID',
    `collection`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '收藏;COLLECTION',
    `school_types_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'school_types(英文);SCHOOL_TYPES_ENG',
    `presented_by_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'presented_by_cht;PRESENTED_BY_CHT',
    `building_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'building_cht;BUILDING_CHT',
    `director_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'director_eng;DIRECTOR_ENG',
    `cast_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cast_eng;CAST_ENG',
    `subject_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'subject_cht;SUBJECT_CHT',
    `producer_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'producer_cht;PRODUCER_CHT',
    `assi_director_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'assi_director_cht;ASSI_DIRECTOR_CHT',
    `cast_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cast_cht;CAST_CHT',
    `url_name_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'url_name_cht;URL_NAME_CHT',
    `vocalist_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'vocalist_eng;VOCALIST_ENG',
    `ori_story_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ori_story_eng;ORI_STORY_ENG',
    `continuity_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'continuity_cht;CONTINUITY_CHT',
    `copyright_status_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_status_eng;COPYRIGHT_STATUS_ENG',
    `brand_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'brand_eng;BRAND_ENG',
    `original_file_name`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'original_file_name;ORIGINAL_FILE_NAME',
    `remark_contributor_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_contributor_eng;REMARK_CONTRIBUTOR_ENG',
    `description_eng`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'description_eng;DESCRIPTION_ENG',
    `original_title_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'original_title_cht;ORIGINAL_TITLE_CHT',
    `genres_type_eng`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'genres_type_eng;GENRES_TYPE_ENG',
    `street_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'street_eng;STREET_ENG',
    `enable`                         int(10)                                                NULL     DEFAULT NULL COMMENT 'enable;ENABLE',
    `vocalist_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'vocalist_cht;VOCALIST_CHT',
    `place_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'place_cht;PLACE_CHT',
    `authors_note_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'authors_note_eng;AUTHORS_NOTE_ENG',
    `creator_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_cht;CREATOR_CHT',
    `prod_place_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_place_cht;PROD_PLACE_CHT',
    `original_file`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'original_file;ORIGINAL_FILE',
    `license_1_authorization_no`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'license_1_authorization_no;LICENSE_1_AUTHORIZATION_NO',
    `prod_place_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_place_eng;PROD_PLACE_ENG',
    `prod_crew_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_crew_cht;PROD_CREW_CHT',
    `music_director_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'music_director_eng;MUSIC_DIRECTOR_ENG',
    `document_type_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'document_type_eng;DOCUMENT_TYPE_ENG',
    `creator_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_eng;CREATOR_ENG',
    `lighting_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lighting_eng;LIGHTING_ENG',
    `license1`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'license1;LICENSE1',
    `remark_contributor_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '备注贡献者(中文);REMARK_CONTRIBUTOR_CHT',
    `kw_other_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '别名(英文);KW_OTHER_ENG',
    `hung_kungfu_instrcutor_eng`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'hung_kungfu_instrcutor_eng;HUNG_KUNGFU_INSTRCUTOR_ENG',
    `kw_place_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_place_eng;KW_PLACE_ENG',
    `tlf_kungfu_instructor_cht`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'tlf_kungfu_instructor_cht;TLF_KUNGFU_INSTRUCTOR_CHT',
    `place_manufacture_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'place_manufacture_eng;PLACE_MANUFACTURE_ENG',
    `ori_story_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ori_story_cht;ORI_STORY_CHT',
    `ori_sound_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ori_sound_cht;ORI_SOUND_CHT',
    `presented_by_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'presented_by_eng;PRESENTED_BY_ENG',
    `lyrics_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lyrics_eng;LYRICS_ENG',
    `remark_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_eng;REMARK_ENG',
    `line_producer_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'line_producer_cht;LINE_PRODUCER_CHT',
    `kw_school_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_school_cht;KW_SCHOOL_CHT',
    `source_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'source_cht;SOURCE_CHT',
    `contributor_eng`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_eng;CONTRIBUTOR_ENG',
    `format_medium_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'format_medium_cht;FORMAT_MEDIUM_CHT',
    `material_type_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'material_type_eng;MATERIAL_TYPE_ENG',
    `theme`                          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '主题;THEME',
    `kw_event_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '事件(中文);KW_EVENT_CHT',
    `boxing_instructor_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '教练(英文);BOXING_INSTRUCTOR_ENG',
    `director_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '负责人(中文);DIRECTOR_CHT',
    `martial_arts_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'martial_arts_cht;MARTIAL_ARTS_CHT',
    `archive`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'archive;ARCHIVE',
    `url`                            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'url;URL',
    `format_colour_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'format_colour_eng;FORMAT_COLOUR_ENG',
    `prod_crew_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_crew_eng;PROD_CREW_ENG',
    `media_type_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'media_type_cht;MEDIA_TYPE_CHT',
    `song_compo_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'song_compo_cht;SONG_COMPO_CHT',
    `creator_place_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_place_cht;CREATOR_PLACE_CHT',
    `collection_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'collection_eng;COLLECTION_ENG',
    `contributor_method_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_method_eng;CONTRIBUTOR_METHOD_ENG',
    `kw_industry_eng`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_industry_eng;KW_INDUSTRY_ENG',
    `remark_other_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_other_eng;REMARK_OTHER_ENG',
    `sp_effect_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sp_effect_eng;SP_EFFECT_ENG',
    `theme_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'theme_cht;THEME_CHT',
    `kw_object_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_object_eng;KW_OBJECT_ENG',
    `remark_creator_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_creator_eng;REMARK_CREATOR_ENG',
    `production_controllrer_eng`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_controllrer_eng;PRODUCTION_CONTROLLRER_ENG',
    `kw_activities_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_activities_eng;KW_ACTIVITIES_ENG',
    `creator_role_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_role_cht;CREATOR_ROLE_CHT',
    `date_pub_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_pub_eng;DATE_PUB_ENG',
    `region_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'region_eng;REGION_ENG',
    `school_types_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'school_types_cht;SCHOOL_TYPES_CHT',
    `copyright_clearance_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_clearance_cht;COPYRIGHT_CLEARANCE_CHT',
    `release_date_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'release_date_cht;RELEASE_DATE_CHT',
    `creator_role_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_role_eng;CREATOR_ROLE_ENG',
    `props_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'props_cht;PROPS_CHT',
    `description_cht`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'description_cht;DESCRIPTION_CHT',
    `kw_event_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_event_eng;KW_EVENT_ENG',
    `city_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'city_cht;CITY_CHT',
    `contributor_method_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_method_cht;CONTRIBUTOR_METHOD_CHT',
    `building_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'building_eng;BUILDING_ENG',
    `boxing_instructor_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'boxing_instructor_cht;BOXING_INSTRUCTOR_CHT',
    `download`                       int(10)                                                NULL     DEFAULT NULL COMMENT 'download;DOWNLOAD',
    `credits_title_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'credits_title_eng;CREDITS_TITLE_ENG',
    `location`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'location;LOCATION',
    `contributor_cht`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_cht;CONTRIBUTOR_CHT',
    `original_title_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'original_title_eng;ORIGINAL_TITLE_ENG',
    `production_controllrer_cht`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_controllrer_cht;PRODUCTION_CONTROLLRER_CHT',
    `tlf_kungfu_instructor_eng`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'tlf_kungfu_instructor_eng;TLF_KUNGFU_INSTRUCTOR_ENG',
    `continuity_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'continuity_eng;CONTINUITY_ENG',
    `kw_institution_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_institution_cht;KW_INSTITUTION_CHT',
    `topic_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'topic_cht;TOPIC_CHT',
    `colour_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'colour_eng;COLOUR_ENG',
    `editor_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'editor_cht;EDITOR_CHT',
    `brand_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'brand_cht;BRAND_CHT',
    `makeup_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'makeup_eng;MAKEUP_ENG',
    `lang_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lang_eng;LANG_ENG',
    `ori_sound_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ori_sound_eng;ORI_SOUND_ENG',
    `sp_effect_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sp_effect_cht;SP_EFFECT_CHT',
    `url_name_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'url_name_eng;URL_NAME_ENG',
    `production_man_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_man_eng;PRODUCTION_MAN_ENG',
    `source_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'source_eng;SOURCE_ENG',
    `theme_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'theme_eng;THEME_ENG',
    `editing_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'editing_eng;EDITING_ENG',
    `contributor_remarks_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_remarks_cht;CONTRIBUTOR_REMARKS_CHT',
    `makeup_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'makeup_cht;MAKEUP_CHT',
    `place`                          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'place;PLACE',
    `material_type_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'material_type_cht;MATERIAL_TYPE_CHT',
    `genres_type_cht`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'genres_type_cht;GENRES_TYPE_CHT',
    `topic_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'topic_eng;TOPIC_ENG',
    `production_coordinator_cht`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_coordinator_cht;PRODUCTION_COORDINATOR_CHT',
    `release_date_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'release_date_eng;RELEASE_DATE_ENG',
    `scriptwriter_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'scriptwriter_eng;SCRIPTWRITER_ENG',
    `media_type_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'media_type_eng;MEDIA_TYPE_ENG',
    `tag_eng`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'tag_eng;TAG_ENG',
    `country_origin_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'country_origin_eng;COUNTRY_ORIGIN_ENG',
    `production_man_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_man_cht;PRODUCTION_MAN_CHT',
    `kw_people_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_people_cht;KW_PEOPLE_CHT',
    `extension`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'extension;EXTENSION',
    `kw_object_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_object_cht;KW_OBJECT_CHT',
    `credits_title_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'credits_title_cht;CREDITS_TITLE_CHT',
    `props_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'props_eng;PROPS_ENG',
    `lang_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lang_cht;LANG_CHT',
    `related`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'related;RELATED',
    `creator_type`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_type;CREATOR_TYPE',
    `song_compo_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'song_compo_eng;SONG_COMPO_ENG',
    `copyright_comment_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_comment_cht;COPYRIGHT_COMMENT_CHT',
    `place_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'place_eng;PLACE_ENG',
    `title_eng`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'title_eng;TITLE_ENG',
    `lyrics_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lyrics_cht;LYRICS_CHT',
    `street_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'street_cht;STREET_CHT',
    `choreographer_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'choreographer_eng;CHOREOGRAPHER_ENG',
    `reference_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'reference_cht;REFERENCE_CHT',
    `digital_file_no`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'digital_file_no;DIGITAL_FILE_NO',
    `sound_rec_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sound_rec_cht;SOUND_REC_CHT',
    `costume_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'costume_cht;COSTUME_CHT',
    `celestial_key`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'celestial_key;CELESTIAL_KEY',
    `kw_activities_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_activities_cht;KW_ACTIVITIES_CHT',
    `production_company_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_company_eng;PRODUCTION_COMPANY_ENG',
    `remark_creator_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_creator_cht;REMARK_CREATOR_CHT',
    `date_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_cht;DATE_CHT',
    `contributor_role_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_role_cht;CONTRIBUTOR_ROLE_CHT',
    `kw_other_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_other_cht;KW_OTHER_CHT',
    `place_manufacture_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'place_manufacture_cht;PLACE_MANUFACTURE_CHT',
    `action_director_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'action_director_cht;ACTION_DIRECTOR_CHT',
    `district_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'district_cht;DISTRICT_CHT',
    `cinematographer_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cinematographer_cht;CINEMATOGRAPHER_CHT',
    `kw_place_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_place_cht;KW_PLACE_CHT',
    `duration_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'duration_eng;DURATION_ENG',
    `original_filename`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'original_filename;ORIGINAL_FILENAME',
    `material_type`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'material_type;MATERIAL_TYPE',
    `reference_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'reference_eng;REFERENCE_ENG',
    `scriptwriter_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'scriptwriter_cht;SCRIPTWRITER_CHT',
    `line_producer_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'line_producer_eng;LINE_PRODUCER_ENG',
    `region_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'region_cht;REGION_CHT',
    `contributor_remarks_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_remarks_eng;CONTRIBUTOR_REMARKS_ENG',
    `art_director_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'art_director_eng;ART_DIRECTOR_ENG',
    `authors_note_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'authors_note_cht;AUTHORS_NOTE_CHT',
    `kw_people_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_people_eng;KW_PEOPLE_ENG',
    `remark_other_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_other_cht;REMARK_OTHER_CHT',
    `martial_arts_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'martial_arts_eng;MARTIAL_ARTS_ENG',
    `art_director_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'art_director_cht;ART_DIRECTOR_CHT',
    `sound_rec_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sound_rec_eng;SOUND_REC_ENG',
    `choreographer_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'choreographer_cht;CHOREOGRAPHER_CHT',
    `tag_cht`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'tag_cht;TAG_CHT',
    `collection_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'collection_cht;COLLECTION_CHT',
    `duration_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'duration_cht;DURATION_CHT',
    `producer_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'producer_eng;PRODUCER_ENG',
    `media_type`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'media_type;MEDIA_TYPE',
    `date_pub_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_pub_cht;DATE_PUB_CHT',
    `contributor_type`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_type;CONTRIBUTOR_TYPE',
    `license2`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'license2;LICENSE2',
    `title_cht`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'title_cht;TITLE_CHT',
    `kw_school_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_school_eng;KW_SCHOOL_ENG',
    `other_functions_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'other_functions_cht;OTHER_FUNCTIONS_CHT',
    `subject_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'subject_eng;SUBJECT_ENG',
    `production_coordinator_eng`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_coordinator_eng;PRODUCTION_COORDINATOR_ENG',
    `extra_table`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'extra_table;EXTRA_TABLE',
    `cinematographer_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cinematographer_eng;CINEMATOGRAPHER_ENG',
    `date_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_eng;DATE_ENG',
    `time`                           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'time;TIME',
    `topic`                          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'topic;TOPIC',
    `music_director_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'music_director_cht;MUSIC_DIRECTOR_CHT',
    `lighting_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'lighting_cht;LIGHTING_CHT',
    `kw_organization_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_organization_eng;KW_ORGANIZATION_ENG',
    `repository_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'repository_cht;REPOSITORY_CHT',
    `city_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'city_eng;CITY_ENG',
    `format_medium_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'format_medium_eng;FORMAT_MEDIUM_ENG',
    `action_director_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'action_director_eng;ACTION_DIRECTOR_ENG',
    `format_colour_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'format_colour_cht;FORMAT_COLOUR_CHT',
    `remark_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'remark_cht;REMARK_CHT',
    `kw_organization_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_organization_cht;KW_ORGANIZATION_CHT',
    `repository_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'repository_eng;REPOSITORY_ENG',
    `kw_institution_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_institution_eng;KW_INSTITUTION_ENG',
    `district_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'district_eng;DISTRICT_ENG',
    `copyright_comment_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_comment_eng;COPYRIGHT_COMMENT_ENG',
    `editor_eng`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'editor_eng;EDITOR_ENG',
    `grouping`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'grouping;GROUPING',
    `kw_industry_cht`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_industry_cht;KW_INDUSTRY_CHT',
    `contributor_role_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'contributor_role_eng;CONTRIBUTOR_ROLE_ENG',
    `colour_cht`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'colour_cht;COLOUR_CHT',
    `production_company_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'production_company_cht;PRODUCTION_COMPANY_CHT',
    `country_origin_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'country_origin_cht;COUNTRY_ORIGIN_CHT',
    `costume_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'costume_eng;COSTUME_ENG',
    `assi_director_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'assi_director_eng;ASSI_DIRECTOR_ENG',
    `camera_format_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'camera_format_cht;CAMERA_FORMAT_CHT',
    `method_copyright_clearance_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'method_copyright_clearance_eng;METHOD_COPYRIGHT_CLEARANCE_ENG',
    `copyright_status_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_status_cht;COPYRIGHT_STATUS_CHT',
    `copyright_clearance_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_clearance_eng;COPYRIGHT_CLEARANCE_ENG',
    `date_end`                       datetime(0)                                            NULL     DEFAULT NULL COMMENT 'date_end;DATE_END',
    `date_start`                     datetime(0)                                            NULL     DEFAULT NULL COMMENT 'date_start;DATE_START',
    `creator_place_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'creator_place_eng;CREATOR_PLACE_ENG',
    `hung_kungfu_instrcutor_cht`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'hung_kungfu_instrcutor_cht;HUNG_KUNGFU_INSTRCUTOR_CHT',
    `document_type_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'document_type_cht;DOCUMENT_TYPE_CHT',
    `camera_format_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'camera_format_eng;CAMERA_FORMAT_ENG',
    `other_functions_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'other_functions_eng;OTHER_FUNCTIONS_ENG',
    `editing_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'editing_cht;EDITING_CHT',
    `editing_chi`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'editing_chi;EDITING_CHI',
    `size_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'size_eng;SIZE_ENG',
    `size_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'size_cht;SIZE_CHT',
    `date_release_eng`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_release_eng;DATE_RELEASE_ENG',
    `date_release_cht`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'date_release_cht;DATE_RELEASE_CHT',
    `ctiy_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ctiy_eng;CTIY_ENG',
    `distrit_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'distrit_cht;DISTRIT_CHT',
    `poem`                           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'poem;POEM',
    `sequence`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sequence;SEQUENCE',
    `content_category`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'content_category;CONTENT_CATEGORY',
    `photography_category`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'photography_category;PHOTOGRAPHY_CATEGORY',
    `poetic_photography`             int(10)                                                NULL     DEFAULT NULL COMMENT 'poetic_photography;POETIC_PHOTOGRAPHY',
    `poetic`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'poetic;POETIC',
    `img_no`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'img_no;IMG_NO',
    `author`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'author;AUTHOR',
    `google_map`                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'google_map;GOOGLE_MAP',
    `size_rez`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'size_rez;SIZE_REZ',
    `prod_crew_chi`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_crew_chi;PROD_CREW_CHI',
    `camera_format_chi`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'camera_format_chi;CAMERA_FORMAT_CHI',
    `brand_chi`                      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'brand_chi;BRAND_CHI',
    `prod_place_chi`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'prod_place_chi;PROD_PLACE_CHI',
    `dimension_eng`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'dimension_eng;DIMENSION_ENG',
    `copyright_comment`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'copyright_comment;COPYRIGHT_COMMENT',
    `kw_company_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_company_eng;KW_COMPANY_ENG',
    `dimension_cht`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'dimension_cht;DIMENSION_CHT',
    `kw_company_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'kw_company_cht;KW_COMPANY_CHT',
    `media_type_chi`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'media_type_chi;MEDIA_TYPE_CHI',
    `period`                         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '时期;PERIOD',
    `type_of_material`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '物料种类;TYPE_OF_MATERIAL',
    `plot_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'plot(英文);PLOT_ENG',
    `plot_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'plot(中文);PLOT_CHT',
    `age_eng`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'age(英文);AGE_ENG',
    `age_cht`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'age(中文);AGE_CHT',
    `sex_eng`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sex(英文);SEX_ENG',
    `sex_cht`                        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'sex(中文);SEX_CHT',
    `place_of_birth_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '出生地(英文);PLACE_OF_BIRTH_ENG',
    `place_of_birth_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '出生地(中文);PLACE_OF_BIRTH_CHT',
    `rank_eng`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'rank(英文);RANK_ENG',
    `rank_cht`                       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'rank(中文);RANK_CHT',
    `occupation_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'occupation(英文);OCCUPATION_ENG',
    `occupation_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'occupation(中文);OCCUPATION_CHT',
    `cause_of_death_eng`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cause_of_death_eng;CAUSE_OF_DEATH_ENG',
    `cause_of_death_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'cause_of_death_cht;CAUSE_OF_DEATH_CHT',
    `monument_eng`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'monument_eng;MONUMENT_ENG',
    `monument_cht`                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'monument_cht;MONUMENT_CHT',
    `feature_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'feature_eng;FEATURE_ENG',
    `feature_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'feature_cht;FEATURE_CHT',
    `erected_by_eng`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'erected_by_eng;ERECTED_BY_ENG',
    `erected_by_cht`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'erected_by_cht;ERECTED_BY_CHT',
    `section_eng`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'section_cht;SECTION_CHT',
    `section_cht`                    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'section_cht;SECTION_CHT',
    `org_id`                         bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`                       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'org name;NO EXIST',
    `create_by`                      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`                      datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`                      smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`                    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`                    datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = MyISAM
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '元数据集合表;主表 WCMMETATABLEICHIIHK'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oral_hist_doc
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oral_hist_doc`;
CREATE TABLE `biz_hkmp_meta_table_oral_hist_doc`
(
    `id`                    bigint(20)                                             NOT NULL COMMENT 'WCMMETATABLEORAL_HIST_DOCID',
    `metadata_id`           bigint(20)                                             NULL     DEFAULT NULL COMMENT 'METADATAID',
    `channel_id`            int(11)                                                NULL     DEFAULT NULL COMMENT 'CHANNELID',
    `acc_no`                varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ACC_NO',
    `enable`                int(11)                                                NULL     DEFAULT NULL COMMENT 'ENABLE',
    `title_eng`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_ENG',
    `title_cht`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_CHT',
    `description_eng`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DESCRIPTION_ENG',
    `description_cht`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DESCRIPTION_CHT',
    `date_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DATE_ENG',
    `date_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DATE_CHT',
    `date_start`            datetime(0)                                            NULL     DEFAULT NULL COMMENT 'DATE_START',
    `date_end`              datetime(0)                                            NULL     DEFAULT NULL COMMENT 'DATE_END',
    `kw_people_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PEOPLE_ENG',
    `kw_people_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PEOPLE_CHT',
    `kw_object_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OBJECT_ENG',
    `kw_object_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OBJECT_CHT',
    `kw_product_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PRODUCT_ENG',
    `kw_product_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PRODUCT_CHT',
    `kw_event_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_EVENT_ENG',
    `kw_event_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_EVENT_CHT',
    `kw_other_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OTHER_ENG',
    `kw_other_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OTHER_CHT',
    `industry_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'INDUSTRY_ENG',
    `industry_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'INDUSTRY_CHT',
    `industry`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'INDUSTRY',
    `company_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COMPANY_ENG',
    `company_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COMPANY_CHT',
    `occupation_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'OCCUPATION_ENG',
    `occupation_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'OCCUPATION_CHT',
    `organization_eng`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ORGANIZATION_ENG',
    `organization_cht`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ORGANIZATION_CHT',
    `theme`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'THEME',
    `topic`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC',
    `topic_2`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC_2',
    `topic_3`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC_3',
    `topic_4`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC_4',
    `topic_5`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC_5',
    `place`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'PLACE',
    `source_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SOURCE_ENG',
    `source_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SOURCE_CHT',
    `collection_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COLLECTION_ENG',
    `collection_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COLLECTION_CHT',
    `repository_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REPOSITORY_ENG',
    `repository_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REPOSITORY_CHT',
    `reference_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REFERENCE_ENG',
    `reference_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REFERENCE_CHT',
    `link_address`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LINK_ADDRESS',
    `link_name`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LINK_NAME',
    `material_type_eng`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MATERIAL_TYPE_ENG',
    `material_type_cht`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MATERIAL_TYPE_CHT',
    `material_type`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MATERIAL_TYPE',
    `media`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MEDIA',
    `extension`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'EXTENSION',
    `archive`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'ARCHIVE',
    `evideo_id`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'EVIDEO_ID',
    `copyright_comment`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_COMMENT',
    `copyright_status`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_STATUS',
    `full_report`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'FULL_REPORT',
    `location`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LOCATION',
    `related`               text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'RELATED',
    `remark_eng`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REMARK_ENG',
    `remark_cht`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REMARK_CHT',
    `collection`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COLLECTION',
    `download`              int(11)                                                NULL     DEFAULT NULL COMMENT 'DOWNLOAD',
    `time`                  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TIME',
    `topic_cht`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC_CHT',
    `copyright_comment_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_COMMENT_ENG',
    `copyright_comment_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_COMMENT_CHT',
    `copyright_status_cht`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_STATUS_CHT',
    `org_id`                bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;no exist',
    `create_by`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`             datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`             smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt`           datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '元数据-口述历史图文;WCMMETATABLEORAL_HIST_DOC'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oral_interview
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oral_interview`;
CREATE TABLE `biz_hkmp_meta_table_oral_interview`
(
    `id`                   bigint(20)                                             NOT NULL COMMENT 'WCMMETATABLEORAL_INTERVIEWID',
    `metadata_id`          bigint(20)                                             NULL     DEFAULT NULL COMMENT 'METADATAID',
    `channel_id`           bigint(20)                                             NULL     DEFAULT NULL COMMENT 'CHANNELID',
    `acc_no`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ACC_NO',
    `enable`               int(10)                                                NULL     DEFAULT NULL COMMENT 'ENABLE',
    `collection_eng`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COLLECTION_ENG',
    `collection_cht`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COLLECTION_CHT',
    `name_eng`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'NAME_ENG',
    `name_cht`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'NAME_CHT',
    `sex_eng`              varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'SEX_ENG',
    `sex_cht`              varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'SEX_CHT',
    `birthyear_eng`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'BIRTHYEAR_ENG',
    `birthyear_cht`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'BIRTHYEAR_CHT',
    `birthplace_eng`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'BIRTHPLACE_ENG',
    `birthplace_cht`       varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'BIRTHPLACE_CHT',
    `age_eng`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'AGE_ENG',
    `age_cht`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'AGE_CHT',
    `education_eng`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'EDUCATION_ENG',
    `education_cht`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'EDUCATION_CHT',
    `origin_eng`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ORIGIN_ENG',
    `origin_cht`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ORIGIN_CHT',
    `nationality_eng`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'NATIONALITY_ENG',
    `nationality_cht`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'NATIONALITY_CHT',
    `industry_eng`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INDUSTRY_ENG',
    `industry_cht`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INDUSTRY_CHT',
    `occupation_eng`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'OCCUPATION_ENG',
    `occupation_cht`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'OCCUPATION_CHT',
    `position_eng`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'POSITION_ENG',
    `position_cht`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'POSITION_CHT',
    `company_eng`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COMPANY_ENG',
    `company_cht`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COMPANY_CHT',
    `association_eng`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ASSOCIATION_ENG',
    `association_cht`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ASSOCIATION_CHT',
    `interviewer_eng`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INTERVIEWER_ENG',
    `interviewer_cht`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INTERVIEWER_CHT',
    `staff_eng`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'STAFF_ENG',
    `staff_cht`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'STAFF_CHT',
    `interviewdate_eng`    datetime(0)                                            NULL     DEFAULT NULL COMMENT 'INTERVIEWDATE_ENG',
    `interviewdate_cht`    datetime(0)                                            NULL     DEFAULT NULL COMMENT 'INTERVIEWDATE_CHT',
    `interviewtime_eng`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INTERVIEWTIME_ENG',
    `interviewtime_cht`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'INTERVIEWTIME_CHT',
    `venue_eng`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'VENUE_ENG',
    `venue_cht`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'VENUE_CHT',
    `bio_eng`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'BIO_ENG',
    `bio_cht`              text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'BIO_CHT',
    `title_eng`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_ENG',
    `title_cht`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_CHT',
    `synopsis_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SYNOPSIS_ENG',
    `synopsis_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SYNOPSIS_CHT',
    `timecover_eng`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TIMECOVER_ENG',
    `timecover_cht`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TIMECOVER_CHT',
    `date_start`           datetime(0)                                            NULL     DEFAULT NULL COMMENT 'DATE_START',
    `date_end`             datetime(0)                                            NULL     DEFAULT NULL COMMENT 'DATE_END',
    `kw_place_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PLACE_ENG',
    `place`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'PLACE',
    `kw_people_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PEOPLE_ENG',
    `kw_people_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_PEOPLE_CHT',
    `kw_event_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_EVENT_ENG',
    `kw_event_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_EVENT_CHT',
    `kw_other_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OTHER_ENG',
    `kw_other_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'KW_OTHER_CHT',
    `subject_eng`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUBJECT_ENG',
    `subject_cht`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUBJECT_CHT',
    `subtheme_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUBTHEME_ENG',
    `subtheme_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUBTHEME_CHT',
    `topic`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TOPIC',
    `media`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MEDIA',
    `material_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MATERIAL_ENG',
    `material_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MATERIAL_CHT',
    `extension`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'EXTENSION',
    `filetype_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'FILETYPE_CHT',
    `medium_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MEDIUM_ENG',
    `medium_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'MEDIUM_CHT',
    `durwhole_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DURWHOLE_ENG',
    `durwhole_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DURWHOLE_CHT',
    `durseg_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DURSEG_ENG',
    `durseg_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DURSEG_CHT',
    `language_eng`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LANGUAGE_ENG',
    `language_cht`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LANGUAGE_CHT',
    `agreement_no`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'AGREEMENT_NO',
    `license_no`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'LICENSE_NO',
    `suppl_image`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUPPL_IMAGE',
    `suppl_video`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'SUPPL_VIDEO',
    `condition_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'CONDITION_ENG',
    `condition_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'CONDITION_CHT',
    `copyright_status`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_STATUS',
    `copyright_comment`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_COMMENT',
    `repository_eng`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REPOSITORY_ENG',
    `repository_cht`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REPOSITORY_CHT',
    `remark_eng`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REMARK_ENG',
    `remark_cht`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REMARK_CHT',
    `video`                text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'VIDEO',
    `collection`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COLLECTION',
    `time`                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'TIME',
    `copyright_status_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'COPYRIGHT_STATUS_CHT',
    `reference_eng`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REFERENCE_ENG',
    `reference_cht`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'REFERENCE_CHT',
    `org_id`               bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`            datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`            smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`          datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '口述历史-采访;WCMMETATABLEORAL_INTERVIEW'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_oralhistory
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_oralhistory`;
CREATE TABLE `biz_hkmp_meta_table_oralhistory`
(
    `id`              bigint(20)                                             NOT NULL COMMENT 'WCMMETATABLEORALHISTORYID',
    `metadata_id`     bigint(20)                                             NULL     DEFAULT NULL COMMENT 'METADATAID',
    `channel_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT 'CHANNELID',
    `acc_no`          varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'ACC_NO',
    `enable`          int(10)                                                NULL     DEFAULT NULL COMMENT 'ENABLE',
    `title_eng`       varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_ENG',
    `title_cht`       varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TITLE_CHT',
    `description_eng` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DESCRIPTION_ENG',
    `description_cht` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'DESCRIPTION_CHT',
    `source_eng`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'SOURCE_ENG',
    `source_cht`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'SOURCE_CHT',
    `collection`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COLLECTION',
    `org_id`          bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`       datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`       smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`     datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '「香港留声」口述历史档案库;WCMMETATABLEORALHISTORY'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_meta_table_search
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_meta_table_search`;
CREATE TABLE `biz_hkmp_meta_table_search`
(
    `id`          int(10)                                                NOT NULL COMMENT 'id;WCMMETATABLESEARCHID',
    `metadata_id` int(10)                                                NULL     DEFAULT NULL COMMENT 'metadata id;METADATAID',
    `channel_id`  int(10)                                                NULL     DEFAULT NULL COMMENT 'channel id;CHANNELID',
    `url`         varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'url;URL',
    `content`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT 'content;CONTENT',
    `doc_status`  int(10)                                                NULL     DEFAULT NULL COMMENT 'doc status;DOCSTATUS',
    `name`        varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'name;NAME',
    `source`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'source;SOURCE',
    `language`    varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'language;LANGUAGE',
    `org_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;no exist',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`   datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`   smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt` datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '展览-所有展览项集合;WCMMETATABLESEARCH'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_tag_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_tag_info`;
CREATE TABLE `biz_hkmp_tag_info`
(
    `id`          bigint(20)                                             NOT NULL COMMENT 'WCMMETATABLETAGINFOID',
    `metadata_id` bigint(20)                                             NULL     DEFAULT NULL COMMENT 'METADATAID',
    `channel_id`  bigint(20)                                             NULL     DEFAULT NULL COMMENT 'CHANNELID',
    `doc_id`      varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'DOCID',
    `tags`        varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'TAGS',
    `username`    varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'USERNAME',
    `ip`          varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'IP',
    `enable`      int(10)                                                NULL     DEFAULT NULL COMMENT 'ENABLE',
    `collection`  varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'COLLECTION',
    `language`    varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'LANGUAGE',
    `org_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`   datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`   smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt` datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '标签数据?;WCMMETATABLETAGINFO'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_template`;
CREATE TABLE `biz_hkmp_template`
(
    `id`               bigint(20)                                             NOT NULL COMMENT 'TEMPID',
    `pid`              bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '上级id;ROOTID',
    `temp_name`        varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '模板名;TEMPNAME',
    `temp_desc`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '模板描述;TEMPDESC',
    `temp_ext`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT 'htm' COMMENT '模板扩展;TEMPEXT',
    `temp_text`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         NULL COMMENT '模板文本;TEMPTEXT',
    `attribute`        varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '属性;ATTRIBUTE',
    `apd_modified`     int(5)                                                 NOT NULL DEFAULT 0 COMMENT '修改;APDMODIFIED',
    `temp_type`        int(5)                                                 NOT NULL DEFAULT 0 COMMENT '模板类型;TEMPTYPE',
    `temp_form_id`     bigint(20)                                             NOT NULL DEFAULT 0 COMMENT 'temp_form_id;TEMPFORMID',
    `is_parsed`        int(5)                                                 NOT NULL DEFAULT 0 COMMENT 'is_parsed;ISPARSED',
    `folder_type`      int(10)                                                NOT NULL DEFAULT 103 COMMENT 'folder_type;FOLDERTYPE',
    `folder_id`        bigint(20)                                             NOT NULL DEFAULT 0 COMMENT 'folder_id;FOLDERID',
    `output_file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '生成视图名;OUTPUTFILENAME',
    `org_id`           bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`        datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`        smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;LASTMODIFIEDUSER',
    `last_upd_dt`      datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;LASTMODIFIEDTIME'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '模板管理;WCMTEMPLATE'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_upload_file_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_upload_file_log`;
CREATE TABLE `biz_hkmp_upload_file_log`
(
    `id`                     bigint(20)                                             NOT NULL COMMENT 'id;APPENDIXID',
    `app_doc_id`             bigint(20)                                             NULL     DEFAULT NULL COMMENT '文档id;APPDOCID',
    `app_file`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '文件生成名;APPFILE',
    `app_file_type`          int(10)                                                NULL     DEFAULT -1 COMMENT '文件类型(-1);APPFILETYPE',
    `app_desc`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '上传名;APPDESC',
    `app_link_alt`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'app_link_alt;APPLINKALT',
    `app_sern`               int(10)                                                NULL     DEFAULT NULL COMMENT 'Is sern;APPSERN',
    `app_prop`               int(10)                                                NULL     DEFAULT NULL COMMENT 'Is prop;APPPROP',
    `app_flag`               int(5)                                                 NULL     DEFAULT NULL COMMENT 'flag;APPFLAG',
    `app_time`               datetime(0)                                            NULL     DEFAULT NULL COMMENT 'time;APPTIME',
    `app_author`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'author;APPAUTHOR',
    `app_editor`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'editor;APPEDITOR',
    `attribute`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'attribute;ATTRIBUTE',
    `used_versions`          int(38)                                                NULL     DEFAULT 1 COMMENT 'Version;USEDVERSIONS',
    `src_file`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Src File;SRCFILE',
    `file_ext`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'file_ext;FILEEXT',
    `is_import_to_image_lib` int(10)                                                NULL     DEFAULT 0 COMMENT 'is_import_to_image_lib;ISIMPORTTOIMAGELIB',
    `related_column`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'related_column;RELATEDCOLUMN',
    `relate_photo_ids`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'related_column;RELATEPHOTOIDS',
    `org_id`                 bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;no exist',
    `create_by`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`              datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`              smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt`            datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '图片记录;WCMAPPENDIX'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_upload_job_log
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_upload_job_log`;
CREATE TABLE `biz_hkmp_upload_job_log`
(
    `id`           bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `batch_job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '批量操作任务编号',
    `tiele`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '标题',
    `file_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '文件名',
    `file_type`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '文件类型',
    `status`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '处理状态',
    `error_info`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '提示信息',
    `org_id`       bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id',
    `org_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name',
    `create_by`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id',
    `create_dt`    datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `is_delete`    smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除',
    `last_upd_by`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id',
    `last_upd_dt`  datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '上传日志'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_video
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_video`;
CREATE TABLE `biz_hkmp_video`
(
    `id`             bigint(20)                                             NOT NULL COMMENT 'id;DOCID',
    `xvideo_id`      bigint(20)                                             NOT NULL COMMENT 'Video id;XVIDEOID',
    `parent_id`      bigint(20)                                             NULL     DEFAULT NULL COMMENT 'Parent id;PARENTID',
    `token`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Token;TOKEN',
    `thumb`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Thumb;THUMB',
    `duration`       int(10)                                                NULL     DEFAULT NULL COMMENT 'Is Duration;DURATION',
    `width`          int(10)                                                NULL     DEFAULT NULL COMMENT 'Is Width;WIDTH',
    `height`         int(10)                                                NULL     DEFAULT NULL COMMENT 'Is Height;HEIGHT',
    `fps`            int(10)                                                NULL     DEFAULT NULL COMMENT 'Is fps;FPS',
    `bitrate`        int(10)                                                NULL     DEFAULT NULL COMMENT 'Is bitrate;BITRATE',
    `create_type`    int(10)                                                NULL     DEFAULT NULL COMMENT 'Is create type;CREATETYPE',
    `convert_status` int(10)                                                NULL     DEFAULT NULL COMMENT 'Is convert_status;CONVERT_STATUS',
    `ref_count`      int(10)                                                NULL     DEFAULT NULL COMMENT 'Is ref_count;REF_COUNT',
    `play_count`     int(10)                                                NULL     DEFAULT NULL COMMENT 'Is play_count;PLAY_COUNT',
    `is_copied`      int(10)                                                NULL     DEFAULT NULL COMMENT 'is copied;IS_COPIED',
    `file_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Is file name;FILENAME',
    `src_file_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'Is src file name;SRCFILENAME',
    `quality`        int(10)                                                NULL     DEFAULT NULL COMMENT 'Is quality;QUALITY',
    `format`         char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin     NULL     DEFAULT NULL COMMENT 'Is format;FORMAT',
    `org_id`         bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;no exist',
    `org_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;no exist',
    `create_by`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`      datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`      smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;no exist',
    `last_upd_by`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;no exist',
    `last_upd_dt`    datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;no exist'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '视频文件信息;XWCMVIDEO_SP2'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_view
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_view`;
CREATE TABLE `biz_hkmp_view`
(
    `id`              bigint(20)                                             NOT NULL COMMENT '视图编号;VIEWINFOID',
    `view_e_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '视图英文名称;VIEWNAME',
    `view_cn_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '视图中文名称;VIEWDESC',
    `db_tablename`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '数据库后缀名;MAINTABLENAME',
    `db_tableinfo_id` bigint(20)                                             NOT NULL COMMENT '数据库关联id;MAINTABLEID',
    `org_id`          bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`       datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`       smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`     datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST',
    INDEX `Key_1` (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '视图管理;XWCMVIEWINFO'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for biz_hkmp_view_fieIdinfo_ref
-- ----------------------------
DROP TABLE IF EXISTS `biz_hkmp_view_fieIdinfo_ref`;
CREATE TABLE `biz_hkmp_view_fieIdinfo_ref`
(
    `id`                  bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键;VIEWFIELDINFOID',
    `view_id`             bigint(20)                                             NULL     DEFAULT NULL COMMENT '视图id;VIEWID',
    `data_id`             bigint(20)                                             NULL     DEFAULT NULL COMMENT '字段id;FIELDNAME',
    `table_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '表名;TABLENAME',
    `table_id`            int(10)                                                NOT NULL DEFAULT 0 COMMENT '表id;TABLEID',
    `class_id`            int(10)                                                NOT NULL DEFAULT 0 COMMENT '地名id;CLASSID',
    `field_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '字段名;FIELDNAME',
    `db_field_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '数据库字段名;DBFIELDNAME',
    `db_type`             int(10)                                                NOT NULL DEFAULT 0 COMMENT '数据库类型;DBTYPE',
    `db_length`           int(10)                                                NOT NULL DEFAULT 0 COMMENT '数据库字段长度;DBLENGTH',
    `another_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '别名;ANOTHERNAME',
    `field_type`          int(10)                                                NOT NULL DEFAULT 0 COMMENT '字段类型;FIELDTYPE',
    `default_value`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '默认值;DEFAULTVALUE',
    `enm_value`           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '枚举值;ENMVALUE',
    `not_null`            int(5)                                                 NULL     DEFAULT NULL COMMENT '是否为空;NOTNULL',
    `field_order`         int(10)                                                NOT NULL DEFAULT 0 COMMENT '字段排序;FIELDORDER',
    `in_outline`          int(5)                                                 NULL     DEFAULT NULL COMMENT 'in_outline;INOUTLINE',
    `in_detail`           int(5)                                                 NOT NULL DEFAULT 1 COMMENT 'in_detail;INDETAIL',
    `search_field`        int(5)                                                 NULL     DEFAULT NULL COMMENT '搜索字段;SEARCHFIELD',
    `title_field`         int(5)                                                 NULL     DEFAULT NULL COMMENT '标题字段;TITLEFIELD',
    `db_field`            int(10)                                                NOT NULL DEFAULT 0 COMMENT '数据库字段;DBFIELD',
    `validator`           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '是否验证;VALIDATOR',
    `from_main_table`     int(10)                                                NOT NULL DEFAULT 1 COMMENT 'from_main_table;FROMMAINTABLE',
    `locate_channel`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT 'locate_channel;LOCATECHANNEL',
    `radorchk`            int(5)                                                 NULL     DEFAULT NULL COMMENT 'radorchk;RADORCHK',
    `not_edit`            int(5)                                                 NULL     DEFAULT 0 COMMENT '是否编辑;NOTEDIT',
    `hidden_field`        int(5)                                                 NULL     DEFAULT 0 COMMENT '隐藏字段;HIDDENFIELD',
    `inmulti_table`       int(5)                                                 NULL     DEFAULT 1 COMMENT 'inmulti_table;INMULTITABLE',
    `db_scale`            int(10)                                                NULL     DEFAULT 3 COMMENT 'db_scale;DBSCALE',
    `attribute`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '属性;ATTRIBUTE',
    `identity_field`      int(11)                                                NULL     DEFAULT NULL COMMENT '实体字段;IDENTITYFIELD',
    `is_right`            int(5)                                                 NULL     DEFAULT 0 COMMENT 'is_right;ISRIGHT',
    `pageno`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT '1 \r\n' COMMENT 'pageno;PAGENO',
    `is_display_front`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '前台页面是否显示;NO EXIST',
    `is_display_back`     varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '后台列表是否显示;NO EXIST',
    `is_hyperlink_search` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL     DEFAULT NULL COMMENT '是否支持搜索;NO EXIST',
    `sort_front`          int(11)                                                NULL     DEFAULT NULL COMMENT '前台排序;NO EXIST',
    `sort_back`           int(11)                                                NULL     DEFAULT NULL COMMENT '后台排序;NO EXIST',
    `org_id`              bigint(20)                                             NULL     DEFAULT NULL COMMENT '租户id;NO EXIST',
    `org_name`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT 'Org Name;NO EXIST',
    `create_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '创建者id;CRUSER',
    `create_dt`           datetime(0)                                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间;CRTIME',
    `is_delete`           smallint(2)                                            NOT NULL DEFAULT 0 COMMENT '是否删除;NO EXIST',
    `last_upd_by`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL     DEFAULT NULL COMMENT '更新者id;NO EXIST',
    `last_upd_dt`         datetime(0)                                            NULL     DEFAULT NULL COMMENT '更新时间;NO EXIST',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '视图字段关联表;XWCMVIEWFIELDINFO'
  ROW_FORMAT = Dynamic;
