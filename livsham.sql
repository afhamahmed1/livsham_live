-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2023 at 11:44 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livsham`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(23, 1, 10, 4, '2023-02-12 16:14:58', '2023-02-13 15:46:50'),
(22, 2, 13, 1, '2023-02-12 16:14:09', '2023-02-12 16:14:09'),
(21, 1, 3, 3, '2023-02-12 12:34:52', '2023-02-13 15:47:31'),
(26, 1, 17, 1, '2023-02-13 15:47:13', '2023-02-13 15:47:13'),
(27, 1, 21, 2, '2023-02-13 16:00:42', '2023-02-13 16:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Wheat', '2023-01-18 17:31:59', '2023-02-04 13:30:32'),
(3, 'Fruits', '2023-01-19 14:32:30', '2023-01-19 14:32:30'),
(4, 'vegetables', '2023-01-19 14:32:39', '2023-01-19 14:32:39'),
(5, 'Fruit & Vegetables', '2023-02-03 20:46:54', '2023-02-03 20:46:54'),
(6, 'Milk', '2023-02-04 13:29:53', '2023-02-04 13:29:53'),
(7, 'Bread', '2023-02-04 13:30:18', '2023-02-04 13:30:18'),
(8, 'Pasta & Pasta Sauce', '2023-02-05 13:52:01', '2023-02-05 13:52:01'),
(9, 'Tortilla', '2023-02-05 13:59:59', '2023-02-05 13:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `start_date`, `end_date`, `type`, `code`, `created_at`, `updated_at`) VALUES
(3, 'Fruits', '2023-01-11', '2023-01-21', 'Free shipping', 'fXr8khty', '2023-01-20 15:00:31', '2023-01-20 15:00:31'),
(4, 'apple', '2023-01-04', '2023-01-14', 'others', 'rpyg6DWG', '2023-01-20 15:01:00', '2023-01-20 15:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(191) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 'Pending', 1, '2023-02-03 06:28:39', '2023-02-03 06:28:39'),
(10, 'Pending', 2, '2023-02-03 21:15:54', '2023-02-03 21:15:54'),
(12, 'Completed', 2, '2023-02-03 21:50:38', '2023-02-03 21:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_lists`
--

DROP TABLE IF EXISTS `order_lists`;
CREATE TABLE IF NOT EXISTS `order_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `qty` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_lists`
--

INSERT INTO `order_lists` (`id`, `product_id`, `order_id`, `qty`, `created_at`, `updated_at`) VALUES
(6, 1, 10, 1, '2023-02-03 21:15:54', '2023-02-03 21:15:54'),
(7, 3, 10, 1, '2023-02-03 21:15:54', '2023-02-03 21:15:54'),
(3, 1, 9, 1, '2023-02-03 06:28:39', '2023-02-03 06:28:39'),
(4, 3, 9, 1, '2023-02-03 06:28:39', '2023-02-03 06:28:39'),
(5, 9, 9, 1, '2023-02-03 06:28:39', '2023-02-03 06:28:39'),
(8, 9, 12, 2, '2023-02-03 21:50:38', '2023-02-03 21:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `category_id` int NOT NULL,
  `tag_id` int DEFAULT NULL,
  `product_information` text,
  `origin` varchar(191) DEFAULT NULL,
  `ingredients` varchar(191) DEFAULT NULL,
  `nutritional_content` text,
  `storage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `other_information` text,
  `price` varchar(15) NOT NULL,
  `price_per_item` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `compare_price` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `weight` varchar(191) NOT NULL,
  `items_status` varchar(191) NOT NULL,
  `discount_price` int DEFAULT NULL,
  `sub_cat_id` int NOT NULL,
  `subsub_cat_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `tag_id`, `product_information`, `origin`, `ingredients`, `nutritional_content`, `storage`, `other_information`, `price`, `price_per_item`, `compare_price`, `status`, `weight`, `items_status`, `discount_price`, `sub_cat_id`, `subsub_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Minced meat - Beef', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Note, changes in the products\' content may occur.&nbsp;Therefore, always check the product information on the packaging.&nbsp;For questions about the contents of non-prepackaged food, contact Customer Service.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '118', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g:</p><p>Energy 750 kJ/180 kcal</p><p>Fat 11 g</p><p>- of which saturated fat 5 g</p><p>Carbohydrate 0 g</p><p>- of which sugars 0 g</p><p>Protein 20 g</p><p>Salt 0.2 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '4°C.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>You prepare ground beef sauces, Biff à la Lindström and lasagne.&nbsp;Not to mention hamburgers of all kinds.&nbsp;For meatballs, mince steaks and meatloaf, finely ground mince is best.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '72', '15:10/lit', '118:-50/kg', 'In Stock', '750l', 'Popular', NULL, 5, 0, '2023-01-18 19:14:57', '2023-02-12 15:28:24'),
(3, 'Fruits', 3, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsdsdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'sdds', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '2:02/lit', '23:-20/kg', 'Out Of Stock', '220g', 'Popular', 10, 0, 0, '2023-01-20 10:07:30', '2023-02-10 10:25:25'),
(9, 'dev', 3, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dfddsf</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'sdds', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsfds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>fdgfds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '5:01/kg', '12:10/kg', 'In Stock', '10g', 'Popular', 0, 0, 0, '2023-02-03 04:04:12', '2023-02-10 10:26:32'),
(10, 'Avocado Class1', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Avocado</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy 3700 kJ/900 kcal Fat 100 g - Of which saturated fat 7 g - Of which monounsaturated fat 63 g - Of which polyunsaturated fat 30 g Carbohydrate 0 g -of which sugars 0 g Protein 0 g Salt 0 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'If the avocado feels soft, it is ready to eat. If the avocado is hard, it should be left at room temperature to ripen. In the refrigerator, the ripening process is somewhat slowed down. Store the avocado in the fridge where it is least cold.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/g', '138:46/kg', 'In Stock', '165g', 'Weekly', 0, 0, 0, '2023-02-03 20:53:07', '2023-02-10 10:26:46'),
(11, 'Apple Granny Smith Class1', 3, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Granny Smith is a green apple with white, firm flesh and a clear sour taste.&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'France', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>The product is packed manually and the weight may vary slightly. We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '7', '3:/kg', '44:30/kg', 'In Stock', '158g', 'Popular', 0, 0, 0, '2023-02-03 21:00:54', '2023-02-12 14:50:30'),
(12, 'Fruits', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'France', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'If the avocado feels soft, it is ready to eat. If the avocado is hard, it should be left at room temperature to ripen. In the refrigerator, the ripening process is somewhat slowed down. Store the avocado in the fridge where it is least cold.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '10:08/kg', '44:30/kg', 'Out Of Stock', '750g', 'Popular', 0, 0, 0, '2023-02-04 11:00:17', '2023-02-10 10:27:24'),
(13, 'Spaghetti 1.8 kg', 8, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Pasta Spaghetti in bulk from Barilla is Italy’s most classic type of pasta in a package of 1.8 kilos. Spaghetti pasta originates from Naples where Antonio Vivani in 1842 named it Spaghetti because he thought it looked like little strings. This is a long pasta which was originally even longer before it was shortened from the original 50 centimeters to today’s more practical 25 centimeters. Barilla’s Spaghetti n.5 is a durum wheat pasta that, with its traditional character, is a must in the kitchen.&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Italy', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy 1521 kJ/359 kcal Fat 2 g - Of which saturated fat 0.5 g Carbohydrate 70.9 g - Of which sugars 3.5 g Fiber 3 g Protein 12.8 g Salt 0.013 g&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '35', '25:/kg', '19:97 SEK/kg', 'In Stock', '1.8 Kg', 'Weekly', 30, 0, 0, '2023-02-05 13:58:48', '2023-02-10 10:27:59'),
(14, 'Tortilla Medium 8-p', 1, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>A soft wheat taco bread suitable for all kinds of Tex Mex and wraps. Hot or cold it doesn’t matter, it always tastes good! One package contains 8 tortillas.</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Sweden', NULL, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>Per 100 g: Energy (kJ)/(kcal): 1252 / 296 Fat: 5.2 g Of which saturated fat: 1.1 g Carbohydrate: 53.6 g Of which sugars: 1.7 g Fiber: 2.4 g Protein: 7.6 g Salt: 1.56 g</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>We at Livshem do our best to always provide correct product information. Changes to the product’s content may occur. Therefore, always check the product information on the packaging. What is written on the packaging always applies&nbsp;</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '19', '10:78/kg', '62:34/kg', 'In Stock', '320 g', 'Popular', 10, 0, 0, '2023-02-05 14:03:09', '2023-02-10 10:28:20'),
(15, 'VeteMoji', 1, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdfdsf dsfdfdsf fsf</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dfsdfds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'If the avocado feels soft, it is ready to eat. If the avocado is hard, it should be left at room temperature to ripen. In the refrigerator, the ripening process is somewhat slowed down. Store the avocado in the fridge where it is least cold.', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsfdsf</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '5:01/kg', '62:34/kg', 'In Stock', '750g', 'Popular', 50, 0, 0, '2023-02-09 10:07:51', '2023-02-10 10:28:33'),
(16, 'Mild', 7, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Italy', 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '3:/kg', '44:30/kg', 'In Stock', '750l', 'Popular', 10, 0, 0, '2023-02-09 10:11:05', '2023-02-10 10:28:46'),
(17, 'Ketchup', 8, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'France', 'fdfd', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/lit', '19:97 SEK/kg', 'In Stock', '165g', 'Weekly', 40, 0, 0, '2023-02-09 10:14:01', '2023-02-10 10:28:58'),
(18, 'Biscuit', 1, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'dsd', 'sd', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dssdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '2:02/g', '19:97 SEK/kg', 'In Stock', '158g', 'Weekly', 25, 0, 0, '2023-02-09 11:09:26', '2023-02-10 10:29:11'),
(19, 'ketchepp', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>asdfsad asdfadsf afad</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'asdvasdvsa as', 'asdfasdf adfasdf', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>asdfasdv </p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '112', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sadfsadf</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '10', '', '12', 'In Stock', '30', 'Weekly', 8, 0, 0, '2023-02-09 11:12:03', '2023-02-09 11:12:03'),
(20, 'Mango', 3, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>ssa</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Sweden', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'sasa', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '2:02/kg', '62:34/kg', 'In Stock', '5kg', 'Popular', 25, 0, 0, '2023-02-12 14:52:27', '2023-02-12 14:52:27'),
(21, 'Guave', 3, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Sweden', 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '12', '5:01/kg', '19:97 SEK/kg', 'In Stock', '5kg', 'Popular', 10, 0, 0, '2023-02-12 14:54:36', '2023-02-12 14:54:36'),
(22, 'Watermelon', 3, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', '15:10/kg', '44:30/kg', 'In Stock', '750g', 'Popular', 10, 0, 0, '2023-02-12 14:57:53', '2023-02-12 14:59:08'),
(23, 'Chips', 7, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsdsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Italy', 'dsds', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsdsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '3:/kg', '62:34/kg', 'In Stock', '7500g', 'Popular', 25, 0, 0, '2023-02-12 15:05:42', '2023-02-12 15:05:42'),
(24, 'Product', 3, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'dsd', 'dsds', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '5:01/kg', '62:34/kg', 'In Stock', '750g', 'Popular', NULL, 0, 0, '2023-02-12 15:30:05', '2023-02-12 15:32:25'),
(25, 'Product1', 3, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'sdds', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', '2:02/lit', '138:46', 'In Stock', '750l', 'Popular', NULL, 0, 0, '2023-02-12 15:31:48', '2023-02-12 15:32:37'),
(26, 'Product3', 4, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'France', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '5:01/kg', '62:34/kg', 'In Stock', '220g', 'Popular', NULL, 0, 0, '2023-02-12 15:33:47', '2023-02-12 15:33:47'),
(27, 'Fruits', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'dsd', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', '5:01/kg', '62:34/kg', 'In Stock', '5kg', 'Popular', NULL, 0, 0, '2023-02-12 15:34:24', '2023-02-12 15:34:24'),
(28, 'Product3', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', '2:02/lit', '138:46', 'In Stock', '158g', 'Popular', NULL, 0, 0, '2023-02-12 15:35:31', '2023-02-12 15:35:31'),
(29, 'Product4', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'France', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '23', NULL, '44:30/kg', 'In Stock', '158g', 'Popular', NULL, 0, 0, '2023-02-12 15:36:18', '2023-02-12 15:36:18'),
(30, 'Product5', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'If the avocado feels soft, it is ready to eat. If the avocado is hard, it should be left at room temperature to ripen. In the refrigerator, the ripening process is somewhat slowed down. Store the avocado in the fridge where it is least cold.', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '10', NULL, '23', 'In Stock', '220g', 'Popular', NULL, 0, 0, '2023-02-12 15:37:09', '2023-02-12 15:37:09'),
(31, 'Product6', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'dsd', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '5:01/kg', '19:97 SEK/kg', 'In Stock', '165g', 'Popular', NULL, 0, 0, '2023-02-12 15:37:40', '2023-02-12 15:37:40'),
(32, 'apple', 1, 2, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Peru', NULL, '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store at a minimum of 5°C to a maximum of 25°C', '<div class=\"ql-editor ql-blank\" data-gramm=\"false\" contenteditable=\"true\"><p><br></p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '100', NULL, '62:34/kg', 'In Stock', '158g', 'Popular', NULL, 0, 0, '2023-02-12 15:38:11', '2023-02-12 15:38:11'),
(33, 'Avacado', 5, 2, '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>dsds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Sweden', 'dsd', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sds</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', 'Store dry and cool', '<div class=\"ql-editor\" data-gramm=\"false\" contenteditable=\"true\"><p>sdsd</p></div><div class=\"ql-clipboard\" contenteditable=\"true\" tabindex=\"-1\"></div><div class=\"ql-tooltip ql-hidden\"><a class=\"ql-preview\" target=\"_blank\" href=\"about:blank\"></a><input type=\"text\" data-formula=\"e=mc^2\" data-link=\"https://quilljs.com\" data-video=\"Embed URL\"><a class=\"ql-action\"></a><a class=\"ql-remove\"></a></div>', '45', '15:10/kg', '62:34/kg', 'In Stock', '165g', 'Weekly', 25, 2, 2, '2023-02-20 08:58:24', '2023-02-20 08:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(191) NOT NULL,
  `product_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(15, 'assets/images/product_image/18236.jpg', 20, '2023-02-12 14:52:27', '2023-02-12 14:52:27'),
(16, 'assets/images/product_image/23665.jpeg', 21, '2023-02-12 14:54:36', '2023-02-12 14:54:36'),
(17, 'assets/images/product_image/30679.jpg', 23, '2023-02-12 15:05:42', '2023-02-12 15:05:42'),
(18, 'assets/images/product_image/98337.webp', 22, '2023-02-12 15:09:14', '2023-02-12 15:09:14'),
(19, 'assets/images/product_image/7309.webp', 33, '2023-02-20 08:58:24', '2023-02-20 08:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review` text NOT NULL,
  `star` float NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

DROP TABLE IF EXISTS `sub`;
CREATE TABLE IF NOT EXISTS `sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `category_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `category_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Bread', 1, '2023-01-19 14:39:37', '2023-02-20 07:27:58'),
(2, 'Fruits', 5, '2023-02-03 20:47:15', '2023-02-03 20:47:15'),
(3, 'Spaghetti', 4, '2023-02-05 13:52:33', '2023-02-20 07:56:11'),
(4, 'Tortilla Wrap', 5, '2023-02-05 14:00:18', '2023-02-20 07:55:36'),
(5, 'Wheat', 8, '2023-02-20 07:27:34', '2023-02-20 07:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `subsubcategories`
--

DROP TABLE IF EXISTS `subsubcategories`;
CREATE TABLE IF NOT EXISTS `subsubcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `sub_cat_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subsubcategories`
--

INSERT INTO `subsubcategories` (`id`, `name`, `sub_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Vegii', 5, '2023-02-15 09:34:11', '2023-02-20 08:03:13'),
(2, 'Avacado', 4, '2023-02-15 09:34:25', '2023-02-20 07:57:10'),
(3, 'apple', 2, '2023-02-20 10:11:35', '2023-02-20 10:11:35');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'tag', '2023-01-18 19:05:16', '2023-01-18 19:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=admin\r\n1=user',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `l_name`, `email`, `image`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INDXR', 'Admin', 'deviktech0@gmail.com', 'app-assets/images/profile/user-uploads/1655040488.jpeg', '0', '1', NULL, '$2y$10$iVG9lOJdaVkE4IJ96Vdvl.xUNhppZxxUwXef.F0alVYlKGRu78AN2', 'ZFejNjYwj2AtP0R7M0IecDTgB9TRvYbncWZUPQunZ8QJIqfR4N748FLhe1VO', NULL, NULL, '2022-06-11 04:21:01', '2022-07-30 06:31:44', NULL),
(2, 'Khalil Urrehman', 'Urrehman', 'urrehman48@gmail.com', NULL, '1', '0', NULL, '$2y$10$iVG9lOJdaVkE4IJ96Vdvl.xUNhppZxxUwXef.F0alVYlKGRu78AN2', NULL, NULL, NULL, '2022-07-22 00:16:14', '2022-07-22 00:16:14', NULL),
(21, 'dev', 'sed', 'urrehman488@gmail.com', NULL, '1', '1', NULL, '$2y$10$3neY8ZIASnUHqivGa1LEKetCMw63ZQ4LoCuKp2zQvZwc6CEvVIGFW', NULL, NULL, NULL, '2023-02-04 01:36:31', '2023-02-04 01:36:31', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
