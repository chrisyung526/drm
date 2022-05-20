drop table if exists `biz_sys_role`;
CREATE TABLE `biz_sys_role`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(80) NOT NULL COMMENT 'Role Name',
  `role_desc` text COMMENT 'Role Desc',
  `status` int(2) NULL DEFAULT NULL COMMENT 'Status',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Soft delete logo',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Role' ROW_FORMAT = Dynamic;

drop table if exists `biz_sys_user_role`;
CREATE TABLE `biz_sys_user_role`  (
 `id` bigint(20) NOT NULL COMMENT 'id',
 `user_id` bigint(20) NOT NULL COMMENT 'User Id',
 `role_id` bigint(20) NOT NULL COMMENT 'Role Id',
 `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
 `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
 `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
 `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
 `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Soft delete logo',
 `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
 `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'User Role' ROW_FORMAT = Dynamic;


drop table if exists `biz_sys_access`;
CREATE TABLE `biz_sys_access`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `parent_id` bigint(20)  NULL DEFAULT NULL COMMENT 'Parent Id',
  `title` varchar(50) NOT NULL COMMENT 'Title',
  `url` varchar(70)  DEFAULT NULL COMMENT 'Url',
  `logo` varchar(70) DEFAULT NULL COMMENT 'logo',
  `status` int(2) NULL DEFAULT NULL COMMENT 'Status',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50) DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Soft delete logo',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Access' ROW_FORMAT = Dynamic;

drop table if exists `biz_sys_role_access`;
CREATE TABLE `biz_sys_role_access`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `access_id` bigint(20) NOT NULL COMMENT 'Access Id',
  `role_id` bigint(20) NOT NULL COMMENT 'Role Id',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'Org ID',
  `org_name` varchar(50)  NULL DEFAULT NULL COMMENT 'Org Name',
  `create_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Created by ',
  `create_dt` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create Date',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT 'Soft delete logo',
  `last_upd_by` varchar(50)  NULL DEFAULT NULL COMMENT 'Last Updated By',
  `last_upd_dt` datetime NULL DEFAULT NULL COMMENT 'Last Update Date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Role Access' ROW_FORMAT = Dynamic;

