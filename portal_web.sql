/*
Navicat MySQL Data Transfer

Source Server         : port_web
Source Server Version : 50624
Source Host           : 10.1.245.4:39316
Source Database       : portal_web

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-06-27 17:46:44
*/
use portal_web;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_center
-- ----------------------------
DROP TABLE IF EXISTS `auth_center`;
CREATE TABLE `auth_center` (
  `AUTH_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUTH_PASSWORD` varchar(48) COLLATE utf8_bin NOT NULL,
  `AUTH_SOURCE` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `AUTH_USER_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AUTH_USER_NAME` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `AUTH_PARAM` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `AUTH_STATE` varchar(2) COLLATE utf8_bin NOT NULL,
  `AUTH_REGISTER_TIME` timestamp NOT NULL,
  `AUTH_ACTIVE_TIME` timestamp NULL DEFAULT NULL,
  `AUTH_CANCEL_TIME` timestamp NULL DEFAULT NULL,
  `AUTH_PID` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`AUTH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for auth_history
-- ----------------------------
DROP TABLE IF EXISTS `auth_history`;
CREATE TABLE `auth_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_pid` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `auth_serviceid` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `auth_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116755 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `PARENT_ROLE_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  `INVALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `INVALID_DATE` timestamp NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for auth_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_rel`;
CREATE TABLE `auth_role_rel` (
  `ROLE_ID` int(11) NOT NULL,
  `INST_TYPE` varchar(2) COLLATE utf8_bin NOT NULL,
  `TYPE_IINST_ID` int(11) NOT NULL,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  `INVALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `INVALID_DATE` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for auth_role_staff
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_staff`;
CREATE TABLE `auth_role_staff` (
  `AUTH_ROLE_STAFF_ID` bigint(20) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `USER_ID` varchar(128) COLLATE utf8_bin NOT NULL,
  `STAFF_ACCOUNT` varchar(30) COLLATE utf8_bin NOT NULL,
  `STAFF_EXT_FLAG` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `STAFF_PWD` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'OA',
  `INVALID_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `INVALID_DATE` timestamp NOT NULL,
  PRIMARY KEY (`AUTH_ROLE_STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
