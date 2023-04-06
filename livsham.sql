-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 06, 2023 at 04:39 PM
-- Server version: 10.5.16-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u834817209_livesham`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(23, 1, 10, 4, '2023-02-12 16:14:58', '2023-02-13 15:46:50'),
(22, 2, 13, 1, '2023-02-12 16:14:09', '2023-02-12 16:14:09'),
(21, 1, 3, 3, '2023-02-12 12:34:52', '2023-02-13 15:47:31'),
(26, 1, 17, 1, '2023-02-13 15:47:13', '2023-02-13 15:47:13'),
(27, 1, 21, 2, '2023-02-13 16:00:42', '2023-02-13 16:01:39'),
(29, 1, 13, 2, '2023-02-22 13:01:55', '2023-02-22 13:02:04'),
(30, 1, 1, 1, '2023-03-03 18:31:57', '2023-03-03 18:31:57'),
(31, 24, 33, 1, '2023-03-08 17:31:46', '2023-03-08 17:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Frukt & Grönsaker', '2023-02-03 20:46:54', '2023-03-16 19:28:02'),
(11, 'Mejeri, Ost & Ägg', '2023-03-04 20:26:42', '2023-03-04 20:26:42'),
(12, 'Bröd & Kakor', '2023-03-04 20:26:57', '2023-03-04 20:26:57'),
(13, 'Kött & Chark', '2023-03-04 20:27:11', '2023-03-04 20:27:11'),
(14, 'Fisk & Skaldjur', '2023-03-04 20:27:27', '2023-03-04 20:27:27'),
(15, 'Dryck', '2023-03-04 20:27:45', '2023-03-04 20:27:45'),
(16, 'Skafferi', '2023-03-04 20:28:01', '2023-03-04 20:28:01'),
(18, 'Godis & snacks', '2023-03-16 20:54:52', '2023-03-16 20:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `max_discount` float(10,2) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `usage_limit` int(11) DEFAULT 10000000,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `start_date`, `end_date`, `amount`, `max_discount`, `type`, `code`, `usage_limit`, `created_at`, `updated_at`) VALUES
(10, 'Percentage Discount', '2023-04-02', '2023-04-11', 12.00, 200.00, 'Percentage', 'RLo7x7yo', NULL, '2023-04-01 18:49:21', '2023-04-04 18:31:51'),
(11, 'Flat Discount', '2023-04-04', '2023-04-14', 24.00, NULL, 'Flat', 'TYKaOLfJ', NULL, '2023-04-01 18:52:33', '2023-04-04 18:31:08'),
(12, 'Free Shipping', '2023-04-02', '2023-04-12', 10.00, 300.00, 'FreeShipping', 'kkxsuEhB', NULL, '2023-04-01 18:53:29', '2023-04-04 18:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_users`
--

CREATE TABLE `coupon_users` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_users`
--

INSERT INTO `coupon_users` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(1, 22, NULL, '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
(2, 29, NULL, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(3, 1, NULL, '2023-04-04 18:20:55', '2023-04-04 18:20:55'),
(4, 29, 10, '2023-04-04 18:38:14', '2023-04-04 18:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `customer_messages`
--

CREATE TABLE `customer_messages` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_messages`
--

INSERT INTO `customer_messages` (`id`, `fname`, `lname`, `email`, `orderno`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 'asdas', 'asdas', 'faizahmed2323@gmail.com', '123123', 'asdas', 'asdasd', '2023-03-30 21:26:44', '2023-03-30 21:26:44'),
(3, 'Rouzbeh', 'Nikberg', 'r.nikberg@gmail.com', '342352345', 'Test', 'TESTAR', '2023-04-03 17:05:03', '2023-04-03 17:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_address`
--

CREATE TABLE `delivery_address` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` int(5) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_address`
--

INSERT INTO `delivery_address` (`id`, `fname`, `lname`, `email`, `street_address`, `postal_code`, `city`, `phone`, `country`, `message`, `created_at`, `updated_at`) VALUES
(3, 'Test', 'Test', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-25 19:56:18', '2023-03-25 19:56:18'),
(4, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-26 19:20:04', '2023-03-26 19:20:04'),
(5, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-26 19:22:09', '2023-03-26 19:22:09'),
(6, 'kalle', 'kksasad', 'customer@email.se', 'Storgatan 10', 11451, 'Stockholm', '+46 70 234 52 34', 'se', NULL, '2023-03-26 19:27:38', '2023-03-26 19:27:38'),
(7, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-26 22:33:13', '2023-03-26 22:33:13'),
(8, 'kalle', 'Svensson', 'kalle@hotmail.com', 'Hälsovägen 13', 14157, 'Huddinge', '+46 73 094 58 73', 'se', NULL, '2023-03-27 16:50:08', '2023-03-27 16:50:08'),
(9, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(10, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-30 16:25:26', '2023-03-30 16:25:26'),
(11, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-30 17:45:28', '2023-03-30 17:45:28'),
(12, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-30 18:54:32', '2023-03-30 18:54:32'),
(13, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(14, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(15, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(16, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-31 16:43:16', '2023-03-31 16:43:16'),
(17, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-31 18:40:29', '2023-03-31 18:40:29'),
(18, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
(19, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-03-31 20:52:49', '2023-03-31 20:52:49'),
(20, 'Test', 'Person-se', 'customer@email.se', 'Karlaplan 3', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-01 17:05:39', '2023-04-01 17:05:39'),
(21, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
(22, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:18:36', '2023-04-03 20:18:36'),
(23, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:25:09', '2023-04-03 20:25:09'),
(24, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:36:38', '2023-04-03 20:36:38'),
(25, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:41:11', '2023-04-03 20:41:11'),
(26, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:44:56', '2023-04-03 20:44:56'),
(27, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:52:49', '2023-04-03 20:52:49'),
(28, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:53:30', '2023-04-03 20:53:30'),
(29, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:55:00', '2023-04-03 20:55:00'),
(30, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 20:57:11', '2023-04-03 20:57:11'),
(31, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 21:00:43', '2023-04-03 21:00:43'),
(32, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 21:03:22', '2023-04-03 21:03:22'),
(33, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 22:53:25', '2023-04-03 22:53:25'),
(34, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 22:54:38', '2023-04-03 22:54:38'),
(35, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 22:56:51', '2023-04-03 22:56:51'),
(36, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 22:59:00', '2023-04-03 22:59:00'),
(37, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 23:06:19', '2023-04-03 23:06:19'),
(38, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-03 23:09:03', '2023-04-03 23:09:03'),
(39, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 01:17:57', '2023-04-04 01:17:57'),
(40, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 01:29:10', '2023-04-04 01:29:10'),
(41, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 01:30:33', '2023-04-04 01:30:33'),
(42, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
(43, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 16:39:08', '2023-04-04 16:39:08'),
(44, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 16:41:51', '2023-04-04 16:41:51'),
(45, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(46, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 17:30:41', '2023-04-04 17:30:41'),
(47, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
(48, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 18:15:40', '2023-04-04 18:15:40'),
(49, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 18:20:55', '2023-04-04 18:20:55'),
(50, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 18:26:24', '2023-04-04 18:26:24'),
(51, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 18:38:14', '2023-04-04 18:38:14'),
(52, 'Test', 'Person-SE', 'customer@email.se', 'Karlaplan 8', 11460, 'Stockholm', '+46 76 526 00 00', 'se', NULL, '2023-04-04 18:53:00', '2023-04-04 18:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_times`
--

CREATE TABLE `delivery_times` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `no_of_orders` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_times`
--

INSERT INTO `delivery_times` (`id`, `date`, `start_time`, `end_time`, `status`, `no_of_orders`, `created_at`, `updated_at`) VALUES
(1, '2023-03-27', '17:25:40', '23:35:11', 1, 0, '2023-03-25 22:42:05', '0000-00-00 00:00:00'),
(2, '2023-03-28', '11:43:42', '08:43:42', 1, 0, '2023-03-25 22:44:08', '0000-00-00 00:00:00'),
(3, '2023-03-29', '00:00:00', '24:00:00', 1, 0, '2023-03-26 12:38:51', '0000-00-00 00:00:00'),
(4, '2023-01-26', '00:00:00', '24:00:00', 0, 0, '2023-03-26 13:40:00', '2023-03-26 13:42:37'),
(5, '2023-07-01', '00:00:00', '24:00:00', 0, 0, '2023-03-26 14:32:50', '2023-03-26 14:32:50'),
(6, '2023-04-29', '00:00:00', '24:00:00', 1, 0, '2023-03-26 14:35:08', '2023-03-26 14:53:23'),
(7, '2023-01-02', '00:00:00', '24:00:00', 0, 0, '2023-03-26 14:36:01', '2023-03-26 14:36:01'),
(8, '2023-05-30', '00:00:00', '24:00:00', 1, 0, '2023-03-26 14:36:25', '2023-03-26 14:43:15'),
(9, '2023-03-28', '00:00:00', '24:00:00', 0, 0, '2023-03-26 14:37:34', '2023-03-26 14:43:54'),
(10, '2023-02-27', '00:00:00', '24:00:00', 0, 0, '2023-03-26 14:53:15', '2023-03-26 14:53:15'),
(11, '2023-03-29', '10:00:00', '12:00:00', 0, 0, '2023-03-26 19:03:49', '2023-03-26 19:06:20'),
(12, '2023-03-27', '16:00:00', '18:00:00', 0, 0, '2023-03-26 19:07:05', '2023-03-26 19:07:05'),
(13, '2023-03-30', '06:00:00', '08:00:00', 1, 1, '2023-03-27 16:50:08', '2023-03-27 16:50:08'),
(14, '2023-03-27', '06:00:00', '08:00:00', 1, 0, '2023-03-27 21:36:46', '2023-03-27 21:36:49'),
(15, '2023-03-30', '00:00:00', '24:00:00', 0, 0, '2023-03-27 22:19:36', '2023-03-27 22:19:36'),
(16, '2023-03-31', '00:00:00', '24:00:00', 0, 0, '2023-03-27 22:19:38', '2023-03-27 22:19:38'),
(17, '2023-04-01', '06:00:00', '08:00:00', 0, 8, '2023-03-29 00:55:18', '2023-03-31 20:52:49'),
(18, '2023-04-01', '08:00:00', '10:00:00', 1, 1, '2023-03-30 16:25:26', '2023-03-30 16:25:26'),
(19, '2023-03-31', '08:00:00', '10:00:00', 1, 2, '2023-03-31 16:43:16', '2023-04-01 17:05:39'),
(20, '2023-04-03', '06:00:00', '08:00:00', 0, 15, '2023-04-03 19:53:48', '2023-04-03 23:09:03'),
(21, '2023-04-06', '14:00:00', '16:00:00', 1, 3, '2023-04-03 20:18:36', '2023-04-03 20:36:38'),
(22, '2023-04-04', '06:00:00', '08:00:00', 1, 2, '2023-04-04 01:17:57', '2023-04-04 01:29:10'),
(23, '2023-04-06', '06:00:00', '08:00:00', 1, 2, '2023-04-04 01:32:19', '2023-04-04 16:41:51'),
(24, '2023-04-06', '08:00:00', '10:00:00', 1, 3, '2023-04-04 16:39:08', '2023-04-04 18:38:14'),
(25, '2023-04-05', '12:00:00', '14:00:00', 1, 1, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(26, '2023-04-05', '06:00:00', '08:00:00', 1, 1, '2023-04-04 17:30:41', '2023-04-04 17:30:41'),
(27, '2023-04-05', '08:00:00', '10:00:00', 1, 2, '2023-04-04 18:15:40', '2023-04-04 18:20:55'),
(28, '2023-04-05', '16:00:00', '18:00:00', 1, 1, '2023-04-04 18:26:24', '2023-04-04 18:26:24'),
(29, '2023-04-05', '14:00:00', '16:00:00', 1, 1, '2023-04-04 18:53:00', '2023-04-04 18:53:00'),
(30, '2023-04-07', '06:00:00', '08:00:00', 0, 0, '2023-04-05 18:18:51', '2023-04-05 18:18:51'),
(31, '2023-04-07', '08:00:00', '10:00:00', 0, 0, '2023-04-05 18:18:54', '2023-04-05 18:18:54'),
(32, '2023-04-07', '10:00:00', '12:00:00', 0, 0, '2023-04-05 18:18:55', '2023-04-05 18:18:55'),
(33, '2023-04-07', '12:00:00', '14:00:00', 0, 0, '2023-04-05 18:18:59', '2023-04-05 18:18:59'),
(34, '2023-04-07', '14:00:00', '16:00:00', 0, 0, '2023-04-05 18:19:00', '2023-04-05 18:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_time_postcode`
--

CREATE TABLE `delivery_time_postcode` (
  `id` int(11) NOT NULL,
  `postcode_id` int(11) DEFAULT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diet`
--

CREATE TABLE `diet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diet`
--

INSERT INTO `diet` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'test', '2023-03-15 16:19:25', '2023-03-15 16:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `disabled_delivery_time`
--

CREATE TABLE `disabled_delivery_time` (
  `id` int(11) NOT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `product_id`) VALUES
(47, 29, 35),
(51, 29, 10),
(58, 22, 9),
(61, 29, 20),
(62, 29, 11),
(63, 29, 9),
(64, 29, 22),
(65, 29, 34),
(66, 29, 36),
(82, 1, 16),
(83, 1, 14),
(84, 1, 17),
(85, 1, 18),
(103, 22, 16),
(104, 22, 17),
(105, 22, 18),
(106, 22, 20),
(108, 22, 13),
(124, 22, 13),
(126, 22, 14),
(127, 22, 16),
(128, 22, 20),
(129, 22, 18);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `recurring_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_outside` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `user_id`, `delivery_address_id`, `delivery_time_id`, `coupon_id`, `total_price`, `recurring_delivery`, `leave_outside`, `message`, `created_at`, `updated_at`) VALUES
('06aa7030-2a58-4859-a6a4-890b07484f66', 0, 22, 28, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 20:53:30', '2023-04-03 20:53:30'),
('0d54c70a-0b47-4ae8-a501-ec38bdf9247e', 0, 22, 30, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 20:57:11', '2023-04-03 20:57:11'),
('10cf17d7-c758-45c1-b6bf-5683bad60fae', 0, 22, 37, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 23:06:19', '2023-04-03 23:06:19'),
('1292e4d2-85db-477d-b97c-5f389e1893b1', 0, 29, 51, 24, NULL, '130.19', NULL, NULL, NULL, '2023-04-04 18:38:14', '2023-04-04 18:38:14'),
('1d2e6770-b983-44c9-a380-ee95e731936f', 0, 29, 24, 21, NULL, '649.50', 'every_week', 1, 'HELLO', '2023-04-03 20:36:38', '2023-04-03 20:36:38'),
('223d19c2-072b-4427-94de-dbe62d5a2c52', 0, 1, 49, 27, NULL, '130.00', NULL, NULL, NULL, '2023-04-04 18:20:55', '2023-04-04 18:20:55'),
('287724a5-aafa-4bde-bd65-6ca2ca54dd51', 0, 22, 39, 22, NULL, '15.00', 'bi_weekly', 1, 'Please leave the delivery outside', '2023-04-04 01:17:57', '2023-04-04 01:17:57'),
('2c56c56b-248f-4955-9e62-165e921cc29c', 0, 22, 32, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 21:03:22', '2023-04-03 21:03:22'),
('38623b61-ceca-4f1d-b3a8-f2e95dc68c60', 0, 29, 23, 21, NULL, '189.75', 'every_week', 1, 'HELLO', '2023-04-03 20:25:09', '2023-04-03 20:25:09'),
('3a42e13a-04dc-4b50-a056-6b0a5d6c92a0', 0, 29, 43, 24, NULL, '135.00', NULL, NULL, NULL, '2023-04-04 16:39:08', '2023-04-04 16:39:08'),
('4254dcc3-966a-42c8-887b-fb537f006e5e', 0, 22, 29, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 20:55:00', '2023-04-03 20:55:00'),
('48c6a2ec-9fa3-4b07-bec9-e9eb7eadcb66', 0, 29, 52, 29, NULL, '135.00', NULL, NULL, NULL, '2023-04-04 18:53:00', '2023-04-04 18:53:00'),
('50ccf9f8-649b-431d-a7e3-19103907fce3', 0, 1, 48, 27, NULL, '285.00', NULL, NULL, NULL, '2023-04-04 18:15:40', '2023-04-04 18:15:40'),
('55b3db2a-c1ef-4fb7-9afd-6b8281e41b62', 0, 22, 25, 20, NULL, '155.00', 'every_week', 1, 'test', '2023-04-03 20:41:12', '2023-04-03 20:41:12'),
('5c0ef6c5-3619-4354-bcd4-0e3c5c1a0ae6', 0, 22, 42, 23, NULL, '85.00', 'every_week', 1, 'test', '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
('5cac255d-df14-4050-bbb5-d4a5511fde94', 0, 22, 36, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 22:59:00', '2023-04-03 22:59:00'),
('5d865248-ff3c-45c5-8b42-035e290f2450', 0, 22, 15, 17, NULL, '208.35', NULL, NULL, NULL, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
('6dc88a19-f099-4644-9923-8540781aee98', 0, NULL, 20, 19, NULL, '280.70', NULL, NULL, NULL, '2023-04-01 17:05:39', '2023-04-01 17:05:39'),
('76b842e0-4d67-4493-95d8-119975ffcd7c', 0, 22, 33, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 22:53:25', '2023-04-03 22:53:25'),
('811f7ebf-77ea-4878-9dac-ab99e8340ca3', 0, 22, 31, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 21:00:43', '2023-04-03 21:00:43'),
('8b2bd057-39cc-4d05-b62f-e4b161d7fe13', 0, 22, 27, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 20:52:49', '2023-04-03 20:52:49'),
('9baeb98a-f420-4729-8678-75c6dc707572', 0, 22, 19, 17, NULL, '165.80', 'bi_weekly', 1, 'test', '2023-03-31 20:52:49', '2023-04-03 17:06:19'),
('a8604090-a287-4c54-84b0-a76efb5838e1', 0, 22, 38, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 23:09:03', '2023-04-03 23:09:03'),
('ab737c81-addc-4b2f-9c91-814959e88771', 0, NULL, 21, 20, NULL, '175.95', 'bi_weekly', NULL, NULL, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
('ad701ef9-7112-423c-8283-cdb34ca00488', 0, 29, 45, 25, NULL, '128.94', NULL, NULL, NULL, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
('b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 2, NULL, 14, 17, NULL, '972.80', NULL, NULL, NULL, '2023-03-30 19:51:47', '2023-03-30 19:53:47'),
('b4bb60d9-1056-4eb2-ad48-9846094ef07a', 0, 30, 47, 24, NULL, '230.00', NULL, NULL, NULL, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
('b7cfe127-4f21-4e8b-889f-092230b9f5d4', 0, 22, 22, 21, NULL, '135.00', 'bi_weekly', 1, 'Hello MF', '2023-04-03 20:18:36', '2023-04-03 20:18:36'),
('bcc9720a-4128-4785-ace5-8f86091c919f', 0, 1, 50, 28, NULL, '295.00', NULL, NULL, NULL, '2023-04-04 18:26:24', '2023-04-04 18:26:24'),
('c93f9eda-045e-4476-ba19-a002243c89c6', 0, 22, 18, 17, NULL, '250.95', '1', 1, NULL, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
('cb72f08b-e2b4-4389-b4be-61c07fcebec5', 0, 30, 46, 26, NULL, '129.90', NULL, NULL, NULL, '2023-04-04 17:30:41', '2023-04-04 17:30:41'),
('cc204ca8-0362-4de2-a379-abaef50a0cd7', 0, 22, 44, 23, NULL, '120.00', 'every_week', 1, 'test', '2023-04-04 16:41:51', '2023-04-04 16:41:51'),
('d0baaf1f-23a5-4e63-8b96-778d3c24c294', 0, 22, 26, 20, NULL, '125.00', 'every_week', 1, 'test', '2023-04-03 20:44:56', '2023-04-03 20:44:56'),
('eb28308a-ab14-42ed-abdd-a311b266205c', 0, 22, 35, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 22:56:51', '2023-04-03 22:56:51'),
('ef1fba03-2195-415f-9a7d-9dca87019ca5', 0, 22, 34, 20, NULL, '220.95', 'every_week', 1, 'test', '2023-04-03 22:54:38', '2023-04-03 22:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_time`
--

CREATE TABLE `order_delivery_time` (
  `id` int(11) NOT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_id`, `qty`, `created_at`, `updated_at`) VALUES
(10, 14, NULL, 2, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(11, 16, NULL, 1, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(12, 17, NULL, 2, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(13, 13, NULL, 1, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(14, 10, NULL, 2, '2023-03-29 00:55:18', '2023-03-29 00:55:18'),
(15, 14, NULL, 1, '2023-03-30 16:25:26', '2023-03-30 16:25:26'),
(16, 16, NULL, 1, '2023-03-30 16:25:26', '2023-03-30 16:25:26'),
(17, 13, NULL, 1, '2023-03-30 16:25:26', '2023-03-30 16:25:26'),
(18, 13, NULL, 1, '2023-03-30 17:45:28', '2023-03-30 17:45:28'),
(19, 14, NULL, 2, '2023-03-30 17:45:28', '2023-03-30 17:45:28'),
(20, 1, NULL, 2, '2023-03-30 17:45:28', '2023-03-30 17:45:28'),
(21, 3, NULL, 1, '2023-03-30 17:45:28', '2023-03-30 17:45:28'),
(22, 13, NULL, 4, '2023-03-30 18:54:33', '2023-03-30 18:54:33'),
(23, 14, NULL, 2, '2023-03-30 18:54:33', '2023-03-30 18:54:33'),
(24, 173, NULL, 1, '2023-03-30 18:54:33', '2023-03-30 18:54:33'),
(25, 1, NULL, 2, '2023-03-30 18:54:33', '2023-03-30 18:54:33'),
(26, 3, NULL, 2, '2023-03-30 18:54:33', '2023-03-30 18:54:33'),
(27, 13, NULL, 1, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(28, 14, NULL, 1, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(29, 3, NULL, 1, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(30, 51, NULL, 2, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(31, 53, NULL, 1, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(32, 60, NULL, 5, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(33, 64, NULL, 1, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(34, 67, NULL, 2, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(35, 72, NULL, 2, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(36, 71, NULL, 2, '2023-03-30 19:00:25', '2023-03-30 19:00:25'),
(37, 13, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(38, 14, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(39, 16, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(40, 17, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(41, 18, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(42, 3, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(43, 53, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(44, 54, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(45, 51, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(46, 59, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(47, 58, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(48, 60, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 1, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(49, 67, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 2, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(50, 69, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 2, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(51, 71, 'b2ec23f7-a69a-4fbd-ae09-a79fe74e1186', 2, '2023-03-30 19:51:47', '2023-03-30 19:51:47'),
(52, 48, '5d865248-ff3c-45c5-8b42-035e290f2450', 1, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(53, 51, '5d865248-ff3c-45c5-8b42-035e290f2450', 1, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(54, 53, '5d865248-ff3c-45c5-8b42-035e290f2450', 1, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(55, 23, '5d865248-ff3c-45c5-8b42-035e290f2450', 1, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(56, 47, '5d865248-ff3c-45c5-8b42-035e290f2450', 1, '2023-03-31 16:30:00', '2023-03-31 16:30:00'),
(64, 13, 'c93f9eda-045e-4476-ba19-a002243c89c6', 1, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
(65, 14, 'c93f9eda-045e-4476-ba19-a002243c89c6', 1, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
(66, 173, 'c93f9eda-045e-4476-ba19-a002243c89c6', 1, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
(67, 3, 'c93f9eda-045e-4476-ba19-a002243c89c6', 1, '2023-03-31 20:47:20', '2023-03-31 20:47:20'),
(68, 1, '9baeb98a-f420-4729-8678-75c6dc707572', 1, '2023-03-31 20:52:49', '2023-03-31 20:52:49'),
(69, 3, '9baeb98a-f420-4729-8678-75c6dc707572', 1, '2023-03-31 20:52:49', '2023-03-31 20:52:49'),
(70, 9, '9baeb98a-f420-4729-8678-75c6dc707572', 1, '2023-03-31 20:52:49', '2023-03-31 20:52:49'),
(71, 9, 'ab737c81-addc-4b2f-9c91-814959e88771', 1, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
(72, 10, 'ab737c81-addc-4b2f-9c91-814959e88771', 1, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
(73, 11, 'ab737c81-addc-4b2f-9c91-814959e88771', 1, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
(74, 22, 'ab737c81-addc-4b2f-9c91-814959e88771', 1, '2023-04-03 19:53:48', '2023-04-03 19:53:48'),
(75, 14, 'b7cfe127-4f21-4e8b-889f-092230b9f5d4', 4, '2023-04-03 20:18:36', '2023-04-03 20:18:36'),
(76, 9, '38623b61-ceca-4f1d-b3a8-f2e95dc68c60', 5, '2023-04-03 20:25:09', '2023-04-03 20:25:09'),
(77, 34, '1d2e6770-b983-44c9-a380-ee95e731936f', 17, '2023-04-03 20:36:38', '2023-04-03 20:36:38'),
(78, 47, '1d2e6770-b983-44c9-a380-ee95e731936f', 11, '2023-04-03 20:36:38', '2023-04-03 20:36:38'),
(79, 14, '55b3db2a-c1ef-4fb7-9afd-6b8281e41b62', 1, '2023-04-03 20:41:12', '2023-04-03 20:41:12'),
(80, 16, '55b3db2a-c1ef-4fb7-9afd-6b8281e41b62', 1, '2023-04-03 20:41:12', '2023-04-03 20:41:12'),
(81, 17, '55b3db2a-c1ef-4fb7-9afd-6b8281e41b62', 1, '2023-04-03 20:41:12', '2023-04-03 20:41:12'),
(82, 13, 'd0baaf1f-23a5-4e63-8b96-778d3c24c294', 1, '2023-04-03 20:44:56', '2023-04-03 20:44:56'),
(83, 13, '8b2bd057-39cc-4d05-b62f-e4b161d7fe13', 1, '2023-04-03 20:52:49', '2023-04-03 20:52:49'),
(84, 13, '06aa7030-2a58-4859-a6a4-890b07484f66', 1, '2023-04-03 20:53:30', '2023-04-03 20:53:30'),
(85, 13, '4254dcc3-966a-42c8-887b-fb537f006e5e', 1, '2023-04-03 20:55:00', '2023-04-03 20:55:00'),
(86, 13, '0d54c70a-0b47-4ae8-a501-ec38bdf9247e', 1, '2023-04-03 20:57:11', '2023-04-03 20:57:11'),
(87, 13, '811f7ebf-77ea-4878-9dac-ab99e8340ca3', 1, '2023-04-03 21:00:43', '2023-04-03 21:00:43'),
(88, 13, '2c56c56b-248f-4955-9e62-165e921cc29c', 1, '2023-04-03 21:03:22', '2023-04-03 21:03:22'),
(89, 13, '76b842e0-4d67-4493-95d8-119975ffcd7c', 3, '2023-04-03 22:53:25', '2023-04-03 22:53:25'),
(90, 14, '76b842e0-4d67-4493-95d8-119975ffcd7c', 2, '2023-04-03 22:53:25', '2023-04-03 22:53:25'),
(91, 3, '76b842e0-4d67-4493-95d8-119975ffcd7c', 1, '2023-04-03 22:53:25', '2023-04-03 22:53:25'),
(92, 13, 'ef1fba03-2195-415f-9a7d-9dca87019ca5', 3, '2023-04-03 22:54:38', '2023-04-03 22:54:38'),
(93, 14, 'ef1fba03-2195-415f-9a7d-9dca87019ca5', 2, '2023-04-03 22:54:38', '2023-04-03 22:54:38'),
(94, 3, 'ef1fba03-2195-415f-9a7d-9dca87019ca5', 1, '2023-04-03 22:54:38', '2023-04-03 22:54:38'),
(95, 13, 'eb28308a-ab14-42ed-abdd-a311b266205c', 3, '2023-04-03 22:56:51', '2023-04-03 22:56:51'),
(96, 14, 'eb28308a-ab14-42ed-abdd-a311b266205c', 2, '2023-04-03 22:56:51', '2023-04-03 22:56:51'),
(97, 3, 'eb28308a-ab14-42ed-abdd-a311b266205c', 1, '2023-04-03 22:56:51', '2023-04-03 22:56:51'),
(98, 13, '5cac255d-df14-4050-bbb5-d4a5511fde94', 3, '2023-04-03 22:59:00', '2023-04-03 22:59:00'),
(99, 14, '5cac255d-df14-4050-bbb5-d4a5511fde94', 2, '2023-04-03 22:59:00', '2023-04-03 22:59:00'),
(100, 3, '5cac255d-df14-4050-bbb5-d4a5511fde94', 1, '2023-04-03 22:59:00', '2023-04-03 22:59:00'),
(101, 13, '10cf17d7-c758-45c1-b6bf-5683bad60fae', 3, '2023-04-03 23:06:19', '2023-04-03 23:06:19'),
(102, 14, '10cf17d7-c758-45c1-b6bf-5683bad60fae', 2, '2023-04-03 23:06:19', '2023-04-03 23:06:19'),
(103, 3, '10cf17d7-c758-45c1-b6bf-5683bad60fae', 1, '2023-04-03 23:06:19', '2023-04-03 23:06:19'),
(104, 13, 'a8604090-a287-4c54-84b0-a76efb5838e1', 3, '2023-04-03 23:09:03', '2023-04-03 23:09:03'),
(105, 14, 'a8604090-a287-4c54-84b0-a76efb5838e1', 2, '2023-04-03 23:09:03', '2023-04-03 23:09:03'),
(106, 3, 'a8604090-a287-4c54-84b0-a76efb5838e1', 1, '2023-04-03 23:09:03', '2023-04-03 23:09:03'),
(107, 14, '287724a5-aafa-4bde-bd65-6ca2ca54dd51', 1, '2023-04-04 01:17:57', '2023-04-04 01:17:57'),
(108, 16, '287724a5-aafa-4bde-bd65-6ca2ca54dd51', 1, '2023-04-04 01:17:57', '2023-04-04 01:17:57'),
(109, 13, '5c0ef6c5-3619-4354-bcd4-0e3c5c1a0ae6', 2, '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
(110, 14, '5c0ef6c5-3619-4354-bcd4-0e3c5c1a0ae6', 2, '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
(111, 16, '5c0ef6c5-3619-4354-bcd4-0e3c5c1a0ae6', 1, '2023-04-04 01:32:19', '2023-04-04 01:32:19'),
(112, 14, '3a42e13a-04dc-4b50-a056-6b0a5d6c92a0', 4, '2023-04-04 16:39:08', '2023-04-04 16:39:08'),
(113, 18, 'cc204ca8-0362-4de2-a379-abaef50a0cd7', 1, '2023-04-04 16:41:51', '2023-04-04 16:41:51'),
(114, 14, 'ad701ef9-7112-423c-8283-cdb34ca00488', 4, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(115, 20, 'ad701ef9-7112-423c-8283-cdb34ca00488', 3, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(116, 9, 'ad701ef9-7112-423c-8283-cdb34ca00488', 1, '2023-04-04 16:58:49', '2023-04-04 16:58:49'),
(117, 3, 'cb72f08b-e2b4-4389-b4be-61c07fcebec5', 1, '2023-04-04 17:30:41', '2023-04-04 17:30:41'),
(118, 9, 'cb72f08b-e2b4-4389-b4be-61c07fcebec5', 1, '2023-04-04 17:30:41', '2023-04-04 17:30:41'),
(119, 17, 'b4bb60d9-1056-4eb2-ad48-9846094ef07a', 2, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
(120, 18, 'b4bb60d9-1056-4eb2-ad48-9846094ef07a', 1, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
(121, 16, 'b4bb60d9-1056-4eb2-ad48-9846094ef07a', 2, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
(122, 14, 'b4bb60d9-1056-4eb2-ad48-9846094ef07a', 1, '2023-04-04 17:47:00', '2023-04-04 17:47:00'),
(123, 16, '50ccf9f8-649b-431d-a7e3-19103907fce3', 3, '2023-04-04 18:15:40', '2023-04-04 18:15:40'),
(124, 17, '50ccf9f8-649b-431d-a7e3-19103907fce3', 4, '2023-04-04 18:15:40', '2023-04-04 18:15:40'),
(125, 10, '223d19c2-072b-4427-94de-dbe62d5a2c52', 3, '2023-04-04 18:20:55', '2023-04-04 18:20:55'),
(126, 17, 'bcc9720a-4128-4785-ace5-8f86091c919f', 5, '2023-04-04 18:26:24', '2023-04-04 18:26:24'),
(127, 16, '1292e4d2-85db-477d-b97c-5f389e1893b1', 4, '2023-04-04 18:38:14', '2023-04-04 18:38:14'),
(128, 16, '48c6a2ec-9fa3-4b07-bec9-e9eb7eadcb66', 4, '2023-04-04 18:53:00', '2023-04-04 18:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_lists`
--

CREATE TABLE `order_lists` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Sweden', '2023-03-11 12:31:00', '2023-03-11 12:31:00'),
(3, 'test', '2023-03-11 12:51:40', '2023-03-11 12:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `postcodes`
--

CREATE TABLE `postcodes` (
  `id` int(11) NOT NULL,
  `postcode` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postcodes`
--

INSERT INTO `postcodes` (`id`, `postcode`, `created_at`, `updated_at`) VALUES
(3, 15023, '2023-03-27 20:57:39', '2023-03-27 20:57:39'),
(4, 15100, '2023-03-27 20:57:54', '2023-03-27 20:57:54'),
(5, 15101, '2023-03-27 20:58:51', '2023-03-27 20:58:51'),
(6, 15102, '2023-03-27 20:59:02', '2023-03-27 20:59:02'),
(7, 15103, '2023-03-27 20:59:12', '2023-03-27 20:59:12'),
(8, 15104, '2023-03-27 20:59:23', '2023-03-27 20:59:23'),
(9, 15105, '2023-03-27 20:59:35', '2023-03-27 20:59:35'),
(10, 15106, '2023-03-27 20:59:43', '2023-03-27 20:59:43'),
(11, 15107, '2023-03-27 20:59:53', '2023-03-27 20:59:53'),
(12, 15108, '2023-03-27 20:59:59', '2023-03-27 20:59:59'),
(13, 15109, '2023-03-27 21:00:09', '2023-03-27 21:00:09'),
(15, 15110, '2023-03-27 21:00:37', '2023-03-27 21:00:37'),
(16, 15113, '2023-03-27 21:01:05', '2023-03-27 21:01:05'),
(17, 15120, '2023-03-27 21:01:15', '2023-03-27 21:01:15'),
(18, 15121, '2023-03-27 21:01:32', '2023-03-27 21:01:32'),
(19, 15122, '2023-03-27 21:02:01', '2023-03-27 21:02:01'),
(20, 15123, '2023-03-27 21:02:11', '2023-03-27 21:02:11'),
(21, 15124, '2023-03-27 21:02:30', '2023-03-27 21:02:30'),
(24, 15126, '2023-03-27 21:02:51', '2023-03-27 21:02:51'),
(25, 15127, '2023-03-27 21:03:36', '2023-03-27 21:03:36'),
(26, 15129, '2023-03-27 21:03:46', '2023-03-27 21:03:46'),
(27, 15132, '2023-03-27 21:03:56', '2023-03-27 21:03:56'),
(28, 15133, '2023-03-27 21:04:08', '2023-03-27 21:04:08'),
(29, 15134, '2023-03-27 21:04:15', '2023-03-27 21:04:15'),
(30, 15135, '2023-03-27 21:04:21', '2023-03-27 21:04:21'),
(31, 15136, '2023-03-27 21:04:31', '2023-03-27 21:04:31'),
(32, 15137, '2023-03-27 21:04:39', '2023-03-27 21:04:39'),
(33, 15138, '2023-03-27 21:04:51', '2023-03-27 21:05:05'),
(34, 15139, '2023-03-27 21:05:13', '2023-03-27 21:05:13'),
(35, 15140, '2023-03-27 21:05:24', '2023-03-27 21:05:24'),
(36, 15144, '2023-03-27 21:05:31', '2023-03-27 21:05:31'),
(37, 15145, '2023-03-27 21:05:39', '2023-03-27 21:05:39'),
(38, 15146, '2023-03-27 21:05:48', '2023-03-27 21:05:48'),
(39, 15147, '2023-03-27 21:05:58', '2023-03-27 21:06:08'),
(40, 15148, '2023-03-27 21:06:23', '2023-03-27 21:06:23'),
(41, 15150, '2023-03-27 21:06:36', '2023-03-27 21:06:36'),
(42, 15152, '2023-03-27 21:06:48', '2023-03-27 21:06:48'),
(43, 15153, '2023-03-27 21:07:04', '2023-03-27 21:07:04'),
(44, 15154, '2023-03-27 21:07:14', '2023-03-27 21:07:14'),
(46, 15155, '2023-03-27 21:07:30', '2023-03-27 21:07:30'),
(47, 15156, '2023-03-27 21:08:05', '2023-03-27 21:08:05'),
(48, 15157, '2023-03-27 21:08:17', '2023-03-27 21:08:17'),
(49, 15159, '2023-03-27 21:08:27', '2023-03-27 21:08:27'),
(50, 15160, '2023-03-27 21:08:43', '2023-03-27 21:08:43'),
(51, 15161, '2023-03-27 21:08:53', '2023-03-27 21:08:53'),
(52, 15162, '2023-03-27 21:09:01', '2023-03-27 21:09:01'),
(53, 15164, '2023-03-27 21:09:08', '2023-03-27 21:09:08'),
(54, 15165, '2023-03-27 21:09:19', '2023-03-27 21:09:34'),
(55, 15166, '2023-03-27 21:09:43', '2023-03-27 21:09:43'),
(56, 15167, '2023-03-27 21:09:50', '2023-03-27 21:09:50'),
(57, 15168, '2023-03-27 21:09:57', '2023-03-27 21:09:57'),
(58, 15171, '2023-03-27 21:10:03', '2023-03-27 21:10:03'),
(59, 15172, '2023-03-27 21:10:13', '2023-03-27 21:10:13'),
(60, 15173, '2023-03-27 21:10:24', '2023-03-27 21:10:24'),
(61, 15181, '2023-03-27 21:10:31', '2023-03-27 21:10:31'),
(62, 15182, '2023-03-27 21:10:54', '2023-03-27 21:10:54'),
(63, 15182, '2023-03-27 21:11:16', '2023-03-27 21:11:16'),
(64, 15183, '2023-03-27 21:11:23', '2023-03-27 21:11:23'),
(65, 15184, '2023-03-27 21:11:30', '2023-03-27 21:11:30'),
(66, 15185, '2023-03-27 21:11:40', '2023-03-27 21:11:49'),
(68, 15187, '2023-03-27 21:12:12', '2023-03-27 21:12:12'),
(69, 15188, '2023-03-27 21:12:20', '2023-03-27 21:12:20'),
(70, 15189, '2023-03-27 21:12:26', '2023-03-27 21:12:26'),
(72, 15192, '2023-03-27 21:12:42', '2023-03-27 21:12:42'),
(73, 15200, '2023-03-27 21:13:35', '2023-03-27 21:13:35'),
(74, 15205, '2023-03-27 21:13:48', '2023-03-27 21:13:48'),
(75, 15205, '2023-03-27 21:13:59', '2023-03-27 21:13:59'),
(76, 15207, '2023-03-27 21:14:05', '2023-03-27 21:14:05'),
(77, 15220, '2023-03-27 21:14:14', '2023-03-27 21:14:14'),
(78, 15225, '2023-03-27 21:14:23', '2023-03-27 21:14:23'),
(79, 15226, '2023-03-27 21:14:38', '2023-03-27 21:14:38'),
(80, 15227, '2023-03-27 21:14:50', '2023-03-27 21:14:50'),
(81, 15228, '2023-03-27 21:14:56', '2023-03-27 21:14:56'),
(82, 15230, '2023-03-27 21:15:24', '2023-03-27 21:15:24'),
(83, 15231, '2023-03-27 21:15:31', '2023-03-27 21:15:31'),
(84, 15240, '2023-03-27 21:15:40', '2023-03-27 21:15:40'),
(85, 15241, '2023-03-27 21:15:51', '2023-03-27 21:15:51'),
(86, 15242, '2023-03-27 21:16:00', '2023-03-27 21:16:00'),
(87, 15243, '2023-03-27 21:16:08', '2023-03-27 21:16:08'),
(88, 15248, '2023-03-27 21:16:23', '2023-03-27 21:16:23'),
(89, 15249, '2023-03-27 21:16:33', '2023-03-27 21:16:33'),
(90, 15250, '2023-03-27 21:16:41', '2023-03-27 21:16:41'),
(91, 15251, '2023-03-27 21:16:47', '2023-03-27 21:16:47'),
(92, 15254, '2023-03-27 21:16:54', '2023-03-27 21:16:54'),
(93, 15256, '2023-03-27 21:17:01', '2023-03-27 21:17:01'),
(94, 15257, '2023-03-27 21:17:13', '2023-03-27 21:17:13'),
(95, 15258, '2023-03-27 21:17:20', '2023-03-27 21:17:20'),
(96, 15259, '2023-03-27 21:17:36', '2023-03-27 21:17:47'),
(97, 15270, '2023-03-27 21:17:57', '2023-03-27 21:17:57'),
(98, 15271, '2023-03-27 21:18:05', '2023-03-27 21:18:05'),
(99, 15286, '2023-03-27 21:18:14', '2023-03-27 21:18:14'),
(100, 15295, '2023-03-27 21:18:22', '2023-03-27 21:18:22'),
(101, 15297, '2023-03-27 21:18:32', '2023-03-27 21:18:32'),
(102, 15307, '2023-03-27 21:19:05', '2023-03-27 21:19:05'),
(103, 15371, '2023-03-27 21:19:18', '2023-03-27 21:19:18'),
(104, 15392, '2023-03-27 21:19:28', '2023-03-27 21:19:28'),
(105, 15393, '2023-03-27 21:19:35', '2023-03-27 21:19:35'),
(106, 15394, '2023-03-27 21:19:44', '2023-03-27 21:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `product_information` text DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `ingredients` varchar(191) DEFAULT NULL,
  `nutritional_content` text DEFAULT NULL,
  `storage` text DEFAULT NULL,
  `other_information` text DEFAULT NULL,
  `price` varchar(15) NOT NULL,
  `price_per_item` varchar(15) DEFAULT NULL,
  `compare_price` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `weight` varchar(191) NOT NULL,
  `items_status` varchar(191) NOT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `sub_cat_id` int(11) DEFAULT NULL,
  `subsub_cat_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Rapsolja 1L', 16, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(66, 75, 84);\">Eldorado Rapsolja har en neutral karaktär som lämpar sig väl till all sorts matlagning då den inte påverkar smaken hos övriga ingredienser.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><em>Innehållsförteckning </em></p><p>Raffinerad rapssolja</p><p>&nbsp;</p><p><em>Näringsinnehåll</em></p><p>Per 100 g:</p><p>Energi 3700 kJ/900 kcal</p><p>Fett 100 g</p><p>-varav mättat fett 7 g</p><p>-varav enkelomättat fett 63 g</p><p>-varav fleromättat fett 30 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 0 g</p><p>Salt 0 g</p><p>&nbsp;</p><p><em>Förvaring </em></p><p>Förvaras vid högst 30°C</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '4°C.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vi på Livshem gör vårt bästa för att alltid ge rätt produktinformation. Förändringar i produktens innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Det som står på förpackningen gäller alltid&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35:90', '35,90 kr/l', '35,90 kr/l', 'In Stock', '1L', 'Popular', NULL, 33, 116, '2023-01-18 19:14:57', '2023-03-20 20:33:26'),
(3, 'Mellanmjölk Färsk 1,5%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Färsk mellanmjölk från Arla, gjord på svensk mjölk från Arlagårdar nu med ännu bättre djuromsorg hela året runt. Mellanmjölk har en härligt fyllig mjölksmak och är ett populärt val till frukostflingorna, gröten eller som dryck till måltiden. Arla Ko® färsk mellanmjölk är en naturlig källa till bland annat protein, kalcium och vitamin B12. Protein bidrar till muskeluppbyggnad och kalcium behövs för att bibehålla en normal benstomme. Varumärket Arla Ko® garanterar att produkten är gjord på 100 procent svensk mjölk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'MJÖLK, vitamin D. Lågpastöriserad', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><em>Näringsinnehåll</em></p><p>Per 100 g:</p><p>Energi 200 kJ/45 kcal</p><p>Fett 1.5 g</p><p>-varav mättat fett 1 g</p><p>Kolhydrat 4.9 g</p><p>-varav sockerarter 4.9 g</p><p>Protein 3.5 g</p><p>Salt 0.1 g</p><p>Vitamin D 1 µg</p><p>Riboflavin 0.15 mg</p><p>Folsyra 15 µg</p><p>Vitamin B12 0.6 µg</p><p>Pantotensyra 0.5 mg</p><p>Kalium 160 mg</p><p>Klorid 95 mg</p><p>Kalcium 120 mg</p><p>Fosfor 105 mg</p><p>Molybden 4.7 µg</p><p>Jod 12 µg</p><p>&nbsp;</p><p><em>Förvaring </em></p><p>Förvaras vid högst +8°C</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vi på Livshem gör vårt bästa för att alltid ge rätt produktinformation. Förändringar i produktens innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Det som står på förpackningen gäller alltid&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '15:95', '15,95', '15,95', 'In Stock', '1 L', 'Popular', NULL, 10, 41, '2023-01-20 10:07:30', '2023-03-20 14:41:30'),
(9, 'Isbergssallat Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Isbergssallat påminner till utseendet om en kålhuvud och är mycket saftig och krispig, med mild smak.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vi på Livshem gör vårt bästa för att alltid ge rätt produktinformation. Förändringar i produktens innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Det som står på förpackningen gäller alltid&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '18:95', '15.95', '15.95', 'In Stock', 'Ca 450g', 'Popular', 0, 4, 15, '2023-02-03 04:04:12', '2023-03-16 19:49:43'),
(10, 'Avocado Class1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Avocado</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy 3700 kJ/900 kcal Fat 100 g - Of which saturated fat 7 g - Of which monounsaturated fat 63 g - Of which polyunsaturated fat 30 g Carbohydrate 0 g -of which sugars 0 g Protein 0 g Salt 0 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'If the avocado feels soft, it is ready to eat. If the avocado is hard, it should be left at room temperature to ripen. In the refrigerator, the ripening process is somewhat slowed down. Store the avocado in the fridge where it is least cold.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/g', '138:46/kg', 'In Stock', '165g', 'Popular', 0, 2, 12, '2023-02-03 20:53:07', '2023-03-20 16:51:09'),
(11, 'Apple Granny Smith Class1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Granny Smith is a green apple with white, firm flesh and a clear sour taste.&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>The product is packed manually and the weight may vary slightly. We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7', '3:/kg', '44:30/kg', 'In Stock', '158g', 'Popular', 0, 2, 6, '2023-02-03 21:00:54', '2023-03-16 19:25:46'),
(13, 'Spaghetti 1.8 kg', 16, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Pasta Spaghetti in bulk from Barilla is Italy’s most classic type of pasta in a package of 1.8 kilos. Spaghetti pasta originates from Naples where Antonio Vivani in 1842 named it Spaghetti because he thought it looked like little strings. This is a long pasta which was originally even longer before it was shortened from the original 50 centimeters to today’s more practical 25 centimeters. Barilla’s Spaghetti n.5 is a durum wheat pasta that, with its traditional character, is a must in the kitchen.&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy 1521 kJ/359 kcal Fat 2 g - Of which saturated fat 0.5 g Carbohydrate 70.9 g - Of which sugars 3.5 g Fiber 3 g Protein 12.8 g Salt 0.013 g&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35', '25:/kg', '19:97 SEK/kg', 'In Stock', '1.8 Kg', 'Weekly', 30, 36, 135, '2023-02-05 13:58:48', '2023-03-16 19:52:58'),
(14, 'Tortilla Medium 8-p', 16, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>A soft wheat taco bread suitable for all kinds of Tex Mex and wraps. Hot or cold it doesn’t matter, it always tastes good! One package contains 8 tortillas.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy (kJ)/(kcal): 1252 / 296 Fat: 5.2 g Of which saturated fat: 1.1 g Carbohydrate: 53.6 g Of which sugars: 1.7 g Fiber: 2.4 g Protein: 7.6 g Salt: 1.56 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '19', '10:78/kg', '62:34/kg', 'In Stock', '320 g', 'Popular', 10, 35, 133, '2023-02-05 14:03:09', '2023-03-16 19:53:54'),
(16, 'Mild', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '3:/kg', '44:30/kg', 'In Stock', '750l', 'Popular', 10, 10, 43, '2023-02-09 10:11:05', '2023-03-16 19:24:59'),
(17, 'Ketchup', 16, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'fdfd', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/lit', '19:97 SEK/kg', 'In Stock', '165g', 'Weekly', 40, 34, 124, '2023-02-09 10:14:01', '2023-03-16 19:56:20'),
(18, 'Biscuit', 12, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'sd', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dssdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '2:02/g', '19:97 SEK/kg', 'In Stock', '158g', 'Weekly', 25, 19, 72, '2023-02-09 11:09:26', '2023-03-16 20:52:49'),
(20, 'Mango', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>ssa</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'sasa', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/kg', '62:34/kg', 'In Stock', '5kg', 'Popular', 25, 2, 12, '2023-02-12 14:52:27', '2023-03-16 20:53:43'),
(22, 'Watermelon', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', '15:10/kg', '44:30/kg', 'In Stock', '750g', 'Popular', 10, 2, 11, '2023-02-12 14:57:53', '2023-03-16 19:56:47'),
(23, 'Chips', 18, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsdsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsdsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '3:/kg', '62:34/kg', 'In Stock', '7500g', 'Popular', 25, 39, 142, '2023-02-12 15:05:42', '2023-03-16 20:57:32'),
(34, 'Morötter Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', '20:- /kg', '20:- /kg', 'In Stock', '1kg', 'Weekly', 20, 4, 141, '2023-03-16 20:05:22', '2023-03-16 20:05:22'),
(35, 'Romansallad Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29.95', NULL, '80:- /kg', 'In Stock', '250g', 'Weekly', 20, 4, 15, '2023-03-16 20:09:49', '2023-03-16 20:09:49'),
(36, 'Gurka Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'asda', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '25', NULL, '76:92 /kg', 'In Stock', '325g', 'Weekly', NULL, 4, 13, '2023-03-16 20:13:53', '2023-03-16 20:13:53'),
(37, 'Paprikamix Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'test', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29 st', '72:50kr /kg', '72:50kr /kg', 'In Stock', '400 g', 'Weekly', NULL, 4, 21, '2023-03-16 20:20:54', '2023-03-16 20:23:19'),
(38, 'Nötfärs 12%', 13, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>TEST</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>TETS	</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Kylvara, max +4°C.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '49', '98 kr/kg', '98 kr/kg', 'In Stock', '500g', 'Weekly', NULL, 22, 79, '2023-03-16 20:45:03', '2023-03-16 20:45:03'),
(39, 'Coca-Cola Zero Sugar 20x33cl', 15, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23:95', NULL, '15 kr/l', 'In Stock', '660 cl', 'Weekly', NULL, 28, 143, '2023-03-16 21:00:21', '2023-03-16 21:02:22'),
(40, 'Ägg Frigående Inomhus 15-p', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">De frigående hönsen rör sig fritt inomhus i stallar med strö på golvet, sittpinnar i olika höjder och värpreden. Hönorna äter ett väl sammansatt vegetabiliskt foder där fodersäd utgör en naturlig grund.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, 'Ägg', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 580 kJ/140 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 9.7 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 2.6 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat &lt;0.5 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 12 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.36 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin A 233 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin B12 1.5 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin D 1.4 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin E 5.6 mg</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '39', '2:40 kr/st', '2:40 kr/st', 'In Stock', '15 st', 'Weekly', NULL, 15, 60, '2023-03-16 21:47:00', '2023-03-16 21:48:08'),
(41, 'Citron Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Citron Klass 1. Den kom ursprungligen från trakten söder om Himalaya och var känd i Kina 500 år f Kr. På 1000-talet kom citronen till Europa och år 1493 tog Columbus den med till Haiti.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 170kJ/41 kcal, Protein: 1g, Fett: 0,3g, Mättade fettsyror: 0g, Kolhydrater: 7g, Fiber: 2g, Vitamin C: 53mg, Vitamin D: 0mcg, Folat: 11mcg, Järn: 0, 1mg, Zink: 0,1 mg, kalcium: 26 mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Produkten packas manuellt, så vikten kanske inte är exakt.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '9', '8', NULL, 'In Stock', '53:89/kg', 'Popular', 7, 2, 144, '2023-03-20 10:30:06', '2023-03-20 14:58:12'),
(42, 'Clementiner Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '5:50', NULL, NULL, 'In Stock', '86 g', 'Weekly', NULL, 2, 9, '2023-03-20 14:15:40', '2023-03-20 14:15:40'),
(43, 'Apelsin i Nät klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">1kg apelsiner packade i ett nät</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Note, changes in the products\' content may occur.&nbsp;Therefore, always check the product information on the packaging.&nbsp;For questions about the contents of non-prepackaged food, contact Customer Service.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '34:95', NULL, NULL, 'In Stock', '1 kg', 'Weekly', NULL, 2, 9, '2023-03-20 14:20:39', '2023-03-20 14:20:39'),
(44, 'Citron EKO Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Ekologisk citron</span></p><p>Den kom ursprungligen från trakten söder om Himalaya och var känd i Kina 500 år f Kr. På 1000-talet kom citronen till Europa och år 1493 tog Columbus den med till Haiti.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '14:95', NULL, NULL, 'In Stock', '160 g', 'Weekly', NULL, 2, 9, '2023-03-20 14:28:03', '2023-03-20 14:28:03'),
(45, 'Apelsin Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '11', NULL, NULL, 'In Stock', '204 g', 'Weekly', NULL, 2, 9, '2023-03-20 14:31:15', '2023-03-20 14:31:15'),
(47, 'Apelsin EKO Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '19:50', NULL, NULL, 'In Stock', '355 g', 'Popular', NULL, 2, 9, '2023-03-20 14:38:48', '2023-03-20 14:58:03'),
(48, 'Lime Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Lime Klass 1. Lime är den suraste av alla citrusfrukter och används med fördel i juice eller matlagning. De är fett- och kolesterolfria, låga i kilojoule, en bra källa till fiber och innehåller mycket C-vitamin.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at +8-12°C.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '8:95', NULL, NULL, 'In Stock', '83 g', 'Popular', NULL, 1, 1, '2023-03-20 14:43:56', '2023-03-20 14:57:59'),
(50, 'Clementin Luxury Class 1 1kg', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '65:95', NULL, NULL, 'In Stock', '1000g', 'Weekly', NULL, 2, 9, '2023-03-20 14:46:59', '2023-03-20 14:46:59');
INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(51, 'Grapefruit Red Class1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>The red grapefruit is slightly sweeter than its light cousin.&nbsp;It also gets a little sweeter when grilled.&nbsp;Cut in half, sprinkle with icing sugar, turn on the grill function of the oven and grill until it has just the right color.&nbsp;Try grilling a grapefruit for your next brunch!</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Note, changes in the products\' content may occur.&nbsp;Therefore, always check the product information on the packaging.&nbsp;For questions about the contents of non-prepackaged food, contact Customer Service.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '21:95', NULL, NULL, 'In Stock', '400 g', 'Popular', NULL, 2, 9, '2023-03-20 14:48:47', '2023-03-20 14:48:47'),
(52, 'Lime EKO Klass1 3-p', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Lime, den sura favoriten, finns nu även ekologisk på MatHem. Gör som mexikanerna och pressa limesaft över fruktsalladen. Den som vill göra det helhjärtat mexikanskt, nöjer sig dock inte med limen, utan pudrar även över chilipulver. Gott?</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '19:95', NULL, NULL, 'In Stock', '150 g', 'Weekly', NULL, 2, 9, '2023-03-20 14:52:45', '2023-03-20 14:52:45'),
(53, 'Banan EKO Fairtrade Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Ekologisk banan Klass1</span></p><p>Fairtradecertifierad.</p><p>Obs! Säljs i klase</p><p>Bananerna kan variera i färg, från gröna till gula</p><p>Världens bästa mellanmål, den ekologiska bananen, är fylld av bra mineraler, spårämnen och vitaminer. Ekologiska bananer är fria från bekämpningsmedel och du slipper således att få i dig gifter och det bidrar till en bättre miljö där bananen produceras.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Näringsvärde per 100g. Energi: 405 kJ/97 kcal, Kolhydrater: 21,8g, Fett: 0,5g, Kalium: 395mg, Magnesium: 33mg, B1-vitamin: 0,05mg, B2-vitamin: 0,1mg, B6-vitamin: 0,6mg, C-vitamin: 9mg, E-vitamin: 0,6mg, Zink: 0,2mg, Niacin: 0,5mg, Järn: 0,4mg, Selen: 0,5ug, Kostfiber: 1,7g.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '37:95', NULL, NULL, 'In Stock', '1075 g', 'Popular', NULL, 2, 1, '2023-03-20 14:58:00', '2023-03-20 14:58:00'),
(54, 'Banan EKO Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs! Säljs styckvis</span></p><p>Bananerna kan variera i färg, från gröna till gula</p><p>Är bananer världens bästa mellanmål? Våra ekologiska bananer är fyllda av mineraler och vitaminer. De är fria från bekämpningsmedel och gifter och du bidrar till en bättre miljö där bananen produceras.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Näringsvärde per 100g. Energi: 405 kJ/97 kcal, Kolhydrater: 21,8g, Fett: 0,5g, Kalium: 395mg, Magnesium: 33mg, B1-vitamin: 0,05mg, B2-vitamin: 0,1mg, B6-vitamin: 0,6mg, C-vitamin: 9mg, E-vitamin: 0,6mg, Zink: 0,2mg, Niacin: 0,5mg, Järn: 0,4mg, Selen: 0,5ug, Kostfiber: 1,7g.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '6:95', NULL, NULL, 'In Stock', '190 g', 'Popular', NULL, 2, 1, '2023-03-20 15:00:00', '2023-03-20 15:00:00'),
(55, 'Banan Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs! Säljs styckvis</span></p><p>Bananerna kan variera i färg, från gröna till gula</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '5:50', NULL, NULL, 'In Stock', '190 g', 'Popular', NULL, 1, 1, '2023-03-20 15:06:12', '2023-03-20 15:06:12'),
(56, 'Äpple Royal Gala Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Royal Gala är en korsning mellan Cox Orange, Pippin, Red Delicious och Golden Delicious och härstammar från Nya Zeeland. Fruktköttet är vitt, mycket krispigt och saftigt. Smaken är söt, frisk och aromatisk.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Näringsvärde per 100g. Energi: 52kcal/218kJ, Vatten: 85g, Protein: 0,4g, Fett: 0,1g, Kolhydrater: 12,2g, Kostfiber: 1,8g, Kalium: 134mg, ß-karoten: 30µg, C-vitamin: 8mg.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7', NULL, NULL, 'In Stock', '128 g', 'Popular', NULL, 2, 6, '2023-03-20 15:11:23', '2023-03-20 15:12:11'),
(57, 'Äpple Royal Gala EKO Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Royal Gala har rött skal och mognar något tidigare än många andra äpplen. Äpplet är medelstort och har ett fruktkött som är vitt, krispigt och saftigt med söt, frisk och aromatisk smak. Royal Gala odlas året runt och är riktigt gott som dessertäpple.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '9:50', NULL, NULL, 'In Stock', '166 g', 'Popular', NULL, 2, 6, '2023-03-20 15:13:34', '2023-03-20 15:13:34'),
(58, 'Äpple Pink Lady Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '9:50', NULL, NULL, 'In Stock', '126 g', 'Popular', NULL, 2, 6, '2023-03-20 15:16:21', '2023-03-20 15:16:49'),
(59, 'Äpple Aroma Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Aroma är en lyckad korsning mellan Ingrid Marie och Filippa. Aroma är en välsmakande frukt och något över medelstorleken för äpplen. Det gulvita fruktköttet är sprött och har aromrik smak med god balans mellan socker och syra.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Näringsvärde per 100g. Energi: 52kcal/218kJ, Vatten: 85g, Protein 0,4g, Fett: 0,1g, Kolhydrater: 12,2g, Kostfiber: 1,8g, Kalium: 134mg,</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7', NULL, NULL, 'In Stock', '140 g', 'Popular', NULL, 2, 6, '2023-03-20 15:20:23', '2023-03-20 15:20:23'),
(60, 'Äpple Granny Smith EKO Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Granny Smith är ett blankt äpple i klargrön färg med vitt, fast fruktkött som har frisk och syrlig smak. När äpplet blivit riktigt moget är fruktköttet mjukare och smaken mer söt. Granny Smith har lång hållbarhet och är ett bra dessertäpple som passar bra till allt från pajer och kompotter till att äta rårivet eller ugnsstekt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '9:50', NULL, NULL, 'In Stock', '185 g', 'Popular', NULL, 2, 6, '2023-03-20 15:24:57', '2023-03-20 15:24:57'),
(61, 'Äpple Red Delicious Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7:50', NULL, NULL, 'In Stock', '180 g', 'Popular', NULL, 2, 6, '2023-03-20 15:27:41', '2023-03-20 15:27:41'),
(62, 'Äpple Golden Delicious Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><ul><li>Produkten packas manuellt varför vikten kanske inte blir exakt</li><li><br></li><li><br></li></ul><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '6:50', NULL, NULL, 'In Stock', '145 g', 'Popular', NULL, 2, 6, '2023-03-20 15:29:25', '2023-03-20 15:29:25'),
(63, 'Äpple Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Goda röda äpplen. Sort: Jonagored, kan varierar efter säsongen</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '19:95', NULL, NULL, 'In Stock', '1 kg', 'Popular', NULL, 2, 6, '2023-03-20 15:31:50', '2023-03-20 15:31:50'),
(64, 'Äpple Elise Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Elise är en relativt ny sort. Den är fast och syrlig och har en fantastisk smak! Knaprig och med saftigt kött.</span></p><p>Ursprungligen från Holland och är en korsning mellan Septer och Cox Orange.</p><p>Bäst av allt är att äta det som det är, men tack vare hög syra går det även utmärkt att använda Elise i matlagning.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Näringsvärden, per 100 g äpple med skal. Energi 52 kcal/218 kJ, Vatten 85 g, Protein 0,4 g, Fett 0,1 g, Kolhydrater totalt (ej fiber) 12,2 g, Kostfiber 1,8 g, Kalium 134 mg, ß–karoten 30 µg, C–vitamin 8 mg.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7:50', NULL, NULL, 'In Stock', '157 g', 'Popular', NULL, 2, 6, '2023-03-20 15:37:52', '2023-03-20 15:37:52'),
(65, 'Äpple Sverige Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Svenska äpplen i påse</span></p><p>Sorten kan variera under säsongen</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Obs, förändringar i produkternas innehåll kan ske. Kontrollera därför alltid produktinformationen på förpackningen. Vid frågor om ej färdigförpackade livsmedels innehåll kontakta Kundtjänst.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '26:95', NULL, NULL, 'In Stock', '1 kg', 'Weekly', NULL, 2, 6, '2023-03-20 15:40:05', '2023-03-20 15:40:05'),
(66, 'Äpple Jonagold Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Produkten packas manuellt varför vikten kanske inte blir exakt</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '6:95', NULL, NULL, 'In Stock', '290 g', 'Weekly', 3, 2, 6, '2023-03-20 15:42:31', '2023-03-20 15:48:02'),
(67, 'Hushållsost 26%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Hushållsost är Sveriges mest populära hårdost! Osten uppskattas för sin milda, gräddiga och lätt syrliga smak och den härliga, runda formen gör den perfekt att ställa fram och dela. Hushållsost äts främst som pålägg men är passar perfekt i matlagning och som tilltugg. Vår Hushållsost är tillverkad i Vium, Danmark, på mjölk från danska Arlagårdar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1399 kJ/337 kcal</p><p>Fett 26 g</p><p>-varav mättat fett 17 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.6 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 725 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Min 2 °C, Max 8 °C.', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '144', NULL, NULL, 'In Stock', '99:09 /kg', 'Popular', 109, 11, 43, '2023-03-21 12:15:50', '2023-03-21 12:15:50'),
(68, 'Halloumi', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Halloumiost från Cypern gjord på mjölk från kor, får och getter. Halloumi kan stekas, grillas eller ätas som den är. Vilken är din ostfavorit? Kika närmre i vårt skafferi av ostar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1370 kJ/330 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 26 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 15 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 2 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1.6 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 22 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 2.7 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '34:95', NULL, NULL, 'In Stock', '155/kg', 'Weekly', NULL, 11, 43, '2023-03-21 13:28:46', '2023-03-21 13:53:30'),
(69, 'Hushållsost 17% ca1,1kg', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Hushållsost 17% uppskattas för sin milda och lätt syrliga smak. God smak med lägre fetthalt. Hushållsost äts främst som pålägg men är super i matlagning och som tilltugg. Vår Hushållsost är tillverkad i Vium, Danmark, på mjölk från danska Arlagårdar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1134 kJ/272 kcal</p><p>Fett 17 g</p><p>-varav mättat fett 11 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 29 g</p><p>Salt 1.6 g,</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 846 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '144', NULL, NULL, 'In Stock', '99:09/kg', 'Popular', 109, 11, 43, '2023-03-21 13:51:45', '2023-03-21 13:55:36'),
(70, 'Halloumi Skivad', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Skivad halloumiost från Cypern gjord på mjölk från kor, får och getter. Halloumi kan stekas, grillas eller ätas som den är. Vilken är din ostfavorit? Kika närmre i vårt skafferi av ostar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1370 kJ/330 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 26 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 15 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 2 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1.6 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 22 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 2.7 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '36:95', NULL, NULL, 'In Stock', '160/kg', 'Weekly', NULL, 11, 43, '2023-03-21 14:02:18', '2023-03-21 14:02:18'),
(71, 'Hushållsost 26%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Hushållsost är Sveriges mest populära hårdost! Osten uppskattas för sin milda, gräddiga och lätt syrliga smak och den härliga, runda formen gör den perfekt att ställa fram och dela. Hushållsost äts främst som pålägg men är passar perfekt i matlagning och som tilltugg. Vår Hushållsost är tillverkad i Vium, Danmark, på mjölk från danska Arlagårdar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1399 kJ/337 kcal</p><p>Fett 26 g</p><p>-varav mättat fett 17 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.6 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 725 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '144', NULL, NULL, 'In Stock', '99:09/kg', 'Popular', 109, 11, 43, '2023-03-21 14:12:09', '2023-03-21 14:12:09'),
(72, 'Präst® Mellan 31%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vår goda Arla Ko® Präst® ost är härligt gräddig, med inslag av sälta, sötma &amp; behaglig syrlighet. Osten passar bra både på smörgås som pålägg eller i din lasagne. Prästosten har sina rötter i 1700-talets Småland. Namnet prästost kommer av att osten fungerade som betalningsmedel när det var dags att betala kyrkoskatt till prästen. Vid ystningen tillsatte man lite extra grädde för att blidka prästen och än i dag är Präst® lite fetare än andra ostar. Vår Arla Ko® Präst® görs på Kalmar mejeri på färsk mjölk från svenska Arlagårdar. Varumärket Arla Ko® garanterar att osten är gjord på 100 procent svensk mjölk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1594 kJ/384 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 31 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 20 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 25 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.2 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin B12 1.4 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kalcium 756 mg</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '91:95', NULL, NULL, 'In Stock', '141:46/kg', 'Popular', NULL, 11, 145, '2023-03-21 14:19:02', '2023-03-21 14:19:02'),
(73, 'Gouda Rund Holland 31%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Smidig och lätthyvlad gouda med få små spridda hål. Osten har rund smak med sälta, sötma och fruktighet. Perfekt till frukostsmörgåsen.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1553 kJ/ 374 kcal</p><p>Fett 31 g</p><p>- varav mättat fett 21 g</p><p>Kolhydrat 0 g</p><p>- varav sockerarter 0 g</p><p>Protein 24 g</p><p>Salt 1.9 g</p><p><br></p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '98:95', NULL, NULL, 'In Stock', '139:37 /kg', 'Weekly', NULL, 11, 146, '2023-03-21 14:23:15', '2023-03-21 14:23:15'),
(74, 'Herrgård® 28%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Our delicious Arla Ko® Herrgårdsost® is a mild and creamy cheese with a characteristic element of sweetness and hazelnut. A manor cheese that is perfect as a spread cheese and in cooking. Herrgård® began production in the 19th century and is still today one of the most popular manor cheeses in Sweden. Our Arla Ko® Herrgård® is made at the Kalmar dairy using fresh milk from Öland and Småland. The Arla Ko® brand guarantees that the cheese is made from 100 percent Swedish milk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energy 1493 kJ/360 kcal</p><p>Fat 28 g</p><p>- of which saturated fat 18 g</p><p>Carbohydrate 0 g</p><p>- of which sugars 0 g</p><p>Protein 26 g</p><p>Salt 1.3 g</p><p>Vitamin B12 1.5 µg</p><p>Calcium 774 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '98:95', NULL, NULL, 'In Stock', '141:36/kg', 'Weekly', NULL, 11, 147, '2023-03-21 14:33:27', '2023-03-21 14:33:27');
INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(75, 'Jarlsberg Original 27%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Jarlsberg har mellanhård konsistens med stora runda hål. Smaken är aromatisk, nötaktig och söt och passar som pålägg, men även till matlagning.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1458 kJ/351 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 27 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 17 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 27 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.1 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kalcium 770 mg</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '78:95', NULL, NULL, 'In Stock', '157:90 /kg', 'Popular', NULL, 11, 43, '2023-03-21 14:44:10', '2023-03-21 14:44:10'),
(76, 'Präst® 35%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Prästost gjord på svensk mjölk. Mellanlagrad, grynpipig svensk hårdost med aromatisk och fyllig smak. Fetthalt 35%. Vilken är din favorit bland svenska klassiker? Osten är lagrad i ca 5 månader.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1700 kJ/400 kcal</p><p>Fett 35 g</p><p>-varav mättat fett 22 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 22 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 660 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '87:95', NULL, NULL, 'In Stock', '125:64 /kg', 'Weekly', NULL, 11, 145, '2023-03-21 14:48:11', '2023-03-21 14:48:11'),
(77, 'Grevé® 28% 12M', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Allerum Grevé 28 % är långlagrad i tolv månader, vilket gör den extra rund och fyllig. Aromrikedomen och den sötaktiga nötkaraktär gör den till en generös ost som lyfter såsen och förgyller gratängen. Passar dessutom lika bra på mackan som på ostbrickan. Smaka och upplev vad tid, kunnande och kärlek kan göra. Njut av tiden!</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1500 kJ/360 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 28 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-Varav mättat fett 18 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-Varav sockerarter (laktos) 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 27 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.2 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kalcium 750 mg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin A 260 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin B12 1.5 µg</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '122', NULL, NULL, 'In Stock', '187:69 /kg', 'Weekly', NULL, 11, 43, '2023-03-21 14:51:26', '2023-03-21 14:51:26'),
(78, 'Cheddar Lagrad 6 Mån 32%', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fyllig och smakrik cheddarost som lagrats i sex till åtta månader. Den är svagt syrlig och aromatisk med tydlig sälta och lång, behaglig eftersmak. Kvibille® Cheddar 6 mån 32% passar utmärkt på såväl ostbricka och buffé som i matlagning och på smörgås. Lagrad cheddar är även en klassiker på julbordet. Kvibille® Cheddar 6 månader tillverkas hantverksmässigt på halländska Kvibille mejeri.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1621 kJ/391 kcal</p><p>Fett 32 g</p><p>-varav mättat fett 20 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.4 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '104', NULL, NULL, 'In Stock', '208:- /kg', 'Weekly', NULL, 1, 1, '2023-03-21 14:57:01', '2023-03-21 14:57:01'),
(79, 'Gräddis 30%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Familjefavoriter - milda och goda ostar för hela familjen. Ost som är enkel att hyvla och skära, perfekt på mackan eller att skära i bitar till fredagsmyset. Gräddis är en ost med krämig konsistens och gräddig smak, fetthalten är 30%. Tips: när du närmar dig slutet av osten och den blir lite svårare att hyvla, riv och frys in. Supersmidigt att plocka fram till nästa pizzatillfälle! Gräddis är tillverkad i Vium, Danmark, av mjölk från danska Arlagårdar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1530 kJ/370 kcal</p><p>Fett 30 g</p><p>-varav mättat fett 19 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 24 g</p><p>Salt 1.6 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 707 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '122', NULL, NULL, 'In Stock', '122:- /kg', 'Weekly', NULL, 11, 146, '2023-03-21 15:00:18', '2023-03-21 15:00:18'),
(80, 'Port Salut 26%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Familjefavoriter - milda och goda ostar för hela familjen. Ost som är enkel att hyvla och skära, perfekt som pålägg eller att skära i bitar till fredagsmyset. Port Salut ost har smidig konsistens med gräddig smak, fetthalten är 26%. Tips: när du närmar dig slutet av osten och den blir lite svårare att hyvla, riv och frys in. Supersmidigt att plocka fram när det är dags för tacopaj! Vår Port Salut är tillverkad i Vium, Danmark, av mjölk från danska Arlagårdar.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1411 kJ/340 kcal</p><p>Fett 26 g</p><p>-varav mättat fett 17 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.6 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 751 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '89:95', NULL, NULL, 'In Stock', '119:93 /kg', 'Popular', NULL, 11, 43, '2023-03-21 15:03:23', '2023-03-21 15:03:23'),
(81, 'Grevé® 28%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vår goda Arla Ko® Grevé® ost är söt och syrlig med karaktäristisk nötighet. Härlig konsistens med stora hål. Grevéosten passar lika bra som pålägg som del av matlagning. Varför inte använda den till att göra ostfyllda grönsaker i ugn? Vår Arla Ko® Grevé ost® görs på Kalmar mejeri på färsk mjölk från svenska Arlagårdar. Varumärket Arla Ko® garanterar att osten är gjord på 100 procent svensk mjölk</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1488 kJ/358 kcal</p><p>Fett 28 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 26 g</p><p>Salt 1.3 g</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 766 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '98:95', NULL, NULL, 'In Stock', '141:36 /kg', 'Weekly', NULL, 11, 43, '2023-03-21 15:05:18', '2023-03-21 15:05:18'),
(82, 'Herrgård® 28%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Herrgårdsost gjord på svensk mjölk. Mild, rundpipig svensk hårdost med fyllig nötsmak. Fetthalt 28 %. Vilken är din favorit bland svenska klassiker? Kika närmre i vårt skafferi av ostar.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1500 kJ/360 kcal</p><p>Fett 28 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 27 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 750 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '87:95', NULL, NULL, 'In Stock', '125:64 /kg', 'Weekly', NULL, 11, 147, '2023-03-21 15:08:06', '2023-03-21 15:08:06'),
(83, 'Riven Ost Texmex 29%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla Köket® riven ost Texmex lyfter smakerna i kryddiga rätter. Osten har lite mer karaktär och är en blandning av de svenska ostarna Herrgård® och Kvibille® Cheddar. Den färdigrivna osten passar utmärkt i allt från tacos till grytor och soppor, omelett och tortilla. Ett gott tips är att ha den rivna texmex-osten till heta kycklingtacos med klassiska tillbehör. Symbolen med den blågula mjölkkannan garanterar 100 procent svensk mjölk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1535 kJ/370 kcal</p><p>Fett 29 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 1.4 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.4 g</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 751 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '30:95', NULL, NULL, 'In Stock', '206:33 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 15:27:46', '2023-03-21 15:27:46'),
(84, 'Riven Ost Pizza 32%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla Köket® riven ost Pizza är en krämig och mild ost som smälter perfekt och ger fin färg. Osten, med sin balanserade salthalt och milda goda smak som inte tar över, är speciellt anpassad för pizza. Ett gott tips är att strö den rivna pizzaosten över en smarrig primörpizza med rucola och pumpakärnor. Symbolen med den blågula mjölkkannan garanterar 100 procent svensk mjölk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1635 kJ/394 kcal</p><p>Fett 32 g</p><p>-varav mättat fett 21 g</p><p>Kolhydrat 1.4 g</p><p>-varav sockerarter 0 g</p><p>Protein 24 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 717 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '30:95', NULL, NULL, 'In Stock', '206:33 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 15:30:49', '2023-03-21 15:30:49'),
(85, 'Riven Ost Mozzarella 22%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Riven mozzarella till matlagning. Fetthalt 22 %.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1273 kJ/306 kcal</p><p>Fett 22 g</p><p>-varav mättat fett 15 g</p><p>Kolhydrat 2 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.3 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '199:67 /kg', 'Popular', NULL, 11, 46, '2023-03-21 15:35:09', '2023-03-21 15:35:09'),
(86, 'Gouda Skivad 28%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Familjefavoriter - milda och goda ostar för hela familjen. Vår Gouda ost är len i konsistensen och har god sälta och lite syrlighet, fetthalten är 28%. Detta är en skivad ost som barnen själva kan ta, perfekt som pålägg. Bästa mellistipset: ostrullar! Ta några skivor, rulla ihop och servera tillsammans med frukt. Enkelt, urgott och kan vara räddningen innan middagen är på bordet. Du vet väl att den blågula mjölkkannan på förpackningen garanterar att produkten görs på 100 procent svensk mjölk?</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1471 kJ/354 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 28 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 18 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 25 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.4 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Vitamin B12 1.5 µg</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kalcium 740 mg</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '98:95', NULL, NULL, 'In Stock', '131:93 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 15:40:09', '2023-03-21 15:40:09'),
(87, 'Svensk Burgarcheddar EKO', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Den första svenska och ekologiska burgarcheddaren med perfekta smältegenskaper. Den nya generationens burgarcheddar utan onödiga tillsatser och utfyllnadskemikalier. Smältegenskaper och smak specialanpassade och utvecklade för din burgare. Hållbar och klimatsmart-kvalitet på riktigt utan genvägar, för att det bara kan bli bäst så! På Väddö Gårdsmejeri tillverkar vi förstklassiga kvalitetsprodukter av gårdens KRAV-ekologiska mjölk. Vi är otrolig stolta över våra produkter men om vi får säga det själva så är vår ekologiska burgarcheddar och vår gårdsproducerade gelato något alldeles extra. Vår gård ligger i Roslagen norr om Norrtälje och har brukats av vår familj i över hundra år. I våra beteshagar växer olika sorters gräs, gullviva, förgätmigej och ängsviol. Växter som ger mjölken en härligt god smak och som gör att våra hantverksprodukter smakar äkta och naturligt gott! Under sommarhalvåret är ni välkomna att hälsa på oss på bondgården, klappa på djuren och besöka våra restauranger.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1516 kJ/366 kcal</p><p>Fett 30 g</p><p>-varav mättat fett 19.3 g</p><p>Kolhydrat 3.5 g</p><p>-varav sockerarter &lt;0.1 g</p><p>Protein 20.4 g</p><p>Salt 1.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '46:95', NULL, NULL, 'In Stock', '469:50 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 15:43:37', '2023-03-21 15:43:37'),
(88, 'Hushållsost 26% Skivad', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Hushållsost är Sveriges mest populära hårdost! Osten uppskattas för sin milda gräddiga, lätt syrliga smak. Skivad ost är perfekt som pålägg, eller att rulla ihop som tilltugg. Fetthalten är 26%. Vår Hushållsost är tillverkad i Vium, Danmark, på mjölk från danska Arlagårdar.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1399 kJ/337 kcal</p><p>Fett 26 g</p><p>-varav mättat fett 17 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.6 g</p><p>Vitamin B12 1.4 µg</p><p>Kalcium 725 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '59:95', NULL, NULL, 'In Stock', '199:83 /kg', 'Weekly', NULL, 11, 47, '2023-03-21 15:53:14', '2023-03-21 15:53:14'),
(89, 'Hamburgerost Cheddar', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Sottilette Cheddar Slices gör din maträtt lite godare. Passar utmärkt till kalla och varma smörgåsar, hamburgare, ugnstekt falukorv och gratänger. Skivorna är singelförpackade och enkla att använda.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 938 kJ/225 kcal</p><p>Fett 14 g</p><p>-varav mättat fett 9.2 g</p><p>Kolhydrat 7 g</p><p>-varav sockerarter 4.7 g</p><p>Fiber 3 g</p><p>Protein 15 g</p><p>Salt 3.2 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '149:75 /kg', 'Weekly', NULL, 11, 47, '2023-03-21 15:55:33', '2023-03-21 15:55:33'),
(90, 'Burgerslices med Cheddar', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1050 kJ/250 kcal</p><p>Fett 16 g</p><p>-varav mättat fett 10 g</p><p>Kolhydrat 8 g</p><p>-varav sockerarter 8 g</p><p>Protein 18 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '139:75 /kg', 'Popular', NULL, 11, 47, '2023-03-21 15:58:28', '2023-03-21 15:58:28'),
(91, 'Riven Ost Mager 12%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla Köket® riven ost Mager 12% är en blandning av de svenska ostarna Riddar® mager och Kadett® och är perfekt om du vill minska på fetthalten men ändå njuta av god och vällagad mat. Den färdigrivna osten är nyckelhålsmärkt och passar till allt – ett gott tips är att strö osten över grillad sparris och cocktailtomater tillsammans med olivolja och salt. Symbolen med den blågula mjölkkannan garanterar 100 procent svensk mjölk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1012 kJ/242 kcal</p><p>Fett 12 g</p><p>-varav mättat fett 7.8 g</p><p>Kolhydrat 1.4 g</p><p>-varav sockerarter 0 g</p><p>Protein 31 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.8 µg</p><p>Kalcium 918 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '30:95', NULL, NULL, 'In Stock', '206:33 /kg', 'Weekly', NULL, 11, 47, '2023-03-21 16:02:04', '2023-03-21 16:02:04'),
(92, 'Riven Ost Gratäng 24%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla Köket® riven ost Gratäng består av en blandning av de svenska ostarna Riddar®, Präst® och Kvibille® Cheddar. Den färdigrivna osten passar bäst i ugnen där den smälter fint och ger god smak åt både gratäng och paj. Varför inte låta den bli pricken över i på en mustig rotfruktsgratäng? Symbolen med den blågula mjölkkannan garanterar 100 procent svensk mjölk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1387 kJ/333 kcal</p><p>Fett 24 g</p><p>-varav mättat fett 16 g</p><p>Kolhydrat 1.4 g</p><p>-varav sockerarter 0 g</p><p>Protein 27 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.6 µg</p><p>Kalcium 794 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '30:95', NULL, NULL, 'In Stock', '206:33 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 16:03:46', '2023-03-21 16:03:46'),
(93, 'Präst® Riven 35% 12M', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Allerum Präst Lagrad Ost är en färdigriven och smakrik Präst som har långlagrats i tolv månader. Allerum Single Cheese har mycket karaktär och en krämigt mjuk smak som samtidigt är lite tuff. Smaka och upplev vad tid, kunnande och kärlek kan göra. Njut av tiden!</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1700 kJ/400 kcal</p><p>Fett 35 g</p><p>-varav mättat fett 22 g</p><p>Kolhydrat 3 g</p><p>-varav sockerarter 0 g</p><p>Protein 22 g</p><p>Salt 1.2 g</p><p>Kalcium 660 mg</p><p>Vitamin A 320 µg</p><p>Vitamin B12 1.4 µg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '36:95', NULL, NULL, 'In Stock', '246:33 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 16:04:59', '2023-03-21 16:04:59'),
(94, 'Parmigiano Reggiano Grovriven', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Parmigiano Reggiano som lagrats i 12-16 månader för en rik och fyllig smak. Osten är grovriven och ger perfekt smaksättning och konsistens i risotto, pasta och gratänger.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1671 kJ/402 kcal</p><p>Fett 30 g</p><p>-varav mättat fett 20 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 32 g</p><p>Salt 1.6 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '41:95', NULL, NULL, 'In Stock', '493:53 /kg', 'Weekly', NULL, 11, 46, '2023-03-21 16:06:30', '2023-03-21 16:06:30'),
(95, 'Munkens Röda 28%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Wästgöta Kloster® - för god att avstå! Munkens Röda 28% är rundpipig och mellanlagrad ost med nötig karaktär och en något söt och aromatisk smak. Eftersmaken är balanserad med syrlighet och nötighet. Osten är lätt att skiva, riva och tärna och passar utmärkt både som pålägg och på ostbricka. Osten ligger i en smart återförslutningsbar förpackning, vilket underlättar i vardagen. Symbolen med den blågula mjölkkannan garanterar 100 procent svensk mjölk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1483 kJ/357 kcal</p><p>Fett 28 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 25 g</p><p>Salt 1.2 g</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 756 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '84:95', NULL, NULL, 'In Stock', '169:90 /kg', 'Weekly', NULL, 11, 44, '2023-03-24 18:05:36', '2023-03-24 18:05:36'),
(96, 'Gräddost', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Ystad av svensk mjölk från glada bönder vänd för hand på traditionellt vis.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1775 kJ/424 kcal</p><p>Fett 38 g</p><p>- Varav mättat fett 24 g</p><p>Kolhydrat 0 g</p><p>- Varav sockerarter 0 g</p><p>Protein 20 g</p><p>Salt 1.2 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '86:95', NULL, NULL, 'In Stock', '173:90 /kg', 'Weekly', NULL, 11, 146, '2023-03-24 18:07:52', '2023-03-24 18:07:52'),
(97, 'Mozzarella Riven 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Familjefavoriter Mozzarella riven ost är en mozzarella-ost med mild och god smak som passar perfekt till varm matlagning. Den färdigrivna osten smälter till en härlig, lite seg konsistens med långa trådar och passar perfekt på pizza och varma mackor. Ugnsrätter får en vackert gyllene yta. Arla® Familjefavoriter Mozzarella riven ost har lagrats en tid och innehåller därför mindre vatten än en färsk mozzarella.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><ul><li>Per 100 g:</li><li>Energi 1254 kJ/301 kcal</li><li>Fett 21 g</li><li>- Varav mättat fett 13 g</li><li>Kolhydrat 3.2 g</li><li>- Varav sockerarter 1.0 g</li><li>Protein 24 g</li><li>Salt 1.4 g</li><li>Kalcium 723 mg</li><li><br></li></ul><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '68:95', NULL, NULL, 'In Stock', '137:90 /kg', 'Weekly', NULL, 11, 46, '2023-03-24 18:09:45', '2023-03-24 18:09:45');
INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(98, 'Herrgård® 28% Skivad', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vår goda Arla Ko® Herrgårdsost® är mild och gräddig skivad ost med karakteristiskt inslag av sötma och hasselnöt. Färdigskivad Herrgårdsost® som passar perfekt som pålägg. Herrgård® började tillverkas på 1800-talet och är än idag en av de mest omtyckta herrgårdsostarna i Sverige. Vår Arla Ko® Herrgård® görs på Kalmar mejeri på färsk mjölk från Öland och Småland. Varumärket Arla Ko® garanterar att osten är gjord på 100 procent svensk mjölk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1493 kJ/360 kcal</p><p>Fett 28 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 26 g</p><p>Salt 1.3 g</p><p>Vitamin B12 1.5 µg</p><p>Kalcium 774 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '62:95', NULL, NULL, 'In Stock', '209:83 /kg', 'Weekly', NULL, 11, 47, '2023-03-24 18:14:01', '2023-03-24 18:14:01'),
(99, 'Pecorino Riven', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Riven fårost med stor smak och tydlig sälta. Utmärkt till pasta och risotto, i såser och dressingar.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1686 kJ/406 kcal</p><p>Fett 32 g</p><p>-varav mättat fett 20 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 29 g</p><p>Salt 4.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '38:95', NULL, NULL, 'In Stock', '389:50 /kg', 'Weekly', NULL, 11, 46, '2023-03-24 18:15:42', '2023-03-24 18:15:42'),
(100, 'Mozzarella Riven 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>98% MOZZARELLA (pastöriserad KOMJÖLK, salt, mjölksyrakultur, ystenzym), 2% potatisstärkelse.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1239 kJ/295 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 13 g</p><p>Kolhydrat 2.6 g</p><p>-varav sockerarter 1 g</p><p>Protein 25 g</p><p>Salt 1.2 g</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '186:33 /kg', 'Weekly', NULL, 11, 46, '2023-03-24 18:17:47', '2023-03-24 18:17:47'),
(101, 'Parmigiano Reggiano Grovriven 12M', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Grovriven parmigiano Reggiano. Italiensk parmesan lagrad i minst 22 månader i norra Italien. Vår parmesanost är certifierad med skyddad ursprungsbeteckning, Certificato da organismo di controllo autorizzato dal Mipaaf.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1671 kJ/402 kcal</p><p>Fett 30 g</p><p>-varav mättat fett 20 g</p><p>Kolhydrat 0 g</p><p>-varav sockerarter 0 g</p><p>Protein 32 g</p><p>Salt 1.6 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '38:95', NULL, NULL, 'In Stock', '458:24 /kg', 'Weekly', NULL, 11, 46, '2023-03-24 18:19:25', '2023-03-24 18:19:25'),
(102, 'Feta 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Zeta Fetaost, från Grekland, av pastöriserad får- och getmjölk. Smakrik och friskt syrlig med lätt sälta. Passar i både kall och varm matlagning.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1140 kJ/ 275 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 16 g</p><p>Kolhydrat 1 g</p><p>-varav sockerarter &lt;0.5 g</p><p>Protein 16 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '199:67 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:27:07', '2023-03-24 18:28:16'),
(103, 'Fetaost Original 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fontanas fetaost är gjord på får- och getmjölk från norra Grekland. Osten har en lätt syrlig smak med lagom mycket sälta vilket gör den perfekt i grekisk sallad, på ostbrickan eller som topping på pasta och soppa.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1163 kJ/278 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 13.7 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 17 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35:95', NULL, NULL, 'In Stock', '239:67 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:30:57', '2023-03-24 18:30:57'),
(104, 'Vitost Hel Bit 20%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Apetina® vitost i hel bit har en behaglig syrlighet med tydlig sälta som ger maträtten en extra smakdimension. Passar både som salladsost och som matlagningsost. Osten har en fast konsistens med ett trevligt tuggmotstånd och den behåller sin form i varm mat. Smula ner, riv eller bryt osten i bitar och sätt guldkant på gratängen eller pastarätten.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1081 kJ/260kcal</p><p>Fett 20 g</p><p>-varav mättat fett 13 g</p><p>Kolhydrat 0.6 g</p><p>-varav sockerarter 0.6 g</p><p>Protein 18 g</p><p>Salt 2.5 g</p><p>Kalcium 519 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '24:95', NULL, NULL, 'In Stock', '166:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:32:18', '2023-03-24 18:32:18'),
(105, 'Fetaost EKO 24%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fontanas ekologiska och KRAV-märkta fetaost, tillverkad på mjölk från får och getter som betar naturligt och äter foder fritt från bekämpningsmedel. Ett grekiskt hantverk utan tillsatser men med mycket smak.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1193 kJ/285 kcal</p><p>Fett 24 g</p><p>-varav mättat fett 15.6 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 16.5 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '37:95', NULL, NULL, 'In Stock', '253:- /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:35:23', '2023-03-24 18:35:23'),
(106, 'Salladsost i Bit 19%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Salladsost i bit. Fetthalt 21%.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 950 kJ/230 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat 1.2 g</p><p>-varav sockerarter 1.2 g</p><p>Protein 12 g</p><p>Salt 2.8 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '18:95', NULL, NULL, 'In Stock', '126:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:39:38', '2023-03-24 18:39:38'),
(107, 'Fetaost 25%', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1201 kJ/290 kcal</p><p>Fett 25 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 1 g</p><p>-varav sockerarter 0 g</p><p>Protein 16 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '26:95', NULL, NULL, 'In Stock', '179:67 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:50:00', '2023-03-24 18:50:00'),
(108, 'Vitost Hel Bit 10%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Apetina® vitost 10% i hel bit har en behaglig syrlighet och tydlig sälta. Osten har en fast, lite torr konsistens som gör den lätt att skära i snygga bitar. Apetina® vitost passar utmärkt som salladsost, på bufféer och som matlagningsost i såväl varm som kall matlagning. Tips: Skiva och stek osten som ett gott alternativ till kött och fisk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 685 kJ/164 kcal</p><p>Fett 10 g</p><p>-varav mättat fett 6.4 g</p><p>Kolhydrat 0.6 g</p><p>-varav sockerarter 0.6 g</p><p>Protein 16 g</p><p>Salt 2.8 g</p><p>Kalcium 476 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '24:95', NULL, NULL, 'In Stock', '166:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:51:28', '2023-03-24 18:51:28'),
(109, 'Vitost Tärnad i Olja Classic 29%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Tärnad Apetina® vitost i olja örter &amp; kryddor har en aromatisk, lätt syrlig smak och god sälta. Osten har en fast konsistens som passar perfekt som salladsost och matlagningsost. Osten ligger i en marinad av rapsolja, örter, kryddor och vitlök. Tips: Använd marinaden som dressing, en smakrik olja att steka i eller ät osten som snacks, precis som den är!</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 2206 kJ/535 kcal</p><p>Fett 55 g</p><p>-varav mättat fett 11 g</p><p>Kolhydrat &lt;0.5 g</p><p>-varav sockerarter &lt;0.5 g</p><p>Protein 10 g</p><p>Salt 1.9 g</p><p>Kalcium 151 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '41:95', NULL, NULL, 'In Stock', '158:30 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:52:56', '2023-03-24 18:52:56'),
(110, 'Vitost Tärnad 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Tärnad Apetina® vitost i lake har en aromatisk smak med god sälta. Osten har en medelfast konsistens och behåller formen vid tillagning, vilket ger en trevlig karaktär i varma rätter. Tärningarna ligger samlade i en nätkorg och är lätta att lyfta upp ur laken. Tärnad Apetina® vitost passar perfekt som matlagningsost i både varma och kalla rätter, som salladsost, på buffébordet och som ett gott alternativ till kött och fisk.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1046 kJ/252 kcal</p><p>Fett 21.4 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat &lt;0.5 g</p><p>-varav sockerarter &lt;0.5 g</p><p>Protein 14.3 g</p><p>Salt 3 g</p><p>Kalcium 215 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '41:95', NULL, NULL, 'In Stock', '209:75 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 18:56:59', '2023-03-24 18:56:59'),
(111, 'Grekisk Salladsost 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Smakrik salladsost gjord av mjölk från kor som betar på frodiga sluttningar i Grekland.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1053 kJ/252 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 15 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 15 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '186:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 19:00:55', '2023-03-24 19:00:55'),
(112, 'Fetaost 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Traditionella Grekisk feta med en len och krämig karaktär, balanserad syra och klarvit färg.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1155 kJ/276 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 16.1 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Fiber 0 g</p><p>Protein 16.5 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '199:67 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 19:03:34', '2023-03-24 19:03:34'),
(113, 'Feta 2x65g', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Zeta Fetaost, av pastöriserad får- och getmjölk, från Grekland. Packad i en unik förpackning med två mindre bitar, som portionsbitar.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1140 kJ/275 kcal</p><p>Fett 23 g</p><p>- Varav mättat fett 16 g</p><p>Kolhydrat 1 g</p><p>- Varav sockerarter 0.50 g</p><p>Protein 16 g</p><p>Salt 2.50 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '31:95', NULL, NULL, 'In Stock', '245:77 /kg', 'Weekly', NULL, 11, 48, '2023-03-24 19:04:59', '2023-03-24 19:04:59'),
(114, 'Färskost Original 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Philadelphia Original är vår mest älskade färskost, välkänd för sin fräscha smak och krämiga konsistens.</p><p>En otroligt mångsidig produkt som är lika god på smörgåsen, som i matlagning eller i desserter. Den är även utan konserveringsmedel, glutenfri och Lakto-vegetarisk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 933 kJ/226 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat 4.3 g</p><p>-varav sockerarter 4.3 g</p><p>Fiber 0.2 g</p><p>Protein 5.4 g</p><p>Salt 0.75 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '37:95', NULL, NULL, 'In Stock', '126:50 /kg', 'Popular', NULL, 11, 49, '2023-03-24 19:12:02', '2023-03-24 19:12:02'),
(115, 'Färskost Original 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Philadelphia Original är vår mest älskade färskost, välkänd för sin fräscha smak och krämiga konsistens.</p><p>En otroligt mångsidig produkt som är lika god på smörgåsen, som i matlagning eller i desserter. Den är även utan konserveringsmedel, glutenfri och Lakto-vegetarisk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 933 kJ/226 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat 4.3 g</p><p>-varav sockerarter 4.3 g</p><p>Fiber 0.2 g</p><p>Protein 5.4 g</p><p>Salt 0.75 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '149:75 /kg', 'Popular', NULL, 11, 49, '2023-03-24 19:14:15', '2023-03-24 19:14:15'),
(116, 'Färskost Vitlök 40%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Servera dina gäster med den här läckra blandningen av delikat vitlök, doftande persilja och milda gräslök som är blandad med krämig färkost och inslagna i vår signaturfolie. Något smuligt men mest krämigt – Boursin vitlök &amp; Örter passar perfekt till ostbrickan och som komplement till nästan alla recept.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1635 kJ/396 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 39 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 26 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 3 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 2.5 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 8.5 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.2 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45:95', NULL, NULL, 'In Stock', '306:33 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 19:17:19', '2023-03-24 19:17:19'),
(117, 'Färskost Light 11%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Philadelphia Light är en magrare färskost, men har samma fräscha krämiga smak som Originalet.</span></p><p><span style=\"color: rgb(38, 38, 58);\">En mångsidig produkt som är lika god på smörgåsen, som i matlagning eller i desserter. Den är även utan konserveringsmedel, glutenfri och Lakto-vegetarisk.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 614 kJ/148 kcal</p><p>Fett 11 g</p><p>-varav mättat fett 7.1 g</p><p>Kolhydrat 5.2 g</p><p>-varav sockerarter 5.2 g</p><p>Fiber 0.4 g</p><p>Protein 7.4 g</p><p>Salt 0.7 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '149:75 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 19:18:27', '2023-03-24 19:18:27'),
(118, 'Ricotta 9%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Mild färskost tillverkad i Italien med 9% fetthalt.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 557 kJ/134 kcal</p><p>Fett 9 g</p><p>-varav mättat fett 6.2 g</p><p>Kolhydrat 3.2 g</p><p>-varav sockerarter 3.2 g</p><p>Protein 10 g</p><p>Salt 0.16 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '22:95', NULL, NULL, 'In Stock', '91:80 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 19:20:58', '2023-03-24 19:20:58'),
(119, 'Färskost 21% Laktosfri', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Philadelphia Laktosfri har samma goda fräscha smak och krämiga konsistens som Philadelphia Original.</p><p>En otroligt mångsidig produkt som är lika god på smörgåsen, som i matlagning eller i desserter. Den är även utan konserveringsmedel, glutenfri och vegetarisk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 915 kJ/221 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat 3.2 g</p><p>-varav sockerarter 3.2 g</p><p>Fiber 0.2 g</p><p>Protein 5.4 g</p><p>Salt 0.85 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '31:95', NULL, NULL, 'In Stock', '182:57 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 19:31:56', '2023-03-24 19:31:56'),
(120, 'Färskost Vitlök & Örter 20%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Philadelphia Vitlök &amp; Örter är en fräsch och krämig färskost med örter och mild smak av vitlök. En mångsidig produkt som är lika god på smörgåsen som i matlagning.</span></p><p><span style=\"color: rgb(38, 38, 58);\">Den är även utan konserveringsmedel, glutenfri och Lakto-vegetarisk.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 892 kJ/216 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 20 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 13 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 4 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 4 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fiber 0.5 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 5.3 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 1.03 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '149:75 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 19:38:03', '2023-03-24 19:38:03'),
(121, 'Räkost 16%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Kavli Räkost är hela Sveriges favoritmjukost, gjord på utvalda klassiska ostar och fina ishavsräkor. Fetthalt endast 16%. Kavlis mjukost är lokalt producerad i Älvsjö. För att få bästa möjliga kvalitet och smak på våra produkter använder vi alltid förstklassig hårdost och bästa råvaror. Alla våra mjukostar är pastöriserade och det går bra att äta dem om man är gravid. Kavli mjukost passar bra att ha på smörgåsen, som ingrediens och smaksättare i matlagning i t.ex soppa, paj eller pastasås.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 850 kJ/210 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 15 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 9.3 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 17 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 3.4 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '46:95', NULL, NULL, 'In Stock', '170:73 /kg', 'Popular', NULL, 11, 45, '2023-03-24 19:41:16', '2023-03-24 19:41:16'),
(122, 'Räkost 14% Laktosfri', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Klassisk räkost i tub - här i en efterlängtad laktosfri variant! Kavlis räkost är riktigt krämig och har god smak av både ost och ishavsräkor - mångas favorit på frukostmackan.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 800 kJ/190 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 14 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 9 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 17 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 3.5 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '46:95', NULL, NULL, 'In Stock', '187:80 /kg', 'Weekly', NULL, 11, 45, '2023-03-24 19:51:15', '2023-03-24 19:51:15');
INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(123, 'Färskost Naturell 25%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Färskost - inga tillsatser, naturligt gott! Arla® Färskost Naturell 25% är god med frisk och lite syrlig smak. Självklar i din underbara cheesecake och annan bakning, använd 50-grams-markeringarna på folien för att snabbt och enkelt mäta upp rätt mängd för ditt recept. Vår goda färskost är otroligt mångsidig: gott pålägg och perfekt att göra röror och glasyrer på. Den kan hettas upp, vilket gör den perfekt som fyllning i maträtter som crêpes, cannelloni och rullader. Inga tillsatser, vår färskost är tillverkad av mjölk och grädde som syrats med naturlig syrningskultur.</p><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1039 kJ/252 kcal</p><p>Fett 25 g</p><p>-varav mättat fett 16 g</p><p>Kolhydrat 3 g</p><p>-varav sockerarter 3 g</p><p>Protein 4.5 g</p><p>Salt 0.8 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '20:95', NULL, NULL, 'In Stock', '139:67 /kg', 'Popular', NULL, 11, 45, '2023-03-24 19:54:29', '2023-03-24 19:54:29'),
(124, 'Färskost Pepparrot', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Cantadou pepparrot imponerar med sin utmärkta, balanserad och klassiska smak. Denna cream cheese är förstahandsvalet för frestande laxsrecept och många andra rätter.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1216 kJ/295 kcal</p><p>Fett 28.5 g</p><p>-varav mättat fett 19 g</p><p>Kolhydrat 3 g</p><p>-varav sockerarter 3 g</p><p>Protein 6.5 g</p><p>Salt 1.3 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35:95', NULL, NULL, 'In Stock', '256:79 /kg', 'Popular', NULL, 11, 49, '2023-03-24 19:57:01', '2023-03-24 19:57:01'),
(125, 'Färskost Vitlök & Örter 24%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Arla® Färskost - inga tillsatser, naturligt gott! Arla® Färskost Vitlök &amp; Örter 24% är en härlig ost med frisk, rik smak av vitlök, persilja och gräslök. Den är perfekt som pålägg men lika god i kall och varm matlagning. Prova den gärna i pastasås, över ugnsbakad lax, som fyllning i en baguette, på ostbrickan eller bara njut den som den är tillsammans med ditt favoritbröd. Vår färskost har inga tillsatser och görs av mjölk och grädde syrad med naturlig syrningskultur.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1040 kJ/252 kcal</p><p>Fett 24 g</p><p>-varav mättat fett 15 g</p><p>Kolhydrat 3.8 g</p><p>-varav sockerarter 3 g</p><p>Protein 4.7 g</p><p>Salt 1.2 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '20:95', NULL, NULL, 'In Stock', '139:67 /kg', 'Weekly', NULL, 11, 49, '2023-03-24 20:02:00', '2023-03-24 20:02:00'),
(126, 'Mozzarella', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Klotformad mozzarella som är mjuk och fin i konsistensen. Mozzarellan går bra att skiva, men går också att riva isär.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1026 kJ/247 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 19 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 12 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 1 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fiber 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 18 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.5 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '17:95', NULL, NULL, 'In Stock', '143:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 20:09:59', '2023-03-24 20:11:26'),
(127, 'Burrata', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Zeta Burrata är en mozzarella med krämig, gräddig fyllning och är en delikatess från Apulien i södra Italien. Perfekt på pizza, pasta eller som förrätt.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 959 kJ/232 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 21 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 12 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 1.3 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1.3 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 11 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.54 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '40:95', NULL, NULL, 'In Stock', '409:50 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:05:11', '2023-03-24 21:05:11'),
(128, 'Mozzarella EKO', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Krämig ekologisk mozzarellaost. God till en sallad på en pizza eller till pastan.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1026 kJ/247 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 19 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 12 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 1 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 18 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.5 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '21:95', NULL, NULL, 'In Stock', '175:60 /kg', 'Popular', NULL, 11, 50, '2023-03-24 21:07:03', '2023-03-24 21:07:03'),
(129, 'Buffelmozzarella', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Mozzarella di bufala campana - Michelangelos buffelmozzarella är klotformad. Trådig i konsistensen och ska helst rivas isär i lite större bitar. Konsistensen är mjukare, smaken är sötare, mer neutral och lite skarpare än komjölksmozzarella.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1062 kJ/256 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 22 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 16 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0.6 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0.6 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 14 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fiber 0 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.39 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '28:95', NULL, NULL, 'In Stock', '231:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:08:28', '2023-03-24 21:08:28'),
(130, 'Burrata', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Burrata har blivit kallad \"drottning av mejeriprodukter\" runt om i världen. Började tillverkas runt 1900 i provinse Bari i Italien och är idag de mest läckraste specialiteter inom mejeriprodukter. Burrata är en färsk ostmassa, liknande mozzarella, men dess textur är mer mjuk och krämig. Smaken är söt och lite smörig. Handtillverkas genom pasta filata som blir till en liten \"påse\", som sedan fylls med en fyllning av mozzarella och grädde. \"Påsen\" försluts sedan noggrant och paketeras. Burrata vann World Cheese Awards 2010. Det bästa sättet att uppskatta Burrata på är att äta den precis som den är, eller ringla lite olivolja över osten tillsammans med några basilikablad. Men kan också tillaga till olika varmrätter som pasta och pizza.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 910 kJ/217 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 18 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 12 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 1.25 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 1.25 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 13 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.8 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '38:95', NULL, NULL, 'In Stock', '324:58 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:09:32', '2023-03-24 21:09:32'),
(131, 'Buffelmozzarella', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Zeta Mozzarella di Bufala Campana är en vackert pärlvit buffelmozzarella av pastöriserad färsk mjölk från vattenbuffel. God med olivolja, basilika och solmogna tomater.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Per 100 g:</span></p><p><span style=\"color: rgb(38, 38, 58);\">Energi 1198 kJ/288 kcal</span></p><p><span style=\"color: rgb(38, 38, 58);\">Fett 25 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav mättat fett 17 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Kolhydrat 0.8 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">-varav sockerarter 0.5 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Protein 15 g</span></p><p><span style=\"color: rgb(38, 38, 58);\">Salt 0.56 g</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '28:95', NULL, NULL, 'In Stock', '289:50 /kg', 'Popular', NULL, 11, 50, '2023-03-24 21:11:49', '2023-03-24 21:11:49'),
(132, 'Mozzarella Classic', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Galbani Mozzarella är italienarnas favorit! Den vanligaste mozzarellan görs på komjölk, något som ger osten en frisk mjölkig och gräddig smak. Traditionellt äts mozzarella med tomater och basilika som en \"Caprese\" -sallad men kan också ätas varm i rostat bröd, panini eller pastarätter!</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 989 kJ/ 238 kcal</p><p>Fett 18 g</p><p>-varav mättat fett 13 g</p><p>Kolhydrat 2 g</p><p>-varav sockerarter 1 g</p><p>Protein 17 g</p><p>Salt 0.7 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '20:95', NULL, NULL, 'In Stock', '167:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:12:54', '2023-03-24 21:12:54'),
(133, 'Buffelmozzarella', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Mozzarella Bufala D.O.P har en karaktäristisk gräddig och fyllig smak. Den är tillverkad av 100 % färsk Buffel-mjölk. D.O.P innebär Skyddad Ursprungsbeteckning och anger att ett livsmedel både härstammar från och är framställd, bearbetad och tillverkad i det gällande området. Märkningen görs på EU-nivå och innebär hårdare krav på kvalitet och produktionsmetod.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1084 kJ/262 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 16 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 13 g</p><p>Salt 0.7 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35:95', NULL, NULL, 'In Stock', '287:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:20:47', '2023-03-24 21:20:47'),
(134, 'Mozzarella Laktosfri', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Laktosfri mozzarellaost - lika god till pizzan som till en fräsch sallad.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 921 kJ/222 kcal</p><p>Fett 17 g</p><p>-varav mättat fett 13 g</p><p>Kolhydrat 0.2 g</p><p>-varav sockerarter 0.2 g</p><p>Protein 17 g</p><p>Salt 0.6 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '279:50 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:22:20', '2023-03-24 21:22:20'),
(135, 'Burrata', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1058 kJ/256 kcal</p><p>Fett 24 g</p><p>- Varav mättat fett 15 g</p><p>Kolhydrat 2 g</p><p>- Varav sockerarter 2 g</p><p>Protein 8 g</p><p>Salt 0.54 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '38:95', NULL, NULL, 'In Stock', '311:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:23:12', '2023-03-24 21:23:12'),
(136, 'Burrata Tryffel', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Zeta Burrata med tryffel är en krämig mozzarella som fått en härlig smak av tryffelsmör. Perfekt till förrätt, på pizza eller pasta.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1068 kJ/258 kcal</p><p>Fett 24 g</p><p>-varav mättat fett 15 g</p><p>Kolhydrat 0.8 g</p><p>-varav sockerarter 0.8 g</p><p>Protein 9.8 g</p><p>Salt 0.95 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '46:95', NULL, NULL, 'In Stock', '469:50 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:24:40', '2023-03-24 21:24:40'),
(137, 'Buffelmozzarella', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '32:95', NULL, NULL, 'In Stock', '263:60 /kg', 'Weekly', NULL, 11, 50, '2023-03-24 21:26:16', '2023-03-24 21:26:16'),
(138, 'Salladsost Vitlök/Persilja 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p><span style=\"color: rgb(38, 38, 58);\">Tärnad Apetina® vitost i lake vitlök &amp; persilja har en trevlig sälta och aromatisk smak. Osten har en medelfast konsistens och smälter inte vid upphettning, vilket ger en trevlig karaktär i varma rätter. Tärningarna ligger samlade i en nätkorg som är lätt att lyfta upp ur laken. Tärnad Apetina® vitost passar perfekt som matlagningsost i både varma och kalla rätter, som salladsost, på buffébordet och som ett spännande alternativ till kött och fisk. Kan även ätas som snacks, precis som den är.</span></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1048 kJ/253 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 14 g</p><p>Kolhydrat &lt;0.5 g</p><p>-varav sockerarter &lt;0.5 g</p><p>Protein 14 g</p><p>Salt 3 g</p><p>Kalcium 213 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '41:95', NULL, NULL, 'In Stock', '209:75 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 15:47:27', '2023-03-25 15:47:27'),
(139, 'Vitost Krämig Hel Bit 20%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Apetina® vitost hel bit är en mjuk, slät och krämig ost med en gräddig och något syrlig smak. Använd Apetina® vitost som matlagningsost eller salladsost på en vegetarisk lunchtallrik, till söta frukter eller som ett krämigt komplement i varm mat. Tips: Skiva och stek osten som ett gott alternativ till kött och fisk.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1037 kJ/ 250 kcal</p><p>Fett 20 g</p><p>- Varav mättat fett 13 g</p><p>Kolhydrat 3.9 g</p><p>- Varav sockerarter 2.5 g</p><p>Protein 13 g</p><p>Salt 2.5 g</p><p>Kalcium 350 mg</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '24:95', NULL, NULL, 'In Stock', '124:75 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 15:49:36', '2023-03-25 15:49:36'),
(140, 'Feta EKO 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Zeta Feta Ekologisk är en grekisk fetaost av pastöriserad får- och getmjölk. Smakrik och friskt syrlig med lätt sälta. Perfekt i både varm och kall matlagning.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1140 kJ/275 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 16 g</p><p>Kolhydrat 1 g</p><p>-varav sockerarter &lt;0.5 g</p><p>Protein 16 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '33:95', NULL, NULL, 'In Stock', '226:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 15:52:14', '2023-03-25 15:52:14'),
(141, 'Grekisk Salladsost 21%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Smakrik salladsost gjord av mjölk från kor som betar på frodiga sluttningar i Grekland.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1053 kJ/252 kcal</p><p>Fett 21 g</p><p>-varav mättat fett 15 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 15 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '186:33 /kg', 'Popular', NULL, 11, 48, '2023-03-25 15:55:14', '2023-03-25 15:55:14'),
(142, 'Fetaost 25%', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1201 kJ/290 kcal</p><p>Fett 25 g</p><p>-varav mättat fett 18 g</p><p>Kolhydrat 1 g</p><p>-varav sockerarter 0 g</p><p>Protein 16 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '26:95', NULL, NULL, 'In Stock', '179:67 /kg', 'Popular', NULL, 11, 48, '2023-03-25 16:07:37', '2023-03-25 16:07:37'),
(143, 'Fetaost Laktosfri 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fontanas fetaost är gjord på laktosfri får- och getmjölk från norra Grekland. Osten har en fast konsistens och frisk smak med lagom mycket sälta. Passar bra i grekisk sallad, på ostbrickan eller som topping på pasta och soppa.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1163 kJ/278 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 13.7 g</p><p>Kolhydrat 0.7 g</p><p>-varav sockerarter 0.7 g</p><p>Protein 17 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '36:95', NULL, NULL, 'In Stock', '246:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:20:52', '2023-03-25 16:20:52'),
(144, 'Salladsost 10%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Salladsost i bit. Fetthalt 10%.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 719 kJ/172 kcal</p><p>Fett 10 g</p><p>-varav mättat fett 6.5 g</p><p>Kolhydrat 0.5 g</p><p>-varav sockerarter 0.5 g</p><p>Protein 20 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '18:95', NULL, NULL, 'In Stock', '126:33 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:23:23', '2023-03-25 16:23:23'),
(145, 'Salladsost Extra Creamy 19%', 11, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 924 kJ/223 kcal</p><p>Fett 19 g</p><p>-varav mättat fett 9.4 g</p><p>Kolhydrat 2 g</p><p>-varav sockerarter 2 g</p><p>Protein 11 g</p><p>Salt 3 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '57:95', NULL, NULL, 'In Stock', '72:44 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:24:43', '2023-03-25 16:24:43'),
(146, 'Salladsost Extra Creamy 19%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Extra krämig salladsost, smula ned i en sallad eller använd till en smakrik röra.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 924 kJ/223 kcal</p><p>Fett 19 g</p><p>-varav mättat fett 9.4 g</p><p>Kolhydrat 2 g</p><p>-varav sockerarter 2 g</p><p>Protein 11 g</p><p>Salt 3 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '37:95', NULL, NULL, 'In Stock', '94:88 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:25:56', '2023-03-25 16:25:56'),
(147, 'Vitost Traditional 60%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Traditionellt tillverkad vitost enligt gammalt recept &amp; tradition Smaken är mild med sälta. Tillverkad i Österrike. Cylinderformad förp. med plastlock. Vitosten förvaras och lagras i saltlake för extra lång hållbarhet.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1240 kJ/300 kcal</p><p>Fett 28 g</p><p>-varav mättat fett 20 g</p><p>Kolhydrat 0.26 g</p><p>-varav sockerarter 0.26 g</p><p>Protein 12 g</p><p>Salt 2.76 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '59:95', NULL, NULL, 'In Stock', '149:88 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:33:26', '2023-03-25 16:33:26');
INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin_id`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(148, 'Vitost German White Combi 23%', 11, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Smaken är mild och krämig med tydlig smak av sälta. Passar som ingrediens till allt från sallader till paj, brödbak eller i kalla röror.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energi 1055 kJ/255 kcal</p><p>Fett 23 g</p><p>-varav mättat fett 22 g</p><p>Kolhydrat 4 g</p><p>-varav sockerarter 4 g</p><p>Protein 8 g</p><p>Salt 2.5 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '28:95', NULL, NULL, 'In Stock', '57:90 /kg', 'Weekly', NULL, 11, 48, '2023-03-25 16:45:57', '2023-03-25 16:45:57'),
(149, 'Vindruvor Gröna i Ask Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vindruvor gröna i ask Klass 1. Gröna vindruvor har oftast en ljusgrön färg och är väldigt saftiga, ibland även lite krispiga. De ger en söt och frisk smak. Vindruvor är en av världens mest odlade frukter. Dessa druvor är kärnfria</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 74 kcal/310 kJ, Vatten: 81g, Protein: 0,7g, Fett: 0,6g, Kolhydrater: 16,2g, Kostfiber: 1,6g, Kalium: 185mg, ß-karoten: 42µg, C-vitamin: 11mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '49:95', NULL, NULL, 'In Stock', '78:- /kg', 'Weekly', NULL, 2, 8, '2023-03-25 17:41:25', '2023-03-25 17:41:25'),
(150, 'Paprika Röd Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Röd Paprika Klass 1. Den röda paprikan har en mild och söt smak då den mognar längre på plantan i jämförelse med den gröna som är starkare i smaken.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 107kJ/26 kcal, Protein: 1g, Fett: 0,1g, Mättade fettsyror: 0g, Kolhydrater: 4g, Fibrer: 2g, C-vitamin: 159mg, D-vitamin: 0mcg, Folat: 40mcg, Järn: 0,3mg, Zink: 0,2mg, Kalcium: 6mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '98:21 /kg', 'Weekly', NULL, 4, 21, '2023-03-25 17:47:25', '2023-03-25 17:47:25'),
(151, 'Potatis Kok/Fast Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fast potatis lämplig att kokas och stekas. Passar även utmärkt i sallader.</p><p><br></p><p>Denna odlas på Östra fornås lantbruk i Östergötland. Ett familjeföretag i 6:e generationen! De är specialiserade på att odla potatis och är bland de bästa odlarna i Sverige enligt oss på MatHem.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '39:95', NULL, NULL, 'In Stock', '11:11 /kg', 'Weekly', NULL, 6, 24, '2023-03-25 17:52:05', '2023-03-25 17:52:05'),
(152, 'Gurka Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Gurka Klass 1.</p><p><br></p><p>Gurka äts ofta rå som del av en sallad eller kan skäras i tunna stavar och serveras som tilltugg. En uppfriskande dryck får du enkelt genom att skiva gurka tunt och låta den dra en stund i iskallt vatten tillsammans med citron och mynta.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 11 kcal/46 kJ, Vatten: 96g, Protein: 0,5g, Fett: 0,1g, Kolhydrater: 2g, Kostfiber: 1,1g, Kalium: 163mg, Kalcium: 22mg, Järn: 0,2mg, Selen: 0µg, ß-karoten: 220µg, C-vitamin: 9mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '22:95', NULL, NULL, 'In Stock', '61:54 /kg', 'Weekly', NULL, 4, 13, '2023-03-25 17:55:30', '2023-03-25 17:55:30'),
(153, 'Tomat Plommon baby Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '100:- /kg', 'Popular', NULL, 4, 14, '2023-03-25 17:57:21', '2023-03-25 17:57:21'),
(154, 'Potatis Kok/Fast Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Fast potatis lämplig att kokas och stekas. Passar även utmärkt i sallader.</p><p><br></p><p>Denna odlas på Östra fornås lantbruk i Östergötland. Ett familjeföretag i 6:e generationen! De är specialiserade på att odla potatis och är bland de bästa odlarna i Sverige enligt oss på MatHem.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '27:78 /kg', 'Popular', NULL, 6, 24, '2023-03-25 17:58:54', '2023-03-25 17:58:54'),
(155, 'Romansallad Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Romansallad är en sallatssort med kraftig smak och stora krispiga blad. Den klassiska Caesar-salladen görs på romansallat.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 17 kcal/71 kJ, Vatten: 94,61g, Protein: 1,23g, Fett: 0,3g varav mättat 0,04g varav enkelomättat 0,01g varav fleromättat 0,16g, Kolhydrater: 3,29g varav sockerarter 1,19g, Fibrer: 2,1g C-vitamin: 24mg, Niacin: 0,31mg, B2: 0,07mg, B1: 0,07mg, B6: 0,07mg, Karoten: 3484mcg, Alfa-tokoferol: 0,13mg, Fosfor: 30mg, Järn: 0,97mg, Kalcium: 33mg, Kalium: 247mg, Magnesium: 14mg, Natrium: 8mg, Zink: 0,23mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '110:- /kg', 'Weekly', NULL, 4, 15, '2023-03-25 18:01:15', '2023-03-25 18:01:15'),
(156, 'Lök Gul Påse Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>1kg Gul lök packade i nät. Packade i Sverige.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '17:95', NULL, NULL, 'In Stock', '15:- /kg', 'Popular', NULL, 6, 25, '2023-03-25 18:08:26', '2023-03-25 18:08:26'),
(157, 'Purjolök Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Purjolök Klass 1</p><p>OBS! Denna purjo är max 30cm lång för att få plats i våra kassar och inte sticka upp vilket kan medföra skador under hantering och transport hos oss</p><p><br></p><p>Detta kan medföra att du ej får så mycket grön blast på din purjolök</p><p><br></p><p>Purjolöken har mildare smak än andra matlökar. Den mörkgröna blasten har krafigare smak än den vita delen.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 138 kJ/33 kcal, Protein: 2g, Fett: 0,2g, Mättade fettsyror 0g, Kolhydrater: 5g, Fibrer 2g, C-vitamin: 40mg, D-vitamin: 0mcg, Folat: 91mcg, Järn: 0,5mg, Zink: 0,3mg, Kalcium: 24mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '15:50', NULL, NULL, 'In Stock', '59:88 /kg', 'Popular', NULL, 6, 25, '2023-03-25 18:12:02', '2023-03-25 18:12:02'),
(158, 'Sallat Isberg Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Sallat Isberg Klass 1.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 61 kJ/15kcal, Protein: 1g, Fett: 0,1g, Mättade fettsyror: 0g, Kolhydrater: 2g, Fibrer: 1g, C-vitamin: 4mg, D-vitamin: 0mcg, Folat: 56mcg, Järn: 0,4mg, Zink: 0,2mg, Kalcium: 16mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '27:95', NULL, NULL, 'In Stock', '55:90 /kg', 'Popular', NULL, 4, 15, '2023-03-25 18:55:16', '2023-03-25 18:55:16'),
(159, 'Paprikamix Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Färgerna kan skifta i olika kombinationer mellan röd, gul, grön och orange.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '44:95', NULL, NULL, 'In Stock', '87:50 /kg', 'Weekly', NULL, 4, 21, '2023-03-25 18:57:29', '2023-03-25 18:57:29'),
(160, 'Broccoli Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Broccoli Klass 1. Broccoli har en mycket mild kålsmak. Broccoli påminner i uppbyggnad om blomkål. I Sverige har broccoli funnits sedan 1950-talet, men det är först de senaste åren den blivit populär. Broccoli används som kokt tillbehör, i soppor, gratinerad, stuvad och rå i sallader.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi 27 kcal/112 kJ, Vatten: 90g, Protein: 3g, Fett: 0,4g, Kolhydrater: 2,7g, Kostfiber: 2,5g, Kalium: 385mg, Kalcium: 48mg, Järn: 0,9mg, Selen: 1µg, ß-karoten: 920µg, C-vitamin: 83mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '17:50', NULL, NULL, 'In Stock', '70:- /kg', 'Weekly', NULL, 4, 19, '2023-03-25 19:01:31', '2023-03-25 19:01:31'),
(161, 'Paprika Gul Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '29:95', NULL, NULL, 'In Stock', '98:21 /kg', 'Popular', NULL, 4, 21, '2023-03-25 19:04:18', '2023-03-25 19:04:18'),
(162, 'Morötter Klass1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12:95', NULL, NULL, 'In Stock', '20:- /kg', 'Weekly', NULL, 4, 141, '2023-03-25 19:06:57', '2023-03-25 19:06:57'),
(163, 'Avokado Mogen 2-p Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Vill du få hem en perfekt avokado är det här produkten för dig. Vår \"vanliga\" avokado kan variera i mognadsgrad och behöva ligga till sig några dagar i fruktskålen innan den är ätmogen, men de här avokadorna garanterar vi att de alltid är redo att ätas redan samma kväll.</p><p>Mjöliga länder vid ersättning: Israel, Sydafrika, Colombia, Kenya, Peru</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '50:95', NULL, NULL, 'In Stock', '138:46 /kg', 'Popular', NULL, 2, 151, '2023-03-25 19:10:48', '2023-03-25 19:10:48'),
(164, 'Banan EKO Fairtrade Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Ekologisk banan Klass1</p><p>Fairtradecertifierad.</p><p><br></p><p>Obs! Säljs i klase</p><p><br></p><p>Bananerna kan variera i färg, från gröna till gula</p><p><br></p><p>Världens bästa mellanmål, den ekologiska bananen, är fylld av bra mineraler, spårämnen och vitaminer. Ekologiska bananer är fria från bekämpningsmedel och du slipper således att få i dig gifter och det bidrar till en bättre miljö där bananen produceras.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 405 kJ/97 kcal, Kolhydrater: 21,8g, Fett: 0,5g, Kalium: 395mg, Magnesium: 33mg, B1-vitamin: 0,05mg, B2-vitamin: 0,1mg, B6-vitamin: 0,6mg, C-vitamin: 9mg, E-vitamin: 0,6mg, Zink: 0,2mg, Niacin: 0,5mg, Järn: 0,4mg, Selen: 0,5ug, Kostfiber: 1,7g.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '37:95', NULL, NULL, 'In Stock', '35:30 /kg', 'Weekly', NULL, 2, 1, '2023-03-25 19:24:34', '2023-03-25 19:24:34'),
(165, 'Apelsin i Nät klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>1kg apelsiner packade i ett nät</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '34:95', NULL, NULL, 'In Stock', '25:- /kg', 'Popular', NULL, 2, 9, '2023-03-25 19:29:29', '2023-03-25 19:29:29'),
(166, 'Citron Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Citron Klass 1. Den kom ursprungligen från trakten söder om Himalaya och var känd i Kina 500 år f Kr. På 1000-talet kom citronen till Europa och år 1493 tog Columbus den med till Haiti.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Näringsvärde per 100g. Energi: 170kJ/41 kcal, Protein: 1g, Fett: 0,3g, Mättade fettsyror: 0g, Kolhydrater: 7g, Fibrer: 2g, C-vitamin: 53mg, D-vitamin: 0mcg, Folat: 11mcg, Järn: 0,1mg, Zink: 0,1mg, Kalcium: 26mg.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '9:95', NULL, NULL, 'In Stock', '53:89 /kg', 'Weekly', NULL, 2, 9, '2023-03-25 19:30:36', '2023-03-25 19:30:36'),
(167, 'Päron Conference Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Långsmalt klassiskt päron med söt smak och saftigt fruktkött. Conference är oftast kärnfria och gulbruna eller gulgröna till färgen.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '13', NULL, NULL, 'In Stock', '58:25 /kg', 'Popular', NULL, 2, 7, '2023-03-25 19:54:37', '2023-03-25 19:54:37'),
(168, 'Avokado Mogen Klass1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Ätmogen avokado</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '15', NULL, NULL, 'In Stock', '89:82 /kg', 'Weekly', NULL, 2, 151, '2023-03-25 19:58:56', '2023-03-25 19:58:56'),
(173, 'test', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 3, 'test', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'test', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>test</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '120', '100', '100', 'In Stock', '1', 'Weekly', 100, 1, 1, '2023-03-27 20:45:41', '2023-03-27 20:45:41'),
(177, 'Melon Honey Class1', 5, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 3, NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '10', NULL, NULL, 'In Stock', '3kg', 'Feature', NULL, 2, 11, '2023-04-04 18:43:59', '2023-04-04 18:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_diet`
--

CREATE TABLE `product_diet` (
  `diet_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_diet`
--

INSERT INTO `product_diet` (`diet_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, NULL, '2023-03-27 20:21:44', '2023-03-27 20:21:44'),
(3, NULL, '2023-03-27 20:36:53', '2023-03-27 20:36:53'),
(3, 173, '2023-03-27 20:45:41', '2023-03-27 20:45:41'),
(NULL, 177, '2023-04-04 18:43:59', '2023-04-04 18:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `path`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'assets/images/product_image/83348.PNG', 8, '2023-02-03 03:24:30', '2023-02-03 03:24:30'),
(2, 'assets/images/product_image/81030.webp', 9, '2023-02-03 04:04:12', '2023-02-05 17:03:16'),
(3, 'assets/images/product_image/46532.webp', 3, '2023-02-03 04:18:44', '2023-02-05 17:03:04'),
(4, 'assets/images/product_image/69452.webp', 1, '2023-02-03 04:19:52', '2023-02-05 17:02:47'),
(5, 'assets/images/product_image/61797.webp', 10, '2023-02-03 20:53:07', '2023-02-05 17:03:27'),
(6, 'assets/images/product_image/89906.webp', 11, '2023-02-03 21:00:54', '2023-02-05 17:03:43'),
(7, 'assets/images/product_image/7661.webp', 12, '2023-02-04 11:00:17', '2023-02-05 17:03:55'),
(8, 'assets/images/product_image/70778.webp', 13, '2023-02-05 13:58:48', '2023-02-05 17:04:05'),
(9, 'assets/images/product_image/48783.webp', 14, '2023-02-05 14:05:10', '2023-02-05 17:04:15'),
(10, 'assets/images/product_image/16978.PNG', 15, '2023-02-09 10:07:51', '2023-02-09 10:07:51'),
(11, 'assets/images/product_image/82567.PNG', 16, '2023-02-09 10:11:05', '2023-02-09 10:11:05'),
(12, 'assets/images/product_image/29490.PNG', 17, '2023-02-09 10:18:35', '2023-02-09 10:18:35'),
(13, 'assets/images/product_image/82539.jpg', 18, '2023-02-09 11:09:26', '2023-02-09 11:09:26'),
(14, 'assets/images/product_image/3555.PNG', 19, '2023-02-09 11:12:03', '2023-02-09 11:12:03'),
(15, 'assets/images/product_image/26280.jpg', 20, '2023-02-12 14:52:27', '2023-03-16 20:53:43'),
(16, 'assets/images/product_image/23665.jpeg', 21, '2023-02-12 14:54:36', '2023-02-12 14:54:36'),
(17, 'assets/images/product_image/57859.jpg', 23, '2023-02-12 15:05:42', '2023-03-16 20:57:32'),
(18, 'assets/images/product_image/98337.webp', 22, '2023-02-12 15:09:14', '2023-02-12 15:09:14'),
(19, 'assets/images/product_image/7309.webp', 33, '2023-02-20 08:58:24', '2023-02-20 08:58:24'),
(20, 'assets/images/product_image/73313.jpg', 34, '2023-03-16 20:06:48', '2023-03-16 20:06:48'),
(21, 'assets/images/product_image/36019.jpg', 35, '2023-03-16 20:10:14', '2023-03-16 20:10:14'),
(22, 'assets/images/product_image/48086.jpg', 36, '2023-03-16 20:13:53', '2023-03-16 20:13:53'),
(23, 'assets/images/product_image/74585.jpg', 37, '2023-03-16 20:21:07', '2023-03-16 20:21:07'),
(24, 'assets/images/product_image/52815.jpeg', 38, '2023-03-16 20:45:04', '2023-03-16 20:45:04'),
(25, 'assets/images/product_image/53350.jpg', 39, '2023-03-16 21:00:36', '2023-03-16 21:01:08'),
(26, 'assets/images/product_image/2289.jpg', 40, '2023-03-16 21:47:00', '2023-03-16 21:47:00'),
(27, 'assets/images/product_image/24204.jpg', 41, '2023-03-20 10:30:06', '2023-03-20 10:30:06'),
(28, 'assets/images/product_image/31660.jpg', 42, '2023-03-20 14:16:47', '2023-03-20 14:16:47'),
(29, 'assets/images/product_image/9650.jpg', 43, '2023-03-20 14:20:39', '2023-03-20 14:20:39'),
(30, 'assets/images/product_image/31708.jpg', 44, '2023-03-20 14:28:03', '2023-03-20 14:28:03'),
(31, 'assets/images/product_image/96753.jpg', 45, '2023-03-20 14:34:03', '2023-03-20 14:34:03'),
(32, 'assets/images/product_image/78038.jpg', 47, '2023-03-20 14:38:48', '2023-03-20 14:38:48'),
(33, 'assets/images/product_image/14145.jpg', 48, '2023-03-20 14:43:56', '2023-03-20 14:43:56'),
(34, 'assets/images/product_image/49350.jpg', 50, '2023-03-20 14:46:59', '2023-03-20 14:46:59'),
(35, 'assets/images/product_image/66204.jpg', 51, '2023-03-20 14:48:47', '2023-03-20 14:48:47'),
(36, 'assets/images/product_image/61616.jpg', 52, '2023-03-20 14:52:45', '2023-03-20 14:52:45'),
(37, 'assets/images/product_image/51733.jpg', 53, '2023-03-20 14:58:00', '2023-03-20 14:58:00'),
(38, 'assets/images/product_image/48048.jpg', 54, '2023-03-20 15:00:00', '2023-03-20 15:00:00'),
(39, 'assets/images/product_image/76495.jpg', 55, '2023-03-20 15:06:12', '2023-03-20 15:06:12'),
(40, 'assets/images/product_image/21242.jpg', 56, '2023-03-20 15:11:23', '2023-03-20 15:11:23'),
(41, 'assets/images/product_image/20909.jpg', 57, '2023-03-20 15:13:34', '2023-03-20 15:13:34'),
(42, 'assets/images/product_image/74540.jpg', 58, '2023-03-20 15:16:21', '2023-03-20 15:16:49'),
(43, 'assets/images/product_image/7479.jpg', 59, '2023-03-20 15:20:23', '2023-03-20 15:20:23'),
(44, 'assets/images/product_image/44309.jpg', 60, '2023-03-20 15:24:57', '2023-03-20 15:24:57'),
(45, 'assets/images/product_image/79549.jpg', 61, '2023-03-20 15:27:41', '2023-03-20 15:27:41'),
(46, 'assets/images/product_image/89225.jpg', 62, '2023-03-20 15:29:25', '2023-03-20 15:29:25'),
(47, 'assets/images/product_image/84066.jpg', 63, '2023-03-20 15:31:50', '2023-03-20 15:31:50'),
(48, 'assets/images/product_image/91935.jpg', 64, '2023-03-20 15:37:52', '2023-03-20 15:37:52'),
(49, 'assets/images/product_image/61012.jpg', 65, '2023-03-20 15:40:05', '2023-03-20 15:40:05'),
(50, 'assets/images/product_image/82837.jpg', 66, '2023-03-20 15:42:31', '2023-03-20 15:42:31'),
(51, 'assets/images/product_image/25188.jpg', 67, '2023-03-21 12:15:50', '2023-03-21 12:15:50'),
(52, 'assets/images/product_image/88704.jpg', 68, '2023-03-21 13:28:46', '2023-03-21 13:58:22'),
(53, 'assets/images/product_image/84950.jpg', 69, '2023-03-21 13:51:45', '2023-03-21 13:55:36'),
(54, 'assets/images/product_image/89637.jpg', 70, '2023-03-21 14:02:18', '2023-03-21 14:02:18'),
(55, 'assets/images/product_image/88233.jpg', 71, '2023-03-21 14:12:09', '2023-03-21 14:12:09'),
(56, 'assets/images/product_image/75661.jpg', 72, '2023-03-21 14:19:02', '2023-03-21 14:19:02'),
(57, 'assets/images/product_image/75738.jpg', 73, '2023-03-21 14:23:15', '2023-03-21 14:23:15'),
(58, 'assets/images/product_image/5368.jpg', 74, '2023-03-21 14:33:27', '2023-03-21 14:33:27'),
(59, 'assets/images/product_image/19788.jpg', 75, '2023-03-21 14:44:10', '2023-03-21 14:44:10'),
(60, 'assets/images/product_image/74669.jpg', 76, '2023-03-21 14:48:11', '2023-03-21 14:48:11'),
(61, 'assets/images/product_image/6247.jpg', 77, '2023-03-21 14:51:26', '2023-03-21 14:51:26'),
(62, 'assets/images/product_image/99642.jpg', 78, '2023-03-21 14:57:01', '2023-03-21 14:57:01'),
(63, 'assets/images/product_image/81429.jpg', 79, '2023-03-21 15:00:18', '2023-03-21 15:00:18'),
(64, 'assets/images/product_image/23976.jpg', 80, '2023-03-21 15:03:23', '2023-03-21 15:03:23'),
(65, 'assets/images/product_image/43288.jpg', 81, '2023-03-21 15:05:18', '2023-03-21 15:05:18'),
(66, 'assets/images/product_image/92052.jpg', 82, '2023-03-21 15:08:06', '2023-03-21 15:08:06'),
(67, 'assets/images/product_image/78170.jpg', 83, '2023-03-21 15:27:46', '2023-03-21 15:27:46'),
(68, 'assets/images/product_image/88420.jpg', 84, '2023-03-21 15:30:49', '2023-03-21 15:30:49'),
(69, 'assets/images/product_image/43221.jpg', 85, '2023-03-21 15:35:09', '2023-03-21 15:35:09'),
(70, 'assets/images/product_image/55017.jpg', 86, '2023-03-21 15:40:09', '2023-03-21 15:40:09'),
(71, 'assets/images/product_image/72633.jpg', 87, '2023-03-21 15:43:37', '2023-03-21 15:43:37'),
(72, 'assets/images/product_image/46944.jpg', 88, '2023-03-21 15:53:14', '2023-03-21 15:53:14'),
(73, 'assets/images/product_image/41975.jpg', 89, '2023-03-21 15:55:33', '2023-03-21 15:55:33'),
(74, 'assets/images/product_image/79900.jpg', 90, '2023-03-21 15:58:28', '2023-03-21 15:58:28'),
(75, 'assets/images/product_image/38366.jpg', 91, '2023-03-21 16:02:04', '2023-03-21 16:02:04'),
(76, 'assets/images/product_image/44309.jpg', 92, '2023-03-21 16:03:46', '2023-03-21 16:03:46'),
(77, 'assets/images/product_image/61368.jpg', 93, '2023-03-21 16:04:59', '2023-03-21 16:04:59'),
(78, 'assets/images/product_image/24516.jpg', 94, '2023-03-21 16:06:30', '2023-03-21 16:06:30'),
(79, 'assets/images/product_image/99385.jpg', 95, '2023-03-24 18:05:36', '2023-03-24 18:05:36'),
(80, 'assets/images/product_image/61435.jpg', 96, '2023-03-24 18:07:52', '2023-03-24 18:07:52'),
(81, 'assets/images/product_image/40029.jpg', 97, '2023-03-24 18:09:45', '2023-03-24 18:09:45'),
(82, 'assets/images/product_image/5023.jpg', 98, '2023-03-24 18:14:01', '2023-03-24 18:14:01'),
(83, 'assets/images/product_image/69061.jpg', 99, '2023-03-24 18:15:42', '2023-03-24 18:15:42'),
(84, 'assets/images/product_image/31080.jpg', 100, '2023-03-24 18:17:47', '2023-03-24 18:17:47'),
(85, 'assets/images/product_image/97112.jpg', 101, '2023-03-24 18:19:25', '2023-03-24 18:19:25'),
(86, 'assets/images/product_image/96855.jpg', 102, '2023-03-24 18:27:07', '2023-03-24 18:28:16'),
(87, 'assets/images/product_image/12588.jpeg', 103, '2023-03-24 18:30:57', '2023-03-24 18:30:57'),
(88, 'assets/images/product_image/4565.jpg', 104, '2023-03-24 18:32:18', '2023-03-24 18:32:18'),
(89, 'assets/images/product_image/24260.jpg', 105, '2023-03-24 18:35:23', '2023-03-24 18:35:23'),
(90, 'assets/images/product_image/2407.jpg', 106, '2023-03-24 18:39:38', '2023-03-24 18:39:38'),
(91, 'assets/images/product_image/70913.jpg', 107, '2023-03-24 18:50:00', '2023-03-24 18:50:00'),
(92, 'assets/images/product_image/67475.jpg', 108, '2023-03-24 18:51:28', '2023-03-24 18:51:28'),
(93, 'assets/images/product_image/53428.jpg', 109, '2023-03-24 18:52:56', '2023-03-24 18:52:56'),
(94, 'assets/images/product_image/56277.jpg', 110, '2023-03-24 18:56:59', '2023-03-24 18:56:59'),
(95, 'assets/images/product_image/57612.jpg', 111, '2023-03-24 19:00:55', '2023-03-24 19:00:55'),
(96, 'assets/images/product_image/86714.jpg', 112, '2023-03-24 19:03:34', '2023-03-24 19:03:34'),
(97, 'assets/images/product_image/26094.jpeg', 113, '2023-03-24 19:04:59', '2023-03-24 19:04:59'),
(98, 'assets/images/product_image/35820.jpg', 114, '2023-03-24 19:12:02', '2023-03-24 19:12:02'),
(99, 'assets/images/product_image/82233.jpg', 115, '2023-03-24 19:14:15', '2023-03-24 19:14:15'),
(100, 'assets/images/product_image/2197.jpg', 116, '2023-03-24 19:17:19', '2023-03-24 19:17:19'),
(101, 'assets/images/product_image/46693.jpg', 117, '2023-03-24 19:18:27', '2023-03-24 19:18:27'),
(102, 'assets/images/product_image/134.jpg', 118, '2023-03-24 19:20:58', '2023-03-24 19:20:58'),
(103, 'assets/images/product_image/44429.jpg', 119, '2023-03-24 19:31:57', '2023-03-24 19:31:57'),
(104, 'assets/images/product_image/98194.jpg', 120, '2023-03-24 19:38:03', '2023-03-24 19:38:03'),
(105, 'assets/images/product_image/29260.jpg', 121, '2023-03-24 19:41:16', '2023-03-24 19:41:16'),
(106, 'assets/images/product_image/77286.jpg', 122, '2023-03-24 19:51:15', '2023-03-24 19:51:15'),
(107, 'assets/images/product_image/79328.jpg', 123, '2023-03-24 19:54:29', '2023-03-24 19:54:29'),
(108, 'assets/images/product_image/1596.jpg', 124, '2023-03-24 19:57:01', '2023-03-24 19:57:01'),
(109, 'assets/images/product_image/99971.jpg', 125, '2023-03-24 20:02:00', '2023-03-24 20:02:00'),
(110, 'assets/images/product_image/59091.jpg', 126, '2023-03-24 20:10:00', '2023-03-24 20:11:26'),
(111, 'assets/images/product_image/32422.jpg', 127, '2023-03-24 21:05:11', '2023-03-24 21:05:11'),
(112, 'assets/images/product_image/39082.jpg', 128, '2023-03-24 21:07:03', '2023-03-24 21:07:03'),
(113, 'assets/images/product_image/5946.jpg', 129, '2023-03-24 21:08:28', '2023-03-24 21:08:28'),
(114, 'assets/images/product_image/3506.jpg', 130, '2023-03-24 21:09:32', '2023-03-24 21:09:32'),
(115, 'assets/images/product_image/61479.jpg', 131, '2023-03-24 21:11:49', '2023-03-24 21:11:49'),
(116, 'assets/images/product_image/71790.jpg', 132, '2023-03-24 21:12:54', '2023-03-24 21:12:54'),
(117, 'assets/images/product_image/21520.jpg', 133, '2023-03-24 21:20:47', '2023-03-24 21:20:47'),
(118, 'assets/images/product_image/88174.jpg', 134, '2023-03-24 21:22:20', '2023-03-24 21:22:20'),
(119, 'assets/images/product_image/83389.jpeg', 135, '2023-03-24 21:23:12', '2023-03-24 21:23:12'),
(120, 'assets/images/product_image/40155.jpeg', 136, '2023-03-24 21:24:40', '2023-03-24 21:24:40'),
(121, 'assets/images/product_image/20955.jpg', 137, '2023-03-24 21:26:16', '2023-03-24 21:26:16'),
(122, 'assets/images/product_image/66678.jpg', 138, '2023-03-25 15:47:27', '2023-03-25 15:47:27'),
(123, 'assets/images/product_image/27397.jpg', 139, '2023-03-25 15:49:36', '2023-03-25 15:49:36'),
(124, 'assets/images/product_image/16335.jpg', 140, '2023-03-25 15:52:14', '2023-03-25 15:52:14'),
(125, 'assets/images/product_image/18542.jpg', 141, '2023-03-25 15:55:14', '2023-03-25 15:55:14'),
(126, 'assets/images/product_image/95190.jpg', 142, '2023-03-25 16:07:37', '2023-03-25 16:07:37'),
(127, 'assets/images/product_image/15388.jpg', 143, '2023-03-25 16:20:53', '2023-03-25 16:20:53'),
(128, 'assets/images/product_image/54384.jpg', 144, '2023-03-25 16:23:23', '2023-03-25 16:23:23'),
(129, 'assets/images/product_image/84677.jpeg', 145, '2023-03-25 16:24:43', '2023-03-25 16:24:43'),
(130, 'assets/images/product_image/7458.jpeg', 146, '2023-03-25 16:25:56', '2023-03-25 16:25:56'),
(131, 'assets/images/product_image/69635.jpg', 147, '2023-03-25 16:33:26', '2023-03-25 16:33:26'),
(132, 'assets/images/product_image/51811.jpeg', 148, '2023-03-25 16:45:57', '2023-03-25 16:45:57'),
(133, 'assets/images/product_image/39301.jpg', 149, '2023-03-25 17:41:26', '2023-03-25 17:41:26'),
(134, 'assets/images/product_image/13472.jpg', 150, '2023-03-25 17:47:25', '2023-03-25 17:47:25'),
(135, 'assets/images/product_image/16993.jpg', 151, '2023-03-25 17:52:05', '2023-03-25 17:52:05'),
(136, 'assets/images/product_image/60085.jpg', 152, '2023-03-25 17:55:30', '2023-03-25 17:55:30'),
(137, 'assets/images/product_image/77475.jpg', 153, '2023-03-25 17:57:21', '2023-03-25 17:57:21'),
(138, 'assets/images/product_image/54688.jpg', 154, '2023-03-25 17:58:54', '2023-03-25 17:58:54'),
(139, 'assets/images/product_image/16878.jpg', 155, '2023-03-25 18:01:15', '2023-03-25 18:01:15'),
(140, 'assets/images/product_image/69727.jpg', 156, '2023-03-25 18:08:26', '2023-03-25 18:08:26'),
(141, 'assets/images/product_image/97712.jpg', 157, '2023-03-25 18:12:02', '2023-03-25 18:12:02'),
(142, 'assets/images/product_image/2385.jpg', 158, '2023-03-25 18:55:16', '2023-03-25 18:55:16'),
(143, 'assets/images/product_image/64260.jpg', 159, '2023-03-25 18:57:29', '2023-03-25 18:57:29'),
(144, 'assets/images/product_image/49443.jpg', 160, '2023-03-25 19:01:32', '2023-03-25 19:01:32'),
(145, 'assets/images/product_image/23406.jpg', 161, '2023-03-25 19:04:18', '2023-03-25 19:04:18'),
(146, 'assets/images/product_image/50914.jpg', 162, '2023-03-25 19:06:57', '2023-03-25 19:06:57'),
(147, 'assets/images/product_image/72532.jpg', 163, '2023-03-25 19:10:48', '2023-03-25 19:10:48'),
(148, 'assets/images/product_image/14205.jpg', 164, '2023-03-25 19:24:34', '2023-03-25 19:24:34'),
(149, 'assets/images/product_image/86562.jpg', 165, '2023-03-25 19:29:30', '2023-03-25 19:29:30'),
(150, 'assets/images/product_image/95438.jpg', 166, '2023-03-25 19:30:36', '2023-03-25 19:30:36'),
(151, 'assets/images/product_image/57722.jpg', 167, '2023-03-25 19:54:37', '2023-03-25 19:54:37'),
(152, 'assets/images/product_image/10996.jpg', 168, '2023-03-25 19:58:56', '2023-03-25 19:58:56'),
(153, 'assets/images/product_image/84602.jpg', 177, '2023-04-04 18:43:59', '2023-04-04 18:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_origin`
--

CREATE TABLE `product_origin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_origin`
--

INSERT INTO `product_origin` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sverige', '2023-03-15 20:28:16', '2023-03-16 20:11:44'),
(2, 'Spanien', '2023-03-16 20:11:33', '2023-03-16 20:11:33'),
(3, 'Holland', '2023-03-16 20:11:51', '2023-03-16 20:11:51'),
(5, 'Marocko', '2023-03-20 14:11:50', '2023-03-20 14:11:50'),
(6, 'Egypten', '2023-03-20 14:32:04', '2023-03-20 14:32:04'),
(7, 'Brasilien', '2023-03-20 14:41:20', '2023-03-20 14:41:20'),
(8, 'Columbia', '2023-03-20 14:50:21', '2023-03-20 14:51:00'),
(9, 'Ecuador', '2023-03-20 14:55:17', '2023-03-20 14:55:17'),
(10, 'Costa Rica', '2023-03-20 15:01:29', '2023-03-20 15:01:29'),
(11, 'Italien', '2023-03-20 15:09:37', '2023-03-20 15:09:37'),
(12, 'Polen', '2023-03-20 15:32:21', '2023-03-20 15:32:21'),
(13, 'Cypern', '2023-03-21 13:27:03', '2023-03-21 13:27:03'),
(14, 'Danmark', '2023-03-21 13:31:52', '2023-03-21 13:31:52'),
(16, 'Irland', '2023-03-21 14:38:16', '2023-03-21 14:38:16'),
(17, 'Belgien', '2023-03-21 15:32:48', '2023-03-21 15:32:48'),
(18, 'Blandat: EU och icke EU', '2023-03-21 15:56:27', '2023-03-21 15:56:27'),
(19, 'Grekland', '2023-03-24 18:25:38', '2023-03-24 18:25:38'),
(20, 'EU', '2023-03-24 18:38:27', '2023-03-24 18:38:27'),
(21, 'Tyskland', '2023-03-24 19:09:23', '2023-03-24 19:09:23'),
(22, 'Frankrike', '2023-03-24 19:15:56', '2023-03-24 19:15:56'),
(23, 'Österrike', '2023-03-25 16:27:27', '2023-03-25 16:27:27'),
(24, 'Chile', '2023-03-25 17:02:31', '2023-03-25 17:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_trademark`
--

CREATE TABLE `product_trademark` (
  `trademark_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_trademark`
--

INSERT INTO `product_trademark` (`trademark_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, NULL, '2023-03-27 20:21:25', '2023-03-27 20:21:25'),
(4, NULL, '2023-03-27 20:21:44', '2023-03-27 20:21:44'),
(4, NULL, '2023-03-27 20:36:53', '2023-03-27 20:36:53'),
(4, 173, '2023-03-27 20:45:41', '2023-03-27 20:45:41'),
(2, 177, '2023-04-04 18:43:59', '2023-04-04 18:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `review` text NOT NULL,
  `star` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

CREATE TABLE `sub` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Bread', NULL, '2023-01-19 14:39:37', '2023-02-20 07:27:58'),
(2, 'Frukt', 5, '2023-02-03 20:47:15', '2023-03-04 20:24:39'),
(3, 'Spaghetti', NULL, '2023-02-05 13:52:33', '2023-02-20 07:56:11'),
(4, 'Grönsaker', 5, '2023-02-05 14:00:18', '2023-03-04 20:29:24'),
(5, 'Wheat', NULL, '2023-02-20 07:27:34', '2023-02-20 07:27:34'),
(6, 'Potatis & Lök', 5, '2023-03-04 20:29:13', '2023-03-04 20:30:01'),
(8, 'Bär', 5, '2023-03-04 20:29:43', '2023-03-04 20:29:43'),
(9, 'Svamp', 5, '2023-03-04 20:29:58', '2023-03-04 20:29:58'),
(10, 'Mjölk', 11, '2023-03-04 20:30:21', '2023-03-04 20:30:21'),
(11, 'Ost', 11, '2023-03-04 20:30:34', '2023-03-04 20:30:34'),
(12, 'Smör & Margarin', 11, '2023-03-04 20:30:47', '2023-03-04 20:30:47'),
(13, 'Yoghurt', 11, '2023-03-04 20:31:00', '2023-03-04 20:31:00'),
(14, 'Gräddfil & Filmjölk', 11, '2023-03-04 20:31:13', '2023-03-04 20:31:13'),
(15, 'Ägg & Jäst', 11, '2023-03-04 20:31:32', '2023-03-04 20:31:32'),
(16, 'Grädde &  Creme fraiche', 11, '2023-03-04 20:31:49', '2023-03-04 20:31:49'),
(17, 'Matbröd', 12, '2023-03-04 20:32:13', '2023-03-04 20:32:13'),
(18, 'Knäckebröd', 12, '2023-03-04 20:32:26', '2023-03-04 20:32:26'),
(19, 'Kex & Kakor', 12, '2023-03-04 20:32:39', '2023-03-04 20:32:39'),
(20, 'Kort & Hamburgebröd', 11, '2023-03-04 20:32:54', '2023-03-04 20:32:54'),
(21, 'Bacon & Fläsk', 13, '2023-03-04 20:33:08', '2023-03-04 20:33:08'),
(22, 'Kött', 13, '2023-03-04 20:33:20', '2023-03-04 20:33:20'),
(23, 'Kyckling & Fågel', 13, '2023-03-04 20:33:31', '2023-03-04 20:33:31'),
(24, 'Burgare, Nuggets, Bullar', 13, '2023-03-04 20:33:45', '2023-03-04 20:33:45'),
(25, 'Korv', 13, '2023-03-04 20:34:03', '2023-03-04 20:34:03'),
(26, 'Fisk', 14, '2023-03-04 20:34:23', '2023-03-04 20:34:23'),
(28, 'Läsk', 15, '2023-03-04 20:34:56', '2023-03-04 20:34:56'),
(29, 'Te', 15, '2023-03-04 20:35:09', '2023-03-04 20:35:09'),
(30, 'Sport & Energidryck', 15, '2023-03-04 20:35:22', '2023-03-04 20:35:22'),
(31, 'Konserver & Burkar', 16, '2023-03-04 20:35:38', '2023-03-04 20:35:38'),
(32, 'Oliver & Delikatesser', 16, '2023-03-04 20:35:49', '2023-03-04 20:35:49'),
(33, 'Olja & Vinäger', 16, '2023-03-04 20:35:58', '2023-03-04 20:35:58'),
(34, 'Kryddor & Smaksättare', 16, '2023-03-04 20:36:11', '2023-03-04 20:36:11'),
(35, 'Texmex', 16, '2023-03-04 20:36:24', '2023-03-04 20:36:24'),
(36, 'Pasta, Ris & Matgryn', 16, '2023-03-04 20:36:36', '2023-03-04 20:36:36'),
(37, 'Godis', 18, '2023-03-16 20:55:07', '2023-03-16 20:55:07'),
(38, 'Choklad', 18, '2023-03-16 20:55:27', '2023-03-16 20:55:27'),
(39, 'Chips', 18, '2023-03-16 20:55:37', '2023-03-16 20:55:37'),
(40, 'Ost', NULL, '2023-03-21 14:25:28', '2023-03-21 14:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `subsubcategories`
--

CREATE TABLE `subsubcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_cat_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subsubcategories`
--

INSERT INTO `subsubcategories` (`id`, `name`, `sub_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Banan', 2, '2023-03-04 18:40:52', '2023-03-04 20:44:45'),
(6, 'Äpplen', 2, '2023-03-04 20:44:23', '2023-03-04 20:44:23'),
(7, 'Päron', 2, '2023-03-04 20:44:56', '2023-03-04 20:44:56'),
(8, 'Vindruvor', 2, '2023-03-04 20:45:07', '2023-03-04 20:45:07'),
(9, 'Citrusfrukter', 2, '2023-03-04 20:45:18', '2023-03-04 20:45:18'),
(10, 'Kiwi', 2, '2023-03-04 20:45:28', '2023-03-04 20:45:28'),
(11, 'Melon', 2, '2023-03-04 20:45:41', '2023-03-04 20:45:41'),
(12, 'Övrigt frukt', 2, '2023-03-04 20:45:57', '2023-03-04 20:45:57'),
(13, 'Gurka', 4, '2023-03-04 20:46:30', '2023-03-04 20:46:30'),
(14, 'Tomat', 4, '2023-03-04 20:46:41', '2023-03-04 20:46:41'),
(15, 'Sallad & Kål', 4, '2023-03-04 20:47:08', '2023-03-04 20:47:08'),
(16, 'Avokado', 4, '2023-03-04 20:47:27', '2023-03-04 20:47:27'),
(17, 'Aubergine', 4, '2023-03-04 20:47:40', '2023-03-04 20:47:40'),
(18, 'Majs', 4, '2023-03-04 20:47:53', '2023-03-04 20:47:53'),
(19, 'Blomkål & Broccoli', 4, '2023-03-04 20:48:11', '2023-03-04 20:48:11'),
(20, 'Bönor & Groddar', 4, '2023-03-04 20:48:37', '2023-03-04 20:48:37'),
(21, 'Paprika', 4, '2023-03-04 20:48:51', '2023-03-04 20:48:51'),
(22, 'Ärtor & Bönor', 4, '2023-03-04 20:49:03', '2023-03-04 20:49:03'),
(23, 'Övriga Grönsaker', 4, '2023-03-04 20:49:15', '2023-03-04 20:49:15'),
(24, 'Patatis', 6, '2023-03-04 20:49:51', '2023-03-04 20:49:51'),
(25, 'Lök', 6, '2023-03-04 20:50:04', '2023-03-04 20:50:04'),
(26, 'Alla färska bär', 8, '2023-03-04 20:50:25', '2023-03-04 20:50:25'),
(27, 'Alla frysta bär', 8, '2023-03-04 20:50:40', '2023-03-04 20:50:40'),
(28, 'Björnbär', 8, '2023-03-04 20:50:49', '2023-03-04 20:50:49'),
(29, 'Blåbär', 8, '2023-03-04 20:50:58', '2023-03-04 20:50:58'),
(30, 'Hallon', 8, '2023-03-04 20:51:08', '2023-03-04 20:51:08'),
(31, 'Hjorton', 8, '2023-03-04 20:51:18', '2023-03-04 20:51:18'),
(32, 'Jordgubbar', 8, '2023-03-04 20:51:32', '2023-03-04 20:51:32'),
(33, 'Körsbär', 8, '2023-03-04 20:51:42', '2023-03-04 20:51:42'),
(34, 'Lingon', 8, '2023-03-04 20:51:54', '2023-03-04 20:51:54'),
(35, 'Övriga bär', 8, '2023-03-04 20:52:05', '2023-03-04 20:52:05'),
(36, 'Champinjon', 9, '2023-03-04 20:52:20', '2023-03-04 20:52:20'),
(37, 'Kantareller', 9, '2023-03-04 20:52:34', '2023-03-04 20:52:34'),
(38, 'Karl-Johan svamp', 9, '2023-03-04 20:52:44', '2023-03-04 20:52:44'),
(39, 'Övriga svamp', 9, '2023-03-04 20:52:59', '2023-03-04 20:52:59'),
(40, 'Lättmjölk', 10, '2023-03-04 20:53:21', '2023-03-04 20:53:21'),
(41, 'Mellanmjölk', 10, '2023-03-04 20:53:31', '2023-03-04 20:53:31'),
(42, 'Standardmjölk', 10, '2023-03-04 20:53:41', '2023-03-04 20:53:41'),
(43, 'Hårdost mild/mellan', 11, '2023-03-04 20:54:02', '2023-03-04 20:54:02'),
(44, 'Hårdost lagrad', 11, '2023-03-04 20:54:12', '2023-03-04 20:54:12'),
(45, 'Mjukost', 11, '2023-03-04 20:54:20', '2023-03-04 20:54:20'),
(46, 'Riven ost', 11, '2023-03-04 20:54:30', '2023-03-04 20:54:30'),
(47, 'Skivad ost', 11, '2023-03-04 20:54:39', '2023-03-04 20:54:39'),
(48, 'Fetaost', 11, '2023-03-04 20:54:49', '2023-03-04 20:54:49'),
(49, 'Färskost', 11, '2023-03-04 20:55:01', '2023-03-04 20:55:01'),
(50, 'Mozarellaost', 11, '2023-03-04 20:55:10', '2023-03-04 20:55:10'),
(51, 'Övrriga ost', 11, '2023-03-04 20:55:19', '2023-03-04 20:55:19'),
(52, 'Bords smör/margarin', 12, '2023-03-04 20:57:00', '2023-03-04 20:57:00'),
(53, 'Matfett', 12, '2023-03-04 20:57:14', '2023-03-04 20:57:14'),
(54, 'Drickyoghurt', 13, '2023-03-04 20:57:35', '2023-03-04 20:57:35'),
(55, 'Naturell yoghurt', 13, '2023-03-04 20:57:45', '2023-03-04 20:57:45'),
(56, 'Smaksatt yoghurt', 13, '2023-03-04 20:57:54', '2023-03-04 20:57:54'),
(57, 'Matlagnings yoghurt', 13, '2023-03-04 20:58:04', '2023-03-04 20:58:04'),
(58, 'Filmjölk', 14, '2023-03-04 20:58:20', '2023-03-04 20:58:20'),
(59, 'Gräddfil', 14, '2023-03-04 20:58:30', '2023-03-04 20:58:30'),
(60, 'Ägg', 15, '2023-03-04 20:58:42', '2023-03-04 20:58:42'),
(61, 'Jäst', 15, '2023-03-04 20:58:57', '2023-03-04 20:58:57'),
(62, 'Ljust bröd', 17, '2023-03-04 20:59:29', '2023-03-04 20:59:29'),
(63, 'Mörkt & grovt bröd', 17, '2023-03-04 20:59:40', '2023-03-04 20:59:40'),
(64, 'Baguetter', 17, '2023-03-04 20:59:54', '2023-03-04 20:59:54'),
(65, 'Rostbröd', 17, '2023-03-04 21:00:07', '2023-03-04 21:00:07'),
(66, 'Tunnbröd', 17, '2023-03-04 21:00:17', '2023-03-04 21:00:17'),
(67, 'Hårt tunnbröd', 18, '2023-03-04 21:00:37', '2023-03-04 21:00:37'),
(68, 'Knäckebröd', 18, '2023-03-04 21:00:52', '2023-03-04 21:00:52'),
(69, 'Skorpor', 18, '2023-03-04 21:01:03', '2023-03-04 21:01:03'),
(70, 'Ströbröd', 18, '2023-03-04 21:01:13', '2023-03-04 21:01:13'),
(71, 'Matkex', 19, '2023-03-04 21:01:40', '2023-03-04 21:01:40'),
(72, 'Kex & Kakor', 19, '2023-03-04 21:01:50', '2023-03-04 21:01:50'),
(73, 'Bacon', 21, '2023-03-04 21:02:18', '2023-03-04 21:02:18'),
(74, 'Pancetta', 21, '2023-03-04 21:02:29', '2023-03-04 21:02:29'),
(75, 'Stekfläsk', 21, '2023-03-04 21:02:40', '2023-03-04 21:02:40'),
(76, 'Fläskkött', 22, '2023-03-04 21:03:04', '2023-03-04 21:03:04'),
(77, 'Köttfärs', 22, '2023-03-04 21:03:32', '2023-03-04 21:03:32'),
(78, 'Lamm', 22, '2023-03-04 21:03:41', '2023-03-04 21:03:41'),
(79, 'Nötkött', 22, '2023-03-04 21:03:51', '2023-03-16 20:45:35'),
(80, 'Vildkött', 22, '2023-03-04 21:04:00', '2023-03-16 20:48:21'),
(81, 'Kyckling', 23, '2023-03-04 21:05:24', '2023-03-04 21:05:24'),
(82, 'Anka', 23, '2023-03-04 21:05:45', '2023-03-04 21:05:45'),
(83, 'Kalkon', 23, '2023-03-04 21:05:54', '2023-03-04 21:05:54'),
(84, 'Kebab', 24, '2023-03-04 21:06:13', '2023-03-04 21:06:13'),
(85, 'Köttbullar', 24, '2023-03-04 21:06:31', '2023-03-04 21:06:31'),
(86, 'Hamburgare', 24, '2023-03-04 21:06:39', '2023-03-04 21:06:39'),
(87, 'Chicken Nuggets', 24, '2023-03-04 21:06:52', '2023-03-04 21:06:52'),
(88, 'Schnitzel', 24, '2023-03-04 21:07:04', '2023-03-04 21:07:04'),
(89, 'Falukorv', 25, '2023-03-04 21:07:23', '2023-03-04 21:07:23'),
(90, 'Chorizo', 25, '2023-03-04 21:07:34', '2023-03-04 21:07:34'),
(91, 'Grillkorv', 25, '2023-03-04 21:07:44', '2023-03-04 21:07:44'),
(92, 'Lammkorv', 36, '2023-03-04 21:07:55', '2023-03-04 21:07:55'),
(93, 'Övriga korv', 25, '2023-03-04 21:08:06', '2023-03-04 21:08:06'),
(94, 'Kyld fisk', 26, '2023-03-04 21:08:33', '2023-03-04 21:08:33'),
(95, 'Frys fisk', 26, '2023-03-04 21:08:43', '2023-03-04 21:08:43'),
(96, 'Rökt & gravat', 26, '2023-03-04 21:08:53', '2023-03-04 21:08:53'),
(97, 'Kylda skaldjur', NULL, '2023-03-04 21:09:03', '2023-03-04 21:09:03'),
(98, 'Frysta skaldjur', 26, '2023-03-04 21:09:13', '2023-03-04 21:09:13'),
(99, 'Liten läsk', 28, '2023-03-04 21:10:02', '2023-03-04 21:10:02'),
(100, 'Stor läsk', 28, '2023-03-04 21:10:11', '2023-03-04 21:10:11'),
(101, 'Te i påse', 29, '2023-03-04 21:10:26', '2023-03-04 21:10:26'),
(102, 'Te lösvikt', 29, '2023-03-04 21:10:35', '2023-03-04 21:10:35'),
(103, 'Energidryck', 30, '2023-03-04 21:12:04', '2023-03-04 21:12:04'),
(104, 'Sportdryck', 30, '2023-03-04 21:12:14', '2023-03-04 21:12:14'),
(105, 'Vitamindryck', 30, '2023-03-04 21:12:23', '2023-03-04 21:12:23'),
(106, 'Bönor & baljväxter', 31, '2023-03-04 21:12:40', '2023-03-04 21:12:40'),
(107, 'Fruktkonserver', 31, '2023-03-04 21:12:50', '2023-03-04 21:12:50'),
(108, 'Grönsakskonserver', 31, '2023-03-04 21:12:59', '2023-03-04 21:12:59'),
(109, 'Inlagda grönsaker', 31, '2023-03-04 21:13:07', '2023-03-04 21:13:07'),
(110, 'Tomatkonserver', 31, '2023-03-04 21:13:16', '2023-03-04 21:13:16'),
(111, 'Köttkonserver', 31, '2023-03-04 21:13:24', '2023-03-04 21:13:24'),
(112, 'Fisk-& skaldjurskonserver', 31, '2023-03-04 21:13:33', '2023-03-04 21:13:33'),
(113, 'Oliver', 32, '2023-03-04 21:13:49', '2023-03-04 21:13:49'),
(114, 'Delikatesser', 32, '2023-03-04 21:14:02', '2023-03-04 21:14:02'),
(115, 'Olivolja', 33, '2023-03-04 21:14:28', '2023-03-04 21:14:28'),
(116, 'Rapsolja', 33, '2023-03-04 21:14:36', '2023-03-04 21:14:36'),
(117, 'Övriga oljor', 33, '2023-03-04 21:14:45', '2023-03-04 21:14:45'),
(118, 'Vinäger & matlagningsvin', 33, '2023-03-04 21:14:54', '2023-03-04 21:14:54'),
(119, 'Ättika', 33, '2023-03-04 21:15:05', '2023-03-04 21:15:05'),
(120, 'Salt', 34, '2023-03-04 21:15:21', '2023-03-04 21:15:21'),
(121, 'Kryddor', 34, '2023-03-04 21:15:32', '2023-03-04 21:15:32'),
(122, 'Buljong', 34, '2023-03-04 21:15:40', '2023-03-04 21:15:40'),
(123, 'Fond', 34, '2023-03-04 21:15:49', '2023-03-04 21:15:49'),
(124, 'Ketchup & chilisås', 34, '2023-03-04 21:16:00', '2023-03-04 21:16:00'),
(125, 'Senap', 34, '2023-03-04 21:16:12', '2023-03-04 21:16:12'),
(126, 'Soja', 34, '2023-03-04 21:16:22', '2023-03-04 21:16:22'),
(127, 'Sås, dressing & majonnäs', 34, '2023-03-04 21:16:31', '2023-03-04 21:16:42'),
(128, 'Matmix', 34, '2023-03-04 21:16:51', '2023-03-04 21:16:51'),
(129, 'Marinader & Grill', 34, '2023-03-04 21:17:00', '2023-03-04 21:17:00'),
(130, 'Grillolja', 34, '2023-03-04 21:17:10', '2023-03-04 21:17:10'),
(131, 'Övriga smaksättare', 34, '2023-03-04 21:17:20', '2023-03-04 21:17:20'),
(132, 'Kryddmix', 35, '2023-03-04 21:17:36', '2023-03-04 21:17:36'),
(133, 'Bröd, chips & skal', 35, '2023-03-04 21:17:46', '2023-03-04 21:17:46'),
(134, 'Såser & tillbehör', 35, '2023-03-04 21:17:54', '2023-03-04 21:17:54'),
(135, 'Pasta', 36, '2023-03-04 21:18:03', '2023-03-04 21:18:03'),
(136, 'Färsk pasta', 36, '2023-03-04 21:18:10', '2023-03-04 21:18:10'),
(137, 'Ris', 36, '2023-03-04 21:18:17', '2023-03-04 21:18:17'),
(138, 'Couscous & bulgur', 36, '2023-03-04 21:18:24', '2023-03-04 21:18:24'),
(139, 'Övriga matgryn', 36, '2023-03-04 21:18:32', '2023-03-04 21:18:32'),
(140, 'Mospulver', 36, '2023-03-04 21:18:38', '2023-03-04 21:18:38'),
(141, 'Rotfrukter', 4, '2023-03-16 20:02:54', '2023-03-16 20:02:54'),
(142, 'Potatischips', 39, '2023-03-16 20:56:51', '2023-03-16 20:56:51'),
(143, 'Läsk multipack', 28, '2023-03-16 21:01:54', '2023-03-16 21:01:54'),
(144, 'Citrusfrukter', 2, '2023-03-20 10:23:27', '2023-03-20 10:23:27'),
(145, 'Hårdost /Prästost/Prästost Mellan', 11, '2023-03-21 14:15:49', '2023-03-21 14:15:49'),
(146, 'Hårdost/Goudaost', 11, '2023-03-21 14:20:46', '2023-03-21 14:20:46'),
(147, 'Hårdost /Herrgårdsost', 11, '2023-03-21 14:23:52', '2023-03-21 14:26:25'),
(149, 'Hårdost', 40, '2023-03-21 14:39:11', '2023-03-21 14:39:11'),
(150, 'Hårdost/Cheddarost', 40, '2023-03-21 14:54:17', '2023-03-21 14:54:17'),
(151, 'Avokado', 2, '2023-03-25 17:02:01', '2023-03-25 17:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'tag', '2023-01-18 19:05:16', '2023-01-18 19:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `trademark`
--

CREATE TABLE `trademark` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trademark`
--

INSERT INTO `trademark` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Test', '2023-03-15 18:23:38', '2023-03-15 18:23:38'),
(4, 'taetta', '2023-03-16 14:56:58', '2023-03-16 14:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `l_name` varchar(191) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `role` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=admin\r\n1=user',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `l_name`, `email`, `image`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `phone`, `address`, `date_of_birth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INDXR', 'Admin', 'deviktech0@gmail.com', 'app-assets/images/profile/user-uploads/1655040488.jpeg', '0', '1', NULL, '$2y$10$iVG9lOJdaVkE4IJ96Vdvl.xUNhppZxxUwXef.F0alVYlKGRu78AN2', 'dZUQIeSEugUOXwjtvqU4Ner59JdBwCGJIYfBNBlQJGOxTsQo0m3ghAZrxgux', NULL, NULL, '0000-00-00', '2022-06-11 04:21:01', '2022-07-30 06:31:44', NULL),
(2, 'Khalil Urrehman', 'Urrehman', 'urrehman48@gmail.com', NULL, '1', '0', NULL, '$2y$10$iVG9lOJdaVkE4IJ96Vdvl.xUNhppZxxUwXef.F0alVYlKGRu78AN2', NULL, NULL, NULL, '0000-00-00', '2022-07-22 00:16:14', '2022-07-22 00:16:14', NULL),
(21, 'dev', 'sed', 'urrehman488@gmail.com', NULL, '1', '1', NULL, '$2y$10$3neY8ZIASnUHqivGa1LEKetCMw63ZQ4LoCuKp2zQvZwc6CEvVIGFW', NULL, NULL, NULL, '0000-00-00', '2023-02-04 01:36:31', '2023-02-04 01:36:31', NULL),
(22, 'Software Byte', 'Byte', 'softwarebyte@gmail.com', NULL, '0', '1', NULL, '$2y$10$FLKnKdAYYOl8GnXn5F1uv.QgAsGkvjsYF6N/ZNMPDEJ7fw7DKDzTq', NULL, NULL, NULL, '0000-00-00', '2023-03-03 19:02:46', '2023-03-04 17:08:28', NULL),
(24, 'Afham', 'Ahmed', 'afham123@gmail.com', NULL, '1', '1', NULL, '$2y$10$5yHYpRY0EhnGd4oybTXXg.2kzYRKUI1SBSQNQKG9W6dclcen0ZzfK', NULL, NULL, NULL, '0000-00-00', '2023-03-05 15:47:09', '2023-03-05 15:47:09', NULL),
(25, 'Rouzbeh', 'Nikberg', 'r.nikberg@gmail.com', NULL, '1', '1', NULL, '$2y$10$39ZSUCl0x8Otug7dtp5wKupxt.Rg11wvBfMQAA8e9yJkG6f2CPIAC', NULL, NULL, NULL, '0000-00-00', '2023-03-09 20:13:29', '2023-03-09 20:13:29', NULL),
(26, 'test', 'test', 'test@gmail.com', NULL, '1', '1', NULL, '$2y$10$F.OZBJKA3V8xaKNetG4.q.CS70N47I583jnyWMZD0OY4.RbK6Xd4u', NULL, NULL, NULL, NULL, '2023-03-14 21:12:04', '2023-03-14 21:12:04', NULL),
(27, 'Muhammad', 'Azeem', 'muhammad.azeemshahid01@gmail.com', NULL, '1', '1', NULL, '$2y$10$NtX1r21QhArmYVuJA1qPfee5EKLvSnZ1UHd0ZmuKJfNJrSCf1pMHu', NULL, NULL, NULL, NULL, '2023-03-14 21:13:09', '2023-03-14 21:13:09', NULL),
(28, 'Hassaan Jamali', 'Jamali', 'hassoo28@gmail.com', NULL, '1', '1', NULL, '$2y$10$BduMKq8yKLf.jebwsq0oOuqQ5YuhlDdBM.27.qQCrrglqf9FeRP36', NULL, NULL, NULL, NULL, '2023-03-20 10:55:00', '2023-03-20 10:55:00', NULL),
(29, 'ABC', 'XYZ', 'muhammad.hassaan.azhar@gmail.com', NULL, '1', '1', NULL, '$2y$10$bnV/OAZYl6nHMTnXLyLUMuJWPFf/lFUQ1lenOadEeESYErY9UohcC', NULL, NULL, NULL, NULL, '2023-04-03 20:23:39', '2023-04-03 20:23:39', NULL),
(30, 'Afham', 'Ahmed', 'afham12ahmed@gmail.com', NULL, '1', '1', NULL, '$2y$10$3O5qbijhiWGjQlhYXdja4eOqAallkxFgltdQCHjoqi2u20AIcvQ86', NULL, NULL, NULL, NULL, '2023-04-04 17:28:28', '2023-04-04 17:28:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_delivery`
--

CREATE TABLE `user_delivery` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_delivery`
--

INSERT INTO `user_delivery` (`id`, `user_id`, `delivery_address_id`, `created_at`, `updated_at`) VALUES
(1, 24, NULL, '2023-03-10 19:54:22', '2023-03-10 19:54:22'),
(2, 26, NULL, '2023-03-14 21:58:35', '2023-03-14 21:58:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_user_fk` (`user_id`),
  ADD KEY `coupon_coupon_fk` (`coupon_id`);

--
-- Indexes for table `customer_messages`
--
ALTER TABLE `customer_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_times`
--
ALTER TABLE `delivery_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_time_postcode`
--
ALTER TABLE `delivery_time_postcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diet`
--
ALTER TABLE `diet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disabled_delivery_time`
--
ALTER TABLE `disabled_delivery_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_delivery_time_fk` (`delivery_time_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourite_product_fk` (`product_id`),
  ADD KEY `user_favourite_fk` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_fk` (`user_id`),
  ADD KEY `order_delivery_fk` (`delivery_address_id`),
  ADD KEY `order_time_fk` (`delivery_time_id`);

--
-- Indexes for table `order_delivery_time`
--
ALTER TABLE `order_delivery_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_time_order_fk` (`order_id`),
  ADD KEY `order_delivery_time_fk` (`delivery_time_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_fk` (`product_id`),
  ADD KEY `order_details_fk` (`order_id`);

--
-- Indexes for table `order_lists`
--
ALTER TABLE `order_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `postcodes`
--
ALTER TABLE `postcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_cat_fk` (`category_id`),
  ADD KEY `prod_sub_cat_fk` (`sub_cat_id`),
  ADD KEY `product_sub_sub_fk` (`subsub_cat_id`),
  ADD KEY `product_tag_fk` (`tag_id`),
  ADD KEY `product_origin_fk` (`origin_id`);

--
-- Indexes for table `product_diet`
--
ALTER TABLE `product_diet`
  ADD KEY `pivot_diet_fk` (`diet_id`),
  ADD KEY `pivot_product_fk` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_origin`
--
ALTER TABLE `product_origin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_trademark`
--
ALTER TABLE `product_trademark`
  ADD KEY `pivot_trademark_fk` (`trademark_id`),
  ADD KEY `pivot_product_trade_fk` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub`
--
ALTER TABLE `sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory_fk` (`category_id`);

--
-- Indexes for table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagories_sub_fk` (`sub_cat_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trademark`
--
ALTER TABLE `trademark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_delivery`
--
ALTER TABLE `user_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_add_fk` (`user_id`),
  ADD KEY `user_delivery_add_fk` (`delivery_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `coupon_users`
--
ALTER TABLE `coupon_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_messages`
--
ALTER TABLE `customer_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `delivery_times`
--
ALTER TABLE `delivery_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `delivery_time_postcode`
--
ALTER TABLE `delivery_time_postcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diet`
--
ALTER TABLE `diet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `disabled_delivery_time`
--
ALTER TABLE `disabled_delivery_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_delivery_time`
--
ALTER TABLE `order_delivery_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `order_lists`
--
ALTER TABLE `order_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `postcodes`
--
ALTER TABLE `postcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `product_origin`
--
ALTER TABLE `product_origin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trademark`
--
ALTER TABLE `trademark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_delivery`
--
ALTER TABLE `user_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD CONSTRAINT `coupon_coupon_fk` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `coupon_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `disabled_delivery_time`
--
ALTER TABLE `disabled_delivery_time`
  ADD CONSTRAINT `disabled_delivery_time_fk` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_address` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourite_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_favourite_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_delivery_fk` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_address` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_time_fk` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_times` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_delivery_time`
--
ALTER TABLE `order_delivery_time`
  ADD CONSTRAINT `delivery_time_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_delivery_time_fk` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_times` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `prod_cat_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `prod_sub_cat_fk` FOREIGN KEY (`sub_cat_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_origin_fk` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_sub_sub_fk` FOREIGN KEY (`subsub_cat_id`) REFERENCES `subsubcategories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_diet`
--
ALTER TABLE `product_diet`
  ADD CONSTRAINT `pivot_diet_fk` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pivot_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_trademark`
--
ALTER TABLE `product_trademark`
  ADD CONSTRAINT `pivot_product_trade_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pivot_trademark_fk` FOREIGN KEY (`trademark_id`) REFERENCES `trademark` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `catagory_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `subsubcategories`
--
ALTER TABLE `subsubcategories`
  ADD CONSTRAINT `catagories_sub_fk` FOREIGN KEY (`sub_cat_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_delivery`
--
ALTER TABLE `user_delivery`
  ADD CONSTRAINT `user_add_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_delivery_add_fk` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_address` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
