-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 30, 2020 at 07:39 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timesheet`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_comment` int(11) DEFAULT NULL,
  `iprestriction` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_object` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `country`, `timezone`, `clock_comment`, `iprestriction`, `db_object`) VALUES
(1, 'Pakistan', 'Asia/Karachi', 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_data`
--

DROP TABLE IF EXISTS `tbl_company_data`;
CREATE TABLE IF NOT EXISTS `tbl_company_data` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_company_data`
--

INSERT INTO `tbl_company_data` (`id`, `reference`, `company`, `department`, `jobposition`, `companyemail`, `idno`, `startdate`, `dateregularized`, `reason`, `leaveprivilege`) VALUES
(1, 1, '', '', '', '', '001122', '2019-01-09', '2019-02-01', '', NULL),
(2, 2, '', '', '', '', '001133', '2019-01-09', '2019-02-01', '', NULL),
(3, 3, 'KELEX TECHNOLOGOES', 'IT', 'ASSISTANT MANAGER', 'syed.asad@technologic.com', '60801', '2020-04-27', '2020-04-28', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_company`
--

DROP TABLE IF EXISTS `tbl_form_company`;
CREATE TABLE IF NOT EXISTS `tbl_form_company` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_form_company`
--

INSERT INTO `tbl_form_company` (`id`, `company`) VALUES
(1, 'KELEX TECHNOLOGOES');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_department`
--

DROP TABLE IF EXISTS `tbl_form_department`;
CREATE TABLE IF NOT EXISTS `tbl_form_department` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_form_department`
--

INSERT INTO `tbl_form_department` (`id`, `department`) VALUES
(1, 'IT'),
(2, 'ACCOUNTING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_jobtitle`
--

DROP TABLE IF EXISTS `tbl_form_jobtitle`;
CREATE TABLE IF NOT EXISTS `tbl_form_jobtitle` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jobtitle` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dept_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_form_jobtitle`
--

INSERT INTO `tbl_form_jobtitle` (`id`, `jobtitle`, `dept_code`) VALUES
(1, 'ASSISTANT MANAGER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_leavegroup`
--

DROP TABLE IF EXISTS `tbl_form_leavegroup`;
CREATE TABLE IF NOT EXISTS `tbl_form_leavegroup` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leavegroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaveprivileges` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_form_leavegroup`
--

INSERT INTO `tbl_form_leavegroup` (`id`, `leavegroup`, `description`, `leaveprivileges`, `status`) VALUES
(1, 'LEVEL1', 'ASDASDASDASDASDASD', '1,2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_form_leavetype`
--

DROP TABLE IF EXISTS `tbl_form_leavetype`;
CREATE TABLE IF NOT EXISTS `tbl_form_leavetype` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leavetype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percalendar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_form_leavetype`
--

INSERT INTO `tbl_form_leavetype` (`id`, `leavetype`, `limit`, `percalendar`) VALUES
(1, 'SICK LEAVE', '1', 'Yearly'),
(2, 'CASUAL', '1', 'Yearly');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people`
--

DROP TABLE IF EXISTS `tbl_people`;
CREATE TABLE IF NOT EXISTS `tbl_people` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_people`
--

INSERT INTO `tbl_people` (`id`, `firstname`, `mi`, `lastname`, `age`, `gender`, `emailaddress`, `civilstatus`, `height`, `weight`, `mobileno`, `birthday`, `nationalid`, `birthplace`, `homeaddress`, `employmentstatus`, `employmenttype`, `avatar`) VALUES
(1, 'MANAGER', '', 'DEMO', NULL, '', 'manager@example.com', '', NULL, NULL, NULL, '2019-01-09', '', '', '', 'Active', NULL, ''),
(2, 'DEMO', '', 'EMPLOYEE', NULL, '', 'employee@example.com', '', NULL, NULL, NULL, '2019-01-09', '', '', '', 'Active', NULL, ''),
(3, 'SAADI', '', 'LINUX', 23, 'MALE', 'cyberasad09@gmail.com', 'SINGLE', '5', '50', '+923152156845', '1996-02-27', '42401-7064399-7', 'KARACHI/PAKISTAN', 'HOUSE NO 810 SECTOR L-1 NORTH KARACHI', 'Active', 'Regular', '78536175_2642242199198850_7103353463467147264_o.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people_attendance`
--

DROP TABLE IF EXISTS `tbl_people_attendance`;
CREATE TABLE IF NOT EXISTS `tbl_people_attendance` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people_leaves`
--

DROP TABLE IF EXISTS `tbl_people_leaves`;
CREATE TABLE IF NOT EXISTS `tbl_people_leaves` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_people_leaves`
--

INSERT INTO `tbl_people_leaves` (`id`, `reference`, `idno`, `employee`, `typeid`, `type`, `leavefrom`, `leaveto`, `returndate`, `reason`, `status`, `comment`, `archived`) VALUES
(1, 3, '60801', 'LINUX, SAADI', 1, 'SICK LEAVE', '2020-04-29', '2020-04-30', '2020-05-01', 'ASDASDASDASDASDASDASDASDASDA', 'Approved', 'DASDASDASDASDADADDDASDASDA', NULL),
(2, 3, '60801', 'LINUX, SAADI', 1, 'SICK LEAVE', '2020-05-05', '2020-05-06', '2020-05-07', 'ADDASDASDASDASDASDASDAS', 'Approved', 'ADASDASDASDASDASDASDASD ASDASDASDASDAS DASDASDASDASDASDASDASDASDASDAS', NULL),
(3, 3, '60801', 'LINUX, SAADI', 1, 'SICK LEAVE', '2020-05-11', '2020-05-12', '2020-05-13', 'DASDDASDASDASDASDASDA DASDASDASDAS ADASDASDASD ADASDASDASDASD', 'Approved', 'DASDASDASDASD ADASDASDAS ADASDASD ADASDASD ADASDADAS', NULL),
(5, 3, '60801', 'LINUX, SAADI', 1, 'SICK LEAVE', '2020-05-20', '2020-05-21', '2020-05-22', 'DDASDASDASDASDASDASDA', 'Pending', NULL, NULL),
(6, 3, '60801', 'LINUX, SAADI', 1, 'SICK LEAVE', '2020-05-24', '2020-05-25', '2020-05-26', 'ASDASDASDASDASADA', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people_schedules`
--

DROP TABLE IF EXISTS `tbl_people_schedules`;
CREATE TABLE IF NOT EXISTS `tbl_people_schedules` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_people_schedules`
--

INSERT INTO `tbl_people_schedules` (`id`, `reference`, `idno`, `employee`, `intime`, `outime`, `datefrom`, `dateto`, `hours`, `restday`, `archive`) VALUES
(1, 2, '001133', 'EMPLOYEE, DEMO', '09:00:00 AM', '05:00:00 PM', '2020-04-20', '2020-04-30', 8, 'Sunday, Saturday', 1),
(2, 3, '60801', 'LINUX, SAADI', '09:00:00 AM', '05:00:00 PM', '2020-04-28', '2020-05-01', 8, 'Sunday, Saturday', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_report_views`
--

DROP TABLE IF EXISTS `tbl_report_views`;
CREATE TABLE IF NOT EXISTS `tbl_report_views` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `last_viewed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_report_views`
--

INSERT INTO `tbl_report_views` (`id`, `report_id`, `last_viewed`, `title`) VALUES
(1, 1, 'Apr, 27 2020', 'Employee List Report'),
(2, 2, 'May, 02 2020', 'Employee Attendance Report'),
(3, 3, 'Apr, 27 2020', 'Employee Leaves Report'),
(4, 4, '', 'Employee Schedule Report'),
(5, 5, 'Apr, 27 2020', 'Organization Profile'),
(6, 6, 'Apr, 27 2020', 'User Accounts Report'),
(7, 7, '', 'Employee Birthdays');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `reference`, `idno`, `name`, `email`, `role_id`, `acc_type`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, '001122', 'SYED ASAD', 'syed.asad@technologicx.com', 2, 2, 1, '$2y$10$mDAH.R8JG5ThPelt4zRXc.8sxizt.tqXQfndx5s/W/3j0Sq6xS3LG', '', '2018-10-31 12:10:04', '2018-10-31 12:10:04'),
(2, 2, '001133', 'DEMO, EMPLOYEE', 'employee@example.com', 5, 1, 1, '$2y$10$3qjhKES39RmTl4k7PQWJ.OfG4uFzzF/iYJI8A1BLgYs2uDEfe5pry', '', '2018-12-21 05:20:18', '2018-12-21 05:20:18'),
(3, 3, '60801', 'LINUX, SAADI', 'cyberasad09@gmail.com', 5, 1, 1, '$2y$10$bhGHqtqTFrRChGiZ5d0IqOWK5UOf5yWl/sZoNvo96Ui51ZPKa.oqm', NULL, '2020-04-26 22:24:56', '2020-04-26 22:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

DROP TABLE IF EXISTS `users_permissions`;
CREATE TABLE IF NOT EXISTS `users_permissions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1844 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_permissions`
--

INSERT INTO `users_permissions` (`id`, `role_id`, `perm_id`) VALUES
(1798, 2, 1),
(1799, 2, 2),
(1800, 2, 22),
(1801, 2, 21),
(1802, 2, 23),
(1803, 2, 24),
(1804, 2, 25),
(1805, 2, 3),
(1806, 2, 31),
(1807, 2, 32),
(1808, 2, 4),
(1809, 2, 41),
(1810, 2, 42),
(1811, 2, 43),
(1812, 2, 44),
(1813, 2, 5),
(1814, 2, 52),
(1815, 2, 53),
(1816, 2, 9),
(1817, 2, 91),
(1818, 2, 7),
(1819, 2, 8),
(1820, 2, 81),
(1821, 2, 82),
(1822, 2, 83),
(1823, 2, 10),
(1824, 2, 101),
(1825, 2, 102),
(1826, 2, 103),
(1827, 2, 104),
(1828, 2, 11),
(1829, 2, 111),
(1830, 2, 112),
(1831, 2, 12),
(1832, 2, 121),
(1833, 2, 122),
(1834, 2, 13),
(1835, 2, 131),
(1836, 2, 132),
(1837, 2, 14),
(1838, 2, 141),
(1839, 2, 142),
(1840, 2, 15),
(1841, 2, 151),
(1842, 2, 152),
(1843, 2, 153);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`id`, `role_name`, `state`) VALUES
(2, 'MANAGER', 'Active'),
(5, 'EMPLOYEE', 'Active'),
(6, 'HR', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`visitor_id`, `visitor_name`, `visitor_email`, `visitor_contact_no`, `visitor_national_id`, `added_by`, `added_at`, `update_by`, `update_at`) VALUES
(1, 'IMRAN', 'SHAHMIAN@GMAIL.COM', '12345', '12121', 1, '2020-04-22 06:29:45', NULL, NULL),
(2, 'SYED ASAD', 'CYBERASAD09@GMAIL.COM', '+923152156845', '42401-7064399-7', 1, '2020-04-30 03:00:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors_timesheet`
--

DROP TABLE IF EXISTS `visitors_timesheet`;
CREATE TABLE IF NOT EXISTS `visitors_timesheet` (
  `v_timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_timesheet_date` date NOT NULL,
  `v_id` int(11) DEFAULT NULL,
  `v_clockin` timestamp NULL DEFAULT NULL,
  `v_clockout` timestamp NULL DEFAULT NULL,
  `v_visiting_purpose` text,
  `ip` varchar(20) DEFAULT NULL,
  `clockin_by` int(11) DEFAULT NULL,
  KEY `v_timesheet_id` (`v_timesheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors_timesheet`
--

INSERT INTO `visitors_timesheet` (`v_timesheet_id`, `v_timesheet_date`, `v_id`, `v_clockin`, `v_clockout`, `v_visiting_purpose`, `ip`, `clockin_by`) VALUES
(1, '2020-04-26', 1, '2020-04-22 01:35:05', '2020-04-26 13:10:49', 'SALAAM', '::1', 1),
(2, '2020-04-26', 1, '2020-04-26 13:09:44', '2020-04-26 13:10:49', 'DDFFDGDFDFDG', '::1', 1),
(3, '2020-04-30', 2, '2020-04-29 22:01:29', NULL, 'MEETING WITH CEO REGARDING SOME FUNDING DECISION.', '::1', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
