/*
SQLyog Ultimate v9.10 
MySQL - 5.1.73-community : Database - web_shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web_shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `web_shopping`;

/*Table structure for table `rabc_user` */

DROP TABLE IF EXISTS `rabc_user`;

CREATE TABLE `rabc_user` (
  `user_id` varchar(20) NOT NULL DEFAULT '' COMMENT '用户账号',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `id_number` varchar(18) DEFAULT '' COMMENT '身份证号',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `QQ` varchar(20) DEFAULT '' COMMENT 'QQ号码',
  `wechat` varchar(20) DEFAULT '' COMMENT '微信号码',
  `photo` varchar(50) DEFAULT '' COMMENT '照片地址',
  `description` varchar(200) DEFAULT '' COMMENT '个人描述',
  `reg_data` datetime NOT NULL COMMENT '注册时间',
  `lastLogin_time` datetime NOT NULL COMMENT '最后登陆时间',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rabc_user` */

insert  into `rabc_user`(`user_id`,`user_name`,`password`,`sex`,`birthday`,`id_number`,`email`,`address`,`QQ`,`wechat`,`photo`,`description`,`reg_data`,`lastLogin_time`,`state`) values ('123','测试','123',1,'1997-04-05','610126199704053595','uhosdavns','显示','8933256','45684956','','测试','2017-04-23 00:00:00','2017-04-23 11:39:00',1),('二哥','挖的','',1,NULL,NULL,'www.1042824123@qq.com','额服务都是','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('南通放大','热发电','',1,'1970-01-01',NULL,'www.1042asds4123@qq.com','问富翁','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('哈哈哈','额我发','',1,'2017-01-26',NULL,'www.1042824123@qq.com','威锋网','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('哈哈哈哈哈','54听歌','',1,'2017-01-26',NULL,'www.1042824123@qq.com','热发电','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('如果','如果v发','',1,'2017-01-26',NULL,'www.1042824123@qq.com','额发的','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('染头发','we ','',1,'2017-01-20',NULL,'www.1042824123@qq.com','ewfew ','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1),('通过你','通过','',0,'1970-01-01',NULL,'www.1042asds4123@qq.com','第三方','0','0','','00000','1970-01-01 00:00:00','1970-01-01 00:00:00',1);

/*Table structure for table `rbac_menu` */

DROP TABLE IF EXISTS `rbac_menu`;

CREATE TABLE `rbac_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_parent_id` int(11) NOT NULL COMMENT '父菜单id',
  `menu_index` int(2) NOT NULL DEFAULT '1' COMMENT '菜单排序位置',
  `menu_icon` varchar(50) DEFAULT '' COMMENT '菜单图标',
  `menu_url` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单访问地址',
  `menu_desc` varchar(100) DEFAULT '' COMMENT '菜单描述',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rbac_menu` */

/*Table structure for table `rbac_role` */

DROP TABLE IF EXISTS `rbac_role`;

CREATE TABLE `rbac_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名字',
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rbac_role` */

/*Table structure for table `rbac_role_menu` */

DROP TABLE IF EXISTS `rbac_role_menu`;

CREATE TABLE `rbac_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rbac_role_menu` */

/*Table structure for table `rbac_user_role` */

DROP TABLE IF EXISTS `rbac_user_role`;

CREATE TABLE `rbac_user_role` (
  `user_id` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rbac_user_role` */

/*Table structure for table `taobao_catalog` */

DROP TABLE IF EXISTS `taobao_catalog`;

CREATE TABLE `taobao_catalog` (
  `catalog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `catalog_name` varchar(20) NOT NULL COMMENT '栏目名称',
  `catalog_parent_id` int(11) NOT NULL COMMENT '父栏目',
  `catalog_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '栏目类别',
  `catalog_desc` varchar(100) DEFAULT '' COMMENT '栏目描述',
  `read_only` int(1) NOT NULL DEFAULT '1' COMMENT '栏目是否只读(0只读，1可编辑)',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taobao_catalog` */

/*Table structure for table `taobao_catalog_type` */

DROP TABLE IF EXISTS `taobao_catalog_type`;

CREATE TABLE `taobao_catalog_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL DEFAULT '' COMMENT '栏目类型名称',
  `type_desc` varchar(50) DEFAULT '' COMMENT '栏目类型描述',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taobao_catalog_type` */

/*Table structure for table `taobao_product` */

DROP TABLE IF EXISTS `taobao_product`;

CREATE TABLE `taobao_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_name` varchar(20) NOT NULL DEFAULT '' COMMENT '商品名字',
  `product_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '商品描述',
  `product_image` varchar(500) DEFAULT '' COMMENT '商品图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `catalog_id` int(11) NOT NULL COMMENT '所属栏目',
  `product_from` varchar(50) DEFAULT '' COMMENT '产地',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taobao_product` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
