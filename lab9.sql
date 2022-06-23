-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jun 23, 2022 at 02:28 AM
-- Server version: 5.7.37
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab9`
--

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE `Class` (
  `ClassCode` varchar(250) NOT NULL,
  `HeadTeacher` varchar(250) DEFAULT NULL,
  `Room` varchar(250) DEFAULT NULL,
  `TimeSlot` char(1) DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`ClassCode`, `HeadTeacher`, `Room`, `TimeSlot`, `CloseDate`) VALUES
('C1007L', 'NhatMinh', 'Class 3', 'A', '2024-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Mark`
--

CREATE TABLE `Mark` (
  `RollNo` varchar(250) NOT NULL,
  `SubjectCode` varchar(250) NOT NULL,
  `WMark` float DEFAULT NULL,
  `PMark` float DEFAULT NULL,
  `mark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mark`
--

INSERT INTO `Mark` (`RollNo`, `SubjectCode`, `WMark`, `PMark`, `mark`) VALUES
('A00264', 'EPC', 7.5, 8.5, 9.5);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `RollNo` varchar(250) NOT NULL,
  `ClassCode` varchar(250) DEFAULT NULL,
  `FullName` varchar(250) DEFAULT NULL,
  `Male` bit(1) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Province` char(2) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`RollNo`, `ClassCode`, `FullName`, `Male`, `BirthDate`, `Address`, `Province`, `Email`) VALUES
('A00264', 'C1007L', 'Nguyen Huy Thang', b'1', '2003-08-27 00:00:00', 'Quang Ninh', 'HN', 'Wesneyne@gamil.com');

-- --------------------------------------------------------

--
-- Table structure for table `Subject`
--

CREATE TABLE `Subject` (
  `SubjectCode` varchar(250) DEFAULT NULL,
  `SubjectName` varchar(250) DEFAULT NULL,
  `WTest` bit(1) DEFAULT NULL,
  `PTest` bit(1) DEFAULT NULL,
  `WTest_Per` int(11) DEFAULT NULL,
  `PTest_Rer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subject`
--

INSERT INTO `Subject` (`SubjectCode`, `SubjectName`, `WTest`, `PTest`, `WTest_Per`, `PTest_Rer`) VALUES
('EPC', 'Elementary Programing with C', b'1', b'1', 9, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`ClassCode`);

--
-- Indexes for table `Mark`
--
ALTER TABLE `Mark`
  ADD PRIMARY KEY (`RollNo`,`SubjectCode`),
  ADD KEY `SubjectCode` (`SubjectCode`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`RollNo`),
  ADD KEY `student_index` (`ClassCode`);

--
-- Indexes for table `Subject`
--
ALTER TABLE `Subject`
  ADD KEY `SubjectCode` (`SubjectCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Mark`
--
ALTER TABLE `Mark`
  ADD CONSTRAINT `Mark_ibfk_1` FOREIGN KEY (`RollNo`) REFERENCES `Student` (`RollNo`),
  ADD CONSTRAINT `Mark_ibfk_2` FOREIGN KEY (`SubjectCode`) REFERENCES `Subject` (`SubjectCode`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`ClassCode`) REFERENCES `Class` (`ClassCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
