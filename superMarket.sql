/*
SQLyog Ultimate v9.10 
MySQL - 5.1.73-community : Database - smms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `smms`;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `emp_name` char(20) NOT NULL COMMENT ' 姓名',
  `emp_password` char(20) NOT NULL DEFAULT '000000',
  `emp_sex` char(2) NOT NULL COMMENT '1为男，0为女',
  `emp_age` int(11) NOT NULL COMMENT '年龄',
  `emp_mobile` char(11) NOT NULL COMMENT '联系电话',
  `emp_address` char(100) NOT NULL COMMENT '地址',
  `emp_auth` char(1) NOT NULL COMMENT '1为收银员，2为管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`emp_name`,`emp_password`,`emp_sex`,`emp_age`,`emp_mobile`,`emp_address`,`emp_auth`) values (1,'李四光','000000','1',22,'543453','西安','1'),(2,'里斯','123456','2',52,'12345698710','西安','1'),(3,'桑','123456','1',15,'189652412','未央','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
