-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2024 at 08:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
(4, 'MCA', '4', '2', 'IV', '2024-08-16 21:22:02', NULL);

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
(3, 'Sessional-II', 3, 'II', '2024-08-10 15:04:14', NULL, '20');

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
(55, 'Ganesh Hedau', 3, 'III', '24MC2155', 'ganeshhedau@gmail.com', '8788558273', 'Male', '2020-08-24 23:22:29', '0000-00-00 00:00:00', 1);

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
(5, 3, 5, 1, '2024-08-20 23:02:16', NULL);

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
(5, 'Soft Computing', 'SC05', '2024-08-20 22:59:07', NULL);

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
(4, 'ATT[MCA(2)-SEM-IV]', 4, 'IV', '2024-08-29 19:10:15', NULL, '100');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblexams`
--
ALTER TABLE `tblexams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbltattendance`
--
ALTER TABLE `tbltattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
