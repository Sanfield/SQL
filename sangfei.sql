/*
SQLyog Ultimate v9.10 
MySQL - 5.1.73-community : Database - sangfei
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sangfei` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sangfei`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `sname` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` char(1) DEFAULT NULL,
  `telephone` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cno` char(5) NOT NULL COMMENT '学号',
  `cname` char(10) NOT NULL COMMENT '科目',
  `tno` char(10) NOT NULL COMMENT '成绩'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cno`,`cname`,`tno`) values ('3-116','数电','886'),('10','数电','1'),('11','数电','1'),('12','数电','1');

/*Table structure for table `qq` */

DROP TABLE IF EXISTS `qq`;

CREATE TABLE `qq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `qq` */

insert  into `qq`(`id`,`user`,`password`) values (1,'覅速度','fuibls'),(2,'覅速度','123456'),(3,'覅速度','fuibls'),(4,'覅速度','fuibls'),(5,'覅速度','fuibls'),(6,'覅速度','fuibls'),(7,'覅速度','fuibls'),(8,'覅速度','fuibls'),(9,'覅速度','fuibls'),(10,'覅速度','fuibls'),(11,'覅速度','fuibls'),(12,'覅速度','fuibls'),(13,'覅速度','fuibls'),(14,'覅速度','fuibls');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `studentno` char(50) NOT NULL COMMENT '学号',
  `subjectname` char(50) NOT NULL COMMENT '所考科目',
  `studentresult` int(11) DEFAULT NULL COMMENT '分数',
  `examdata` datetime NOT NULL COMMENT '考试日期',
  PRIMARY KEY (`id`),
  KEY `fk_result_studentno` (`studentno`),
  CONSTRAINT `fk_result_studentno` FOREIGN KEY (`studentno`) REFERENCES `sctstudet` (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `result` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `sno` char(3) NOT NULL COMMENT '学号',
  `cno` char(5) NOT NULL COMMENT '科目编号',
  `degree` double NOT NULL COMMENT '成绩',
  KEY `fk_course_cno` (`sno`),
  CONSTRAINT `fk_course_cno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`sno`,`cno`,`degree`) values ('1','10',85),('3','11',45),('4','12',48),('2','14',48),('2','14',48),('2','14',48),('2','14',48);

/*Table structure for table `sctstudet` */

DROP TABLE IF EXISTS `sctstudet`;

CREATE TABLE `sctstudet` (
  `studentno` char(50) NOT NULL COMMENT '学号',
  `loginpwd` char(50) NOT NULL DEFAULT '123456' COMMENT '密码',
  `studentname` char(50) NOT NULL COMMENT ' 姓名',
  `sex` char(2) NOT NULL COMMENT '性别',
  `gradeld` int(11) NOT NULL COMMENT '所在年级',
  `phone` char(255) NOT NULL COMMENT '联系方式',
  `address` char(255) DEFAULT '学生宿舍' COMMENT '现住址',
  PRIMARY KEY (`studentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sctstudet` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sno` char(3) NOT NULL COMMENT '学号',
  `sname` char(4) NOT NULL COMMENT '姓名',
  `ssex` char(2) NOT NULL DEFAULT '男' COMMENT '性别',
  `sbrithday` datetime DEFAULT NULL COMMENT '出生日期',
  `class` char(5) DEFAULT NULL COMMENT '班级',
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sno`,`sname`,`ssex`,`sbrithday`,`class`,`id`) values ('','不弄i发','男',NULL,'641',NULL),('1','张三','男','2016-11-12 00:00:00','45611',NULL),('10','641','男',NULL,NULL,NULL),('2','饿死鬼','女','2006-01-02 00:00:00','389',NULL),('3','谢霆锋','女','2006-01-12 00:00:00','4575',NULL),('4','史蒂芬森','男','2006-01-02 00:00:00','389',NULL),('5','sef','女','2016-05-09 00:00:00','968',NULL);

/*Table structure for table `techer` */

DROP TABLE IF EXISTS `techer`;

CREATE TABLE `techer` (
  `tno` char(3) NOT NULL COMMENT '编号',
  `tname` char(4) NOT NULL COMMENT '姓名',
  `tsex` char(2) NOT NULL COMMENT '性别',
  `tbrithday` datetime NOT NULL COMMENT '生日',
  `prof` char(6) DEFAULT NULL,
  `depart` char(10) NOT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `techer` */

insert  into `techer`(`tno`,`tname`,`tsex`,`tbrithday`,`prof`,`depart`) values ('1','恺威','男','1997-05-08 00:00:00','教授','广电系'),('2','威','男','1997-05-08 00:00:00','教授','广电系'),('3','威wei','男','1977-05-08 00:00:00','教授','广电系'),('4','杨幂','男','1977-05-08 00:00:00','僵尸','广电系'),('5','杨幂','男','1977-05-08 00:00:00','助教','广电系');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
