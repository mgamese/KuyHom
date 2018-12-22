-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2018 at 12:23 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learnning`
--

-- --------------------------------------------------------

--
-- Table structure for table `los`
--

CREATE TABLE `los` (
  `lo_id` int(11) NOT NULL,
  `lo` text COLLATE utf8_unicode_ci NOT NULL,
  `knowledge` text COLLATE utf8_unicode_ci NOT NULL,
  `skill` text COLLATE utf8_unicode_ci NOT NULL,
  `attitude` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `los`
--

INSERT INTO `los` (`lo_id`, `lo`, `knowledge`, `skill`, `attitude`, `created_at`, `updated_at`) VALUES
(16, 'qeqwe', 'qweqw', 'ew', 'wewewewe', '2018-12-14 14:43:30', '2018-12-14 14:43:30'),
(17, 't', 't', 't', 't', '2018-12-14 15:02:56', '2018-12-14 15:02:56'),
(18, 'qweqweqw', 'ะeqweqw', 'ะqweq', 'ะweqweqwe', '2018-12-14 15:11:57', '2018-12-22 10:24:22'),
(19, 'ffff', 'ff', 'ff', 'fff', '2018-12-14 15:12:03', '2018-12-14 15:12:03'),
(20, 'ffff', 'ff', 'f', 'fff', '2018-12-14 15:12:10', '2018-12-14 15:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `los_los`
--

CREATE TABLE `los_los` (
  `id` int(11) NOT NULL,
  `lo_id` int(11) NOT NULL,
  `relate_id` int(11) NOT NULL,
  `relate_type` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `los_los`
--

INSERT INTO `los_los` (`id`, `lo_id`, `relate_id`, `relate_type`, `created_at`, `updated_at`) VALUES
(5, 17, 17, 'twqeqweqwsadasdasdsadsad', '2018-12-22 10:51:19', '2018-12-22 11:13:35'),
(6, 16, 17, 'qwewqeqwewqe', '2018-12-22 11:13:53', '2018-12-22 11:13:53'),
(7, 17, 18, 'qweqweqe', '2018-12-22 11:14:05', '2018-12-22 11:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `los_type`
--

CREATE TABLE `los_type` (
  `id` int(11) NOT NULL,
  `type_name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_detail`
--

CREATE TABLE `type_detail` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `lo_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `los`
--
ALTER TABLE `los`
  ADD PRIMARY KEY (`lo_id`);

--
-- Indexes for table `los_los`
--
ALTER TABLE `los_los`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `los_type`
--
ALTER TABLE `los_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_detail`
--
ALTER TABLE `type_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `los`
--
ALTER TABLE `los`
  MODIFY `lo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `los_los`
--
ALTER TABLE `los_los`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `los_type`
--
ALTER TABLE `los_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_detail`
--
ALTER TABLE `type_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
