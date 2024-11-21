-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2024 at 10:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2024-03-10 05:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `AttendanceTypeId` int(11) DEFAULT NULL,
  `Attendance` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`id`, `StudentId`, `ClassId`, `SubjectId`, `AttendanceTypeId`, `Attendance`, `PostingDate`, `UpdationDate`, `Session`) VALUES
(1, 32, 3, 4, 1, 70, '2024-08-29 21:28:33', NULL, '2024-25'),
(2, 32, 3, 1, 1, 80, '2024-08-29 21:28:33', NULL, '2024-25'),
(3, 32, 3, 2, 1, 50, '2024-08-29 21:28:33', NULL, '2024-25'),
(4, 32, 3, 3, 1, 50, '2024-08-29 21:28:33', '2024-08-29 21:28:47', '2024-25'),
(5, 32, 3, 5, 1, 72, '2024-08-29 21:28:33', NULL, '2024-25');

-- --------------------------------------------------------

--
-- Table structure for table `tblclasses`
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` varchar(80) DEFAULT NULL,
  `Year` varchar(80) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Year`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'MCA', '1', '1', 'I', '2024-08-16 21:21:21', NULL),
(2, 'MCA', '2', '1', 'II', '2024-08-16 21:21:39', NULL),
(3, 'MCA', '3', '2', 'III', '2024-08-16 21:21:48', NULL),
(4, 'MCA', '4', '2', 'IV', '2024-08-16 21:22:02', NULL),
(5, 'BCA', '5', '1', 'I', '2024-11-11 09:25:54', NULL),
(7, 'BCA', '6', '1', 'II', '2024-11-11 09:27:57', NULL),
(8, 'BCA', '7', '2', 'III', '2024-11-11 09:28:16', NULL),
(9, 'BCA', '8', '2', 'IV', '2024-11-11 09:28:40', NULL),
(10, 'BCA', '9', '3', 'V', '2024-11-11 09:28:53', NULL),
(11, 'BCA', '10', '3', 'VI', '2024-11-11 09:29:07', NULL),
(12, 'BCA', '11', '4', 'VII', '2024-11-11 09:29:21', NULL),
(13, 'BCA', '12', '4', 'VIII', '2024-11-11 09:29:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblexams`
--

CREATE TABLE `tblexams` (
  `id` int(11) NOT NULL,
  `ExamName` varchar(80) DEFAULT NULL,
  `ExamsNameNumeric` int(4) DEFAULT NULL,
  `ExamCode` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Marks` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='tblexams';

--
-- Dumping data for table `tblexams`
--

INSERT INTO `tblexams` (`id`, `ExamName`, `ExamsNameNumeric`, `ExamCode`, `CreationDate`, `UpdationDate`, `Marks`) VALUES
(1, 'Pre Unit Test (PUT)', 1, 'I', '2024-08-10 15:01:06', NULL, '80'),
(2, 'Sessional-I', 2, 'I', '2024-08-10 15:04:14', NULL, '20'),
(3, 'Sessional-II', 3, 'II', '2024-08-10 15:04:14', NULL, '20'),
(4, 'Midd Sem Exam (MSE)', 4, 'I', '2024-11-11 11:33:00', NULL, '60'),
(5, 'Term Exam - I', 5, 'I', '2024-11-11 11:33:31', NULL, '20'),
(6, 'Term Exam - II', 6, 'II', '2024-11-11 11:34:29', NULL, '20');

-- --------------------------------------------------------

--
-- Table structure for table `tbllearner`
--

CREATE TABLE `tbllearner` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `CombinedClassName` varchar(255) NOT NULL,
  `ExamTypeId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(80) NOT NULL,
  `RollId` varchar(80) NOT NULL,
  `SubjectName` varchar(80) NOT NULL,
  `Marks` int(80) NOT NULL,
  `LearnerCategory` enum('Fast','Slow','Weak','Fail') NOT NULL,
  `Grade` enum('A','B','C','D') NOT NULL,
  `PassStatus` enum('Pass','Fail') NOT NULL,
  `ResultStatus` enum('Pass','Fail') NOT NULL,
  `Session` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbllearner`
--

INSERT INTO `tbllearner` (`id`, `ClassId`, `CombinedClassName`, `ExamTypeId`, `StudentId`, `StudentName`, `RollId`, `SubjectName`, `Marks`, `LearnerCategory`, `Grade`, `PassStatus`, `ResultStatus`, `Session`) VALUES
(1, 3, 'MCA-2-III', 2, 1, 'Sanskruti Jagtap', '24MC2101', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(2, 3, 'MCA-2-III', 2, 1, 'Sanskruti Jagtap', '24MC2101', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(3, 3, 'MCA-2-III', 2, 1, 'Sanskruti Jagtap', '24MC2101', 'Python Programming', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(4, 3, 'MCA-2-III', 2, 1, 'Sanskruti Jagtap', '24MC2101', 'Artificial Intelligence', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(5, 3, 'MCA-2-III', 2, 1, 'Sanskruti Jagtap', '24MC2101', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(6, 3, 'MCA-2-III', 2, 2, 'Vaishnavi Bargat', '24MC2102', 'Big Data Analytics', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(7, 3, 'MCA-2-III', 2, 2, 'Vaishnavi Bargat', '24MC2102', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(8, 3, 'MCA-2-III', 2, 2, 'Vaishnavi Bargat', '24MC2102', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(9, 3, 'MCA-2-III', 2, 2, 'Vaishnavi Bargat', '24MC2102', 'Artificial Intelligence', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(10, 3, 'MCA-2-III', 2, 2, 'Vaishnavi Bargat', '24MC2102', 'Soft Computing', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(11, 3, 'MCA-2-III', 2, 3, 'Mamta Pimpalkar', '24MC2103', 'Big Data Analytics', 8, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(12, 3, 'MCA-2-III', 2, 3, 'Mamta Pimpalkar', '24MC2103', 'Data Mining', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(13, 3, 'MCA-2-III', 2, 3, 'Mamta Pimpalkar', '24MC2103', 'Python Programming', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(14, 3, 'MCA-2-III', 2, 3, 'Mamta Pimpalkar', '24MC2103', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(15, 3, 'MCA-2-III', 2, 3, 'Mamta Pimpalkar', '24MC2103', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(16, 3, 'MCA-2-III', 2, 4, 'Madhavi Mistry', '24MC2104', 'Big Data Analytics', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(17, 3, 'MCA-2-III', 2, 4, 'Madhavi Mistry', '24MC2104', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(18, 3, 'MCA-2-III', 2, 4, 'Madhavi Mistry', '24MC2104', 'Python Programming', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(19, 3, 'MCA-2-III', 2, 4, 'Madhavi Mistry', '24MC2104', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(20, 3, 'MCA-2-III', 2, 4, 'Madhavi Mistry', '24MC2104', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(21, 3, 'MCA-2-III', 2, 5, 'Neha Donadkar', '24MC2105', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(22, 3, 'MCA-2-III', 2, 5, 'Neha Donadkar', '24MC2105', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(23, 3, 'MCA-2-III', 2, 5, 'Neha Donadkar', '24MC2105', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(24, 3, 'MCA-2-III', 2, 5, 'Neha Donadkar', '24MC2105', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(25, 3, 'MCA-2-III', 2, 5, 'Neha Donadkar', '24MC2105', 'Soft Computing', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(26, 3, 'MCA-2-III', 2, 6, 'Bhawana Asatkar', '24MC2106', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(27, 3, 'MCA-2-III', 2, 6, 'Bhawana Asatkar', '24MC2106', 'Data Mining', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(28, 3, 'MCA-2-III', 2, 6, 'Bhawana Asatkar', '24MC2106', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(29, 3, 'MCA-2-III', 2, 6, 'Bhawana Asatkar', '24MC2106', 'Artificial Intelligence', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(30, 3, 'MCA-2-III', 2, 6, 'Bhawana Asatkar', '24MC2106', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(31, 3, 'MCA-2-III', 2, 7, 'Arpit Ninawe', '24MC2107', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(32, 3, 'MCA-2-III', 2, 7, 'Arpit Ninawe', '24MC2107', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(33, 3, 'MCA-2-III', 2, 7, 'Arpit Ninawe', '24MC2107', 'Python Programming', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(34, 3, 'MCA-2-III', 2, 7, 'Arpit Ninawe', '24MC2107', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(35, 3, 'MCA-2-III', 2, 7, 'Arpit Ninawe', '24MC2107', 'Soft Computing', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(36, 3, 'MCA-2-III', 2, 8, 'Shruti Dhomne', '24MC2108', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(37, 3, 'MCA-2-III', 2, 8, 'Shruti Dhomne', '24MC2108', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(38, 3, 'MCA-2-III', 2, 8, 'Shruti Dhomne', '24MC2108', 'Python Programming', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(39, 3, 'MCA-2-III', 2, 8, 'Shruti Dhomne', '24MC2108', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(40, 3, 'MCA-2-III', 2, 8, 'Shruti Dhomne', '24MC2108', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(41, 3, 'MCA-2-III', 2, 9, 'Prajwal Madavi', '24MC2109', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(42, 3, 'MCA-2-III', 2, 9, 'Prajwal Madavi', '24MC2109', 'Data Mining', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(43, 3, 'MCA-2-III', 2, 9, 'Prajwal Madavi', '24MC2109', 'Python Programming', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(44, 3, 'MCA-2-III', 2, 9, 'Prajwal Madavi', '24MC2109', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(45, 3, 'MCA-2-III', 2, 9, 'Prajwal Madavi', '24MC2109', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(46, 3, 'MCA-2-III', 2, 10, 'Anand Jugnake', '24MC2110', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(47, 3, 'MCA-2-III', 2, 10, 'Anand Jugnake', '24MC2110', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(48, 3, 'MCA-2-III', 2, 10, 'Anand Jugnake', '24MC2110', 'Python Programming', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(49, 3, 'MCA-2-III', 2, 10, 'Anand Jugnake', '24MC2110', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(50, 3, 'MCA-2-III', 2, 10, 'Anand Jugnake', '24MC2110', 'Soft Computing', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(51, 3, 'MCA-2-III', 2, 11, 'Achal Patil', '24MC2111', 'Big Data Analytics', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(52, 3, 'MCA-2-III', 2, 11, 'Achal Patil', '24MC2111', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(53, 3, 'MCA-2-III', 2, 11, 'Achal Patil', '24MC2111', 'Python Programming', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(54, 3, 'MCA-2-III', 2, 11, 'Achal Patil', '24MC2111', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(55, 3, 'MCA-2-III', 2, 11, 'Achal Patil', '24MC2111', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(56, 3, 'MCA-2-III', 2, 12, 'Vaishnavi Raut', '24MC2112', 'Big Data Analytics', 9, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(57, 3, 'MCA-2-III', 2, 12, 'Vaishnavi Raut', '24MC2112', 'Data Mining', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(58, 3, 'MCA-2-III', 2, 12, 'Vaishnavi Raut', '24MC2112', 'Python Programming', 9, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(59, 3, 'MCA-2-III', 2, 12, 'Vaishnavi Raut', '24MC2112', 'Artificial Intelligence', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(60, 3, 'MCA-2-III', 2, 12, 'Vaishnavi Raut', '24MC2112', 'Soft Computing', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(61, 3, 'MCA-2-III', 2, 13, 'Saurabh Shwelkar', '24MC2113', 'Big Data Analytics', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(62, 3, 'MCA-2-III', 2, 13, 'Saurabh Shwelkar', '24MC2113', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(63, 3, 'MCA-2-III', 2, 13, 'Saurabh Shwelkar', '24MC2113', 'Python Programming', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(64, 3, 'MCA-2-III', 2, 13, 'Saurabh Shwelkar', '24MC2113', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(65, 3, 'MCA-2-III', 2, 13, 'Saurabh Shwelkar', '24MC2113', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(66, 3, 'MCA-2-III', 2, 14, 'Chitra Malode', '24MC2114', 'Big Data Analytics', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(67, 3, 'MCA-2-III', 2, 14, 'Chitra Malode', '24MC2114', 'Data Mining', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(68, 3, 'MCA-2-III', 2, 14, 'Chitra Malode', '24MC2114', 'Python Programming', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(69, 3, 'MCA-2-III', 2, 14, 'Chitra Malode', '24MC2114', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(70, 3, 'MCA-2-III', 2, 14, 'Chitra Malode', '24MC2114', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(71, 3, 'MCA-2-III', 2, 15, 'Sajid Sheikh', '24MC2115', 'Big Data Analytics', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(72, 3, 'MCA-2-III', 2, 15, 'Sajid Sheikh', '24MC2115', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(73, 3, 'MCA-2-III', 2, 15, 'Sajid Sheikh', '24MC2115', 'Python Programming', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(74, 3, 'MCA-2-III', 2, 15, 'Sajid Sheikh', '24MC2115', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(75, 3, 'MCA-2-III', 2, 15, 'Sajid Sheikh', '24MC2115', 'Soft Computing', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(76, 3, 'MCA-2-III', 2, 16, 'Harshal Pathrabe', '24MC2116', 'Big Data Analytics', 9, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(77, 3, 'MCA-2-III', 2, 16, 'Harshal Pathrabe', '24MC2116', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(78, 3, 'MCA-2-III', 2, 16, 'Harshal Pathrabe', '24MC2116', 'Python Programming', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(79, 3, 'MCA-2-III', 2, 16, 'Harshal Pathrabe', '24MC2116', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(80, 3, 'MCA-2-III', 2, 16, 'Harshal Pathrabe', '24MC2116', 'Soft Computing', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(81, 3, 'MCA-2-III', 2, 17, 'Maithili Andankar', '24MC2117', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(82, 3, 'MCA-2-III', 2, 17, 'Maithili Andankar', '24MC2117', 'Data Mining', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(83, 3, 'MCA-2-III', 2, 17, 'Maithili Andankar', '24MC2117', 'Python Programming', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(84, 3, 'MCA-2-III', 2, 17, 'Maithili Andankar', '24MC2117', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(85, 3, 'MCA-2-III', 2, 17, 'Maithili Andankar', '24MC2117', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(86, 3, 'MCA-2-III', 2, 18, 'Aditya Shete', '24MC2118', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(87, 3, 'MCA-2-III', 2, 18, 'Aditya Shete', '24MC2118', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(88, 3, 'MCA-2-III', 2, 18, 'Aditya Shete', '24MC2118', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(89, 3, 'MCA-2-III', 2, 18, 'Aditya Shete', '24MC2118', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(90, 3, 'MCA-2-III', 2, 18, 'Aditya Shete', '24MC2118', 'Soft Computing', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(91, 3, 'MCA-2-III', 2, 19, 'Khushi Gour', '24MC2119', 'Big Data Analytics', 17, 'Fast', 'A', 'Pass', 'Fail', '2024-25'),
(92, 3, 'MCA-2-III', 2, 19, 'Khushi Gour', '24MC2119', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Fail', '2024-25'),
(93, 3, 'MCA-2-III', 2, 19, 'Khushi Gour', '24MC2119', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(94, 3, 'MCA-2-III', 2, 19, 'Khushi Gour', '24MC2119', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(95, 3, 'MCA-2-III', 2, 19, 'Khushi Gour', '24MC2119', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(96, 3, 'MCA-2-III', 2, 20, 'Nakshtra Patrange', '24MC2120', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(97, 3, 'MCA-2-III', 2, 20, 'Nakshtra Patrange', '24MC2120', 'Data Mining', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(98, 3, 'MCA-2-III', 2, 20, 'Nakshtra Patrange', '24MC2120', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(99, 3, 'MCA-2-III', 2, 20, 'Nakshtra Patrange', '24MC2120', 'Artificial Intelligence', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(100, 3, 'MCA-2-III', 2, 20, 'Nakshtra Patrange', '24MC2120', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(101, 3, 'MCA-2-III', 2, 21, 'Jayant Tekam', '24MC2121', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(102, 3, 'MCA-2-III', 2, 21, 'Jayant Tekam', '24MC2121', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(103, 3, 'MCA-2-III', 2, 21, 'Jayant Tekam', '24MC2121', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(104, 3, 'MCA-2-III', 2, 21, 'Jayant Tekam', '24MC2121', 'Artificial Intelligence', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(105, 3, 'MCA-2-III', 2, 21, 'Jayant Tekam', '24MC2121', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(106, 3, 'MCA-2-III', 2, 22, 'Rupal Khobragade', '24MC2122', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(107, 3, 'MCA-2-III', 2, 22, 'Rupal Khobragade', '24MC2122', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(108, 3, 'MCA-2-III', 2, 22, 'Rupal Khobragade', '24MC2122', 'Python Programming', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(109, 3, 'MCA-2-III', 2, 22, 'Rupal Khobragade', '24MC2122', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(110, 3, 'MCA-2-III', 2, 22, 'Rupal Khobragade', '24MC2122', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(111, 3, 'MCA-2-III', 2, 23, 'Pratham Yadv', '24MC2123', 'Big Data Analytics', 9, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(112, 3, 'MCA-2-III', 2, 23, 'Pratham Yadv', '24MC2123', 'Data Mining', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(113, 3, 'MCA-2-III', 2, 23, 'Pratham Yadv', '24MC2123', 'Python Programming', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(114, 3, 'MCA-2-III', 2, 23, 'Pratham Yadv', '24MC2123', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(115, 3, 'MCA-2-III', 2, 23, 'Pratham Yadv', '24MC2123', 'Soft Computing', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(116, 3, 'MCA-2-III', 2, 24, 'Tejas Nemad', '24MC2124', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(117, 3, 'MCA-2-III', 2, 24, 'Tejas Nemad', '24MC2124', 'Data Mining', 8, 'Weak', 'C', 'Pass', 'Fail', '2024-25'),
(118, 3, 'MCA-2-III', 2, 24, 'Tejas Nemad', '24MC2124', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(119, 3, 'MCA-2-III', 2, 24, 'Tejas Nemad', '24MC2124', 'Artificial Intelligence', 2, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(120, 3, 'MCA-2-III', 2, 24, 'Tejas Nemad', '24MC2124', 'Soft Computing', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(121, 3, 'MCA-2-III', 2, 25, 'Akansha Patil', '24MC2125', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(122, 3, 'MCA-2-III', 2, 25, 'Akansha Patil', '24MC2125', 'Data Mining', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(123, 3, 'MCA-2-III', 2, 25, 'Akansha Patil', '24MC2125', 'Python Programming', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(124, 3, 'MCA-2-III', 2, 25, 'Akansha Patil', '24MC2125', 'Artificial Intelligence', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(125, 3, 'MCA-2-III', 2, 25, 'Akansha Patil', '24MC2125', 'Soft Computing', 9, 'Weak', 'C', 'Pass', 'Pass', '2024-25'),
(126, 3, 'MCA-2-III', 2, 26, 'Ajay Barve', '24MC2126', 'Big Data Analytics', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(127, 3, 'MCA-2-III', 2, 26, 'Ajay Barve', '24MC2126', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(128, 3, 'MCA-2-III', 2, 26, 'Ajay Barve', '24MC2126', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(129, 3, 'MCA-2-III', 2, 26, 'Ajay Barve', '24MC2126', 'Artificial Intelligence', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(130, 3, 'MCA-2-III', 2, 26, 'Ajay Barve', '24MC2126', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(131, 3, 'MCA-2-III', 2, 27, 'Akhilesh Hadke', '24MC2127', 'Big Data Analytics', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(132, 3, 'MCA-2-III', 2, 27, 'Akhilesh Hadke', '24MC2127', 'Data Mining', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(133, 3, 'MCA-2-III', 2, 27, 'Akhilesh Hadke', '24MC2127', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(134, 3, 'MCA-2-III', 2, 27, 'Akhilesh Hadke', '24MC2127', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(135, 3, 'MCA-2-III', 2, 27, 'Akhilesh Hadke', '24MC2127', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(136, 3, 'MCA-2-III', 2, 28, 'Sandhya Masram', '24MC2128', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(137, 3, 'MCA-2-III', 2, 28, 'Sandhya Masram', '24MC2128', 'Data Mining', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(138, 3, 'MCA-2-III', 2, 28, 'Sandhya Masram', '24MC2128', 'Python Programming', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(139, 3, 'MCA-2-III', 2, 28, 'Sandhya Masram', '24MC2128', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(140, 3, 'MCA-2-III', 2, 28, 'Sandhya Masram', '24MC2128', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(141, 3, 'MCA-2-III', 2, 29, 'Kanchan Satpudke', '24MC2129', 'Big Data Analytics', 6, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(142, 3, 'MCA-2-III', 2, 29, 'Kanchan Satpudke', '24MC2129', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(143, 3, 'MCA-2-III', 2, 29, 'Kanchan Satpudke', '24MC2129', 'Python Programming', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(144, 3, 'MCA-2-III', 2, 29, 'Kanchan Satpudke', '24MC2129', 'Artificial Intelligence', 15, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(145, 3, 'MCA-2-III', 2, 29, 'Kanchan Satpudke', '24MC2129', 'Soft Computing', 16, 'Fast', 'A', 'Pass', 'Fail', '2024-25'),
(146, 3, 'MCA-2-III', 2, 30, 'Sonal Barde', '24MC2130', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(147, 3, 'MCA-2-III', 2, 30, 'Sonal Barde', '24MC2130', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(148, 3, 'MCA-2-III', 2, 30, 'Sonal Barde', '24MC2130', 'Python Programming', 4, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(149, 3, 'MCA-2-III', 2, 30, 'Sonal Barde', '24MC2130', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(150, 3, 'MCA-2-III', 2, 30, 'Sonal Barde', '24MC2130', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(151, 3, 'MCA-2-III', 2, 31, 'Gaurav Kapse', '24MC2131', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(152, 3, 'MCA-2-III', 2, 31, 'Gaurav Kapse', '24MC2131', 'Data Mining', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(153, 3, 'MCA-2-III', 2, 31, 'Gaurav Kapse', '24MC2131', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(154, 3, 'MCA-2-III', 2, 31, 'Gaurav Kapse', '24MC2131', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(155, 3, 'MCA-2-III', 2, 31, 'Gaurav Kapse', '24MC2131', 'Soft Computing', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(156, 3, 'MCA-2-III', 2, 32, 'Yash Ttitirmare', '24MC2132', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(157, 3, 'MCA-2-III', 2, 32, 'Yash Ttitirmare', '24MC2132', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(158, 3, 'MCA-2-III', 2, 32, 'Yash Ttitirmare', '24MC2132', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(159, 3, 'MCA-2-III', 2, 32, 'Yash Ttitirmare', '24MC2132', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(160, 3, 'MCA-2-III', 2, 32, 'Yash Ttitirmare', '24MC2132', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(161, 3, 'MCA-2-III', 2, 33, 'Harshita Poharkar', '24MC2133', 'Big Data Analytics', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(162, 3, 'MCA-2-III', 2, 33, 'Harshita Poharkar', '24MC2133', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(163, 3, 'MCA-2-III', 2, 33, 'Harshita Poharkar', '24MC2133', 'Python Programming', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(164, 3, 'MCA-2-III', 2, 33, 'Harshita Poharkar', '24MC2133', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(165, 3, 'MCA-2-III', 2, 33, 'Harshita Poharkar', '24MC2133', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(166, 3, 'MCA-2-III', 2, 34, 'Suchita Bawne', '24MC2134', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(167, 3, 'MCA-2-III', 2, 34, 'Suchita Bawne', '24MC2134', 'Data Mining', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(168, 3, 'MCA-2-III', 2, 34, 'Suchita Bawne', '24MC2134', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(169, 3, 'MCA-2-III', 2, 34, 'Suchita Bawne', '24MC2134', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(170, 3, 'MCA-2-III', 2, 34, 'Suchita Bawne', '24MC2134', 'Soft Computing', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(171, 3, 'MCA-2-III', 2, 35, 'Yash Baksare', '24MC2135', 'Big Data Analytics', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(172, 3, 'MCA-2-III', 2, 35, 'Yash Baksare', '24MC2135', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(173, 3, 'MCA-2-III', 2, 35, 'Yash Baksare', '24MC2135', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(174, 3, 'MCA-2-III', 2, 35, 'Yash Baksare', '24MC2135', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(175, 3, 'MCA-2-III', 2, 35, 'Yash Baksare', '24MC2135', 'Soft Computing', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(176, 3, 'MCA-2-III', 2, 36, 'Swapnil Somkuwar', '24MC2136', 'Big Data Analytics', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(177, 3, 'MCA-2-III', 2, 36, 'Swapnil Somkuwar', '24MC2136', 'Data Mining', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(178, 3, 'MCA-2-III', 2, 36, 'Swapnil Somkuwar', '24MC2136', 'Python Programming', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(179, 3, 'MCA-2-III', 2, 36, 'Swapnil Somkuwar', '24MC2136', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(180, 3, 'MCA-2-III', 2, 36, 'Swapnil Somkuwar', '24MC2136', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(181, 3, 'MCA-2-III', 2, 37, 'Prajwal Bobade', '24MC2137', 'Big Data Analytics', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(182, 3, 'MCA-2-III', 2, 37, 'Prajwal Bobade', '24MC2137', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(183, 3, 'MCA-2-III', 2, 37, 'Prajwal Bobade', '24MC2137', 'Python Programming', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(184, 3, 'MCA-2-III', 2, 37, 'Prajwal Bobade', '24MC2137', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(185, 3, 'MCA-2-III', 2, 37, 'Prajwal Bobade', '24MC2137', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(186, 3, 'MCA-2-III', 2, 38, 'Rohini Bhowate', '24MC2138', 'Big Data Analytics', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(187, 3, 'MCA-2-III', 2, 38, 'Rohini Bhowate', '24MC2138', 'Data Mining', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(188, 3, 'MCA-2-III', 2, 38, 'Rohini Bhowate', '24MC2138', 'Python Programming', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(189, 3, 'MCA-2-III', 2, 38, 'Rohini Bhowate', '24MC2138', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(190, 3, 'MCA-2-III', 2, 38, 'Rohini Bhowate', '24MC2138', 'Soft Computing', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(191, 3, 'MCA-2-III', 2, 39, 'Aditya Sirsat', '24MC2139', 'Big Data Analytics', 11, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(192, 3, 'MCA-2-III', 2, 39, 'Aditya Sirsat', '24MC2139', 'Data Mining', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(193, 3, 'MCA-2-III', 2, 39, 'Aditya Sirsat', '24MC2139', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(194, 3, 'MCA-2-III', 2, 39, 'Aditya Sirsat', '24MC2139', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(195, 3, 'MCA-2-III', 2, 39, 'Aditya Sirsat', '24MC2139', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(196, 3, 'MCA-2-III', 2, 40, 'Mansi Khade', '24MC2140', 'Big Data Analytics', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(197, 3, 'MCA-2-III', 2, 40, 'Mansi Khade', '24MC2140', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(198, 3, 'MCA-2-III', 2, 40, 'Mansi Khade', '24MC2140', 'Python Programming', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(199, 3, 'MCA-2-III', 2, 40, 'Mansi Khade', '24MC2140', 'Artificial Intelligence', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(200, 3, 'MCA-2-III', 2, 40, 'Mansi Khade', '24MC2140', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(201, 3, 'MCA-2-III', 2, 41, 'Sandip Gawali', '24MC2141', 'Big Data Analytics', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(202, 3, 'MCA-2-III', 2, 41, 'Sandip Gawali', '24MC2141', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(203, 3, 'MCA-2-III', 2, 41, 'Sandip Gawali', '24MC2141', 'Python Programming', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(204, 3, 'MCA-2-III', 2, 41, 'Sandip Gawali', '24MC2141', 'Artificial Intelligence', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(205, 3, 'MCA-2-III', 2, 41, 'Sandip Gawali', '24MC2141', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(206, 3, 'MCA-2-III', 2, 42, 'Payal Bankar', '24MC2142', 'Big Data Analytics', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(207, 3, 'MCA-2-III', 2, 42, 'Payal Bankar', '24MC2142', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(208, 3, 'MCA-2-III', 2, 42, 'Payal Bankar', '24MC2142', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(209, 3, 'MCA-2-III', 2, 42, 'Payal Bankar', '24MC2142', 'Artificial Intelligence', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(210, 3, 'MCA-2-III', 2, 42, 'Payal Bankar', '24MC2142', 'Soft Computing', 19, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(211, 3, 'MCA-2-III', 2, 43, 'Prajwal Dharnedhar', '24MC2143', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(212, 3, 'MCA-2-III', 2, 43, 'Prajwal Dharnedhar', '24MC2143', 'Data Mining', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(213, 3, 'MCA-2-III', 2, 43, 'Prajwal Dharnedhar', '24MC2143', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(214, 3, 'MCA-2-III', 2, 43, 'Prajwal Dharnedhar', '24MC2143', 'Artificial Intelligence', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(215, 3, 'MCA-2-III', 2, 43, 'Prajwal Dharnedhar', '24MC2143', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(216, 3, 'MCA-2-III', 2, 44, 'Paras Mulwande', '24MC2144', 'Big Data Analytics', 4, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(217, 3, 'MCA-2-III', 2, 44, 'Paras Mulwande', '24MC2144', 'Data Mining', 4, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(218, 3, 'MCA-2-III', 2, 44, 'Paras Mulwande', '24MC2144', 'Python Programming', 8, 'Weak', 'C', 'Pass', 'Fail', '2024-25'),
(219, 3, 'MCA-2-III', 2, 44, 'Paras Mulwande', '24MC2144', 'Artificial Intelligence', 2, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(220, 3, 'MCA-2-III', 2, 44, 'Paras Mulwande', '24MC2144', 'Soft Computing', 6, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(221, 3, 'MCA-2-III', 2, 45, 'Nishant Sathawane', '24MC2145', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(222, 3, 'MCA-2-III', 2, 45, 'Nishant Sathawane', '24MC2145', 'Data Mining', 14, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(223, 3, 'MCA-2-III', 2, 45, 'Nishant Sathawane', '24MC2145', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(224, 3, 'MCA-2-III', 2, 45, 'Nishant Sathawane', '24MC2145', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(225, 3, 'MCA-2-III', 2, 45, 'Nishant Sathawane', '24MC2145', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(226, 3, 'MCA-2-III', 2, 46, 'Diksha Tiwari', '24MC2146', 'Big Data Analytics', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(227, 3, 'MCA-2-III', 2, 46, 'Diksha Tiwari', '24MC2146', 'Data Mining', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(228, 3, 'MCA-2-III', 2, 46, 'Diksha Tiwari', '24MC2146', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(229, 3, 'MCA-2-III', 2, 46, 'Diksha Tiwari', '24MC2146', 'Artificial Intelligence', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(230, 3, 'MCA-2-III', 2, 46, 'Diksha Tiwari', '24MC2146', 'Soft Computing', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(231, 3, 'MCA-2-III', 2, 47, 'Sanket Bawangade', '24MC2147', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(232, 3, 'MCA-2-III', 2, 47, 'Sanket Bawangade', '24MC2147', 'Data Mining', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(233, 3, 'MCA-2-III', 2, 47, 'Sanket Bawangade', '24MC2147', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(234, 3, 'MCA-2-III', 2, 47, 'Sanket Bawangade', '24MC2147', 'Artificial Intelligence', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(235, 3, 'MCA-2-III', 2, 47, 'Sanket Bawangade', '24MC2147', 'Soft Computing', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(236, 3, 'MCA-2-III', 2, 48, 'Mayuri Dudhe', '24MC2148', 'Big Data Analytics', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(237, 3, 'MCA-2-III', 2, 48, 'Mayuri Dudhe', '24MC2148', 'Data Mining', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(238, 3, 'MCA-2-III', 2, 48, 'Mayuri Dudhe', '24MC2148', 'Python Programming', 20, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(239, 3, 'MCA-2-III', 2, 48, 'Mayuri Dudhe', '24MC2148', 'Artificial Intelligence', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(240, 3, 'MCA-2-III', 2, 48, 'Mayuri Dudhe', '24MC2148', 'Soft Computing', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(241, 3, 'MCA-2-III', 2, 49, 'Purvi Meshram', '24MC2149', 'Big Data Analytics', 13, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(242, 3, 'MCA-2-III', 2, 49, 'Purvi Meshram', '24MC2149', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(243, 3, 'MCA-2-III', 2, 49, 'Purvi Meshram', '24MC2149', 'Python Programming', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(244, 3, 'MCA-2-III', 2, 49, 'Purvi Meshram', '24MC2149', 'Artificial Intelligence', 10, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(245, 3, 'MCA-2-III', 2, 49, 'Purvi Meshram', '24MC2149', 'Soft Computing', 14, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(246, 3, 'MCA-2-III', 2, 50, 'Amish Tembhurne', '24MC2150', 'Big Data Analytics', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(247, 3, 'MCA-2-III', 2, 50, 'Amish Tembhurne', '24MC2150', 'Data Mining', 8, 'Weak', 'C', 'Pass', 'Fail', '2024-25'),
(248, 3, 'MCA-2-III', 2, 50, 'Amish Tembhurne', '24MC2150', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(249, 3, 'MCA-2-III', 2, 50, 'Amish Tembhurne', '24MC2150', 'Artificial Intelligence', 3, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(250, 3, 'MCA-2-III', 2, 50, 'Amish Tembhurne', '24MC2150', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(251, 3, 'MCA-2-III', 2, 51, 'Astha Gupta', '24MC2151', 'Big Data Analytics', 17, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(252, 3, 'MCA-2-III', 2, 51, 'Astha Gupta', '24MC2151', 'Data Mining', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(253, 3, 'MCA-2-III', 2, 51, 'Astha Gupta', '24MC2151', 'Python Programming', 16, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(254, 3, 'MCA-2-III', 2, 51, 'Astha Gupta', '24MC2151', 'Artificial Intelligence', 18, 'Fast', 'A', 'Pass', 'Pass', '2024-25'),
(255, 3, 'MCA-2-III', 2, 51, 'Astha Gupta', '24MC2151', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Pass', '2024-25'),
(256, 3, 'MCA-2-III', 2, 52, 'Vaibhav Bagde', '24MC2152', 'Big Data Analytics', 14, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(257, 3, 'MCA-2-III', 2, 52, 'Vaibhav Bagde', '24MC2152', 'Data Mining', 15, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(258, 3, 'MCA-2-III', 2, 52, 'Vaibhav Bagde', '24MC2152', 'Python Programming', 14, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(259, 3, 'MCA-2-III', 2, 52, 'Vaibhav Bagde', '24MC2152', 'Artificial Intelligence', 6, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(260, 3, 'MCA-2-III', 2, 52, 'Vaibhav Bagde', '24MC2152', 'Soft Computing', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(261, 3, 'MCA-2-III', 2, 53, 'Arya Agasti', '24MC2153', 'Big Data Analytics', 10, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(262, 3, 'MCA-2-III', 2, 53, 'Arya Agasti', '24MC2153', 'Data Mining', 4, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(263, 3, 'MCA-2-III', 2, 53, 'Arya Agasti', '24MC2153', 'Python Programming', 12, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(264, 3, 'MCA-2-III', 2, 53, 'Arya Agasti', '24MC2153', 'Artificial Intelligence', 4, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(265, 3, 'MCA-2-III', 2, 53, 'Arya Agasti', '24MC2153', 'Soft Computing', 11, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(266, 3, 'MCA-2-III', 2, 54, 'Pallavi Lanjewar', '24MC2154', 'Big Data Analytics', 16, 'Fast', 'A', 'Pass', 'Fail', '2024-25'),
(267, 3, 'MCA-2-III', 2, 54, 'Pallavi Lanjewar', '24MC2154', 'Data Mining', 19, 'Fast', 'A', 'Pass', 'Fail', '2024-25'),
(268, 3, 'MCA-2-III', 2, 54, 'Pallavi Lanjewar', '24MC2154', 'Python Programming', 0, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(269, 3, 'MCA-2-III', 2, 54, 'Pallavi Lanjewar', '24MC2154', 'Artificial Intelligence', 12, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(270, 3, 'MCA-2-III', 2, 54, 'Pallavi Lanjewar', '24MC2154', 'Soft Computing', 15, 'Slow', 'B', 'Pass', 'Fail', '2024-25'),
(271, 3, 'MCA-2-III', 2, 55, 'Ganesh Hedau', '24MC2155', 'Big Data Analytics', 1, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(272, 3, 'MCA-2-III', 2, 55, 'Ganesh Hedau', '24MC2155', 'Data Mining', 1, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(273, 3, 'MCA-2-III', 2, 55, 'Ganesh Hedau', '24MC2155', 'Python Programming', 5, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(274, 3, 'MCA-2-III', 2, 55, 'Ganesh Hedau', '24MC2155', 'Artificial Intelligence', 1, 'Fail', 'D', 'Fail', 'Fail', '2024-25'),
(275, 3, 'MCA-2-III', 2, 55, 'Ganesh Hedau', '24MC2155', 'Soft Computing', 1, 'Fail', 'D', 'Fail', 'Fail', '2024-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbllearnercategorycount`
--

CREATE TABLE `tbllearnercategorycount` (
  `id` int(11) NOT NULL,
  `ExamName` varchar(255) DEFAULT NULL,
  `Session` varchar(255) DEFAULT NULL,
  `ClassName` varchar(255) DEFAULT NULL,
  `Year` varchar(80) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `Fast` int(11) DEFAULT 0,
  `Slow` int(11) DEFAULT 0,
  `Weak` int(11) DEFAULT 0,
  `Fail` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbllearnercategorycount`
--

INSERT INTO `tbllearnercategorycount` (`id`, `ExamName`, `Session`, `ClassName`, `Year`, `Section`, `Fast`, `Slow`, `Weak`, `Fail`) VALUES
(1, 'Sessional-I', '2024-25', 'MCA', '2', 'III', 69, 152, 9, 45);

-- --------------------------------------------------------

--
-- Table structure for table `tblnotice`
--

CREATE TABLE `tblnotice` (
  `id` int(11) NOT NULL,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnotice`
--

INSERT INTO `tblnotice` (`id`, `noticeTitle`, `noticeDetails`, `postingDate`) VALUES
(1, 'Notice regarding result Delearation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing elit ut aliquam purus. Vel risus commodo viverra maecenas. Et netus et malesuada fames ac turpis egestas sed. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla. Ornare arcu odio ut sem nulla pharetra diam. Vel pharetra vel turpis nunc eget lorem dolor sed. Velit ut tortor pretium viverra suspendisse. In ornare quam viverra orci sagittis eu. Viverra tellus in hac habitasse. Donec massa sapien faucibus et molestie. Libero justo laoreet sit amet cursus sit amet dictum. Dignissim diam quis enim lobortis scelerisque fermentum dui.\r\n\r\nEget nulla facilisi etiam dignissim. Quisque non tellus orci ac. Amet cursus sit amet dictum sit amet justo donec. Interdum velit euismod in pellentesque massa. Condimentum lacinia quis vel eros donec ac odio. Magna eget est lorem ipsum dolor. Bibendum at varius vel pharetra vel turpis nunc eget lorem. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Massa tincidunt dui ut ornare lectus sit amet est placerat. Nisi quis eleifend quam adipiscing vitae.', '2024-05-01 09:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `ExamTypeId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `ExamTypeId`, `marks`, `PostingDate`, `UpdationDate`, `Session`) VALUES
(1, 1, 3, 4, 2, 18, '2024-08-21 21:36:10', '2024-08-22 19:15:48', '2024-25'),
(2, 1, 3, 1, 2, 10, '2024-08-21 21:36:10', NULL, '2024-25'),
(3, 1, 3, 2, 2, 17, '2024-08-21 21:36:10', NULL, '2024-25'),
(4, 1, 3, 3, 2, 13, '2024-08-21 21:36:10', NULL, '2024-25'),
(5, 1, 3, 5, 2, 17, '2024-08-21 21:36:10', '2024-08-22 19:15:48', '2024-25'),
(6, 2, 3, 4, 2, 15, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(7, 2, 3, 1, 2, 14, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(8, 2, 3, 2, 2, 18, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(9, 2, 3, 3, 2, 20, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(10, 2, 3, 5, 2, 16, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(11, 3, 3, 4, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(12, 3, 3, 1, 2, 8, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(13, 3, 3, 2, 2, 10, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(14, 3, 3, 3, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(15, 3, 3, 5, 2, 11, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(16, 4, 3, 4, 2, 16, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(17, 4, 3, 1, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(18, 4, 3, 2, 2, 17, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(19, 4, 3, 3, 2, 10, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(20, 4, 3, 5, 2, 15, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(21, 5, 3, 1, 2, 11, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(22, 5, 3, 2, 2, 16, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(23, 5, 3, 3, 2, 20, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(24, 5, 3, 4, 2, 16, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(25, 5, 3, 5, 2, 16, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(26, 6, 3, 1, 2, 0, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(27, 6, 3, 2, 2, 0, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(28, 6, 3, 3, 2, 0, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(29, 6, 3, 4, 2, 0, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(30, 6, 3, 5, 2, 0, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(31, 7, 3, 1, 2, 11, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(32, 7, 3, 2, 2, 13, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(33, 7, 3, 3, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(34, 7, 3, 4, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(35, 7, 3, 5, 2, 12, '2022-08-24 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(36, 8, 3, 1, 2, 11, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(37, 8, 3, 2, 2, 13, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(38, 8, 3, 3, 2, 18, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(39, 8, 3, 4, 2, 16, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(40, 8, 3, 5, 2, 15, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(41, 9, 3, 1, 2, 13, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(42, 9, 3, 2, 2, 14, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(43, 9, 3, 3, 2, 17, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(44, 9, 3, 4, 2, 13, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(45, 9, 3, 5, 2, 14, '2024-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(46, 10, 3, 1, 2, 11, '2025-08-22 19:15:10', '2024-08-22 22:07:27', '2024-25'),
(47, 10, 3, 2, 2, 15, '2026-08-22 19:15:10', '2024-08-22 22:07:31', '2024-25'),
(48, 10, 3, 3, 2, 16, '2027-08-22 19:15:10', '2024-08-22 22:07:36', '2024-25'),
(49, 10, 3, 4, 2, 13, '2028-08-22 19:15:10', '2024-08-26 22:54:49', '2024-25'),
(50, 10, 3, 5, 2, 13, '2029-08-22 19:15:10', '2024-08-22 22:07:46', '2024-25'),
(51, 11, 3, 1, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(52, 11, 3, 2, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(53, 11, 3, 3, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(54, 11, 3, 4, 2, 16, '2029-08-22 19:15:10', '2024-08-26 22:55:01', '2024-25'),
(55, 11, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(56, 12, 3, 1, 2, 9, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(57, 12, 3, 2, 2, 12, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(58, 12, 3, 3, 2, 9, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(59, 12, 3, 4, 2, 11, '2029-08-22 19:15:10', '2024-08-26 22:55:13', '2024-25'),
(60, 12, 3, 5, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(61, 13, 3, 1, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(62, 13, 3, 2, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(63, 13, 3, 3, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(64, 13, 3, 4, 2, 10, '2029-08-22 19:15:10', '2024-08-26 22:55:24', '2024-25'),
(65, 13, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(66, 14, 3, 1, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(67, 14, 3, 2, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(68, 14, 3, 3, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(69, 14, 3, 4, 2, 16, '2029-08-22 19:15:10', '2024-08-26 22:55:35', '2024-25'),
(70, 14, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(71, 15, 3, 1, 2, 12, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(72, 15, 3, 2, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(73, 15, 3, 3, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(74, 15, 3, 4, 2, 10, '2029-08-22 19:15:10', '2024-08-26 22:55:44', '2024-25'),
(75, 15, 3, 5, 2, 12, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(76, 16, 3, 1, 2, 9, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(77, 16, 3, 2, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(78, 16, 3, 3, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(79, 16, 3, 4, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(80, 16, 3, 5, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(81, 17, 3, 1, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(82, 17, 3, 2, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(83, 17, 3, 3, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(84, 17, 3, 4, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(85, 17, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(86, 18, 3, 1, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(87, 18, 3, 2, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(88, 18, 3, 3, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(89, 18, 3, 4, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(90, 18, 3, 5, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(91, 19, 3, 1, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(92, 19, 3, 2, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(93, 19, 3, 3, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(94, 19, 3, 4, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(95, 19, 3, 5, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(96, 20, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(97, 20, 3, 2, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(98, 20, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(99, 20, 3, 4, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(100, 20, 3, 5, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(101, 21, 3, 1, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(102, 21, 3, 2, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(103, 21, 3, 3, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(104, 21, 3, 4, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(105, 21, 3, 5, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(106, 22, 3, 1, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(107, 22, 3, 2, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(108, 22, 3, 3, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(109, 22, 3, 4, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(110, 22, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(111, 23, 3, 1, 2, 9, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(112, 23, 3, 2, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(113, 23, 3, 3, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(114, 23, 3, 4, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(115, 23, 3, 5, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(116, 24, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(117, 24, 3, 2, 2, 8, '2029-08-22 19:15:10', '2024-08-26 22:56:49', '2024-25'),
(118, 24, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(119, 24, 3, 4, 2, 2, '2029-08-22 19:15:10', '2024-08-26 22:56:49', '2024-25'),
(120, 24, 3, 5, 2, 10, '2029-08-22 19:15:10', '2024-08-26 22:56:49', '2024-25'),
(121, 25, 3, 1, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(122, 25, 3, 2, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(123, 25, 3, 3, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(124, 25, 3, 4, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(125, 25, 3, 5, 2, 9, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(126, 26, 3, 1, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(127, 26, 3, 2, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(128, 26, 3, 3, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(129, 26, 3, 4, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(130, 26, 3, 5, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(131, 27, 3, 1, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(132, 27, 3, 2, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(133, 27, 3, 3, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(134, 27, 3, 4, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(135, 27, 3, 5, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(136, 28, 3, 1, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(137, 28, 3, 2, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(138, 28, 3, 3, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(139, 28, 3, 4, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(140, 28, 3, 5, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(141, 29, 3, 1, 2, 6, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(142, 29, 3, 2, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(143, 29, 3, 3, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(144, 29, 3, 4, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(145, 29, 3, 5, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(146, 30, 3, 1, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(147, 30, 3, 2, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(148, 30, 3, 3, 2, 4, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(149, 30, 3, 4, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(150, 30, 3, 5, 2, 11, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(151, 31, 3, 1, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(152, 31, 3, 2, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(153, 31, 3, 3, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(154, 31, 3, 4, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(155, 31, 3, 5, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(156, 32, 3, 1, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(157, 32, 3, 2, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(158, 32, 3, 3, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(159, 32, 3, 4, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(160, 32, 3, 5, 2, 14, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(161, 33, 3, 1, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(162, 33, 3, 2, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(163, 33, 3, 3, 2, 18, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(164, 33, 3, 4, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(165, 33, 3, 5, 2, 14, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(166, 34, 3, 1, 2, 11, '2029-08-22 19:15:00', '2024-08-26 22:56:23', '2024-25'),
(167, 34, 3, 2, 2, 12, '2029-08-22 19:15:00', '2024-08-26 22:56:23', '2024-25'),
(168, 34, 3, 3, 2, 15, '2029-08-22 19:15:00', '2024-08-26 22:56:23', '2024-25'),
(169, 34, 3, 4, 2, 14, '2029-08-22 19:15:00', '2024-08-26 22:56:23', '2024-25'),
(170, 34, 3, 5, 2, 12, '2029-08-22 19:15:00', '2024-08-26 22:56:23', '2024-25'),
(171, 35, 3, 1, 2, 14, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(172, 35, 3, 2, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(173, 35, 3, 3, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(174, 35, 3, 4, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(175, 35, 3, 5, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(176, 36, 3, 1, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(177, 36, 3, 2, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(178, 36, 3, 3, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(179, 36, 3, 4, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(180, 36, 3, 5, 2, 11, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(181, 37, 3, 1, 2, 14, '2029-08-22 19:15:00', '2024-08-26 23:03:17', '2024-25'),
(182, 37, 3, 2, 2, 17, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(183, 37, 3, 3, 2, 16, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(184, 37, 3, 4, 2, 14, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(185, 37, 3, 5, 2, 14, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(186, 38, 3, 1, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(187, 38, 3, 2, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(188, 38, 3, 3, 2, 10, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(189, 38, 3, 4, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(190, 38, 3, 5, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(191, 39, 3, 1, 2, 11, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(192, 39, 3, 2, 2, 13, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(193, 39, 3, 3, 2, 15, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(194, 39, 3, 4, 2, 12, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(195, 39, 3, 5, 2, 17, '2029-08-22 19:15:00', '0000-00-00 00:00:00', '2024-25'),
(196, 40, 3, 1, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(197, 40, 3, 2, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(198, 40, 3, 3, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(199, 40, 3, 4, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(200, 40, 3, 5, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(201, 41, 3, 1, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(202, 41, 3, 2, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(203, 41, 3, 3, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(204, 41, 3, 4, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(205, 41, 3, 5, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(206, 42, 3, 1, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(207, 42, 3, 2, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(208, 42, 3, 3, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(209, 42, 3, 4, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(210, 42, 3, 5, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(211, 43, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(212, 43, 3, 2, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(213, 43, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(214, 43, 3, 4, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(215, 43, 3, 5, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(216, 44, 3, 1, 2, 4, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(217, 44, 3, 2, 2, 4, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(218, 44, 3, 3, 2, 8, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(219, 44, 3, 4, 2, 2, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(220, 44, 3, 5, 2, 6, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(221, 45, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(222, 45, 3, 2, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(223, 45, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(224, 45, 3, 4, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(225, 45, 3, 5, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(226, 46, 3, 1, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(227, 46, 3, 2, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(228, 46, 3, 3, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(229, 46, 3, 4, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(230, 46, 3, 5, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(231, 47, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(232, 47, 3, 2, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(233, 47, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(234, 47, 3, 4, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(235, 47, 3, 5, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(236, 48, 3, 1, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(237, 48, 3, 2, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(238, 48, 3, 3, 2, 20, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(239, 48, 3, 4, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(240, 48, 3, 5, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(241, 49, 3, 1, 2, 13, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(242, 49, 3, 2, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(243, 49, 3, 3, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(244, 49, 3, 4, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(245, 49, 3, 5, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(246, 50, 3, 1, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(247, 50, 3, 2, 2, 8, '2029-08-22 19:15:10', '2024-08-26 23:00:07', '2024-25'),
(248, 50, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(249, 50, 3, 4, 2, 3, '2029-08-22 19:15:10', '2024-08-26 23:00:07', '2024-25'),
(250, 50, 3, 5, 2, 11, '2029-08-22 19:15:10', '2024-08-26 23:00:07', '2024-25'),
(251, 51, 3, 1, 2, 17, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(252, 51, 3, 2, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(253, 51, 3, 3, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(254, 51, 3, 4, 2, 18, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(255, 51, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(256, 52, 3, 1, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(257, 52, 3, 2, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(258, 52, 3, 3, 2, 14, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(259, 52, 3, 4, 2, 6, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(260, 52, 3, 5, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(261, 53, 3, 1, 2, 10, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(262, 53, 3, 2, 2, 4, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(263, 53, 3, 3, 2, 12, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(264, 53, 3, 4, 2, 4, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(265, 53, 3, 5, 2, 11, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(266, 54, 3, 1, 2, 16, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(267, 54, 3, 2, 2, 19, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(268, 54, 3, 3, 2, 0, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(269, 54, 3, 4, 2, 12, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(270, 54, 3, 5, 2, 15, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(271, 55, 3, 1, 2, 1, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(272, 55, 3, 2, 2, 1, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(273, 55, 3, 3, 2, 5, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(274, 55, 3, 4, 2, 1, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25'),
(275, 55, 3, 5, 2, 1, '2029-08-22 19:15:10', '0000-00-00 00:00:00', '2024-25');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `Semester` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `ClassId`, `Semester`, `RollId`, `StudentEmail`, `MobileNo`, `Gender`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'Sanskruti Jagtap', 3, 'III', '24MC2101', 'sanskrutijagtap@gmail.com', '9359650145', 'Female', '2024-08-20 23:22:29', NULL, 1),
(2, 'Vaishnavi Bargat', 3, 'III', '24MC2102', 'vaishnavibargat@gmail.com', '7796025924', 'Female', '2024-08-20 23:27:56', NULL, 1),
(3, 'Mamta Pimpalkar', 3, 'III', '24MC2103', 'mamtapimpalkar@gmail.com', '9172640794', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(4, 'Madhavi Mistry', 3, 'III', '24MC2104', 'madhavimistry@gmail.com', '9322531432', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(5, 'Neha Donadkar', 3, 'III', '24MC2105', 'nehadonadkar@gmail.com', '8390381432', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(6, 'Bhawana Asatkar', 3, 'III', '24MC2106', 'bhawanaasatkar@gmail.com', '9527647433', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(7, 'Arpit Ninawe', 3, 'III', '24MC2107', 'arpitninawe@gmail.com', '9373369033', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(8, 'Shruti Dhomne', 3, 'III', '24MC2108', 'shrutidhomne@gmail.com', '9604381598', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(9, 'Prajwal Madavi', 3, 'III', '24MC2109', 'prajwalmadavi@gmail.com', '820709273', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(10, 'Anand Jugnake', 3, 'III', '24MC2110', 'anandjugnake@gmail.com', '9637108918', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(11, 'Achal Patil', 3, 'III', '24MC2111', 'achalpatil@gmail.com', '7798758810', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(12, 'Vaishnavi Raut', 3, 'III', '24MC2112', 'vaishnaviraut@gmail.com', '9158998544', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(13, 'Saurabh Shwelkar', 3, 'III', '24MC2113', 'saurabhshwelkar@gmail.com', '8149962365', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(14, 'Chitra Malode', 3, 'III', '24MC2114', 'chitramalode@gmail.com', '7387094378', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(15, 'Sajid Sheikh', 3, 'III', '24MC2115', 'sajidsheikh@gmail.com', '8669594621', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(16, 'Harshal Pathrabe', 3, 'III', '24MC2116', 'harshalpathrabe@gmail.com', '9326919213', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(17, 'Maithili Andankar', 3, 'III', '24MC2117', 'maithiliandankar@gmail.com', '9373468767', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(18, 'Aditya Shete', 3, 'III', '24MC2118', 'adityashete@gmail.com', '9503420693', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(19, 'Khushi Gour', 3, 'III', '24MC2119', 'khushigour@gmail.com', '7020330144', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(20, 'Nakshtra Patrange', 3, 'III', '24MC2120', 'nakshtrapatrange@gmail.com', '9421735997', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(21, 'Jayant Tekam', 3, 'III', '24MC2121', 'jayanttekam@gmail.com', '7030240115', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(22, 'Rupal Khobragade', 3, 'III', '24MC2122', 'rupalkhobragade@gmail.com', '9595064348', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(23, 'Pratham Yadv', 3, 'III', '24MC2123', 'prathamyadv@gmail.com', '9421755578', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(24, 'Tejas Nemad', 3, 'III', '24MC2124', 'tejasnemad@gmail.com', '7350250017', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(25, 'Akansha Patil', 3, 'III', '24MC2125', 'akanshapatil@gmail.com', '9373186947', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(26, 'Ajay Barve', 3, 'III', '24MC2126', 'ajaybarve@gmail.com', '9763965616', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(27, 'Akhilesh Hadke', 3, 'III', '24MC2127', 'akhileshhadke@gmail.com', '9373930521', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(28, 'Sandhya Masram', 3, 'III', '24MC2128', 'sandhyamasram@gmail.com', '9158228807', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(29, 'Kanchan Satpudke', 3, 'III', '24MC2129', 'kanchansatpudke@gmail.com', '9329838697', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(30, 'Sonal Barde', 3, 'III', '24MC2130', 'sonalbarde@gmail.com', '8208365237', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(31, 'Gaurav Kapse', 3, 'III', '24MC2131', 'gauravkapse@gmail.com', '9764237206', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(32, 'Yash Ttitirmare', 3, 'III', '24MC2132', 'yashttitirmare@gmail.com', '9766948023', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(33, 'Harshita Poharkar', 3, 'III', '24MC2133', 'harshitapoharkar@gmail.com', '9420409603', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(34, 'Suchita Bawne', 3, 'III', '24MC2134', 'suchitabawne@gmail.com', '9370939024', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(35, 'Yash Baksare', 3, 'III', '24MC2135', 'yashbaksare@gmail.com', '8177924354', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(36, 'Swapnil Somkuwar', 3, 'III', '24MC2136', 'swapnilsomkuwar@gmail.com', '8380870177', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(37, 'Prajwal Bobade', 3, 'III', '24MC2137', 'prajwalbobade@gmail.com', '7972427783', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(38, 'Rohini Bhowate', 3, 'III', '24MC2138', 'rohinibhowate@gmail.com', '9766822956', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(39, 'Aditya Sirsat', 3, 'III', '24MC2139', 'adityasirsat@gmail.com', '8805814729', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(40, 'Mansi Khade', 3, 'III', '24MC2140', 'mansikhade@gmail.com', '9923800000', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(41, 'Sandip Gawali', 3, 'III', '24MC2141', 'sandipgawali@gmail.com', '8805821675', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(42, 'Payal Bankar', 3, 'III', '24MC2142', 'payalbankar@gmail.com', '8551053223', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(43, 'Prajwal Dharnedhar', 3, 'III', '24MC2143', 'prajwaldharnedhar@gmail.com', '7028015424', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(44, 'Paras Mulwande', 3, 'III', '24MC2144', 'parasmulwande@gmail.com', '9665400000', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(45, 'Nishant Sathawane', 3, 'III', '24MC2145', 'nishantsathawane@gmail.com', '9850300000', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(46, 'Diksha Tiwari', 3, 'III', '24MC2146', 'dikshatiwari@gmail.com', '9156866022', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(47, 'Sanket Bawangade', 3, 'III', '24MC2147', 'sanketbawangade@gmail.com', '9890573512', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(48, 'Mayuri Dudhe', 3, 'III', '24MC2148', 'mayuridudhe@gmail.com', '9689576636', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(49, 'Purvi Meshram', 3, 'III', '24MC2149', 'purvimeshram@gmail.com', '9301434370', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(50, 'Amish Tembhurne', 3, 'III', '24MC2150', 'amishtembhurne@gmail.com', '9172178174', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(51, 'Astha Gupta', 3, 'III', '24MC2151', 'asthagupta@gmail.com', '7223937092', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(52, 'Vaibhav Bagde', 3, 'III', '24MC2152', 'vaibhavbagde@gmail.com', '9371122098', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(53, 'Arya Agasti', 3, 'III', '24MC2153', 'aryaagasti@gmail.com', '8830743653', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(54, 'Pallavi Lanjewar', 3, 'III', '24MC2154', 'pallavilanjewar@gmail.com', '9096399265', 'Female', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(55, 'Ganesh Hedau', 3, 'III', '24MC2155', 'ganeshhedau@gmail.com', '8788558273', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1),
(56, 'ADITI AMOL NANNAWARE', 5, 'I', '24BC1101', 'aditiamolnannaware@gmail.com', '9766418249', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(57, 'ARPITA MORESHWAR BALPANDE', 5, 'I', '24BC1102', 'arpitamoreshwarbalpande@gmail.com', '9730723354', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(58, 'AVANTIKA AILESH BAGDE', 5, 'I', '24BC1103', 'avantikaaileshbagde@gmail.com', '9309120964', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(59, 'ALFIYA NASIR SAYYAD', 5, 'I', '24BC1104', 'alfiyanasirsayyad@gmail.com', '7823071286', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(60, 'CHAITALI CHINTAMANRAO KHADKE', 5, 'I', '24BC1105', 'chaitalichintamanraokhadke@gmail.com', '9284411747', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(61, 'DHANASHREE PRAKASH KADUKAR', 5, 'I', '24BC1106', 'dhanashreeprakashkadukar@gmail.com', '9503407552', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(62, 'DIMPAL OMPRAKASH KUBDE', 5, 'I', '24BC1107', 'dimpalomprakashkubde@gmail.com', '9730693233', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(63, 'GAURI ASHOK GAJBHIYE', 5, 'I', '24BC1108', 'gauriashokgajbhiye@gmail.com', '8788852171', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(64, 'GAUSHIYA SABIR SHEIKH', 5, 'I', '24BC1109', 'gaushiyasabirsheikh@gmail.com', '7875159243', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(65, 'HARSHITA ISHWAR BANKAR', 5, 'I', '24BC1110', 'harshitaishwarbankar@gmail.com', '9075754829', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(66, 'HIMANI TARACHAND KHOBRAGADE', 5, 'I', '24BC1111', 'himanitarachandkhobragade@gmail.com', '8669378090', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(67, 'HITAKSHI NANDKISHOR KUKWAS', 5, 'I', '24BC1112', 'hitakshinandkishorkukwas@gmail.com', '9307825021', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(68, 'ISHITA TARACHAND SHENDE', 5, 'I', '24BC1113', 'ishitatarachandshende@gmail.com', '8668791549', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(69, 'JANHAVI ASHOK BARBATE', 5, 'I', '24BC1114', 'janhaviashokbarbate@gmail.com', '8888524962', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(70, 'JASMIN FIROZ KHAN', 5, 'I', '24BC1115', 'jasminfirozkhan@gmail.com', '9158523774', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(71, 'KANCHI PRAMOD BHURE', 5, 'I', '24BC1116', 'kanchipramodbhure@gmail.com', '7620399412', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(72, 'KASHISH SANJAY GAIKWAD', 5, 'I', '24BC1117', 'kashishsanjaygaikwad@gmail.com', '9503435016', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(73, 'KHUSHI SANJAY GIRI', 5, 'I', '24BC1118', 'khushisanjaygiri@gmail.com', '7058327272', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(74, 'KIRTI BABAN GHUGUSKAR', 5, 'I', '24BC1119', 'kirtibabanghuguskar@gmail.com', '8830138990', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(75, 'ACHAL YOGESHWAR THAWAKAR', 5, 'I', '24BC1120', 'achalyogeshwarthawakar@gmail.com', '9371211467', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(76, 'KRUPA SANJAY BORKAR', 5, 'I', '24BC1121', 'krupasanjayborkar@gmail.com', '7620519665', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(77, 'KRUSHNA RAMESH ALONE', 5, 'I', '24BC1122', 'krushnarameshalone@gmail.com', '8788607061', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(78, 'LALIMA GOKULPRASAD HARINKHEDE', 5, 'I', '24BC1123', 'lalimagokulprasadharinkhede@gmail.com', '9970429594', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(79, 'MAYURI DHANRAJ DHOBALE', 5, 'I', '24BC1124', 'mayuridhanrajdhobale@gmail.com', '8208983596', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(80, 'MOHINI RAVINDRA KOLHE', 5, 'I', '24BC1125', 'mohiniravindrakolhe@gmail.com', '7887373244', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(81, 'NAMRATA BABURAO BHUTE', 5, 'I', '24BC1126', 'namratababuraobhute@gmail.com', '9272127350', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(82, 'NANDINI DINESH CHAFLE', 5, 'I', '24BC1127', 'nandinidineshchafle@gmail.com', '9067310806', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(83, 'NIDHI DHANRAJ PARATE', 5, 'I', '24BC1128', 'nidhidhanrajparate@gmail.com', '9921075367', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(84, 'ABDUL KASHIF SAJID PATEL', 5, 'I', '24BC1129', 'abdulkashifsajid@gmail.com', '8698546136', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(85, 'ADITYA PRAKASH WANJARI', 5, 'I', '24BC1130', 'adityaprakashwanjari@gmail.com', '7775854637', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(86, 'ADITYA SANJAY FUTANE', 5, 'I', '24BC1131', 'adityasanjayfutane@gmail.com', '7276818504', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(87, 'AJIT KANNA NAROTI', 5, 'I', '24BC1132', 'ajitkannanaroti@gmail.com', '9209110653', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(88, 'AKSHAY AMIT CHOUDHARY', 5, 'I', '24BC1133', 'akshayamitchoudhary@gmail.com', '9373487097', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(89, 'ANKIT ANIL TARATKAR', 5, 'I', '24BC1134', 'ankitaniltaratkar@gmail.com', '8625004869', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(90, 'ANKUSH GOSTO BISWAS', 5, 'I', '24BC1135', 'ankushgostobiswas@gmail.com', '7391844945', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(91, 'ANTARISH AMAR REWATE', 5, 'I', '24BC1136', 'antarishamarrewate@gmail.com', '8421849997', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(92, 'ARPIT ANIL SHAHU', 5, 'I', '24BC1137', 'arpitanilshahu@gmail.com', '7559124073', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(93, 'ARYAN PRAVIN GATKINE', 5, 'I', '24BC1138', 'aryanpravingatkine@gmail.com', '8180039865', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(94, 'ARYAN SUMED GANVIR', 5, 'I', '24BC1139', 'aryansumedganvir@gmail.com', '9075943452', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(95, 'ASHLESH RAJENDRA ADAGALE', 5, 'I', '24BC1140', 'ashleshrajendraadagale@gmail.com', '8668256061', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(96, 'ATHARV VILAS TUPATE', 5, 'I', '24BC1141', 'atharvvilastupate@gmail.com', '9561243631', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(97, 'AVESH SUNIL BARYEKAR', 5, 'I', '24BC1142', 'aveshsunilbaryekar@gmail.com', '9545772770', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(98, 'AYUSH SATISH GADEKAR', 5, 'I', '24BC1143', 'ayushsatishgadekar@gmail.com', '9309032737', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(99, 'BHARAT RANGLAL SEN', 5, 'I', '24BC1144', 'bharatranglalsen@gmail.com', '8408830322', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(100, 'BHAVIK TIDKE SHAILESH', 5, 'I', '24BC1145', 'bhaviktidkeshailesh@gmail.com', '7744958665', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(101, 'SAKSHI KULDEEP MESHRAM', 5, 'I', '24BC1146', 'sakshikuldeepmeshram@gmail.com', '9673150790', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(102, 'DARSHIT DEWANAND PETKAR', 5, 'I', '24BC1147', 'darshitdewanandpetkar@gmail.com', '9420829105', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(103, 'DEEP KISHOR KHADGI', 5, 'I', '24BC1148', 'deepkishorkhadgi@gmail.com', '8237575934', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(104, 'DEVANSHU ARUN AKRE', 5, 'I', '24BC1149', 'devanshuarunakre@gmail.com', '8625953174', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(105, 'DHANANJAY ANIL KALE', 5, 'I', '24BC1150', 'dhananjayanilkale@gmail.com', '8766022964', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(106, 'GAURAV RAMAN CHANNE', 5, 'I', '24BC1151', 'gauravramanchanne@gmail.com', '9511219902', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(107, 'GURUDEV HARIDAS THAKARE', 5, 'I', '24BC1152', 'gurudevharidasthakare@gmail.com', '7420904352', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(108, 'HARSH PRAFULL SAPATE', 5, 'I', '24BC1153', 'harshprafullsapate@gmail.com', '9112094226', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(109, 'HARSH VINAYAK TARALE', 5, 'I', '24BC1154', 'harshvinayaktarale@gmail.com', '8421997941', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(110, 'HARSHIT GHANSHYAM SONI', 5, 'I', '24BC1155', 'harshitghanshyamsoni@gmail.com', '9699932976', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(111, 'HIMANSHU VIKAS BHIWGADE', 5, 'I', '24BC1156', 'himanshuvikasbhiwgade@gmail.com', '7350994450', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(112, 'ISHAN ANIL SUKEY', 5, 'I', '24BC1157', 'ishananilsukey@gmail.com', '8408807296', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(113, 'PRANJAL GOVINDA KADGAYE', 5, 'I', '24BC1158', 'pranjalgovindakadgaye@gmail.com', '7499685541', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(114, 'KARTIK ANIL INGLE', 5, 'I', '24BC1159', 'kartikanilingle@gmail.com', '9322159879', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(115, 'MANTHAN KISHOR DAKHOLE', 5, 'I', '24BC1160', 'manthankishordakhole@gmail.com', '9322395757', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(116, 'MAYUR RAKESH BHARTI', 5, 'I', '24BC1161', 'mayurrakeshbharti@gmail.com', '8055021617', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(117, 'MAYUR MADANLAL PAGADE', 5, 'I', '24BC1162', 'mayurmadanlalpagade@gmail.com', '9765628537', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(118, 'MAYUR SOMESHWAR TUMSARE', 5, 'I', '24BC1163', 'mayursomeshwartumsare@gmail.com', '9049784876', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(119, 'MRUNAL PRADIP TIWASE', 5, 'I', '24BC1164', 'mrunalpradiptiwase@gmail.com', '9373178611', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(120, 'NAVINYA ANIL TIJARE', 5, 'I', '24BC1165', 'navinyaaniltijare@gmail.com', '8459158112', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(121, 'NIKITA DILIP RAMERWAR', 5, 'I', '245BC1201', 'nikitadilipramerwar@gmail.com', '9595527983', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(122, 'NISHITA DEVANAND SARODEY', 5, 'I', '245BC1202', 'nishitadevanandsarodey@gmail.com', '9325712644', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(123, 'PAYAL SUDHIR MORE', 5, 'I', '245BC1203', 'payalsudhirmore@gmail.com', '8975460965', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(124, 'PRIYANKA SURESH GIRI', 5, 'I', '245BC1204', 'priyankasureshgiri@gmail.com', '9370662104', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(125, 'PUNAM VIJAY TUPATE', 5, 'I', '245BC1205', 'punamvijaytupate@gmail.com', '9325664948', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(126, 'PURWA UMESH DUMARE', 5, 'I', '245BC1206', 'purwaumeshdumare@gmail.com', '9284485968', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(127, 'RIYA MOHAN MOUNDEKAR', 5, 'I', '245BC1207', 'riyamohanmoundekar@gmail.com', '8767158744', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(128, 'RUCHITA SHANKAR PARATE', 5, 'I', '245BC1208', 'ruchitashankarparate@gmail.com', '7875123998', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(129, 'SAKSHI RAJESH THOTE', 5, 'I', '245BC1209', 'sakshirajeshthote@gmail.com', '7499420435', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(130, 'SAMIKSHA GOVINDA KADU', 5, 'I', '245BC1210', 'samikshagovindakadu@gmail.com', '9699617058', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(131, 'SANJ SUKHPAL GADRE', 5, 'I', '245BC1211', 'sanjsukhpalgadre@gmail.com', '9579863767', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(132, 'SAYALI PURUSHOTTAM GOWARDIPE', 5, 'I', '245BC1212', 'sayalipurushottamgowardipe@gmail.com', '9552203255', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(133, 'SHAHIN AHAMAD ALI ANSARI', 5, 'I', '245BC1213', 'shahinahamadali@gmail.com', '8446483084', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(134, 'SHREYA ANKUSH AMBULKAR', 5, 'I', '245BC1214', 'shreyaankushambulkar@gmail.com', '9623341447', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(135, 'SHRUSHTI PRAVIN DARODE', 5, 'I', '245BC1215', 'shrushtipravindarode@gmail.com', '9022593921', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(136, 'SHRUTI ARUN CHOUDHARI', 5, 'I', '245BC1216', 'shrutiarunchoudhari@gmail.com', '7875371352', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(137, 'SHRUTIKA VILAS PAUNIKAR', 5, 'I', '245BC1217', 'shrutikavilaspaunikar@gmail.com', '7666160052', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(138, 'SHWETA BABANRAO MUNDHE', 5, 'I', '245BC1218', 'shwetababanraomundhe@gmail.com', '8767731016', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(139, 'SHWETA DHANPAL TIRPUDE', 5, 'I', '245BC1219', 'shwetadhanpaltirpude@gmail.com', '7447657764', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(140, 'SRUSHTI SAKHARE RAMANLAL', 5, 'I', '245BC1220', 'srushtisakhareramanlal@gmail.com', '9371211467', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(141, 'SWARANGI RAJESH NAIK', 5, 'I', '245BC1221', 'swarangirajeshnaik@gmail.com', '9371217042', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(142, 'SWARANGI TEJRAM GOSAVI', 5, 'I', '245BC1222', 'swarangitejramgosavi@gmail.com', '9370922014', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(143, 'TANAYA BHARAT DHORE', 5, 'I', '245BC1223', 'tanayabharatdhore@gmail.com', '8010036724', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(144, 'VAISHNAVI RAJENDRA MOHURLE', 5, 'I', '245BC1224', 'vaishnavirajendramohurle@gmail.com', '8830671722', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(145, 'VAISHNAVI SUNIL BHANDAKKAR', 5, 'I', '245BC1225', 'vaishnavisunilbhandakkar@gmail.com', '7385330661', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(146, 'VIDHYA SOMESHWAR PARATE', 5, 'I', '245BC1226', 'vidhyasomeshwarparate@gmail.com', '8698635544', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(147, 'VINISHA PRASHANT MUNESHWAR', 5, 'I', '245BC1227', 'vinishaprashantmuneshwar@gmail.com', '9699899984', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(148, 'YAMINI SUDHAKAR KALAMBHE', 5, 'I', '245BC1228', 'yaminisudhakarkalambhe@gmail.com', '7499802891', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(149, 'YASHASWI SANJAY JADHAO', 5, 'I', '245BC1229', 'yashaswisanjayjadhao@gmail.com', '9356876659', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(150, 'NITIN PANDHARI RAMTEKE', 5, 'I', '245BC1230', 'nitinpandhariramteke@gmail.com', '7498241783', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(151, 'OM ANIL SHUKLA', 5, 'I', '245BC1231', 'omanilshukla@gmail.com', '7058044945', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(152, 'OM NITIN GAIKWAD', 5, 'I', '245BC1232', 'omnitingaikwad@gmail.com', '9970955809', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(153, 'PARTH SANJAY HEMKE', 5, 'I', '245BC1233', 'parthsanjayhemke@gmail.com', '8275173710', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(154, 'PIYUSH LAKHAN RAUT', 5, 'I', '245BC1234', 'piyushlakhanraut@gmail.com', '8530434133', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(155, 'PRANAV NARESH PARATE', 5, 'I', '245BC1235', 'pranavnareshparate@gmail.com', '9359755904', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(156, 'PRANAY NISHOD BARSAGADE', 5, 'I', '245BC1236', 'pranaynishodbarsagade@gmail.com', '7218226409', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(157, 'PRATIK SHYAM WANKHEDE', 5, 'I', '245BC1237', 'pratikshyamwankhede@gmail.com', '8625887125', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(158, 'PRATIK DNYANESHWAR MESHRAM', 5, 'I', '245BC1238', 'pratikdnyaneshwarmeshram@gmail.com', '7389551368', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(159, 'PRINCE JAGDISH GAJBHIYE', 5, 'I', '245BC1239', 'princejagdishgajbhiye@gmail.com', '8788302254', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(160, 'PURVESH ASHOK NIMJE', 5, 'I', '245BC1240', 'purveshashoknimje@gmail.com', '7709672043', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(161, 'SACHIN ANIL ZADE', 5, 'I', '245BC1241', 'sachinanilzade@gmail.com', '8261016531', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(162, 'SAKET DATTARAM MOTEY', 5, 'I', '245BC1242', 'saketdattarammotey@gmail.com', '9172334979', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(163, 'SAMEERAN SANJAY MASKE', 5, 'I', '245BC1243', 'sameeransanjaymaske@gmail.com', '9881022294', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(164, 'SANSKAR KRISHNA POTULWAR', 5, 'I', '245BC1244', 'sanskarkrishnapotulwar@gmail.com', '7447896898', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(165, 'SANSKAR RAJENDRA GUDADHE', 5, 'I', '245BC1245', 'sanskarrajendragudadhe@gmail.com', '8275072739', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(166, 'SAURABH SANTOSH GADEKAR', 5, 'I', '245BC1246', 'saurabhsantoshgadekar@gmail.com', '9699923650', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(167, 'SHANTANU DHANRAJ BHOYAR', 5, 'I', '245BC1247', 'shantanudhanrajbhoyar@gmail.com', '8668621356', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(168, 'SHATAYU PRAYAG PARSODKAR', 5, 'I', '245BC1248', 'shatayuprayagparsodkar@gmail.com', '7387963954', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(169, 'SIDDHESH KISHOR KITADIKAR', 5, 'I', '245BC1249', 'siddheshkishorkitadikar@gmail.com', '9922022833', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(170, 'SUMIT GULAB MANDHARE', 5, 'I', '245BC1250', 'sumitgulabmandhare@gmail.com', '8275992386', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(171, 'SUSHIL SUKHDEV NIKHARE', 5, 'I', '245BC1251', 'sushilsukhdevnikhare@gmail.com', '9307917036', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(172, 'SUSHRUT KAILASH GONDANE', 5, 'I', '245BC1252', 'sushrutkailashgondane@gmail.com', '7385589823', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(173, 'TANMAY MANOHAR RAMTEKE', 5, 'I', '245BC1253', 'tanmaymanoharramteke@gmail.com', '8830019307', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(174, 'UJWAL RAKESH NAKKEWAR', 5, 'I', '245BC1254', 'ujwalrakeshnakkewar@gmail.com', '9699655417', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(175, 'VEDANT PRAVIN BHOPE', 5, 'I', '245BC1255', 'vedantpravinbhope@gmail.com', '7558512953', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(176, 'VEDANT GOVARDHAN DAHARE', 5, 'I', '245BC1256', 'vedantgovardhandahare@gmail.com', '9503757529', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(177, 'VILAS NAKHATE DHANRAJ', 5, 'I', '245BC1257', 'vilasnakhatedhanraj@gmail.com', '8308001307', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(178, 'VIVEK YUVRAJ GHODAKADE', 5, 'I', '245BC1258', 'vivekyuvrajghodakade@gmail.com', '8329443523', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(179, 'YASH KRUSHNA BORKAR', 5, 'I', '245BC1259', 'yashkrushnaborkar@gmail.com', '9325783328', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(180, 'YASH SHIVCHAND TUPAT', 5, 'I', '245BC1260', 'yashshivchandtupat@gmail.com', '7249671646', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(181, 'YUGANT NARESH TETE', 5, 'I', '245BC1261', 'yugantnareshtete@gmail.com', '7840922454', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(182, 'SHIVANI RAMDAS WANKHEDE', 5, 'I', '245BC1262', 'shivaniramdaswankhede@gmail.com', '9373138650', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(183, 'VAIDEHI AJAY SARATKAR', 5, 'I', '245BC1263', 'vaidehiajaysaratkar@gmail.com', '7058237996', 'Female', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(184, 'VEDANT VIJAY MUNGATE', 5, 'I', '245BC1264', 'vedantvijaymungate@gmail.com', '8830052679', 'Male', '2024-11-10 18:30:00', '0000-00-00 00:00:00', 1),
(185, 'SIYA B. NAKORIYA', 1, 'I', 'MCA24_001', 'siyab.nakoriya@gmail.com', '9322638860', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(186, 'KRUTIKA J. GADHAVE', 1, 'I', 'MCA24_002', 'krutikaj.gadhave@gmail.com', '7378690686', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(187, 'NILESH R. BURADKAR', 1, 'I', 'MCA24_003', 'nileshr.buradkar@gmail.com', '8766844581', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(188, 'OM D. THAKRE', 1, 'I', 'MCA24_004', 'omd.thakre@gmail.com', '8767186904', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(189, 'KHUSHBU R. GAUTAM', 1, 'I', 'MCA24_005', 'khushbur.gautam@gmail.com', '9860194133', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(190, 'JANVI A. PETKAR', 1, 'I', 'MCA24_006', 'janvia.petkar@gmail.com', '8482802156', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(191, 'VAIBHAV S. WAGH', 1, 'I', 'MCA24_007', 'vaibhavs.wagh@gmail.com', '7796050074', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(192, 'RITIKA J. WANJARI', 1, 'I', 'MCA24_008', 'ritikaj.wanjari@gmail.com', '7020550851', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(193, 'RUSHIKESH V. KUMBHARE', 1, 'I', 'MCA24_009', 'rushikeshv.kumbhare@gmail.com', '8766899934', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(194, 'CHAITANYA D. SATHWANE', 1, 'I', 'MCA24_010', 'chaitanyad.sathwane@gmail.com', '9284817182', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(195, 'REWA R. BAWANGADE', 1, 'I', 'MCA24_011', 'rewar.bawangade@gmail.com', '7875519640', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(196, 'SUMIT A. KANOJIYA', 1, 'I', 'MCA24_012', 'sumita.kanojiya@gmail.com', '9637490394', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(197, 'PRAYAS P. GOTEFODE', 1, 'I', 'MCA24_013', 'prayasp.gotefode@gmail.com', '7821060165', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(198, 'SHIWANI R. AMRUTE', 1, 'I', 'MCA24_014', 'shiwanir.amrute@gmail.com', '7498169774', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(199, 'CHETANA R. CHOUDHARY', 1, 'I', 'MCA24_015', 'chetanar.choudhary@gmail.com', '7620237734', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(200, 'ROHIT S. TOHANE', 1, 'I', 'MCA24_016', 'rohits.tohane@gmail.com', '9146272156', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(201, 'PRANAY S. GUNDU', 1, 'I', 'MCA24_017', 'pranays.gundu@gmail.com', '9422925352', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(202, 'SALOMI V. GAUTAM', 1, 'I', 'MCA24_018', 'salomiv.gautam@gmail.com', '7721920212', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(203, 'SACHIN T. BHAGAT', 1, 'I', 'MCA24_019', 'sachint.bhagat@gmail.com', '7218455439', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(204, 'KAUSTUBH B. LANJEWAR', 1, 'I', 'MCA24_020', 'kaustubhb.lanjewar@gmail.com', '8830814805', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(205, 'HEMA N. KUHIKAR', 1, 'I', 'MCA24_021', 'heman.kuhikar@gmail.com', '9822492690', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(206, 'RIDDHI P. RAUT', 1, 'I', 'MCA24_022', 'riddhip.raut@gmail.com', '9822778334', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(207, 'AMIT M. INGLE', 1, 'I', 'MCA24_023', 'amitm.ingle@gmail.com', '8830085024', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(208, 'RUSHIKESH S. MANDOGADE', 1, 'I', 'MCA24_024', 'rushikeshs.mandogade@gmail.com', '9579426956', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(209, 'NIKITA H. MANE', 1, 'I', 'MCA24_025', 'nikitah.mane@gmail.com', '9767872293', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(210, 'ANJALI D. LAMBAT', 1, 'I', 'MCA24_026', 'anjalid.lambat@gmail.com', 'SACHIN', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(211, 'HARSH D. LAHANE', 1, 'I', 'MCA24_027', 'harshd.lahane@gmail.com', '8421908505', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(212, 'RASHMI R. SAYARE', 1, 'I', 'MCA24_028', 'rashmir.sayare@gmail.com', '8767587513', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(213, 'ASIYA S. KHAN', 1, 'I', 'MCA24_029', 'asiyas.khan@gmail.com', '7887485411', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(214, 'NIKITA G. TELANG', 1, 'I', 'MCA24_030', 'nikitag.telang@gmail.com', '9309231863', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(215, 'ANJALI B. GAJBHIYE', 1, 'I', 'MCA24_031', 'anjalib.gajbhiye@gmail.com', '9112954617', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(216, 'SHREYAS P. KHERDE', 1, 'I', 'MCA24_032', 'shreyasp.kherde@gmail.com', '9545557617', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(217, 'MONIKA G. MANAPURE', 1, 'I', 'MCA24_033', 'monikag.manapure@gmail.com', '8999978902', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(218, 'VISHAKHA M. CHOPADE', 1, 'I', 'MCA24_034', 'vishakham.chopade@gmail.com', '9307268884', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(219, 'VAISHNAVI R. SHOBHANE', 1, 'I', 'MCA24_035', 'vaishnavir.shobhane@gmail.com', '8380896035', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(220, 'APURVA V. KHANNADE', 1, 'I', 'MCA24_036', 'apurvav.khannade@gmail.com', '9766907225', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(221, 'JYOTIRMAY A. KAREMORE', 1, 'I', 'MCA24_037', 'jyotirmaya.karemore@gmail.com', '8625977188', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(222, 'SAURABH K. UDAPURE', 1, 'I', 'MCA24_038', 'saurabhk.udapure@gmail.com', '8329851934', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(223, 'SHRUTI R. RANGARI', 1, 'I', 'MCA24_039', 'shrutir.rangari@gmail.com', '9699849646', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(224, 'SEJAL R. BARVE', 1, 'I', 'MCA24_040', 'sejalr.barve@gmail.com', '8766695407', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(225, 'KAJAL D. KACHHWAHA', 1, 'I', 'MCA24_041', 'kajald.kachhwaha@gmail.com', '9145147625', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(226, 'RISHI P. PUNJE', 1, 'I', 'MCA24_042', 'riship.punje@gmail.com', '7219522819', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(227, 'ROHIT R. UIKEY', 1, 'I', 'MCA24_043', 'rohitr.uikey@gmail.com', '7972518582', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(228, 'RUPALI RAHANGDALE', 1, 'I', 'MCA24_044', 'rupalirahangdale@gmail.com', '7758099739', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(229, 'NIKHIL A. WANDHARE', 1, 'I', 'MCA24_045', 'nikhila.wandhare@gmail.com', '9168028316', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(230, 'ACHAL P. ZADE', 1, 'I', 'MCA24_046', 'achalp.zade@gmail.com', '8767991576', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(231, 'SANIDHI A. GAJBHIYE', 1, 'I', 'MCA24_047', 'sanidhia.gajbhiye@gmail.com', '9552408570', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(232, 'SAURAV R. UKEY', 1, 'I', 'MCA24_048', 'sauravr.ukey@gmail.com', '8698953611', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(233, 'SARAFAT S. SHAIKH', 1, 'I', 'MCA24_049', 'sarafats.shaikh@gmail.com', '7030432531', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(234, 'SUHASHINI R. NARNAWARE', 1, 'I', 'MCA24_050', 'suhashinir.narnaware@gmail.com', '9579709763', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(235, 'NEHA L. BHOYAR', 1, 'I', 'MCA24_051', 'nehal.bhoyar@gmail.com', '9307187338', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(236, 'KOMAL S. NIMJE', 1, 'I', 'MCA24_052', 'komals.nimje@gmail.com', '7498014227', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(237, 'JAYASHREE W. BAWANKULE', 1, 'I', 'MCA24_053', 'jayashreew.bawankule@gmail.com', '9325134967', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(238, 'SHRUTI M. KHANDAGALE', 1, 'I', 'MCA24_054', 'shrutim.khandagale@gmail.com', '9665477549', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(239, 'VAISHNAVI V. SALVE', 1, 'I', 'MCA24_055', 'vaishnaviv.salve@gmail.com', '8007726090', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(240, 'AYUSHI S. SHROTE', 1, 'I', 'MCA24_056', 'ayushis.shrote@gmail.com', '7756894759', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(241, 'VAIBHAVI V. KALODE', 1, 'I', 'MCA24_057', 'vaibhaviv.kalode@gmail.com', '9767793751', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(242, 'PRIYANKA S. GHARAT', 1, 'I', 'MCA24_058', 'priyankas.gharat@gmail.com', '7410142428', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(243, 'KHUSHI S. DIWANE', 1, 'I', 'MCA24_059', 'khushis.diwane@gmail.com', '9322474231', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(244, 'PRADNYA V. NAIK', 1, 'I', 'MCA24_060', 'pradnyav.naik@gmail.com', '8767016943', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(245, 'TEJAS F. PATIL', 1, 'I', 'MCA24_061', 'tejasf.patil@gmail.com', '9834069739', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(246, 'SAKSHI G. DESHKAR', 1, 'I', 'MCA24_062', 'sakshig.deshkar@gmail.com', '9325437914', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(247, 'PRANJALI P. NIKULE', 1, 'I', 'MCA24_063', 'pranjalip.nikule@gmail.com', '7020119431', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(248, 'TUSHAR S. MASANE', 1, 'I', 'MCA24_064', 'tushars.masane@gmail.com', '9766161506', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(249, 'VAIBHAV D. LAKDE', 1, 'I', 'MCA24_065', 'vaibhavd.lakde@gmail.com', '82089 9238', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(250, 'HARSH N. BHIDKAR', 1, 'I', 'MCA24_066', 'harshn.bhidkar@gmail.com', '8767479143', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(251, 'MUSKAN S. BAGDE', 1, 'I', 'MCA24_067', 'muskans.bagde@gmail.com', '7756937289', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(252, 'SUYOG G. SHENDE', 1, 'I', 'MCA24_068', 'suyogg.shende@gmail.com', '7558216800', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(253, 'PRACHIKA G. DESHMUKH', 1, 'I', 'MCA24_069', 'prachikag.deshmukh@gmail.com', '9049612388', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(254, 'RANJANA R. TIWARI', 1, 'I', 'MCA24_070', 'ranjanar.tiwari@gmail.com', '8669255852', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(255, 'ANISHA S. AWAZE', 1, 'I', 'MCA24_071', 'anishas.awaze@gmail.com', '8668629112', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(256, 'ROHIT R. PILLEWAN', 1, 'I', 'MCA24_072', 'rohitr.pillewan@gmail.com', '9156579634', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(257, 'ANKUSH K. BALBUDDHE', 1, 'I', 'MCA24_073', 'ankushk.balbuddhe@gmail.com', '9518940147', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(258, 'SNEHA S. YARLAGADDA', 1, 'I', 'MCA24_074', 'snehas.yarlagadda@gmail.com', '8080241969', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(259, 'AKANSHA K. MESHRAM', 1, 'I', 'MCA24_075', 'akanshak.meshram@gmail.com', '7058382874', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(260, 'RITIKA A. SAYRE', 1, 'I', 'MCA24_076', 'ritikaa.sayre@gmail.com', '7385985637', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(261, 'KHEMRAJ K. UKEY', 1, 'I', 'MCA24_077', 'khemrajk.ukey@gmail.com', '9552122251', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(262, 'SHRINIWAS S. DUBBEWAR', 1, 'I', 'MCA24_078', 'shriniwass.dubbewar@gmail.com', '8788697186', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(263, 'SANJANA J. BADWAIK', 1, 'I', 'MCA24_079', 'sanjanaj.badwaik@gmail.com', '9834445774', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(264, 'KALYANI D. WELEKAR', 1, 'I', 'MCA24_080', 'kalyanid.welekar@gmail.com', '8830279521', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(265, 'ROHIT B. LOKHANDE', 1, 'I', 'MCA24_081', 'rohitb.lokhande@gmail.com', '7887956544', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(266, 'SHIVAM V. GAUTRE', 1, 'I', 'MCA24_082', 'shivamv.gautre@gmail.com', '9673437109', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(267, 'NEHA J. HIWASE', 1, 'I', 'MCA24_083', 'nehaj.hiwase@gmail.com', '9049168071', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(268, 'PRAJAKTA K. SINGH', 1, 'I', 'MCA24_084', 'prajaktak.singh@gmail.com', '8669858525', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(269, 'PAYAL V. AGRAWAL', 1, 'I', 'MCA24_085', 'payalv.agrawal@gmail.com', '9130291435', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(270, 'KAJAL KUMBHALWAR', 1, 'I', 'MCA24_086', 'kajalkumbhalwar@gmail.com', '7820873496', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(271, 'RUPANSHU BABAN YADAV', 1, 'I', 'MCA24_087', 'rupanshubabanyadav@gmail.com', '8263076511', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(272, 'SAGAR SIDDHARTH FULZELE', 1, 'I', 'MCA24_088', 'sagarsiddharthfulzele@gmail.com', '9112902206', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(273, 'NAYAN SUNIL JANBANDHU', 1, 'I', 'MCA24_089', 'nayansuniljanbandhu@gmail.com', '7720077849', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(274, 'RITESH RAVINDRA RAMTEKE', 1, 'I', 'MCA24_090', 'riteshravindraramteke@gmail.com', '8055694102', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(275, 'SHUBHAM ARUN PATIL', 1, 'I', 'MCA24_091', 'shubhamarunpatil@gmail.com', '97634 9957', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(276, 'PRATHMESH SONPIMPLE', 1, 'I', 'MCA24_092', 'prathmeshsonpimple@gmail.com', '7397828539', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(277, 'SAKSHI VILAS SHENDE', 1, 'I', 'MCA24_093', 'sakshivilasshende@gmail.com', '9145735474', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(278, 'KUSHAL KIRAN CHAVAN', 1, 'I', 'MCA24_094', 'kushalkiranchavan@gmail.com', '9359580806', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(279, 'SEJAL RAJHANS BARSAGADE', 1, 'I', 'MCA24_095', 'sejalrajhansbarsagade@gmail.com', '9322543059', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(280, 'YASH BANDUJI TAGADE', 1, 'I', 'MCA24_096', 'yashbandujitagade@gmail.com', '8010072657', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(281, 'PUJA CHANDANKHEDE', 1, 'I', 'MCA24_097', 'pujachandankhede@gmail.com', '9209707229', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(282, 'VIJAY SHRAVAN RAUT', 1, 'I', 'MCA24_098', 'vijayshravanraut@gmail.com', '8766401753', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(283, 'ISHA SHARDKUMAR LANJEWAR', 1, 'I', 'MCA24_099', 'ishashardkumarlanjewar@gmail.com', '97653 2767', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(284, 'BHAVANA ANIL DHANDE', 1, 'I', 'MCA24_100', 'bhavanaanildhande@gmail.com', '9322306854', 'Female', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1),
(285, 'LALIT DHANRAJ LAKADE', 1, 'I', 'MCA24_101', 'lalitdhanrajlakade@gmail.com', '8999319520', 'Male', '2024-11-11 18:30:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjectcombination`
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjectcombination`
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(1, 3, 1, 1, '2024-08-20 23:01:33', NULL),
(2, 3, 2, 1, '2024-08-20 23:01:38', NULL),
(3, 3, 3, 1, '2024-08-20 23:01:42', NULL),
(4, 3, 4, 1, '2024-08-20 23:01:46', NULL),
(5, 3, 5, 1, '2024-08-20 23:02:16', NULL),
(6, 5, 6, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(7, 5, 7, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(8, 5, 8, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(9, 5, 9, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(10, 5, 10, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(11, 5, 11, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(12, 5, 12, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(13, 1, 13, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(14, 1, 14, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(15, 1, 15, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(16, 1, 16, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(17, 1, 17, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(18, 1, 18, 1, '2024-11-10 18:30:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Big Data Analytics', 'BD01', '2024-08-20 22:57:37', NULL),
(2, 'Data Mining', 'DM02', '2024-08-20 22:57:59', NULL),
(3, 'Python Programming', 'PP03', '2024-08-20 22:58:12', NULL),
(4, 'Artificial Intelligence', 'AI04', '2024-08-20 22:58:42', NULL),
(5, 'Soft Computing', 'SC05', '2024-08-20 22:59:07', NULL),
(6, 'Mathematics Foundation to Computer Science -I', 'MFCS06', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(7, 'Programming using C', 'PC07', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(8, 'Fundamental of Web Designing', 'FWD08', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(9, 'Function English', 'FE09', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(10, 'Enviormental Science and Sustainability', 'ESS10', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(11, 'Indian Knowledge Systeem', 'IKS11', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(12, 'Professional Communication', 'PC12', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(13, 'Data Structure using C++', 'DSC13', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(14, 'Database Management System', 'DMS14', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(15, 'Operating System', 'OS15', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(16, 'Advance Scripting Using HTML & CSS', 'A.S.HTML16', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(17, 'Computer Forensic', 'CF17', '2024-11-10 18:30:00', '0000-00-00 00:00:00'),
(18, 'Reasearch Methodolgy', 'RM18', '2024-11-10 18:30:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbltattendance`
--

CREATE TABLE `tbltattendance` (
  `id` int(11) NOT NULL,
  `AttendanceName` varchar(80) DEFAULT NULL,
  `AttendanceNameNumeric` int(4) DEFAULT NULL,
  `AttendanceCode` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `TotalAttendance` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='tbltattendance';

--
-- Dumping data for table `tbltattendance`
--

INSERT INTO `tbltattendance` (`id`, `AttendanceName`, `AttendanceNameNumeric`, `AttendanceCode`, `CreationDate`, `UpdationDate`, `TotalAttendance`) VALUES
(1, 'ATT[MCA(1)-SEM-I]', 1, 'I', '2024-08-29 19:06:38', NULL, '100'),
(2, 'ATT[MCA(1)-SEM-II]', 2, 'II', '2024-08-29 19:07:02', NULL, '100'),
(3, 'ATT[MCA(2)-SEM-III]', 3, 'III', '2024-08-29 19:08:18', NULL, '100'),
(4, 'ATT[MCA(2)-SEM-IV]', 4, 'IV', '2024-08-29 19:10:15', NULL, '100'),
(5, 'ATT[BCA(1)-SEM-I]', 5, 'I', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(6, 'ATT[BCA(1)-SEM-II]', 6, 'II', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(7, 'ATT[BCA(2)-SEM-III]', 7, 'III', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(8, 'ATT[BCA(2)-SEM-IV]', 8, 'IV', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(9, 'ATT[BCA(3)-SEM-V]', 9, 'V', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(10, 'ATT[BCA(3)-SEM-VI]', 10, 'VI', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(11, 'ATT[BCA(4)-SEM-VII]', 11, 'VII', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100'),
(12, 'ATT[BCA(4)-SEM-VIII]', 12, 'VIII', '2024-11-10 18:30:00', '0000-00-00 00:00:00', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `ClassId` (`ClassId`),
  ADD KEY `SubjectId` (`SubjectId`);

--
-- Indexes for table `tblclasses`
--
ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblexams`
--
ALTER TABLE `tblexams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tbllearner`
--
ALTER TABLE `tbllearner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_result` (`ClassId`,`ExamTypeId`,`StudentId`,`SubjectName`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tbllearnercategorycount`
--
ALTER TABLE `tbllearnercategorycount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_session_exam` (`ClassName`,`ExamName`);

--
-- Indexes for table `tblnotice`
--
ALTER TABLE `tblnotice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `ClassId` (`ClassId`),
  ADD KEY `SubjectId` (`SubjectId`),
  ADD KEY `ExamTypeId` (`ExamTypeId`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltattendance`
--
ALTER TABLE `tbltattendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblclasses`
--
ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblexams`
--
ALTER TABLE `tblexams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbllearner`
--
ALTER TABLE `tbllearner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `tbllearnercategorycount`
--
ALTER TABLE `tbllearnercategorycount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblnotice`
--
ALTER TABLE `tblnotice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbltattendance`
--
ALTER TABLE `tbltattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
