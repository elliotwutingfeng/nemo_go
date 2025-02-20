/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : nemo

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 30/05/2022 11:28:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `org_id` int(10) unsigned DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_domain_domain` (`domain`) USING BTREE,
  KEY `fk_domain_org_id` (`org_id`),
  CONSTRAINT `fk_domain_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for domain_attr
-- ----------------------------
DROP TABLE IF EXISTS `domain_attr`;
CREATE TABLE `domain_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `source` varchar(40) DEFAULT NULL,
  `tag` varchar(40) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_domain_attr_hash` (`hash`) USING BTREE,
  KEY `index_domain_attr_ip_id` (`r_id`),
  CONSTRAINT `domain_attr_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `domain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for domain_color_tag
-- ----------------------------
DROP TABLE IF EXISTS `domain_color_tag`;
CREATE TABLE `domain_color_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `color` char(20) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_domain_color_tag_rid_unique` (`r_id`),
  KEY `fk_domain_color_tag_rid` (`r_id`) USING BTREE,
  CONSTRAINT `fk_domain_color_tag_rid` FOREIGN KEY (`r_id`) REFERENCES `domain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for domain_memo
-- ----------------------------
DROP TABLE IF EXISTS `domain_memo`;
CREATE TABLE `domain_memo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_domain_memo_rid_unique` (`r_id`),
  CONSTRAINT `fk_domain_memo_rid` FOREIGN KEY (`r_id`) REFERENCES `domain` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ip
-- ----------------------------
DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(128) NOT NULL,
  `ip_int` bigint(20) NOT NULL,
  `org_id` int(10) unsigned DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ip_ip` (`ip`) USING BTREE,
  UNIQUE KEY `index_ip_ip_int` (`ip_int`) USING BTREE,
  KEY `index_ip_org_id` (`org_id`),
  CONSTRAINT `fk_ip_org_id` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106525 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ip_attr
-- ----------------------------
DROP TABLE IF EXISTS `ip_attr`;
CREATE TABLE `ip_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `source` varchar(40) DEFAULT NULL,
  `tag` varchar(40) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ip_attr_hash` (`hash`) USING BTREE,
  KEY `index_ip_attr_ip_id` (`r_id`),
  CONSTRAINT `fk_ip_attr_ip_id` FOREIGN KEY (`r_id`) REFERENCES `ip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ip_color_tag
-- ----------------------------
DROP TABLE IF EXISTS `ip_color_tag`;
CREATE TABLE `ip_color_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `color` char(20) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ip_color_tag_rid_unique` (`r_id`),
  KEY `fk_ip_color_tag_rid` (`r_id`),
  CONSTRAINT `ip_color_tag_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `ip` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ip_memo
-- ----------------------------
DROP TABLE IF EXISTS `ip_memo`;
CREATE TABLE `ip_memo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ip_memo_rid_unqie` (`r_id`),
  CONSTRAINT `fk_ip_memo_rid` FOREIGN KEY (`r_id`) REFERENCES `ip` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_name` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '100',
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for port
-- ----------------------------
DROP TABLE IF EXISTS `port`;
CREATE TABLE `port` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_id` int(10) unsigned NOT NULL,
  `port` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_port_ip_port` (`ip_id`,`port`),
  CONSTRAINT `fk_port_ip` FOREIGN KEY (`ip_id`) REFERENCES `ip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=531997 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for port_attr
-- ----------------------------
DROP TABLE IF EXISTS `port_attr`;
CREATE TABLE `port_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `r_id` int(10) unsigned NOT NULL,
  `source` varchar(40) DEFAULT NULL,
  `tag` varchar(40) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_port_attr_hash` (`hash`),
  KEY `fk_port_attr_r_id` (`r_id`),
  CONSTRAINT `fk_port_attr_r_id` FOREIGN KEY (`r_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=669820 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` char(36) NOT NULL,
  `task_name` varchar(100) NOT NULL,
  `args` varchar(2000) DEFAULT NULL,
  `kwargs` varchar(8000) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `state` varchar(40) NOT NULL,
  `result` varchar(4000) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `retried` datetime DEFAULT NULL,
  `revoked` datetime DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `succeeded` datetime DEFAULT NULL,
  `failed` datetime DEFAULT NULL,
  `progress_message` varchar(100) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `cron_id` char(36) DEFAULT NULL COMMENT 'the id for cron task',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_cron
-- ----------------------------
DROP TABLE IF EXISTS `task_cron`;
CREATE TABLE `task_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` char(36) NOT NULL,
  `task_name` varchar(100) NOT NULL,
  `args` varchar(2000) DEFAULT NULL,
  `kwargs` varchar(8000) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `cron_rule` varchar(200) NOT NULL COMMENT '定时规则',
  `lastrun_datetime` datetime DEFAULT NULL COMMENT '上次运行时间',
  `status` varchar(10) NOT NULL COMMENT '状态enable or disable',
  `run_count` int(10) DEFAULT NULL COMMENT '启动次数',
  `comment` varchar(200) DEFAULT NULL COMMENT '定时任务说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vulnerability
-- ----------------------------
DROP TABLE IF EXISTS `vulnerability`;
CREATE TABLE `vulnerability` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `poc_file` varchar(200) NOT NULL,
  `source` varchar(40) NOT NULL,
  `extra` varchar(8000) DEFAULT NULL,
  `hash` char(32) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
