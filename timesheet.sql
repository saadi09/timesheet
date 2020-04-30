/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 10.1.40-MariaDB : Database - timesheet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`timesheet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `timesheet`;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_comment` int(11) DEFAULT NULL,
  `iprestriction` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_object` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`country`,`timezone`,`clock_comment`,`iprestriction`,`db_object`) values (1,'United States of America','America/New_York',0,NULL,'');

/*Table structure for table `tbl_company_data` */

DROP TABLE IF EXISTS `tbl_company_data`;

CREATE TABLE `tbl_company_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `jobposition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `companyemail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `idno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `startdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dateregularized` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reason` varchar(455) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `leaveprivilege` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_company_data` */

insert  into `tbl_company_data`(`id`,`reference`,`company`,`department`,`jobposition`,`companyemail`,`idno`,`startdate`,`dateregularized`,`reason`,`leaveprivilege`) values (1,1,'','','','','001122','2019-01-09','2019-02-01','',NULL),(2,2,'','','','','001133','2019-01-09','2019-02-01','',NULL);

/*Table structure for table `tbl_form_company` */

DROP TABLE IF EXISTS `tbl_form_company`;

CREATE TABLE `tbl_form_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_form_company` */

insert  into `tbl_form_company`(`id`,`company`) values (1,'KELEX TECHNOLOGOES');

/*Table structure for table `tbl_form_department` */

DROP TABLE IF EXISTS `tbl_form_department`;

CREATE TABLE `tbl_form_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_form_department` */

/*Table structure for table `tbl_form_jobtitle` */

DROP TABLE IF EXISTS `tbl_form_jobtitle`;

CREATE TABLE `tbl_form_jobtitle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jobtitle` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dept_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_form_jobtitle` */

/*Table structure for table `tbl_form_leavegroup` */

DROP TABLE IF EXISTS `tbl_form_leavegroup`;

CREATE TABLE `tbl_form_leavegroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leavegroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaveprivileges` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_form_leavegroup` */

/*Table structure for table `tbl_form_leavetype` */

DROP TABLE IF EXISTS `tbl_form_leavetype`;

CREATE TABLE `tbl_form_leavetype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leavetype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percalendar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_form_leavetype` */

/*Table structure for table `tbl_people` */

DROP TABLE IF EXISTS `tbl_people`;

CREATE TABLE `tbl_people` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `emailaddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `civilstatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobileno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nationalid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthplace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeaddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `employmentstatus` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `employmenttype` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_people` */

insert  into `tbl_people`(`id`,`firstname`,`mi`,`lastname`,`age`,`gender`,`emailaddress`,`civilstatus`,`height`,`weight`,`mobileno`,`birthday`,`nationalid`,`birthplace`,`homeaddress`,`employmentstatus`,`employmenttype`,`avatar`) values (1,'MANAGER','','DEMO',NULL,'','manager@example.com','',NULL,NULL,NULL,'2019-01-09','','','','Active',NULL,''),(2,'DEMO','','EMPLOYEE',NULL,'','employee@example.com','',NULL,NULL,NULL,'2019-01-09','','','','Active',NULL,'');

/*Table structure for table `tbl_people_attendance` */

DROP TABLE IF EXISTS `tbl_people_attendance`;

CREATE TABLE `tbl_people_attendance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `idno` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `date` date DEFAULT NULL,
  `employee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `timein` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalhours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status_timein` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status_timeout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_people_attendance` */

insert  into `tbl_people_attendance`(`id`,`reference`,`idno`,`date`,`employee`,`timein`,`timeout`,`totalhours`,`status_timein`,`status_timeout`,`reason`,`comment`) values (1,1,'001122','2020-04-16','DEMO, MANAGER ','2020-04-16 04:10:40 PM','2020-04-16 04:11:33 PM','0.0','Ok','Ok','',NULL),(2,NULL,'1','2020-04-16','','2020-04-16 04:15:34 PM',NULL,'','Ok','','',NULL);

/*Table structure for table `tbl_people_leaves` */

DROP TABLE IF EXISTS `tbl_people_leaves`;

CREATE TABLE `tbl_people_leaves` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `idno` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `typeid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `leavefrom` date DEFAULT NULL,
  `leaveto` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archived` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_people_leaves` */

/*Table structure for table `tbl_people_schedules` */

DROP TABLE IF EXISTS `tbl_people_schedules`;

CREATE TABLE `tbl_people_schedules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `idno` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intime` text COLLATE utf8mb4_unicode_ci,
  `outime` text COLLATE utf8mb4_unicode_ci,
  `datefrom` date DEFAULT NULL,
  `dateto` date DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `restday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archive` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_people_schedules` */

insert  into `tbl_people_schedules`(`id`,`reference`,`idno`,`employee`,`intime`,`outime`,`datefrom`,`dateto`,`hours`,`restday`,`archive`) values (1,2,'001133','EMPLOYEE, DEMO','09:00:00 AM','05:00:00 PM','2020-04-20','2020-04-30',8,'Sunday, Saturday',1);

/*Table structure for table `tbl_report_views` */

DROP TABLE IF EXISTS `tbl_report_views`;

CREATE TABLE `tbl_report_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `last_viewed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tbl_report_views` */

insert  into `tbl_report_views`(`id`,`report_id`,`last_viewed`,`title`) values (1,1,'Apr, 21 2020','Employee List Report'),(2,2,'','Employee Attendance Report'),(3,3,'','Employee Leaves Report'),(4,4,'','Employee Schedule Report'),(5,5,'','Organization Profile'),(6,6,'','User Accounts Report'),(7,7,'','Employee Birthdays');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` int(11) DEFAULT NULL,
  `idno` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  `acc_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`reference`,`idno`,`name`,`email`,`role_id`,`acc_type`,`status`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,1,'001122','DEMO, MANAGER','manager@example.com',2,2,1,'$2y$10$mDAH.R8JG5ThPelt4zRXc.8sxizt.tqXQfndx5s/W/3j0Sq6xS3LG','','2018-10-31 17:10:04','2018-10-31 17:10:04'),(2,2,'001133','DEMO, EMPLOYEE','employee@example.com',5,1,1,'$2y$10$3qjhKES39RmTl4k7PQWJ.OfG4uFzzF/iYJI8A1BLgYs2uDEfe5pry','','2018-12-21 10:20:18','2018-12-21 10:20:18');

/*Table structure for table `users_permissions` */

DROP TABLE IF EXISTS `users_permissions`;

CREATE TABLE `users_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1844 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_permissions` */

insert  into `users_permissions`(`id`,`role_id`,`perm_id`) values (1798,2,1),(1799,2,2),(1800,2,22),(1801,2,21),(1802,2,23),(1803,2,24),(1804,2,25),(1805,2,3),(1806,2,31),(1807,2,32),(1808,2,4),(1809,2,41),(1810,2,42),(1811,2,43),(1812,2,44),(1813,2,5),(1814,2,52),(1815,2,53),(1816,2,9),(1817,2,91),(1818,2,7),(1819,2,8),(1820,2,81),(1821,2,82),(1822,2,83),(1823,2,10),(1824,2,101),(1825,2,102),(1826,2,103),(1827,2,104),(1828,2,11),(1829,2,111),(1830,2,112),(1831,2,12),(1832,2,121),(1833,2,122),(1834,2,13),(1835,2,131),(1836,2,132),(1837,2,14),(1838,2,141),(1839,2,142),(1840,2,15),(1841,2,151),(1842,2,152),(1843,2,153);

/*Table structure for table `users_roles` */

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users_roles` */

insert  into `users_roles`(`id`,`role_name`,`state`) values (2,'MANAGER','Active'),(5,'EMPLOYEE','Active');

/*Table structure for table `visitors` */

DROP TABLE IF EXISTS `visitors`;

CREATE TABLE `visitors` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_name` varchar(35) DEFAULT NULL,
  `visitor_email` varchar(65) DEFAULT NULL,
  `visitor_contact_no` varchar(20) DEFAULT NULL,
  `visitor_national_id` varchar(35) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  KEY `visitor_id` (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `visitors` */

insert  into `visitors`(`visitor_id`,`visitor_name`,`visitor_email`,`visitor_contact_no`,`visitor_national_id`,`added_by`,`added_at`,`update_by`,`update_at`) values (1,'IMRAN','SHAHMIAN@GMAIL.COM','12345','12121',1,'2020-04-22 06:29:45',NULL,NULL);

/*Table structure for table `visitors_timesheet` */

DROP TABLE IF EXISTS `visitors_timesheet`;

CREATE TABLE `visitors_timesheet` (
  `v_timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_timesheet_date` date NOT NULL,
  `v_id` int(11) DEFAULT NULL,
  `v_clockin` timestamp NULL DEFAULT NULL,
  `v_clockout` timestamp NULL DEFAULT NULL,
  `v_visiting_purpose` text,
  `ip` varchar(20) DEFAULT NULL,
  `clockin_by` int(11) DEFAULT NULL,
  KEY `v_timesheet_id` (`v_timesheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `visitors_timesheet` */

insert  into `visitors_timesheet`(`v_timesheet_id`,`v_timesheet_date`,`v_id`,`v_clockin`,`v_clockout`,`v_visiting_purpose`,`ip`,`clockin_by`) values (1,'2020-04-22',1,'2020-04-22 06:35:05','2020-04-22 07:17:09','SALAAM','::1',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
