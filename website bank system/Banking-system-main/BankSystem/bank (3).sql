-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2021 at 11:22 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cname` varchar(100) DEFAULT NULL,
  `accNo` varchar(200) NOT NULL,
  `accType` varchar(200) DEFAULT NULL,
  `citizenship` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `currentBalance` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cname`, `accNo`, `accType`, `citizenship`, `email`, `currentBalance`) VALUES

('pallavi', 'UBIN23348899', 'Savings', 'US', 'pallavi2gmail.com', 510),
('sneha', 'UBIN24012205', 'savings', 'indian', 'sneha@gmail.com', 780),
('rachi', 'UBIN24012207', 'savings', 'indian', 'rachi@gmail.com', 20101),
('pooja', 'UBIN27012208', 'savings', 'indian', 'pooja@gmail.com', 19000),
('kajal', 'UBIN28012281', 'savings', 'indian', 'kajal@gmail.com', 500),


-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tid` int(11) NOT NULL,
  `senderName` varchar(200) DEFAULT NULL,
  `recipientName` varchar(200) DEFAULT NULL,
  `senderAccountNum` varchar(200) DEFAULT NULL,
  `recipientAccountNum` varchar(200) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `msg` varchar(220) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tid`, `senderName`, `recipientName`, `senderAccountNum`, `recipientAccountNum`, `amount`, `msg`) VALUES
(59, 'neha', 'pallavi', 'UBIN22011202', 'UBIN23348899', 500, 'gdh'),
(60, 'sneha', 'kajal', 'UBIN22011202', 'UBIN22011209', 10, 'no'),
(61, 'rachi', 'Amit', 'UBIN22011202', 'UBIN23348899', 10, 'ok'),
(63, 'pooja', 'harshal', 'UBIN22011202', 'UBIN22011209', 100, 'hi'),
(64, 'kajal', 'harshi', 'UBIN22011202', 'UBIN22011209', 34, 'hi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`accNo`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `senderAccountNum` (`senderAccountNum`),
  ADD KEY `recipientAccountNum` (`recipientAccountNum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`senderAccountNum`) REFERENCES `customer` (`accNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`recipientAccountNum`) REFERENCES `customer` (`accNo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
