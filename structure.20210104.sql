/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `daemon` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `daemon`;

CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `functionid` int(11) DEFAULT NULL,
  `functioncd` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE,
  KEY `functioncd` (`functioncd`) USING BTREE,
  KEY `functionid` (`functionid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `source` varchar(1000) DEFAULT NULL,
  `start` bigint(20) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cd` (`cd`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `enforcement` varchar(255) DEFAULT NULL,
  `source` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `textplural` varchar(1000) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `controltypeid` int(11) DEFAULT NULL,
  `source` varchar(5000) DEFAULT NULL,
  `properties` varchar(1000) DEFAULT NULL,
  `html` varchar(1000) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT uuid(),
  `iuser` int(11) DEFAULT 0,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `sort` varchar(500) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  `controltypeid_old` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uuid` (`uuid`),
  KEY `sort` (`sort`),
  KEY `parentid` (`parentid`),
  KEY `controlsetid` (`requestid`) USING BTREE,
  KEY `controltypeid` (`controltypeid`) USING BTREE,
  KEY `controltypeid_old` (`controltypeid_old`)
) ENGINE=InnoDB AUTO_INCREMENT=11035 DEFAULT CHARSET=utf8;

CREATE TABLE `controltype` (
	`id` INT(11) NOT NULL,
	`parent` VARCHAR(1000) NULL COLLATE 'utf8_general_ci',
	`cd` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`position` INT(11) NULL,
	`#` TEXT NULL COLLATE 'utf8_general_ci',
	`source` VARCHAR(5000) NULL COLLATE 'utf8_general_ci',
	`properties` VARCHAR(1000) NULL COLLATE 'utf8_general_ci',
	`html` VARCHAR(1000) NULL COLLATE 'utf8_general_ci',
	`label` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`style` VARCHAR(1000) NULL COLLATE 'utf8_general_ci',
	`controlgroop` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`datelind` TEXT NULL COLLATE 'utf8_general_ci',
	`textcontent` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`access` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`itemtype` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`iuser` INT(11) NULL,
	`uuser` INT(11) NULL,
	`idate` BIGINT(20) NULL,
	`udate` BIGINT(20) NULL,
	`uuid` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`sort` VARCHAR(500) NULL COLLATE 'utf8_general_ci',
	`parentcd` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`pathid` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`rewriteidx` INT(11) NULL,
	`accessid` INT(11) NULL
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `control_new` (
  `id` int(11) NOT NULL,
  `requestid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `controltypeid` int(11) DEFAULT NULL,
  `source` varchar(5000) DEFAULT NULL,
  `properties` varchar(1000) DEFAULT NULL,
  `outerhtml` varchar(1000) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT uuid(),
  `iuser` int(11) DEFAULT 0,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `sort` varchar(500) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  `controltypeid_old` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `sort` (`sort`),
  KEY `parentid` (`parentid`),
  KEY `controlsetid` (`requestid`) USING BTREE,
  KEY `controltypeid` (`controltypeid`) USING BTREE,
  KEY `controltypeid_old` (`controltypeid_old`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `datel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `datatype` varchar(500) DEFAULT NULL,
  `valuetype` varchar(500) DEFAULT NULL,
  `source` text DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `iuser` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cd` (`cd`) USING BTREE,
  KEY `valuetype` (`valuetype`),
  KEY `datatype` (`datatype`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE,
  KEY `modulecd` (`module`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `groop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `relationshipid` int(11) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE,
  KEY `relationshipid` (`relationshipid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `icon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cd` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fun` varchar(50) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `source` varchar(1000) DEFAULT NULL,
  `style` varchar(1000) DEFAULT '{}',
  `idate` bigint(20) unsigned DEFAULT NULL,
  `udate` bigint(20) unsigned DEFAULT NULL,
  `iuser` int(10) unsigned DEFAULT 0,
  `uuser` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cd_name` (`cd`,`name`),
  KEY `cd` (`cd`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

DELIMITER //
CREATE FUNCTION `increment`(val integer,incr integer) RETURNS int(11)
BEGIN
RETURN val+incr;

END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION `languify`(`textcontent` text,
	`lang` VARCHAR(10)
) RETURNS text CHARSET utf8
BEGIN
declare val text;

if not json_valid(textcontent) then return textcontent; end if;

if lang='undefined' then set lang=json_value(json_keys(textcontent),'$[0]'); end if;

set val=json_value(textcontent,concat('$.',lang));

if val is null then
	set lang=json_value(json_keys(textcontent),'$[0]');
	set val=json_value(textcontent,concat('$.',lang));
end if;


RETURN val;

END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION `listitem`(`itm` varchar(100),
	`lbl` VARCHAR(1000),
	`lang` VARCHAR(10)
) RETURNS varchar(1000) CHARSET utf8
BEGIN
  
	if json_valid(lbl)=1 then 
      if lang='undefined' then set lang=json_value(json_keys(lbl),'$[0]'); end if;
      if lang is null then set lang='en';end if;
      set lbl=languify(lbl,lang); 
    end if;
	return concat('{"itm":"',itm,'","lbl":"',lbl,'"}');	
END//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `namespace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `namespace` varchar(1000) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `textplural` varchar(1000) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT 1598918400000,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inits` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` varchar(550) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` text COLLATE utf8_unicode_ci DEFAULT '{}',
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `value` varchar(5000) DEFAULT NULL,
  `dml` text DEFAULT '{}',
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationshipid` int(11) DEFAULT NULL,
  `litm` int(11) DEFAULT NULL,
  `ritm` int(11) DEFAULT NULL,
  `ridx` int(11) DEFAULT NULL,
  `lidx` int(11) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `start` bigint(20) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relationshipid` (`relationshipid`),
  KEY `litm` (`litm`),
  KEY `ritm` (`ritm`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `lobjectcd` varchar(255) DEFAULT NULL,
  `robjectcd` varchar(255) DEFAULT NULL,
  `lobjectid` int(11) DEFAULT 0,
  `robjectid` int(11) DEFAULT 0,
  `role` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `textcontent` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `applicationid` int(11) DEFAULT NULL,
  `modeid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `controlsetid` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `objectid` (`objectid`),
  KEY `modeid` (`modeid`),
  KEY `itemid` (`itemid`),
  KEY `applicationid` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `accesscd` varchar(255) DEFAULT NULL,
  `accessid` int(11) DEFAULT 0,
  `source` text DEFAULT '{}',
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cd` (`cd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `userperson` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`inits` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`fname` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`lname` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`mname` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`nname` VARCHAR(255) NULL COLLATE 'utf8_unicode_ci',
	`sort` VARCHAR(550) NULL COLLATE 'utf8_unicode_ci'
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `source` varchar(1255) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT 1598918400000,
  `udate` bigint(20) DEFAULT 1598918400000,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cd` (`cd`),
  KEY `iuser` (`iuser`),
  KEY `uuser` (`uuser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_20201228_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(50) DEFAULT uuid(),
  `requestid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `controltypeid` int(11) DEFAULT NULL,
  `source` varchar(5000) DEFAULT '{}',
  `properties` varchar(1000) DEFAULT NULL,
  `outerhtml` varchar(1000) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `sort` varchar(500) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `sort` (`sort`),
  KEY `parentid` (`parentid`),
  KEY `controlsetid` (`requestid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1067 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_20201228_controltype` (
  `id` int(11) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `controlsetid` int(11) DEFAULT 0,
  `source` varchar(1000) DEFAULT NULL,
  `properties` varchar(1000) DEFAULT NULL,
  `outerhtml` varchar(500) DEFAULT NULL,
  `controlgroop` varchar(255) DEFAULT NULL,
  `iscontrol` tinyint(4) DEFAULT NULL,
  `datelind` tinyint(4) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(1000) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  UNIQUE KEY `cd` (`cd`) USING BTREE,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_controltypecontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controltypeid` int(11) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `source` varchar(5000) DEFAULT '{}',
  `properties` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `sort` varchar(500) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `_controltypeid_controlid_xref` (
  `controltypeid` int(11) NOT NULL,
  `controltypeid_new` int(11) NOT NULL,
  PRIMARY KEY (`controltypeid`),
  UNIQUE KEY `id` (`controltypeid_new`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_controltype_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `controltypeid` int(11) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `source` varchar(5000) DEFAULT '{}',
  `properties` varchar(1000) DEFAULT NULL,
  `outerhtml` varchar(1000) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `sort` varchar(500) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `_control_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `modeid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `controlid` int(11) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `path` varchar(755) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `source` varchar(5000) DEFAULT '{}',
  `properties` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `applicationid` (`applicationid`),
  KEY `objectid` (`objectid`),
  KEY `modeid` (`modeid`),
  KEY `itemid` (`itemid`),
  KEY `accessid` (`accessid`)
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_control_rewrite_bk` (
  `id` int(11) NOT NULL DEFAULT 0,
  `requestid` int(11) DEFAULT NULL,
  `parentcd` varchar(255) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `parent` varchar(1000) DEFAULT NULL,
  `path` varchar(755) DEFAULT NULL,
  `pathid` varchar(255) DEFAULT NULL,
  `sort` varchar(500) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `rewriteidx` int(11) DEFAULT NULL,
  `controltypecd` varchar(255) DEFAULT NULL,
  `controltypeid` int(11) DEFAULT NULL,
  `cd` varchar(255) DEFAULT NULL,
  `source` varchar(5000) DEFAULT '{}',
  `properties` varchar(1000) DEFAULT NULL,
  `textcontent` varchar(255) DEFAULT NULL,
  `style` varchar(1000) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `access` varchar(1000) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  `applicationid` int(11) DEFAULT NULL,
  `modeid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_daemondatelkey` (
  `datelkey` varchar(64) NOT NULL DEFAULT '',
  `datelidx` bigint(21) unsigned DEFAULT NULL,
  `objectcount` bigint(21) NOT NULL,
  `objects` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `controltype`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `controltype` AS select `control`.`id` AS `id`,`control`.`parent` AS `parent`,`control`.`cd` AS `cd`,`control`.`position` AS `position`,json_value(`control`.`html`,'$.#') AS `#`,`control`.`source` AS `source`,`control`.`properties` AS `properties`,`control`.`html` AS `html`,`control`.`label` AS `label`,`control`.`style` AS `style`,ifnull(`control`.`controltypecd`,`control`.`cd`) AS `controlgroop`,json_value(`control`.`source`,'$.datelind') AS `datelind`,ifnull(`control`.`textcontent`,'{}') AS `textcontent`,ifnull(`control`.`access`,'[]') AS `access`,`control`.`itemtype` AS `itemtype`,`control`.`iuser` AS `iuser`,`control`.`uuser` AS `uuser`,`control`.`idate` AS `idate`,`control`.`udate` AS `udate`,`control`.`uuid` AS `uuid`,`control`.`sort` AS `sort`,`control`.`parentcd` AS `parentcd`,`control`.`pathid` AS `pathid`,`control`.`rewriteidx` AS `rewriteidx`,`control`.`accessid` AS `accessid` from `control` where `control`.`requestid` = 0 and `control`.`parentid` is null;

DROP TABLE IF EXISTS `userperson`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `userperson` AS select `user`.`id` AS `id`,`person`.`name` AS `name`,`person`.`inits` AS `inits`,`person`.`fname` AS `fname`,`person`.`lname` AS `lname`,`person`.`mname` AS `mname`,`person`.`nname` AS `nname`,`person`.`sort` AS `sort` from (`user` join `person` on(`person`.`id` = `user`.`personid`));

CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;

CREATE TABLE IF NOT EXISTS `geonames_city` (
  `id` int(11) NOT NULL,
  `gnid` int(11) NOT NULL,
  `locationid` int(11) DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landid` int(11) DEFAULT NULL,
  `landcd` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceid` int(11) DEFAULT NULL,
  `provincecd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `metroplexid` int(11) DEFAULT NULL,
  `microplexid` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namescii` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `charset` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variantscope` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `variantstring` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variantwaiver` int(11) DEFAULT NULL,
  `variantname` varchar(1000) DEFAULT NULL,
  `variantdt` bigint(20) DEFAULT NULL,
  `variantstring_20200822` varchar(1000) DEFAULT NULL,
  `coordinates` varchar(100) DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `ismaxpopland` tinyint(4) DEFAULT NULL,
  `ismaxpopprov` tinyint(4) DEFAULT NULL,
  `populationcd` int(11) DEFAULT NULL,
  `textContent` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin3` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin4` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `elevation` int(11) DEFAULT NULL,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `timezone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc2` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `landa2` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `udt` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `idate` date DEFAULT NULL,
  `variant` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilmodlen` int(11) DEFAULT NULL,
  `affilmodcount` int(11) DEFAULT NULL,
  `affilmodcitycount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locationid` (`locationid`),
  KEY `landid` (`landid`),
  KEY `type` (`type`),
  KEY `landcd` (`landcd`),
  KEY `provinceid` (`provinceid`),
  KEY `provincecd` (`provincecd`),
  KEY `name` (`name`),
  KEY `namescii` (`namescii`),
  KEY `variantscope` (`variantscope`),
  KEY `charset` (`charset`),
  KEY `gnid` (`gnid`),
  KEY `populationoverride` (`variantwaiver`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `iso_language_land` (
  `landid` int(11) DEFAULT NULL,
  `langid` int(11) DEFAULT NULL,
  `cd` varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL,
  `a2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `landid` (`landid`),
  KEY `langid` (`langid`),
  KEY `cd` (`cd`),
  KEY `a2` (`a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `land` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(25) DEFAULT NULL,
  `cd` varchar(25) DEFAULT NULL,
  `a2` varchar(2) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `textContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `euind` int(11) DEFAULT 0,
  `nameun` varchar(255) DEFAULT NULL,
  `charset` varchar(25) DEFAULT NULL,
  `variantscope` varchar(25) DEFAULT NULL,
  `variantstring` varchar(740) DEFAULT NULL,
  `varianthreshold` int(11) DEFAULT NULL,
  `variantstringlobal` text DEFAULT NULL,
  `variantdt` bigint(20) DEFAULT NULL,
  `geonamesvariantstring` text DEFAULT NULL,
  `geonamesvariantgnid` text DEFAULT NULL,
  `variant` varchar(740) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text DEFAULT NULL,
  `access` text DEFAULT NULL,
  `blurb` varchar(1000) DEFAULT NULL,
  `dsc` text DEFAULT NULL,
  `idate` datetime DEFAULT current_timestamp(),
  `iuser` int(11) DEFAULT 0,
  `udate` datetime DEFAULT current_timestamp(),
  `uuser` int(11) DEFAULT 0,
  `udt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fasname` (`name`) USING BTREE,
  KEY `cd` (`cd`),
  KEY `a2` (`a2`),
  KEY `variant` (`variant`),
  KEY `varianthreshold` (`varianthreshold`)
) ENGINE=InnoDB AUTO_INCREMENT=903 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL,
  `a2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `part2b` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `part2T` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEU` tinyint(4) NOT NULL DEFAULT 0,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a2` (`a2`),
  KEY `cd` (`cd`),
  KEY `isEU` (`isEU`)
) ENGINE=InnoDB AUTO_INCREMENT=7868 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS `resource` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `resource`;

CREATE TABLE IF NOT EXISTS `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businesstype` int(11) NOT NULL,
  `comercialtype` int(11) DEFAULT NULL,
  `nuts1` varchar(5) DEFAULT NULL,
  `nuts2` varchar(5) DEFAULT NULL,
  `nuts3` varchar(5) DEFAULT NULL,
  `lau1` int(11) DEFAULT NULL,
  `lau2` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcd` int(11) DEFAULT NULL,
  `ownertype` tinyint(4) DEFAULT NULL,
  `addresstype` tinyint(4) DEFAULT NULL,
  `commercialterms` varchar(3000) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `iuser` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=944459 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mumok` (
  `id` int(11) NOT NULL,
  `sourcecd` varchar(50) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `groopid` int(11) DEFAULT NULL,
  `itemidx` int(11) DEFAULT NULL,
  `landid` int(11) DEFAULT NULL,
  `landname` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `textcontent` varchar(1255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `productionyr` smallint(6) DEFAULT NULL,
  `productionstart` smallint(6) DEFAULT NULL,
  `productiondt` varchar(50) DEFAULT NULL,
  `acquisitionyr` smallint(6) DEFAULT NULL,
  `exhibitionind` tinyint(4) DEFAULT NULL,
  `material` varchar(2555) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `ownership` varchar(500) DEFAULT NULL,
  `rights` varchar(500) DEFAULT NULL,
  `resourceurl` varchar(255) DEFAULT NULL,
  `tags` varchar(1000) DEFAULT NULL,
  `dsc` text DEFAULT NULL,
  `artist` varchar(500) DEFAULT NULL,
  `uuser` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `iuser` bigint(20) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `groopid` (`groopid`),
  KEY `sequenceid` (`itemidx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mumokresourcecode` (
  `mumokid` int(11) DEFAULT NULL,
  `resourcecode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `resourcecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cd` varchar(255) DEFAULT NULL,
  `textcontent` varchar(1255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(1255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iuser` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `sourcecd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sourcecd` (`sourcecd`),
  KEY `cd` (`cd`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `resourceperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `nname` varchar(255) DEFAULT NULL,
  `inits` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `landid` int(11) DEFAULT NULL,
  `landname` varchar(255) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `udate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `uuser` int(11) DEFAULT 0,
  `sourceid` int(11) DEFAULT NULL,
  `sourcecd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceid` (`sourceid`)
) ENGINE=InnoDB AUTO_INCREMENT=1577 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `resourcereference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationshipid` int(11) DEFAULT NULL,
  `litm` int(11) DEFAULT NULL,
  `ritm` int(11) DEFAULT NULL,
  `ridx` int(11) DEFAULT NULL,
  `lidx` int(11) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `start` bigint(20) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relationshipid` (`relationshipid`),
  KEY `litm` (`litm`),
  KEY `ritm` (`ritm`)
) ENGINE=InnoDB AUTO_INCREMENT=5993 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `resourcereference_bk` (
  `id` int(11) NOT NULL DEFAULT 0,
  `relationshipid` int(11) DEFAULT NULL,
  `litm` int(11) DEFAULT NULL,
  `ritm` int(11) DEFAULT NULL,
  `ridx` int(11) DEFAULT NULL,
  `lidx` int(11) DEFAULT NULL,
  `source` text DEFAULT '{}',
  `start` bigint(20) DEFAULT NULL,
  `end` bigint(20) DEFAULT NULL,
  `idate` bigint(20) DEFAULT NULL,
  `iuser` int(11) DEFAULT 0,
  `udate` bigint(20) DEFAULT NULL,
  `uuser` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
