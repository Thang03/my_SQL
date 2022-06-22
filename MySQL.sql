-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jun 22, 2022 at 01:40 PM
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
-- Database: `MySQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_store`
--

CREATE TABLE `book_store` (
  `id` int(11) NOT NULL,
  `book_code` varchar(250) NOT NULL,
  `name_book` varchar(250) DEFAULT NULL,
  `author` varchar(250) DEFAULT NULL,
  `summary_content` varchar(500) DEFAULT NULL,
  `pubic_year` int(11) DEFAULT NULL,
  `pubic_time` int(11) DEFAULT NULL,
  `pubic_compaly` varchar(250) DEFAULT NULL,
  `pubic_address` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type_book` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `list_product`
--

CREATE TABLE `list_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `list_product`
--

INSERT INTO `list_product` (`id`, `name`, `address`, `phone`) VALUES
(1, 'Asus', 'USA', '983232');

-- --------------------------------------------------------

--
-- Table structure for table `list_table`
--

CREATE TABLE `list_table` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `list_table`
--

INSERT INTO `list_table` (`id`, `name`, `description`, `unit`, `price`, `amount`) VALUES
(1, 'Máy Tính T450', 'Máy nhập cũ', 'Chiếc', 1000, 10),
(2, 'Điện Thoại Nokia5670', 'Điện thoại đang hot', 'Chiếc', 200, 200),
(3, 'Máy In Samsung 450', 'Máy in đang loại bình', 'Chiếc', 100, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `name`, `address`, `phone`, `order_date`) VALUES
(1, 'Nguyễn Văn An', '111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '0987654321', '2009-11-18'),
(2, 'Nguyễn Văn Bắc', '222 Nguyễn Trãi, Thanh Xuân, Hà Nội', '079876543', '2009-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_detail`
--

CREATE TABLE `order_product_detail` (
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_product_detail`
--

INSERT INTO `order_product_detail` (`order_id`, `product_id`, `quantity`) VALUES
(1, 1, 10),
(1, 2, 10),
(2, 1, 10),
(2, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `phone_book`
--

CREATE TABLE `phone_book` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `your_date` date DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_book`
--

INSERT INTO `phone_book` (`id`, `name`, `phone`, `your_date`, `address`) VALUES
(1, 'Nguyễn Văn An', '0987654321,09873452,09832323,09434343', '2000-11-18', '111 Nguyễn Trãi, Thanh Xuân, Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `into_money` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `unit`, `price`, `amount`, `into_money`) VALUES
(1, 'Máy Tính T450', 'Máy nhập mới', 'Chiếc', 1000, 100, 10000),
(2, 'Điện Thoại Nokia5670', 'Điện thoại đang hot', 'Chiếc', 200, 100, 2000),
(3, 'Máy In Samsung 450', 'Máy in đang ế', 'Chiếc', 100, 100, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `product_coupons`
--

CREATE TABLE `product_coupons` (
  `id` int(11) NOT NULL,
  `product_code` varchar(500) DEFAULT NULL,
  `date_manu` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `code_name` varchar(250) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `product_type` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_coupons`
--

INSERT INTO `product_coupons` (`id`, `product_code`, `date_manu`, `name`, `code_name`, `product_name`, `product_type`) VALUES
(1, 'Z37 111111', '2009/12/12', 'Máy tính sách tay Z37', 'Z37E', 'Nguyễn Văn An', '0987688');

-- --------------------------------------------------------

--
-- Table structure for table `register_information`
--

CREATE TABLE `register_information` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `id_card` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `subscription_type` varchar(250) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `register_information`
--

INSERT INTO `register_information` (`id`, `name`, `id_card`, `address`, `phone`, `subscription_type`, `registration_date`) VALUES
(1, 'Nguyễn Nguyệt Nga', '0123456789', 'Hà Nội', '0123456789', 'Trả trước', '2022-12-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_store`
--
ALTER TABLE `book_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_product`
--
ALTER TABLE `list_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_table`
--
ALTER TABLE `list_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_book`
--
ALTER TABLE `phone_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_coupons`
--
ALTER TABLE `product_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register_information`
--
ALTER TABLE `register_information`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_store`
--
ALTER TABLE `book_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `list_product`
--
ALTER TABLE `list_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `list_table`
--
ALTER TABLE `list_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `phone_book`
--
ALTER TABLE `phone_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_coupons`
--
ALTER TABLE `product_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `register_information`
--
ALTER TABLE `register_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
