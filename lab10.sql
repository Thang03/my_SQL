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
-- Database: `lab10`
--

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `BookCode` int(11) NOT NULL,
  `Category` varchar(250) DEFAULT NULL,
  `Author` varchar(250) DEFAULT NULL,
  `Publisher` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `InStore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`BookCode`, `Category`, `Author`, `Publisher`, `Title`, `Price`, `InStore`) VALUES
(1, 'Van Hoc', 'Trinh Cong Son', 'Kim Dong', 'Em va Trinh', 20, 100),
(2, 'Kinh Te', 'Elon Musk', 'USA', 'Gia Tri Cua Dong Tien', 35, 100),
(3, 'Kinh Di', 'Moon Night', 'USA', 'Coi Chung Sau lung Ban', 30, 100),
(4, 'Anime', 'Omada', 'Tokyo', 'Jujustu Kaisen', 15, 100),
(5, 'Anh Hung', 'Stan Lee', 'USA', 'Avenger', 40, 100);

-- --------------------------------------------------------

--
-- Table structure for table `BookSold`
--

CREATE TABLE `BookSold` (
  `BookSold_ID` int(11) NOT NULL,
  `Customers_ID` int(11) DEFAULT NULL,
  `BookCode` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BookSold`
--

INSERT INTO `BookSold` (`BookSold_ID`, `Customers_ID`, `BookCode`, `Date`, `Price`, `Amount`) VALUES
(1, 1, 1, '2003-08-27 00:00:00', 20, 100),
(2, 2, 2, '2023-12-22 00:00:00', 35, 100),
(3, 3, 3, '2022-12-15 00:00:00', 30, 100),
(4, 4, 4, '2021-05-20 00:00:00', 15, 100),
(5, 5, 5, '2012-08-27 00:00:00', 40, 100);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `Customers_ID` int(11) NOT NULL,
  `CustomersName` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Phone` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`Customers_ID`, `CustomersName`, `Address`, `Phone`) VALUES
(1, 'Nguyen Huy Thang', 'HaNoi', '0987654321'),
(2, 'Nguyen Van A', 'Ho Chi Minh', '0876654764'),
(3, 'Nguyen Van B', 'Sai Gon', '0543523516'),
(4, 'Nguyen Van C', 'Quang Ninh', '0756856543'),
(5, 'Nguyen Van D', 'Co nhue', '0132453363');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`BookCode`);

--
-- Indexes for table `BookSold`
--
ALTER TABLE `BookSold`
  ADD PRIMARY KEY (`BookSold_ID`),
  ADD KEY `Customers_ID` (`Customers_ID`),
  ADD KEY `BookCode` (`BookCode`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`Customers_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `Customers_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookSold`
--
ALTER TABLE `BookSold`
  ADD CONSTRAINT `BookSold_ibfk_1` FOREIGN KEY (`Customers_ID`) REFERENCES `Customers` (`Customers_ID`),
  ADD CONSTRAINT `BookSold_ibfk_2` FOREIGN KEY (`BookCode`) REFERENCES `Books` (`BookCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
