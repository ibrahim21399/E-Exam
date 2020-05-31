-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2020 at 03:09 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(2, 'admin@admin.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_email_address` varchar(150) NOT NULL,
  `admin_password` varchar(150) NOT NULL,
  `admin_verfication_code` varchar(100) NOT NULL,
  `admin_type` enum('master','sub_master') NOT NULL,
  `admin_created_on` datetime NOT NULL,
  `email_verified` enum('no','yes') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `qid` text NOT NULL,
  `ansid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`qid`, `ansid`) VALUES
('5ece8e556659e', '5ece8e55baacf'),
('5ece8e561a9bc', '5ece8e562b06f'),
('5ece8e566b559', '5ece8e5678ea4'),
('5ece8e56e0cd2', '5ece8e56f3ad5');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `department_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `faculty_id`, `department_name`, `status`) VALUES
(1, 1, 'SE', 1),
(2, 1, 'IT', 1),
(3, 1, 'IS', 1),
(4, 1, 'CS', 1),
(5, 1, 'BIO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `status`) VALUES
(1, 'fci', 1),
(2, 'engineering', 1),
(3, 'Arts', 1),
(4, 'science', 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `email` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `score` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `sahi` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `level_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `faculty_id`, `level_name`, `status`) VALUES
(1, 1, 'one', 1),
(2, 1, 'two', 1),
(3, 1, 'three', 1),
(4, 1, 'four', 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_table`
--

CREATE TABLE `online_exam_table` (
  `online_exam_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `online_exam_title` varchar(250) NOT NULL,
  `online_exam_datetime` datetime NOT NULL,
  `online_exam_duration` varchar(30) NOT NULL,
  `total_question` int(5) NOT NULL,
  `marks_per_right_answer` varchar(30) NOT NULL,
  `marks_per_wrong_answer` varchar(30) NOT NULL,
  `online_exam_created_on` datetime NOT NULL,
  `online_exam_status` enum('Pending','Created','Started','Completed') NOT NULL,
  `online_exam_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `qid` varchar(50) NOT NULL,
  `option` varchar(5000) NOT NULL,
  `optionid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`qid`, `option`, `optionid`) VALUES
('5ece8e556659e', '<18', '5ece8e55baac6'),
('5ece8e556659e', '>18', '5ece8e55baacf'),
('5ece8e556659e', '>22', '5ece8e55baad0'),
('5ece8e556659e', '<22', '5ece8e55baad1'),
('5ece8e561a9bc', '', '5ece8e562b06f'),
('5ece8e561a9bc', '', '5ece8e562b07b'),
('5ece8e561a9bc', '', '5ece8e562b07d'),
('5ece8e561a9bc', '', '5ece8e562b080'),
('5ece8e566b559', '', '5ece8e5678ea4'),
('5ece8e566b559', '', '5ece8e5678eb8'),
('5ece8e566b559', '', '5ece8e5678ebc'),
('5ece8e566b559', '', '5ece8e5678ebf'),
('5ece8e56e0cd2', '', '5ece8e56f3ad5'),
('5ece8e56e0cd2', '', '5ece8e56f3ae4'),
('5ece8e56e0cd2', '', '5ece8e56f3ae8'),
('5ece8e56e0cd2', '', '5ece8e56f3aeb');

-- --------------------------------------------------------

--
-- Table structure for table `option_table`
--

CREATE TABLE `option_table` (
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_number` int(2) NOT NULL,
  `option_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `name` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`name`, `gender`, `email`, `phone`, `faculty`, `department`, `course`, `password`) VALUES
('mai ramadan', 'F', 'alicelay22@gmail.com', 347477432, 'computer & information', 'se', 'it5645', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `eid` text NOT NULL,
  `qid` text NOT NULL,
  `qns` text NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`eid`, `qid`, `qns`, `choice`, `sn`) VALUES
('5ece8e2324e46', '5ece8e556659e', 'how old are you?', 4, 1),
('5ece8e2324e46', '5ece8e561a9bc', '', 4, 2),
('5ece8e2324e46', '5ece8e566b559', '', 4, 3),
('5ece8e2324e46', '5ece8e56e0cd2', '', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `question_table`
--

CREATE TABLE `question_table` (
  `question_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `question_title` text NOT NULL,
  `answer_option` enum('1','2','3','4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `eid` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `sahi` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `intro` text NOT NULL,
  `tag` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`eid`, `title`, `sahi`, `wrong`, `total`, `time`, `intro`, `tag`, `date`) VALUES
('5ece8e2324e46', 'Mai Ramadan', 2, 0, 4, 2, '', '33', '2020-05-27 15:58:27'),
('5ecf288ec5e06', 'Test', 0, 1, 4, 0, '', '', '2020-05-28 02:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `email` varchar(50) NOT NULL,
  `score` int(55) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `name` varchar(50) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `studentcode` int(20) NOT NULL,
  `phone` int(11) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `gender`, `email`, `studentcode`, `phone`, `faculty`, `level`, `department`, `password`) VALUES
('', '', '', 0, 0, '', '', '', ''),
('ONLINEEXAMHEMA', 'M', 'liga@gmail.com', 2147483647, 2147483647, '1', 'one', '4', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `un_professors`
--

CREATE TABLE `un_professors` (
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `faculty` varchar(55) NOT NULL,
  `department` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `un_students`
--

CREATE TABLE `un_students` (
  `name` varchar(50) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `studentcode` int(20) NOT NULL,
  `phone` int(11) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_exam_enroll_table`
--

CREATE TABLE `user_exam_enroll_table` (
  `user_exam_enroll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `attendance_status` enum('Absent','Present') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_exam_question_answer`
--

CREATE TABLE `user_exam_question_answer` (
  `user_exam_question_answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_answer_option` enum('0','1','2','3','4') NOT NULL,
  `marks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `online_exam_table`
--
ALTER TABLE `online_exam_table`
  ADD PRIMARY KEY (`online_exam_id`);

--
-- Indexes for table `option_table`
--
ALTER TABLE `option_table`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `question_table`
--
ALTER TABLE `question_table`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `un_professors`
--
ALTER TABLE `un_professors`
  ADD PRIMARY KEY (`gender`),
  ADD UNIQUE KEY `gender` (`gender`);

--
-- Indexes for table `un_students`
--
ALTER TABLE `un_students`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_exam_enroll_table`
--
ALTER TABLE `user_exam_enroll_table`
  ADD PRIMARY KEY (`user_exam_enroll_id`);

--
-- Indexes for table `user_exam_question_answer`
--
ALTER TABLE `user_exam_question_answer`
  ADD PRIMARY KEY (`user_exam_question_answer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `online_exam_table`
--
ALTER TABLE `online_exam_table`
  MODIFY `online_exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `option_table`
--
ALTER TABLE `option_table`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_table`
--
ALTER TABLE `question_table`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_exam_enroll_table`
--
ALTER TABLE `user_exam_enroll_table`
  MODIFY `user_exam_enroll_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_exam_question_answer`
--
ALTER TABLE `user_exam_question_answer`
  MODIFY `user_exam_question_answer_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
