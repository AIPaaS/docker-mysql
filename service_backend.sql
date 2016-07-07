/*
Navicat MySQL Data Transfer

Source Server         : slp
Source Server Version : 50624
Source Host           : 10.1.245.4:39316
Source Database       : service_backend

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-06-27 17:42:11
*/
use service_backend;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ats_inst
-- ----------------------------
DROP TABLE IF EXISTS `ats_inst`;
CREATE TABLE `ats_inst` (
  `ats_inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `ats_resource_id` int(11) NOT NULL,
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `service_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `zk_producer_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_producer_node` varchar(10000) COLLATE utf8_bin NOT NULL,
  `zk_consumer_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_consumer_node` varchar(10000) COLLATE utf8_bin NOT NULL,
  `zk_topic_path` varchar(200) COLLATE utf8_bin NOT NULL,
  `kafka_create_command` varchar(1000) COLLATE utf8_bin NOT NULL,
  `inst_state` int(11) NOT NULL,
  `inst_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ats_inst_id`),
  KEY `fk_ats_inst_ats_resource_pool1_idx` (`ats_resource_id`),
  CONSTRAINT `fk_ats_inst_ats_resource_pool1` FOREIGN KEY (`ats_resource_id`) REFERENCES `ats_resource_pool` (`ats_resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ats_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `ats_resource_pool`;
CREATE TABLE `ats_resource_pool` (
  `ats_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `txs_resource_id` int(11) NOT NULL,
  `zk_producer_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_producer_node` varchar(10000) COLLATE utf8_bin NOT NULL,
  `zk_consumer_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_consumer_node` varchar(10000) COLLATE utf8_bin NOT NULL,
  `zk_topic_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `kafka_create_command` varchar(1000) COLLATE utf8_bin NOT NULL,
  `resource_state` int(11) NOT NULL,
  `resource_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ats_resource_id`),
  KEY `fk_ats_resource_pool_txs_resource_pool1_idx` (`txs_resource_id`),
  CONSTRAINT `fk_ats_resource_pool_txs_resource_pool1` FOREIGN KEY (`txs_resource_id`) REFERENCES `txs_resource_pool` (`txs_resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ccs_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `ccs_resource_pool`;
CREATE TABLE `ccs_resource_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zk_address` varchar(256) COLLATE utf8_bin NOT NULL COMMENT 'zk ip',
  `zk_type_code` int(1) NOT NULL COMMENT 'zk1paas2-paas',
  `zk_description` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `super_auth_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `super_auth_password` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ccs_service_user_config
-- ----------------------------
DROP TABLE IF EXISTS `ccs_service_user_config`;
CREATE TABLE `ccs_service_user_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `zk_user_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `zk_password` varchar(32) COLLATE utf8_bin NOT NULL,
  `zk_address` varchar(256) COLLATE utf8_bin NOT NULL,
  `service_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `ccs_resource_id` int(11) NOT NULL,
  `service_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ccs_user_config
-- ----------------------------
DROP TABLE IF EXISTS `ccs_user_config`;
CREATE TABLE `ccs_user_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `zk_user_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `zk_password` varchar(64) COLLATE utf8_bin NOT NULL,
  `zk_address` varchar(256) COLLATE utf8_bin NOT NULL,
  `update_time` date DEFAULT NULL,
  `ccs_resource_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_config_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dbr_replicator_manager_info
-- ----------------------------
DROP TABLE IF EXISTS `dbr_replicator_manager_info`;
CREATE TABLE `dbr_replicator_manager_info` (
  `replicator_manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `node_num` int(11) DEFAULT '0',
  `manager_address` varchar(200) COLLATE utf8_bin NOT NULL,
  `manager_zk` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`replicator_manager_id`),
  UNIQUE KEY `manager_address` (`manager_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dbr_replicator_node_info
-- ----------------------------
DROP TABLE IF EXISTS `dbr_replicator_node_info`;
CREATE TABLE `dbr_replicator_node_info` (
  `replicator_node_id` int(11) NOT NULL,
  `manager_address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `res_instance` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `node_ip` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `node_port` int(11) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0--1--',
  PRIMARY KEY (`replicator_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dbs_logic_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `dbs_logic_resource_pool`;
CREATE TABLE `dbs_logic_resource_pool` (
  `logic_id` int(11) NOT NULL,
  `logic_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `res_use_type` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '10 --- \r\n            11 --- ',
  `used_id` int(11) NOT NULL,
  PRIMARY KEY (`logic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dbs_mui_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `dbs_mui_resource_pool`;
CREATE TABLE `dbs_mui_resource_pool` (
  `mui_id` int(11) NOT NULL,
  `mui_url` varchar(200) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`mui_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dbs_mui_user_service
-- ----------------------------
DROP TABLE IF EXISTS `dbs_mui_user_service`;
CREATE TABLE `dbs_mui_user_service` (
  `service_id` int(11) NOT NULL,
  `mui_id` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dbs_physical_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `dbs_physical_resource_pool`;
CREATE TABLE `dbs_physical_resource_pool` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_host` varchar(20) COLLATE utf8_bin NOT NULL,
  `res_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `res_port` int(11) NOT NULL,
  `res_instance` varchar(100) COLLATE utf8_bin NOT NULL,
  `res_user` varchar(50) COLLATE utf8_bin NOT NULL,
  `res_password` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_used` char(1) COLLATE utf8_bin NOT NULL COMMENT '0  --- \r\n            1  --- ',
  `res_status` char(2) COLLATE utf8_bin NOT NULL COMMENT '10 ---  ',
  `create_time` datetime DEFAULT NULL,
  `used_time` datetime DEFAULT NULL,
  `create_author` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `last_modify_author` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ms_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1 --- \r\n            0 ---- \r\n            ',
  `res_use_type` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '10 --- \r\n            11 --- ',
  `logic_id` int(11) DEFAULT NULL,
  `res_super_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `res_super_password` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `conf_addr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `agent_port` int(11) DEFAULT NULL,
  `user_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dbs_user_service
-- ----------------------------
DROP TABLE IF EXISTS `dbs_user_service`;
CREATE TABLE `dbs_user_service` (
  `used_id` int(11) NOT NULL,
  `user_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `user_service_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_txs` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `seq_db_id` int(11) DEFAULT NULL,
  `is_mysql_proxy` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `is_autoswitch` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`used_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for des_service_bind
-- ----------------------------
DROP TABLE IF EXISTS `des_service_bind`;
CREATE TABLE `des_service_bind` (
  `service_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `dbs_service_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `dbs_service_password` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `mds_service_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mds_service_password` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `mds_topic` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mds_partition` int(11) DEFAULT NULL,
  `user_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for des_service_bind_table
-- ----------------------------
DROP TABLE IF EXISTS `des_service_bind_table`;
CREATE TABLE `des_service_bind_table` (
  `service_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `table_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(128) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for des_user_service
-- ----------------------------
DROP TABLE IF EXISTS `des_user_service`;
CREATE TABLE `des_user_service` (
  `srv_apply_id` int(11) DEFAULT NULL,
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `state` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dss_mcs_info
-- ----------------------------
DROP TABLE IF EXISTS `dss_mcs_info`;
CREATE TABLE `dss_mcs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mcs_address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dss_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `dss_resource_pool`;
CREATE TABLE `dss_resource_pool` (
  `host_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `left_size` int(32) DEFAULT NULL,
  PRIMARY KEY (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dss_user_instance
-- ----------------------------
DROP TABLE IF EXISTS `dss_user_instance`;
CREATE TABLE `dss_user_instance` (
  `oss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `db_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `collection_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `oss_size` double DEFAULT NULL,
  `file_limit_size` double(15,3) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `redis_id` int(11) DEFAULT NULL,
  `service_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for idps_balance_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `idps_balance_resource_pool`;
CREATE TABLE `idps_balance_resource_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `idps_balance_host_ip` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '图片服务负载均衡主机',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  `idps_balance_port` int(6) unsigned DEFAULT NULL COMMENT '已使用的端口，比如默认是18080',
  `min_port` int(6) unsigned DEFAULT NULL COMMENT '最小端口',
  `max_port` int(6) unsigned DEFAULT NULL COMMENT '最大端口号',
  `cycle` int(1) unsigned DEFAULT NULL COMMENT '1已经循环',
  `ssh_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSH用户',
  `ssh_password` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSH用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for idps_config_info
-- ----------------------------
DROP TABLE IF EXISTS `idps_config_info`;
CREATE TABLE `idps_config_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gm_mode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `gm_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `image_name_split` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `image_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `max_active` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `max_idle` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `max_wait` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `test_on_borrow` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `test_on_return` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `extent` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `quality` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `command_size` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `up_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `up_path_new` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for idps_instance_band_dss
-- ----------------------------
DROP TABLE IF EXISTS `idps_instance_band_dss`;
CREATE TABLE `idps_instance_band_dss` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户id，非空',
  `service_id` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT '图片服务ID',
  `dss_service_id` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT 'dss服务ID',
  `dss_pid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'dss pid，非空',
  `dss_service_pwd` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'dss service pwd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for idps_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `idps_resource_pool`;
CREATE TABLE `idps_resource_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `idps_host_ip` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '图片服务主机',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  `idps_port` int(6) unsigned DEFAULT NULL COMMENT '已使用的端口，比如默认是8080',
  `min_port` int(6) unsigned DEFAULT NULL COMMENT '最小端口',
  `max_port` int(6) unsigned DEFAULT NULL COMMENT '最大端口号',
  `cycle` int(1) unsigned DEFAULT NULL COMMENT '1已经循环',
  `ssh_user` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ssh_password` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for idps_user_instance
-- ----------------------------
DROP TABLE IF EXISTS `idps_user_instance`;
CREATE TABLE `idps_user_instance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户id，非空',
  `idps_host_ip` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT '图片服务主机',
  `idps_host_port` int(6) DEFAULT NULL COMMENT '图片服务端口',
  `service_id` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT '图片服务ID',
  `service_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态',
  `begin_time` datetime DEFAULT NULL COMMENT '生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `type` int(1) DEFAULT NULL COMMENT '1 gm_tomcat  2 balance',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ipaas_image_resource
-- ----------------------------
DROP TABLE IF EXISTS `ipaas_image_resource`;
CREATE TABLE `ipaas_image_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `service_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '服务编码',
  `image_repository` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '镜像仓库',
  `image_code` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '镜像编码',
  `image_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '镜像名称',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ipaas_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `ipaas_sys_config`;
CREATE TABLE `ipaas_sys_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `table_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '第一级业务编码',
  `field_code` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT '第二级业务编码',
  `field_value` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'value',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mcs_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `mcs_resource_pool`;
CREATE TABLE `mcs_resource_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cache_host_ip` varchar(24) COLLATE utf8_bin NOT NULL,
  `cache_memory` int(6) unsigned DEFAULT NULL COMMENT ' M',
  `cache_memory_used` int(6) unsigned DEFAULT NULL COMMENT ' M',
  `status` int(1) unsigned DEFAULT NULL COMMENT ' 1',
  `cache_port` int(6) unsigned DEFAULT NULL COMMENT '6378',
  `min_port` int(6) unsigned DEFAULT NULL,
  `max_port` int(6) unsigned DEFAULT NULL,
  `cycle` int(1) unsigned DEFAULT NULL COMMENT '1',
  `agent_cmd` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'agent',
  `agent_file` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'agent',
  `cache_path` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'mcs',
  `host_user_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '虚机用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mcs_user_cache_instance
-- ----------------------------
DROP TABLE IF EXISTS `mcs_user_cache_instance`;
CREATE TABLE `mcs_user_cache_instance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `cache_host` varchar(24) COLLATE utf8_bin DEFAULT NULL,
  `cache_memory` int(6) unsigned DEFAULT NULL COMMENT 'M',
  `status` int(1) unsigned DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `serial_number` varchar(128) COLLATE utf8_bin NOT NULL,
  `cache_port` int(6) unsigned DEFAULT NULL,
  `pwd` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `service_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mds_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `mds_resource_pool`;
CREATE TABLE `mds_resource_pool` (
  `cluster_id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(255) DEFAULT NULL,
  `zk_address` varchar(512) DEFAULT NULL,
  `kafka_address` varchar(512) DEFAULT NULL COMMENT 'IP:PORT,IP:PORT',
  `cluster_state` int(11) DEFAULT NULL COMMENT ' 1 0',
  `remark` varchar(255) DEFAULT NULL,
  `zk_auth_user` varchar(64) DEFAULT NULL COMMENT 'zk auth user',
  `zk_auth_passwd` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cluster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mds_user_service
-- ----------------------------
DROP TABLE IF EXISTS `mds_user_service`;
CREATE TABLE `mds_user_service` (
  `srv_inst_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `user_srv_id` varchar(128) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '1' COMMENT ': 1  0 ',
  `operator_id` varchar(128) DEFAULT NULL COMMENT 'id',
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`srv_inst_id`,`user_id`,`user_srv_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mds_user_topic
-- ----------------------------
DROP TABLE IF EXISTS `mds_user_topic`;
CREATE TABLE `mds_user_topic` (
  `srv_inst_id` int(11) NOT NULL,
  `topic_inst_id` int(11) NOT NULL,
  `topic_display_name` varchar(128) DEFAULT NULL,
  `topic_en_name` varchar(128) NOT NULL COMMENT '(',
  `user_id` varchar(64) DEFAULT NULL,
  `user_srv_id` varchar(128) DEFAULT NULL,
  `mds_cluster_id` int(11) DEFAULT NULL,
  `producer_config_path` varchar(255) DEFAULT NULL,
  `producer_config` varchar(1024) DEFAULT NULL COMMENT '()',
  `consumer_config_path` varchar(255) DEFAULT NULL,
  `consumer_config` varchar(1024) DEFAULT NULL COMMENT '()',
  `topic_partitions` int(3) NOT NULL,
  `msg_replicas` int(1) DEFAULT NULL,
  `reamrk` varchar(255) DEFAULT NULL,
  `state` int(1) DEFAULT '1' COMMENT ': 1  0 ',
  `operator_id` varchar(128) DEFAULT NULL COMMENT 'id',
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`topic_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rcs_bolt_info
-- ----------------------------
DROP TABLE IF EXISTS `rcs_bolt_info`;
CREATE TABLE `rcs_bolt_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NOT NULL COMMENT 'task',
  `bolt_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'bolt',
  `bolt_class_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'bolt',
  `threads` int(11) NOT NULL,
  `grouping_types` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'grouping',
  `grouping_spout_or_blots` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'grouping',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rcs_cluster_info
-- ----------------------------
DROP TABLE IF EXISTS `rcs_cluster_info`;
CREATE TABLE `rcs_cluster_info` (
  `ID` float NOT NULL,
  `Cluster_ID` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Cluster_Type` int(11) DEFAULT NULL,
  `nimbus_ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nimbus_port` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `ui_port` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Service_Id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Server_count` int(11) DEFAULT NULL,
  `bandwidth` float DEFAULT NULL,
  `password` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `comments` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `Host_CPU` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `HOST_memory` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `HOST_disk` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `Order_status` int(11) DEFAULT NULL,
  `Order_user` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `Zk_IP` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `Zk_port` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rcs_spout_info
-- ----------------------------
DROP TABLE IF EXISTS `rcs_spout_info`;
CREATE TABLE `rcs_spout_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NOT NULL COMMENT 'task',
  `spout_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'spout',
  `spout_class_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'spout',
  `threads` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rcs_task_info
-- ----------------------------
DROP TABLE IF EXISTS `rcs_task_info`;
CREATE TABLE `rcs_task_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `cluster_id` bigint(20) NOT NULL COMMENT 'ID',
  `register_dt` datetime NOT NULL,
  `cancel_dt` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_bin NOT NULL,
  `comments` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `num_workers` int(11) NOT NULL COMMENT 'work',
  `jarFilePath` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'jar',
  `register_user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_ansible_do_shell_log
-- ----------------------------
DROP TABLE IF EXISTS `rmc_ansible_do_shell_log`;
CREATE TABLE `rmc_ansible_do_shell_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `info` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_ansible_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_ansible_info`;
CREATE TABLE `rmc_ansible_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ansible_type` varchar(45) COLLATE utf8_bin NOT NULL,
  `ansible_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ansible_uil` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ansible_param` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ansible_param_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ansible_desc` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_application_deploy_setup
-- ----------------------------
DROP TABLE IF EXISTS `rmc_application_deploy_setup`;
CREATE TABLE `rmc_application_deploy_setup` (
  `setup_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `task_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `ip` varchar(32) COLLATE utf8_bin NOT NULL,
  `ser_usr` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ser_pwd` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ser_log_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `package_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '应用包的名称',
  `package_path` varchar(128) COLLATE utf8_bin NOT NULL,
  `deploy_path` varchar(128) COLLATE utf8_bin NOT NULL,
  `command` varchar(128) COLLATE utf8_bin NOT NULL,
  `sort_id` int(11) NOT NULL,
  `setup_status` int(11) NOT NULL COMMENT '0-未处理（默认），1-处理成功，2-处理失败。',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录应用发布任务，所对应的具体操作信息';

-- ----------------------------
-- Table structure for rmc_application_deploy_task
-- ----------------------------
DROP TABLE IF EXISTS `rmc_application_deploy_task`;
CREATE TABLE `rmc_application_deploy_task` (
  `task_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '某类资源管理操作的唯一标识，对于需要SWI/SWC类任务，需要按具体基础软件进行任务拆分。',
  `task_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `task_desc` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT 'VMI-虚机导入类任务；VMC-虚机创建类任务；SWI-软件安装类任务；SWT-软件验证类任务；APD：应用包发布类任务。',
  `task_status` int(11) NOT NULL COMMENT '0-未执行（默认），1-执行成功，2-执行失败。',
  `create_person` varchar(128) COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录应用发布任务信息';

-- ----------------------------
-- Table structure for rmc_auth_log
-- ----------------------------
DROP TABLE IF EXISTS `rmc_auth_log`;
CREATE TABLE `rmc_auth_log` (
  `auth_seq` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `req_json` varchar(512) COLLATE utf8_bin NOT NULL,
  `rsp_json` varchar(512) COLLATE utf8_bin NOT NULL,
  `auth_req_time` datetime NOT NULL,
  `auth_rsp_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录资源中心登录鉴权的来往流水信息';

-- ----------------------------
-- Table structure for rmc_install_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_install_info`;
CREATE TABLE `rmc_install_info` (
  `install_seq` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '从1开始',
  `task_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '安装某个基础软件全过程的唯一标识',
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS、MCS、DBS等分类，用于关联需要的基础软件。',
  `service_version` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `vm_ip` varchar(32) COLLATE utf8_bin NOT NULL,
  `vm_path` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '软件在虚拟机上的安装路径',
  `software_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '如：zookeeper、redis、kafka',
  `software_version` varchar(32) COLLATE utf8_bin NOT NULL,
  `install_setup` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '1～10步等',
  `rest_url` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `install_command` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '从安装模版中获取的安装命令，软件安装模版中所定义的步骤，基本步骤如：ftp、tar、config、make、test等。',
  `install_status` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '安装执行状态，00-未执行，01-执行成功，02-执行失败。',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `operator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`install_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='基础软件安装的操作信息，包括所安装的虚拟机信息、软件信息、安装时间、安装情况，是否验证通过等。';

-- ----------------------------
-- Table structure for rmc_install_package_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_install_package_info`;
CREATE TABLE `rmc_install_package_info` (
  `package_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '从1开始',
  `software_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'redis,mongodb等',
  `software_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '如：zookeeper、redis、kafka',
  `software_version` varchar(64) COLLATE utf8_bin NOT NULL,
  `package_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `package_size` int(11) NOT NULL COMMENT '单位M',
  `package_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'tar、zip、bin等',
  `package_path` varchar(256) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1：可用（默认），0：不可用。',
  `package_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='基础软件安装包信息，包括软件名称、版本、大小、格式、描述信息等';

-- ----------------------------
-- Table structure for rmc_log_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_log_info`;
CREATE TABLE `rmc_log_info` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(24) COLLATE utf8_bin NOT NULL,
  `log_info` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_order_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_order_info`;
CREATE TABLE `rmc_order_info` (
  `order_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '1.虚机导入类任务，没有服务开通申请单号，改字段值为0;\n            2.源于服务开通申请的资源管理任务，填写服务开通申请单号。',
  `order_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '01-虚机创建类工单；02-虚机复用类工单；03-服务复用类工单。',
  `service_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS，MCS，DBS等',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '对于虚机导入操作，如果资源未分配，则租户ID为空。',
  `project_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '对于虚机导入操作，如果资源未分配，则项目ID为空。',
  `create_time` datetime NOT NULL,
  `operator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `service_para` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '服务开通时的参数',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-待处理（默认），1-申请创建虚机，2-复用虚机，3-任务处理中，4-资源初始化完成，5-工单处理完成，6-工单注销。',
  `report_status` int(1) DEFAULT NULL COMMENT '0-没有通知处理结果， 1-已经通知给门户',
  `result_code` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '000000 - 成功，999999 - 失败',
  `result_msg` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回处理结果信息',
  `finish_time` datetime DEFAULT NULL COMMENT '处理完订单时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资源管理的原始工单信息，拆单模块处理此表数据，同时产生资源管理的任务记录。\n1.服务开通申请所产生的工单记录';

-- ----------------------------
-- Table structure for rmc_order_result
-- ----------------------------
DROP TABLE IF EXISTS `rmc_order_result`;
CREATE TABLE `rmc_order_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `reslut_status` int(1) DEFAULT NULL,
  `reslut_code` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `result_msg` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_order_rule
-- ----------------------------
DROP TABLE IF EXISTS `rmc_order_rule`;
CREATE TABLE `rmc_order_rule` (
  `rule_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '1.虚机导入类任务，没有服务开通申请单号，改字段值为0;\n            2.源于服务开通申请的资源管理任务，填写服务开通申请单号。',
  `rule_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '01-服务开通类工单的处理规则；02-运维人员自建类工单的处理规则。',
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS，MCS，DBS等',
  `rule_content` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '对于虚机导入操作，如果资源未分配，则租户ID为空。',
  `rule_status` int(11) DEFAULT NULL COMMENT '0-未生效；1-生效（默认）',
  `create_time` datetime NOT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='配置资源中心的工单处理规则信息，工单处理模块根据所配规则，进行工单处理.\n规则包括：\n1. 服务';

-- ----------------------------
-- Table structure for rmc_paramter_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_paramter_info`;
CREATE TABLE `rmc_paramter_info` (
  `seq` int(11) NOT NULL,
  `para_code` varchar(32) COLLATE utf8_bin NOT NULL,
  `para_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `para_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '参数分组类型',
  `para_value` varchar(128) COLLATE utf8_bin NOT NULL,
  `para_desc` varchar(256) COLLATE utf8_bin NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资源管理中心所用到的公共参数、常量等信息';

-- ----------------------------
-- Table structure for rmc_port_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_port_info`;
CREATE TABLE `rmc_port_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `port` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `max_port` int(6) DEFAULT NULL,
  `min_port` int(6) DEFAULT NULL,
  `user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `status` int(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `rmc_resource_pool`;
CREATE TABLE `rmc_resource_pool` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `service_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `res_ip` varchar(64) COLLATE utf8_bin NOT NULL,
  `port` int(6) DEFAULT NULL,
  `max_port` int(6) DEFAULT NULL,
  `min_port` int(6) DEFAULT NULL,
  `admin_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `admin_passwd` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `zk_address` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `zk_path` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `agent_path` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `agent_cmd` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `agent_file` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `memory` int(6) DEFAULT NULL,
  `memory_used` int(6) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `bin_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cycle` int(1) DEFAULT NULL,
  `user_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `left_size` int(32) DEFAULT NULL,
  `zk_node` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `zk_producer_path` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `zk_producer_node` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `zk_consumer_path` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `zk_consumer_node` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `zk_topic_path` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `kafka_create_command` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_service_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_service_info`;
CREATE TABLE `rmc_service_info` (
  `service_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `service_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `service_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `res_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `res_ip` varchar(64) COLLATE utf8_bin NOT NULL,
  `service_port` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `service_instance` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `service_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `service_passwd` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `service_status` int(11) NOT NULL,
  `service_desc` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_operator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `used_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_operator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`service_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_sftp_server_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_sftp_server_info`;
CREATE TABLE `rmc_sftp_server_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) COLLATE utf8_bin NOT NULL,
  `port` varchar(16) COLLATE utf8_bin NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(64) COLLATE utf8_bin NOT NULL,
  `path` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '文档路径',
  `status` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '“1”有效\n“2”无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_software_config
-- ----------------------------
DROP TABLE IF EXISTS `rmc_software_config`;
CREATE TABLE `rmc_software_config` (
  `config_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS、MCS、DBS、TXS、ATS、CCS、RCS',
  `software_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'zookeeper、redis、mysql、storm、kafka等',
  `software_version` varchar(32) COLLATE utf8_bin NOT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='配置iPaaS服务需要安装的基础软件信息，每类服务可以配置多个基础软件。';

-- ----------------------------
-- Table structure for rmc_software_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_software_info`;
CREATE TABLE `rmc_software_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `service_type` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '安装某个基础软件全过程的唯一标识',
  `vm_ip` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `software_port` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '1～10步等',
  `software_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '如：zookeeper、redis、kafka',
  `software_version` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `software_path` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `operator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_software_template_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_software_template_info`;
CREATE TABLE `rmc_software_template_info` (
  `relation_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `software_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `software_version` varchar(32) COLLATE utf8_bin NOT NULL,
  `task_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'SWI-软件安装类任务；SWT-软件验证类任务；APD：应用包发布类任务。',
  `template_id` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录基础软件安装、验证过程中，所需要的模版。';

-- ----------------------------
-- Table structure for rmc_task_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_task_info`;
CREATE TABLE `rmc_task_info` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '某类资源管理操作的唯一标识，对于需要SWI/SWC类任务，需要按具体基础软件进行任务拆分。',
  `task_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `task_type` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'VMI-虚机导入类任务；VMC-虚机创建类任务；SWI-软件安装类任务；SWT-软件验证类任务；APD：应用包发布类任务。',
  `order_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '1.虚机导入类任务，没有服务开通申请单号，改字段值为0;\n            2.源于服务开通申请的资源管理任务，填写服务开通申请单号。',
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS，MCS，DBS等',
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '对于虚机导入操作，如果资源未分配，则租户ID为空。',
  `project_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '对于虚机导入操作，如果资源未分配，则项目ID为空。',
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `task_sort` int(11) NOT NULL COMMENT '0-优先级最高，1-优先级次之，以此类推。',
  `task_status` int(11) NOT NULL COMMENT '0-任务未完成，50-用户创建完成，51-软件安装步骤生成完成，52-软件安装执行完成，53-资源池初始化完成，1-任务已完成。',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='1. 服务开通类的订单数据，拆单模块产生任务原数据，分别产生多个虚机管理的任务，多个服务软件安装/验证的任务。（按需要的';

-- ----------------------------
-- Table structure for rmc_template_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_template_info`;
CREATE TABLE `rmc_template_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_type` varchar(32) COLLATE utf8_bin NOT NULL,
  `template_status` int(11) NOT NULL,
  `execute_sort` int(11) NOT NULL,
  `command_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `describle` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_template_install_cmd
-- ----------------------------
DROP TABLE IF EXISTS `rmc_template_install_cmd`;
CREATE TABLE `rmc_template_install_cmd` (
  `command_id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'ftp、tar、zip、cd、rm、config、ps、netstat、kill、mv等',
  `command_para` varchar(128) COLLATE utf8_bin NOT NULL,
  `command_value` varchar(512) COLLATE utf8_bin NOT NULL,
  `command_desc` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='基础软件安装及验证的模版中，所需要执行的命令信息表，如ftp、tar、zip、cd、rm、config、ps、netst';

-- ----------------------------
-- Table structure for rmc_vm_create_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_vm_create_info`;
CREATE TABLE `rmc_vm_create_info` (
  `opr_seq` varchar(64) COLLATE utf8_bin NOT NULL,
  `task_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '虚机创建为多步操作，各步骤任务号相同。',
  `service_type` varchar(4) COLLATE utf8_bin NOT NULL,
  `opr_content` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '虚机创建：记录所调用的IAAS层接口信息。',
  `opr_status` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '00:处理中；01:处理成功；02:处理失败；',
  `create_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_bin NOT NULL,
  `order_id` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`opr_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚拟机创建的业务处理信息表';

-- ----------------------------
-- Table structure for rmc_vm_import_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_vm_import_info`;
CREATE TABLE `rmc_vm_import_info` (
  `opr_seq` varchar(64) COLLATE utf8_bin NOT NULL,
  `task_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '某类资源管理操作的唯一标识',
  `service_type` varchar(4) COLLATE utf8_bin NOT NULL,
  `opr_content` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '虚机导入时，记录所操作的excel文件。',
  `opr_status` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '00:处理中；01:处理成功；02:处理失败；',
  `create_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`opr_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚拟机导入的业务处理信息表';

-- ----------------------------
-- Table structure for rmc_vm_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_vm_info`;
CREATE TABLE `rmc_vm_info` (
  `id` int(11) NOT NULL,
  `vm_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `vm_status` int(11) NOT NULL COMMENT '0-未分配，1-已分配',
  `vm_ip` varchar(64) COLLATE utf8_bin NOT NULL,
  `vm_root` varchar(64) COLLATE utf8_bin NOT NULL,
  `vm_passwd` varchar(64) COLLATE utf8_bin NOT NULL,
  `vm_cpu` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `vm_memory` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `vm_storage` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `vm_model` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'IMPORT：导入方式，CREATE：创建方式。',
  `create_time` datetime NOT NULL,
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '如果资源已分配，租户ID非空',
  `res_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机资源的唯一标识',
  `note` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚机的信息总表，记录虚机的基本信息（IP、用户、口令）、虚机的分配情况。';

-- ----------------------------
-- Table structure for rmc_vm_param
-- ----------------------------
DROP TABLE IF EXISTS `rmc_vm_param`;
CREATE TABLE `rmc_vm_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `core_num` int(2) DEFAULT NULL,
  `memory` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `store` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `vm_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for rmc_vm_user_info
-- ----------------------------
DROP TABLE IF EXISTS `rmc_vm_user_info`;
CREATE TABLE `rmc_vm_user_info` (
  `ip` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '虚拟机的IP',
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '0',
  `home_path` varchar(128) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1-生效（默认）；0-失效。',
  `create_time` datetime NOT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建用户时关联的工单号',
  `service_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'MDS，MCS，DBS等',
  `service_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `serial_num` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ip`,`user`,`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `table_name` varchar(100) NOT NULL,
  `sequence_name` varchar(100) NOT NULL,
  `max_value` int(11) DEFAULT NULL,
  `min_value` int(11) DEFAULT NULL,
  `start_value` int(11) DEFAULT NULL,
  `increament_value` int(11) DEFAULT NULL,
  `cache_size` int(11) DEFAULT NULL,
  `cycle_flag` char(1) DEFAULT NULL COMMENT 'N ---         \r\n            Y ---   ',
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ses_dataimport_ds
-- ----------------------------
DROP TABLE IF EXISTS `ses_dataimport_ds`;
CREATE TABLE `ses_dataimport_ds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `du_id` int(11) NOT NULL COMMENT 'ses_dataimport_user.id，非空',
  `alias` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '数据源别名，非空',
  `type` int(1) NOT NULL COMMENT '1 普通数据库，2 DBS',
  `info` varchar(768) COLLATE utf8_bin NOT NULL COMMENT '数据源信息，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  `group_id` int(1) DEFAULT NULL COMMENT '1 单库  2 多库  3 DBS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_dataimport_sql
-- ----------------------------
DROP TABLE IF EXISTS `ses_dataimport_sql`;
CREATE TABLE `ses_dataimport_sql` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `du_id` int(11) NOT NULL COMMENT 'ses_dataimport_user.id，非空',
  `ds_id` int(11) NOT NULL COMMENT 'ses_dataimport_ds.id，非空',
  `alias` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'sql别名，非空',
  `is_primary` int(1) NOT NULL COMMENT '1 主表，2 辅助表',
  `ds_alias` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '数据源别名，非空',
  `info` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT 'sql信息，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  `group_id` int(1) DEFAULT NULL COMMENT '1 单库  2 多库  3 DBS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_dataimport_user
-- ----------------------------
DROP TABLE IF EXISTS `ses_dataimport_user`;
CREATE TABLE `ses_dataimport_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户id，非空',
  `user_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `ses_sid` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'ses,service_id，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `ses_resource_pool`;
CREATE TABLE `ses_resource_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `host_ip` varchar(24) COLLATE utf8_bin NOT NULL COMMENT 'SES主机ip',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1主机生效中  2主机不可用',
  `port_min` int(6) NOT NULL,
  `port_max` int(6) NOT NULL,
  `mem_total` int(6) NOT NULL,
  `mem_used` int(6) NOT NULL,
  `agent_port` int(6) DEFAULT NULL,
  `bin_path` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'ses安装路径  例如:/aifs01/devusers/devrds01/elasticsearch-1.7.1',
  `user_path` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '用户数据存储路径  如：/aifs01/devusers/devrds01/ses-server',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_user_index_word
-- ----------------------------
DROP TABLE IF EXISTS `ses_user_index_word`;
CREATE TABLE `ses_user_index_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `word` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_user_instance
-- ----------------------------
DROP TABLE IF EXISTS `ses_user_instance`;
CREATE TABLE `ses_user_instance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户id，非空',
  `host_ip` varchar(24) COLLATE utf8_bin DEFAULT NULL COMMENT 'SES主机ip',
  `ses_port` int(6) unsigned DEFAULT NULL COMMENT '端口',
  `tcp_port` int(6) unsigned DEFAULT NULL,
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1是生效中  2 是已回收',
  `mem_use` int(6) DEFAULT NULL COMMENT '占用内存',
  `begin_time` datetime DEFAULT NULL COMMENT '生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `service_id` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户serviceid',
  `service_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_user_mapping
-- ----------------------------
DROP TABLE IF EXISTS `ses_user_mapping`;
CREATE TABLE `ses_user_mapping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `service_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `mapping` varchar(4096) COLLATE utf8_bin DEFAULT NULL,
  `index_display` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '索引描述',
  `pk` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '数据模型主键字段',
  `copy_to` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ses_user_stop_word
-- ----------------------------
DROP TABLE IF EXISTS `ses_user_stop_word`;
CREATE TABLE `ses_user_stop_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `word` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for testtable
-- ----------------------------
DROP TABLE IF EXISTS `testtable`;
CREATE TABLE `testtable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g` bit(1) DEFAULT NULL,
  `f` smallint(8) DEFAULT NULL,
  `e` tinyint(4) DEFAULT NULL,
  `d` blob,
  `c` float(5,3) DEFAULT NULL,
  `b` double(8,2) DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_m
-- ----------------------------
DROP TABLE IF EXISTS `test_m`;
CREATE TABLE `test_m` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `mm_id` int(12) NOT NULL COMMENT '用户id，非空',
  `menu_id` int(12) NOT NULL COMMENT '用户id，非空',
  `mm_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_menu
-- ----------------------------
DROP TABLE IF EXISTS `test_menu`;
CREATE TABLE `test_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `menu_id` int(12) NOT NULL COMMENT '用户id，非空',
  `menu_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_role
-- ----------------------------
DROP TABLE IF EXISTS `test_role`;
CREATE TABLE `test_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `role_id` int(12) NOT NULL COMMENT '用户id，非空',
  `role_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_role_2_menu
-- ----------------------------
DROP TABLE IF EXISTS `test_role_2_menu`;
CREATE TABLE `test_role_2_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `role_id` int(12) NOT NULL COMMENT '用户id，非空',
  `menu_id` int(12) NOT NULL COMMENT '云账号，非空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_user
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` int(12) NOT NULL COMMENT '用户id，非空',
  `user_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_user_2_role
-- ----------------------------
DROP TABLE IF EXISTS `test_user_2_role`;
CREATE TABLE `test_user_2_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` int(12) NOT NULL COMMENT '用户id，非空',
  `role_id` int(12) NOT NULL COMMENT '云账号，非空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_user_moudle
-- ----------------------------
DROP TABLE IF EXISTS `test_user_moudle`;
CREATE TABLE `test_user_moudle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` int(12) NOT NULL COMMENT '用户id，非空',
  `moudle_id` int(12) NOT NULL COMMENT '用户id，非空',
  `moudle_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for test_user_province
-- ----------------------------
DROP TABLE IF EXISTS `test_user_province`;
CREATE TABLE `test_user_province` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，非空，id',
  `user_id` int(12) NOT NULL COMMENT '用户id，非空',
  `province_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '云账号，非空',
  `status` int(1) unsigned DEFAULT NULL COMMENT '状态 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for txs_inst
-- ----------------------------
DROP TABLE IF EXISTS `txs_inst`;
CREATE TABLE `txs_inst` (
  `txs_inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `service_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `txs_resource_id` int(11) NOT NULL,
  `zk_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_node` varchar(5000) COLLATE utf8_bin NOT NULL,
  `inst_state` int(11) NOT NULL,
  `inst_state_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`txs_inst_id`),
  KEY `fk_txs_inst_txs_resource_pool_idx` (`txs_resource_id`),
  CONSTRAINT `fk_txs_inst_txs_resource_pool` FOREIGN KEY (`txs_resource_id`) REFERENCES `txs_resource_pool` (`txs_resource_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for txs_resource_pool
-- ----------------------------
DROP TABLE IF EXISTS `txs_resource_pool`;
CREATE TABLE `txs_resource_pool` (
  `txs_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `zk_path` varchar(45) COLLATE utf8_bin NOT NULL,
  `zk_node` varchar(10000) COLLATE utf8_bin NOT NULL,
  `resource_state` int(11) NOT NULL,
  `resource_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`txs_resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
