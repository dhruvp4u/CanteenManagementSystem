-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2016 at 04:23 PM
-- Server version: 5.7.11-log
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `canteen_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_order`
--

CREATE TABLE IF NOT EXISTS `active_order` (
  `a_id` int(20) NOT NULL,
  `room_no` int(20) DEFAULT NULL,
  `s_id` int(20) DEFAULT NULL,
  `m_id` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `active_order`
--

INSERT INTO `active_order` (`a_id`, `room_no`, `s_id`, `m_id`) VALUES
(5, 0, 1, 5),
(7, 0, 1, 6),
(9, 0, 4, 6),
(10, 0, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE IF NOT EXISTS `admin_details` (
  `admin_id` int(50) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `username`, `password`) VALUES
(1, 'testadmin', 'testadmin123');

-- --------------------------------------------------------

--
-- Table structure for table `college_layout`
--

CREATE TABLE IF NOT EXISTS `college_layout` (
  `id` int(50) NOT NULL,
  `floor` int(20) DEFAULT NULL,
  `room_no` int(20) DEFAULT NULL,
  `starting_ip` int(20) DEFAULT NULL,
  `ending_ip` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `college_layout`
--

INSERT INTO `college_layout` (`id`, `floor`, `room_no`, `starting_ip`, `ending_ip`) VALUES
(1, 8, 801, 2, 32);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `food_rating` int(20) DEFAULT NULL,
  `service` int(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `food_rating`, `service`, `comment`) VALUES
(1, 'test one', 1, 4, 'nice food');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `m_id` int(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` int(50) NOT NULL,
  `picture_path` varchar(250) DEFAULT NULL,
  `c_id` int(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `name`, `price`, `picture_path`, `c_id`) VALUES
(5, 'pani puri', 30, 'pani_puri.png', 6),
(6, 'bhel puri', 30, 'bhel_puri.png', 6),
(7, 'sev puri', 30, 'sev_puri.png', 6),
(8, 'ragada puri', 30, '3.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `menu_catagories`
--

CREATE TABLE IF NOT EXISTS `menu_catagories` (
  `c_id` int(50) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_catagories`
--

INSERT INTO `menu_catagories` (`c_id`, `name`) VALUES
(6, 'chaat');

-- --------------------------------------------------------

--
-- Table structure for table `past_order`
--

CREATE TABLE IF NOT EXISTS `past_order` (
  `p_id` int(20) NOT NULL,
  `room_no` int(20) DEFAULT NULL,
  `s_id` int(20) DEFAULT NULL,
  `m_id` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `past_order`
--

INSERT INTO `past_order` (`p_id`, `room_no`, `s_id`, `m_id`) VALUES
(2, 0, 2, 7),
(3, 0, 1, 5),
(4, 0, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE IF NOT EXISTS `student_details` (
  `s_id` int(25) NOT NULL,
  `somaiya_id` int(20) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile_no` varchar(250) DEFAULT NULL,
  `email_id` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`s_id`, `somaiya_id`, `name`, `mobile_no`, `email_id`, `password`) VALUES
(1, 2013201320, 'test one', '9898989898', 'testone@somaiya.edu', 'testone'),
(2, 1234567890, 'test two', '1234567890', 'testtwo@somaiya.edu', 'testtwo'),
(3, 1234567890, 'Atiq Patel', '9969504868', 'atiq.patel@somaiya.edu', 'atiqpatel'),
(4, 1234566785, 'nisha v', '1234567891', 'abc@somaiya.edu', '123123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_order`
--
ALTER TABLE `active_order`
  ADD PRIMARY KEY (`a_id`), ADD KEY `s_id` (`s_id`), ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `college_layout`
--
ALTER TABLE `college_layout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`m_id`), ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `menu_catagories`
--
ALTER TABLE `menu_catagories`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `past_order`
--
ALTER TABLE `past_order`
  ADD PRIMARY KEY (`p_id`), ADD KEY `s_id` (`s_id`), ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_order`
--
ALTER TABLE `active_order`
  MODIFY `a_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `admin_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `college_layout`
--
ALTER TABLE `college_layout`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `m_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `menu_catagories`
--
ALTER TABLE `menu_catagories`
  MODIFY `c_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `past_order`
--
ALTER TABLE `past_order`
  MODIFY `p_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `s_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_order`
--
ALTER TABLE `active_order`
ADD CONSTRAINT `active_order_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student_details` (`s_id`),
ADD CONSTRAINT `active_order_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `menu` (`m_id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `menu_catagories` (`c_id`);

--
-- Constraints for table `past_order`
--
ALTER TABLE `past_order`
ADD CONSTRAINT `past_order_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student_details` (`s_id`),
ADD CONSTRAINT `past_order_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `menu` (`m_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
