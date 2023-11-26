-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 17, 2023 at 09:16 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `examat_id`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `examat_id` (IN `id` INT, OUT `exam_ans` VARCHAR(30))   SELECT exam_answer INTO exam_ans FROM exam_question_tbl WHERE eqt_id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_acc`
--

DROP TABLE IF EXISTS `admin_acc`;
CREATE TABLE IF NOT EXISTS `admin_acc` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(1000) NOT NULL,
  `admin_pass` varchar(1000) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_acc`
--

INSERT INTO `admin_acc` (`admin_id`, `admin_user`, `admin_pass`) VALUES
(1, 'admin@username', 'admin@password');

-- --------------------------------------------------------

--
-- Stand-in structure for view `course_exam_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `course_exam_view`;
CREATE TABLE IF NOT EXISTS `course_exam_view` (
`cou_name` varchar(1000)
,`exmne_id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `course_tbl`
--

DROP TABLE IF EXISTS `course_tbl`;
CREATE TABLE IF NOT EXISTS `course_tbl` (
  `cou_id` int NOT NULL AUTO_INCREMENT,
  `cou_name` varchar(1000) NOT NULL,
  `cou_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_tbl`
--

INSERT INTO `course_tbl` (`cou_id`, `cou_name`, `cou_created`) VALUES
(25, 'BSHRM', '2019-11-27 09:26:08'),
(67, 'DBMS', '2023-11-15 08:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `examinee_tbl`
--

DROP TABLE IF EXISTS `examinee_tbl`;
CREATE TABLE IF NOT EXISTS `examinee_tbl` (
  `exmne_id` int NOT NULL AUTO_INCREMENT,
  `exmne_fullname` varchar(1000) NOT NULL,
  `exmne_course` varchar(1000) NOT NULL,
  `exmne_gender` varchar(1000) NOT NULL,
  `exmne_birthdate` varchar(1000) NOT NULL,
  `exmne_year_level` varchar(1000) NOT NULL,
  `exmne_email` varchar(1000) NOT NULL,
  `exmne_password` varchar(1000) NOT NULL,
  `exmne_status` varchar(1000) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`exmne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examinee_tbl`
--

INSERT INTO `examinee_tbl` (`exmne_id`, `exmne_fullname`, `exmne_course`, `exmne_gender`, `exmne_birthdate`, `exmne_year_level`, `exmne_email`, `exmne_password`, `exmne_status`) VALUES
(9, 'VISHNU', '67', 'male', '2003-12-09', 'first year', 'vishnuankith52@gmail.com', 'vishnu', 'active'),
(10, 'VISHWAS VIVIAN ANTHONY', '67', 'male', '2003-09-08', 'third year', 'vishwas@gmail.com', 'vishwasvivian', 'active'),
(11, 'VISHWAS VIVIAN', '67', 'male', '2003-09-08', 'third year', 'vivian@gmail.com', 'vivian', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_answers`
--

DROP TABLE IF EXISTS `exam_answers`;
CREATE TABLE IF NOT EXISTS `exam_answers` (
  `exans_id` int NOT NULL AUTO_INCREMENT,
  `axmne_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `quest_id` int NOT NULL,
  `exans_answer` varchar(1000) NOT NULL,
  `exans_status` varchar(1000) NOT NULL DEFAULT 'new',
  `exans_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_answers`
--

INSERT INTO `exam_answers` (`exans_id`, `axmne_id`, `exam_id`, `quest_id`, `exans_answer`, `exans_status`, `exans_created`) VALUES
(295, 4, 12, 25, 'Diode, inverted, pointer', 'old', '2019-12-07 02:52:14'),
(296, 4, 12, 16, 'Data Block', 'old', '2019-12-07 02:52:14'),
(297, 6, 12, 18, 'Programmable Logic Controller', 'old', '2019-12-05 12:59:47'),
(298, 6, 12, 9, '1850s', 'old', '2019-12-05 12:59:47'),
(299, 6, 12, 24, '1976', 'old', '2019-12-05 12:59:47'),
(300, 6, 12, 14, 'Operating System', 'old', '2019-12-05 12:59:47'),
(301, 6, 12, 19, 'WAN (Wide Area Network)', 'old', '2019-12-05 12:59:47'),
(302, 6, 11, 28, 'fds', 'new', '2019-12-05 12:04:28'),
(303, 6, 11, 29, 'sd', 'new', '2019-12-05 12:04:28'),
(304, 6, 12, 15, 'David Filo & Jerry Yang', 'new', '2019-12-05 12:59:47'),
(305, 6, 12, 17, 'System file', 'new', '2019-12-05 12:59:47'),
(306, 6, 12, 10, 'Field', 'new', '2019-12-05 12:59:47'),
(307, 6, 12, 9, '1880s', 'new', '2019-12-05 12:59:47'),
(308, 6, 12, 21, 'Temporary file', 'new', '2019-12-05 12:59:47'),
(309, 4, 11, 28, 'q1', 'new', '2019-12-05 13:30:21'),
(310, 4, 11, 29, 'dfg', 'new', '2019-12-05 13:30:21'),
(311, 4, 12, 16, 'Data Block', 'new', '2019-12-07 02:52:14'),
(312, 4, 12, 20, 'Plancks radiation', 'new', '2019-12-07 02:52:14'),
(313, 4, 12, 10, 'Report', 'new', '2019-12-07 02:52:14'),
(314, 4, 12, 24, '1976', 'new', '2019-12-07 02:52:14'),
(315, 4, 12, 9, '1930s', 'new', '2019-12-07 02:52:14'),
(316, 8, 12, 18, 'Programmable Lift Computer', 'new', '2020-01-05 03:18:35'),
(317, 8, 12, 14, 'Operating System', 'new', '2020-01-05 03:18:35'),
(318, 8, 12, 20, 'Einstein oscillation', 'new', '2020-01-05 03:18:35'),
(319, 8, 12, 21, 'Temporary file NOW UPDATED', 'new', '2023-11-05 11:40:38'),
(320, 8, 12, 25, 'Diode, inverted, pointer', 'new', '2020-01-05 03:18:35'),
(321, 9, 12, 19, 'URL (Universal Resource Locator)', 'new', '2023-11-07 10:02:47'),
(322, 9, 12, 25, 'Gas, solid state, diode', 'new', '2023-11-07 10:02:47'),
(323, 9, 12, 20, 'Stimulated emission', 'new', '2023-11-07 10:02:47'),
(324, 11, 24, 1001, 'DATABASE MANAGEMENT SYSTEM', 'new', '2023-11-15 08:21:18'),
(325, 11, 24, 1002, 'Web technology', 'new', '2023-11-15 08:21:18');

--
-- Triggers `exam_answers`
--
DROP TRIGGER IF EXISTS `ans_update`;
DELIMITER $$
CREATE TRIGGER `ans_update` BEFORE UPDATE ON `exam_answers` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.exans_id, "AnsUpdated", NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempt`
--

DROP TABLE IF EXISTS `exam_attempt`;
CREATE TABLE IF NOT EXISTS `exam_attempt` (
  `examat_id` int NOT NULL AUTO_INCREMENT,
  `exmne_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `examat_status` varchar(1000) NOT NULL DEFAULT 'used',
  PRIMARY KEY (`examat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_attempt`
--

INSERT INTO `exam_attempt` (`examat_id`, `exmne_id`, `exam_id`, `examat_status`) VALUES
(51, 6, 12, 'used'),
(52, 4, 11, 'used'),
(53, 4, 12, 'used'),
(54, 8, 12, 'used'),
(55, 9, 12, 'used'),
(56, 11, 24, 'used');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_tbl`
--

DROP TABLE IF EXISTS `exam_question_tbl`;
CREATE TABLE IF NOT EXISTS `exam_question_tbl` (
  `eqt_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `exam_question` varchar(1000) NOT NULL,
  `exam_ch1` varchar(1000) NOT NULL,
  `exam_ch2` varchar(1000) NOT NULL,
  `exam_ch3` varchar(1000) NOT NULL,
  `exam_ch4` varchar(1000) NOT NULL,
  `exam_answer` varchar(1000) NOT NULL,
  `exam_status` varchar(1000) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`eqt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_question_tbl`
--

INSERT INTO `exam_question_tbl` (`eqt_id`, `exam_id`, `exam_question`, `exam_ch1`, `exam_ch2`, `exam_ch3`, `exam_ch4`, `exam_answer`, `exam_status`) VALUES
(9, 12, 'In which decade was the American Institute of Electrical Engineers (AIEE) founded?', '1850s', '1880s', '1930s', '1950s', '1880s', 'active'),
(10, 12, 'What is part of a database that holds only one type of information?', 'Report', 'Field', 'Record', 'File', 'Field', 'active'),
(14, 12, 'OS computer abbreviation usually means ?', 'Order of Significance', 'Open Software', 'Operating System', 'Optical Sensor', 'Operating System', 'active'),
(15, 12, 'Who developed Yahoo?', 'Dennis Ritchie & Ken Thompson', 'David Filo & Jerry Yang', 'Vint Cerf & Robert Kahn', 'Steve Case & Jeff Bezos', 'David Filo & Jerry Yang', 'active'),
(16, 12, 'DB computer abbreviation usually means ?', 'Database', 'Double Byte', 'Data Block', 'Driver Boot', 'Database', 'active'),
(17, 12, '.INI extension refers usually to what kind of file?', 'Image file', 'System file', 'Hypertext related file', 'Image Color Matching Profile file', 'System file', 'active'),
(18, 12, 'What does the term PLC stand for?', 'Programmable Lift Computer', 'Program List Control', 'Programmable Logic Controller', 'Piezo Lamp Connector', 'Programmable Logic Controller', 'active'),
(19, 12, 'What do we call a network whose elements may be separated by some distance? It usually involves two or more small networks and dedicated high-speed telephone lines.', 'URL (Universal Resource Locator)', 'LAN (Local Area Network)', 'WAN (Wide Area Network)', 'World Wide Web', 'WAN (Wide Area Network)', 'active'),
(20, 12, 'After the first photons of light are produced, which process is responsible for amplification of the light?', 'Blackbody radiation', 'Stimulated emission', 'Plancks radiation', 'Einstein oscillation', 'Stimulated emission', 'active'),
(21, 12, '.TMP extension refers usually to what kind of file?', 'Compressed Archive file', 'Image file', 'Temporary file', 'Audio file', 'Temporary file', 'active'),
(22, 12, 'What do we call a collection of two or more computers that are located within a limited distance of each other and that are connected to each other directly or indirectly?', 'Inernet', 'Interanet', 'Local Area Network', 'Wide Area Network', 'Local Area Network', 'active'),
(24, 12, '	 In what year was the \"@\" chosen for its use in e-mail addresses?', '1976', '1972', '1980', '1984', '1972', 'active'),
(25, 12, 'What are three types of lasers?', 'Gas, metal vapor, rock', 'Pointer, diode, CD', 'Diode, inverted, pointer', 'Gas, solid state, diode', 'Gas, solid state, diode', 'active'),
(27, 15, 'asdasd', 'dsf', 'sd', 'yui', 'sdf', 'yui', 'active'),
(28, 11, 'Question 1', 'q1', 'asd', 'fds', 'ytu', 'q1', 'active'),
(1001, 24, 'Full form of DBMS', 'DATABASE MANAGEMENT SYSTEM', 'DATABASE', 'MANAGEMENT ', 'SYSTEM', 'DATABASE MANAGEMENT SYSTEM', 'active'),
(1002, 24, 'Full form of WT', 'Web technology', 'Web', 'Technology', 'WT', 'Web technology', 'active'),
(1003, 24, 'What does SQL stand for?', 'Structured Language', 'Standard Query Language', 'Sequential Query Language', 'Simplified Question Language', 'Standard Query Language', 'active');

--
-- Triggers `exam_question_tbl`
--
DROP TRIGGER IF EXISTS `insert_trigger`;
DELIMITER $$
CREATE TRIGGER `insert_trigger` BEFORE INSERT ON `exam_question_tbl` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.eqt_id, "inserted", NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `question_backup`;
DELIMITER $$
CREATE TRIGGER `question_backup` AFTER DELETE ON `exam_question_tbl` FOR EACH ROW INSERT INTO logs VALUES(null, OLD.eqt_id,old.exam_question, "deleted", NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger`;
DELIMITER $$
CREATE TRIGGER `update_trigger` BEFORE UPDATE ON `exam_question_tbl` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.eqt_id, "UPDATED", NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl`
--

DROP TABLE IF EXISTS `exam_tbl`;
CREATE TABLE IF NOT EXISTS `exam_tbl` (
  `ex_id` int NOT NULL AUTO_INCREMENT,
  `cou_id` int NOT NULL,
  `ex_title` varchar(1000) NOT NULL,
  `ex_time_limit` varchar(1000) NOT NULL,
  `ex_questlimit_display` int NOT NULL,
  `ex_description` varchar(1000) NOT NULL,
  `ex_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_tbl`
--

INSERT INTO `exam_tbl` (`ex_id`, `cou_id`, `ex_title`, `ex_time_limit`, `ex_questlimit_display`, `ex_description`, `ex_created`) VALUES
(11, 26, 'Duerms', '1', 2, 'qwe', '2019-12-05 12:03:21'),
(13, 26, 'Exam Again', '5', 0, 'again and again\r\n', '2019-11-30 08:24:54'),
(24, 67, 'DBMS', '10', 2, 'DBMS', '2023-11-15 08:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks_tbl`
--

DROP TABLE IF EXISTS `feedbacks_tbl`;
CREATE TABLE IF NOT EXISTS `feedbacks_tbl` (
  `fb_id` int NOT NULL AUTO_INCREMENT,
  `exmne_id` int NOT NULL,
  `fb_exmne_as` varchar(1000) NOT NULL,
  `fb_feedbacks` varchar(1000) NOT NULL,
  `fb_date` varchar(1000) NOT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacks_tbl`
--

INSERT INTO `feedbacks_tbl` (`fb_id`, `exmne_id`, `fb_exmne_as`, `fb_feedbacks`, `fb_date`) VALUES
(11, 11, 'Anonymous', 'EASY', 'November 15, 2023');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eqt_id` int NOT NULL,
  `action` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `eqt_id`, `action`, `date`) VALUES
(1, 30, '0', '2023-11-05 17:05:43'),
(2, 319, '0', '2023-11-05 17:10:38'),
(3, 29, '0', '2023-11-06 08:20:29'),
(4, 100, '0', '2023-11-07 17:19:15'),
(6, 1000, '0', '2023-11-07 17:19:41'),
(7, 100, '0', '2023-11-07 17:22:18'),
(8, 1000, '0', '2023-11-07 17:24:30'),
(9, 100, 'deleted', '2023-11-07 17:25:12'),
(10, 0, 'inserted', '2023-11-15 13:44:28'),
(11, 0, 'inserted', '2023-11-15 13:45:12'),
(12, 1001, 'UPDATED', '2023-11-15 14:02:22'),
(13, 0, 'inserted', '2023-11-15 14:19:37'),
(14, 1003, 'UPDATED', '2023-11-15 14:20:00'),
(15, 1003, 'UPDATED', '2023-11-15 14:21:16'),
(16, 1003, 'UPDATED', '2023-11-16 10:55:40');

-- --------------------------------------------------------

--
-- Structure for view `course_exam_view`
--
DROP TABLE IF EXISTS `course_exam_view`;

DROP VIEW IF EXISTS `course_exam_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `course_exam_view`  AS SELECT `c`.`cou_name` AS `cou_name`, `e`.`exmne_id` AS `exmne_id` FROM (`course_tbl` `c` join `examinee_tbl` `e` on((`c`.`cou_id` = `e`.`exmne_course`)))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
