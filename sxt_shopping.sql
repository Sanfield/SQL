/*
SQLyog Ultimate v9.10 
MySQL - 5.1.73-community : Database - sxt_shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sxt_shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sxt_shopping`;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_number` int(6) NOT NULL,
  `product_price` double NOT NULL,
  `product_from` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`product_id`,`product_name`,`product_number`,`product_price`,`product_from`) values (1,'手电筒',550,10.5,'广州'),(2,'魅族手机',20000,999,'深圳'),(3,'小米',100,1999,'东莞'),(4,'iphone',50000,5299,'郑州富士康'),(5,'汽车',5000,1000000,'西安比亚迪'),(6,'大卡车',4000,3000000,'高陵陕汽');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `sex` int(1) DEFAULT '1',
  `age` int(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`sex`,`age`,`email`,`phone`,`address`,`password`) values (1,'杨幂',0,25,'www.yangmi@163.com','1568975231','西安市雁塔区','123456'),(2,'孙俪',0,24,'www.sunli@qq.com','15894865132','宝鸡市陈仓区',''),(3,'张三',1,12,'546','48965','和数据库了','123'),(4,'123',1,54,'4535354','453535','533','123'),(5,'123',1,54,'4535354','453535','533','123'),(6,'123',1,54,'4535354','453535','533','123'),(7,'wfgag',1,52,'2525','6373','4524853','111'),(8,'53543',1,854,'yukyuk','356356','53563','000'),(9,'456',1,123,'12345','852','sdfsdv','111'),(10,'456',1,123,'12345','852','sdfsdv','111'),(11,'456',1,123,'12345','852','sdfsdv','111'),(12,'456',1,123,'12345','852','sdfsdv','111'),(13,'456',1,123,'12345','852','sdfsdv','111'),(14,'88888',1,15,'56132','4856','56','8520'),(15,'æ¡é£',1,45,'846','48965','49865','222222');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
