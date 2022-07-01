-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jul 01, 2022 at 03:03 AM
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
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_ID`, `Name`, `City`, `Country`, `Phone`, `Email`) VALUES
(1, 'Nguyen Van A', 'Hanoi', 'Vietnam', '089674534', 'VanA@gmail.com'),
(2, 'Nguyen Thi B', 'Saigon', 'Vietnam', '085443219', 'ThiB@gamil.com'),
(3, 'Nguyen Huu C', 'HCM', 'Vietnam', '067423812', 'HuuC@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `CustomerAccount`
--

CREATE TABLE `CustomerAccount` (
  `AccountNumber` char(9) NOT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `MinAccount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CustomerAccount`
--

INSERT INTO `CustomerAccount` (`AccountNumber`, `Customer_id`, `Balance`, `MinAccount`) VALUES
('101', 1, 1000000, 1000000),
('102', 2, 1000000, 1000000),
('103', 3, 1000000, 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `CustomerTransaction`
--

CREATE TABLE `CustomerTransaction` (
  `Transaction_ID` int(11) NOT NULL,
  `AccountNumber` char(9) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `Amount` double NOT NULL,
  `DepositorWithdraw` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CustomerTransaction`
--

INSERT INTO `CustomerTransaction` (`Transaction_ID`, `AccountNumber`, `TransactionDate`, `Amount`, `DepositorWithdraw`) VALUES
(1, '101', '2022-07-01 00:00:00', 500000, b'1'),
(2, '102', '2022-07-02 00:00:00', 500000, b'1'),
(3, '103', '2022-07-03 00:00:00', 500000, b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `CustomerAccount`
--
ALTER TABLE `CustomerAccount`
  ADD PRIMARY KEY (`AccountNumber`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `CustomerTransaction`
--
ALTER TABLE `CustomerTransaction`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `AccountNumber` (`AccountNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CustomerAccount`
--
ALTER TABLE `CustomerAccount`
  ADD CONSTRAINT `CustomerAccount_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_ID`);

--
-- Constraints for table `CustomerTransaction`
--
ALTER TABLE `CustomerTransaction`
  ADD CONSTRAINT `CustomerTransaction_ibfk_1` FOREIGN KEY (`AccountNumber`) REFERENCES `CustomerAccount` (`AccountNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
