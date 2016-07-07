/*
Navicat MySQL Data Transfer

Source Server         : 10.1.245.4
Source Server Version : 50624
Source Host           : 10.1.245.4:39316
Source Database       : portal_backend

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-06-27 17:42:37
*/

use portal_backend;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for email_detail
-- ----------------------------
DROP TABLE IF EXISTS `email_detail`;
CREATE TABLE `email_detail` (
  `EMAIL_ID` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `FROM_ADDRESS` varchar(60) COLLATE utf8_bin NOT NULL,
  `FROM_PWD` varchar(32) COLLATE utf8_bin NOT NULL,
  `TO_ADDRESS` varchar(60) COLLATE utf8_bin NOT NULL,
  `EMAIL_TITLE` varchar(60) COLLATE utf8_bin NOT NULL,
  `EAMIL_CONTENT` varchar(5000) COLLATE utf8_bin NOT NULL,
  `EAMIL_CC` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `IS_SUCC` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '1- 2-',
  `FAIL_REASON` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `SEND_TIME` timestamp NOT NULL,
  PRIMARY KEY (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for oa_operaters
-- ----------------------------
DROP TABLE IF EXISTS `oa_operaters`;
CREATE TABLE `oa_operaters` (
  `OA_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `BUI_CODE` varchar(20) COLLATE utf8_bin NOT NULL,
  `nt_account` varchar(20) COLLATE utf8_bin NOT NULL,
  `VALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`OA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_attribute
-- ----------------------------
DROP TABLE IF EXISTS `order_attribute`;
CREATE TABLE `order_attribute` (
  `ORDER_DETAIL_ID` bigint(20) NOT NULL,
  `COST_CENTER_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `COST_CENTER_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `USER_MAX_NUMBERS` bigint(20) DEFAULT NULL,
  `Concurrent_numbers` bigint(20) DEFAULT NULL,
  `apply_type` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `use_type` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `apply_desc` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `IS_PROJECT` varchar(2) COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`ORDER_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `ORDER_DETAIL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OPERATE_TYPE` varchar(2) COLLATE utf8_bin NOT NULL,
  `USER_ID` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `PROD_TYPE` varchar(2) COLLATE utf8_bin NOT NULL,
  `PROD_ID` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `PROD_BYNAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `PROD_PARAM_ZH` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `PROD_PARAM` longtext COLLATE utf8_bin NOT NULL,
  `vm_number` smallint(6) DEFAULT '1',
  `ORDER_APP_DATE` timestamp NOT NULL,
  `PRE_OPEN_DATE` timestamp NULL DEFAULT NULL,
  `OPEN_STATUS` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '1. \r\n            2. \r\n            3. ',
  `OPEN_PARAM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OPEN_RESULT` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '1. \r\n            2. \r\n            ',
  `OPEN_DATE` timestamp NULL DEFAULT NULL,
  `ORDER_CHECK_STATUS` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `ORDER_CHECK_RESULT` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `ORDER_CHECK_DATE` timestamp NULL DEFAULT NULL,
  `ORDER_CHECK_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ORDER_STATUS` varchar(2) COLLATE utf8_bin NOT NULL,
  `USER_SERV_ID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `USER_SERV_IPAAS_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `USER_SERV_IPAAS_PWD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT_DEPT` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT_TEL` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT_EMAIL` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT_REASON` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `APPLICANT_DESC` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `EXPIRATION_DATE` timestamp NULL DEFAULT NULL,
  `BELONG_CLOUD` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `WF_INST_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SOFTS_CONFIG` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `SBUTRACT_FLAG` varchar(2) COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`ORDER_DETAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6782 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_scheme
-- ----------------------------
DROP TABLE IF EXISTS `order_scheme`;
CREATE TABLE `order_scheme` (
  `SCHEME_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_DETAIL_ID` bigint(20) NOT NULL,
  `PROD_PARAM_ZH` longtext COLLATE utf8_bin,
  `PROD_PARAM` longtext COLLATE utf8_bin,
  `VALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  `SCHEME_MAKE_TIME` timestamp NULL DEFAULT NULL,
  `SCHEME_MAKER` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHEME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_wo
-- ----------------------------
DROP TABLE IF EXISTS `order_wo`;
CREATE TABLE `order_wo` (
  `ORDER_WO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_DETAIL_ID` bigint(20) NOT NULL,
  `WF_TASK_ID` varchar(64) COLLATE utf8_bin NOT NULL,
  `ROLE_ID` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `OPERATE_ID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `WO_CREATE_DATE` timestamp NULL DEFAULT NULL,
  `WO_STATUS` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `WO_DESC` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `WO_DATE` timestamp NULL DEFAULT NULL,
  `DISPLAY_FLAG` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `WO_RESULT` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `RECEIPT_URL` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ORDER_WO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ord_status_operate_rel
-- ----------------------------
DROP TABLE IF EXISTS `ord_status_operate_rel`;
CREATE TABLE `ord_status_operate_rel` (
  `OPERATE_REL_ID` smallint(6) NOT NULL,
  `ORDER_STATUS` varchar(2) COLLATE utf8_bin NOT NULL,
  `NT_ACCOUNT` varchar(20) COLLATE utf8_bin NOT NULL,
  `VALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`OPERATE_REL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for prod_product
-- ----------------------------
DROP TABLE IF EXISTS `prod_product`;
CREATE TABLE `prod_product` (
  `PROD_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `PROD_EN_SIMP` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `PROD_TYPE` varchar(2) COLLATE utf8_bin NOT NULL,
  `PROD_CATEGORY` varchar(2) COLLATE utf8_bin NOT NULL,
  `PROD_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `PROD_LOGOPIC_ID` varchar(10) COLLATE utf8_bin NOT NULL,
  `PROD_DESC` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `PROD_VALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `PROD_SALE_FLAG` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `PROD_PARAM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_OPEN_RESTFULL` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `PROD_START_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_STOP_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_MDYPWD_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_FULLCLEAR_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_KEYCLEAR_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_SELTEDKEY_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_CANCLE_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_USED_AMOUNT_RESTFULL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_BIND_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_GETBOUND_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_GetBoundTableInfo_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_UNBIND_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROD_FilterTable_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXPANSE_CAPACITY_RESTFUL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for prod_quota
-- ----------------------------
DROP TABLE IF EXISTS `prod_quota`;
CREATE TABLE `prod_quota` (
  `PROD_ID` smallint(6) NOT NULL COMMENT '产品编码',
  `USER_ORG_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '归属组织机构',
  `CPU_QUOTA` int(8) DEFAULT NULL,
  `MEMORY_QUOTA` int(8) DEFAULT NULL,
  `DISK_SPACE_QUOTA` int(8) DEFAULT NULL,
  `REMAIN_CPU_QUOTA` int(8) DEFAULT NULL,
  `REMAIN_MEMORY_QUOTA` int(8) DEFAULT NULL,
  `REMAIN_DISK_SPACE_QUOTA` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `ROLE_ID` int(11) NOT NULL,
  `MENU_ID` int(11) NOT NULL,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  `status` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '0 \n            1 ',
  `status_time` date NOT NULL,
  `create_time` date NOT NULL,
  KEY `FK_Relationship_6` (`ROLE_ID`),
  KEY `FK_Relationship_7` (`MENU_ID`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`ROLE_ID`) REFERENCES `auth_role` (`ROLE_ID`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`MENU_ID`) REFERENCES `scy_menu` (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for scy_menu
-- ----------------------------
DROP TABLE IF EXISTS `scy_menu`;
CREATE TABLE `scy_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `MENU_CODE` varchar(60) COLLATE utf8_bin NOT NULL,
  `MENU_DESC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENU_URL` varchar(255) COLLATE utf8_bin NOT NULL,
  `MENU_CATALOG_ID` int(11) NOT NULL,
  `STS` varchar(2) COLLATE utf8_bin NOT NULL,
  `CREATE_DATE` date NOT NULL,
  `STS_DATE` date NOT NULL,
  PRIMARY KEY (`MENU_ID`),
  KEY `FK_Relationship_32` (`MENU_CATALOG_ID`),
  CONSTRAINT `FK_Relationship_32` FOREIGN KEY (`MENU_CATALOG_ID`) REFERENCES `scy_menu_catalog` (`MENU_CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for scy_menu_catalog
-- ----------------------------
DROP TABLE IF EXISTS `scy_menu_catalog`;
CREATE TABLE `scy_menu_catalog` (
  `MENU_CATALOG_ID` int(11) NOT NULL,
  `PARENT_CATALOG_ID` int(11) NOT NULL,
  `CATALOG_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `STS` varchar(2) COLLATE utf8_bin NOT NULL,
  `CREATE_DATE` date NOT NULL,
  `STS_DATE` date NOT NULL,
  PRIMARY KEY (`MENU_CATALOG_ID`),
  KEY `FK_REL_MENU_CATALOG_TREE` (`PARENT_CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `param_code` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `service_value` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `service_option` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `descb` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(2) COLLATE utf8_bin DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sys_config_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_rel`;
CREATE TABLE `sys_config_rel` (
  `SYS_CONFIG_REL_ID` smallint(6) NOT NULL,
  `PARENT_PARAM_ID` smallint(6) DEFAULT NULL,
  `CHILD_PARAM_ID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`SYS_CONFIG_REL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_center
-- ----------------------------
DROP TABLE IF EXISTS `user_center`;
CREATE TABLE `user_center` (
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `USER_ORG_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '/\r\n            ',
  `USER_EMAIL` varchar(32) COLLATE utf8_bin NOT NULL,
  `USER_PHONE_NUM` varchar(11) COLLATE utf8_bin NOT NULL,
  `USER_STATE` varchar(2) COLLATE utf8_bin NOT NULL,
  `USER_REGISTER_TIME` timestamp NOT NULL,
  `USER_ACTIVE_TIME` timestamp NULL DEFAULT NULL,
  `USER_CANCEL_TIME` timestamp NULL DEFAULT NULL,
  `USER_INSIDE_TAG` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `PARTNER_TYPE` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `PARTNER_ACCOUNT` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `PID` varchar(128) COLLATE utf8_bin DEFAULT '0',
  `myname` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `USER_MSG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `USER_MSG_CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_MSG_SEND_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_MSG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1284 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_mgr_operate
-- ----------------------------
DROP TABLE IF EXISTS `user_mgr_operate`;
CREATE TABLE `user_mgr_operate` (
  `USER_OPERATE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  `USER_PROD_TYPE` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '1\r\n            2',
  `USER_PROD_ID` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_SERV_ID` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_SERV_IPAAS_ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `USER_PROD_PARAM` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `USER_PROD_BYNAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `USER_OPERATE_ACTION` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_OPERATE_DATE` timestamp NOT NULL,
  `USER_UPDATE_BEFORE` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `USER_UPDATE_AFTER` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `USER_OPERATE_RESULT` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`USER_OPERATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2423 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for user_prod_inst
-- ----------------------------
DROP TABLE IF EXISTS `user_prod_inst`;
CREATE TABLE `user_prod_inst` (
  `USER_SERV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `USER_SERV_TYPE` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '1\r\n            2',
  `USER_SERVICE_ID` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `USER_SERV_IPAAS_ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `USER_SERV_PARAM` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `USER_SERV_PARAM_ZH` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `USER_PROD_BYNAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `USER_SERV_STATE` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '0\r\n            1',
  `USER_SERV_OPEN_TIME` timestamp NOT NULL,
  `USER_SERV_BACK_PARAM` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `USER_SERV_CLOSE_TIME` timestamp NULL DEFAULT NULL,
  `USER_SERV_RUN_STATE` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '0\r\n            1',
  `USER_SERV_START_TIME` timestamp NULL DEFAULT NULL,
  `USER_SERV_STOP_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_SERV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10636 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for wf_tickets
-- ----------------------------
DROP TABLE IF EXISTS `wf_tickets`;
CREATE TABLE `wf_tickets` (
  `WF_TICKETS_ID` bigint(20) NOT NULL,
  `WF_ID` varchar(30) COLLATE utf8_bin NOT NULL,
  `WF_NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `TICKET_TYPE` varchar(2) COLLATE utf8_bin NOT NULL,
  `VAILD_FLAG` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`WF_TICKETS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
