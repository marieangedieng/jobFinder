-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table job_portal.abouts
DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.abouts: ~0 rows (approximately)
DELETE FROM `abouts`;
INSERT INTO `abouts` (`id`, `image`, `title`, `description`, `url`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c5fe2f94c7b.png', 'What we can do?', '<p>Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio.</p><p>Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio.</p><p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.</p><p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.</p>', 'https://websolutionus.com/', '2024-02-09 04:27:59', '2024-02-09 04:27:59');

-- Dumping structure for table job_portal.admins
DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/default-uploads/avatar.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.admins: ~0 rows (approximately)
DELETE FROM `admins`;
INSERT INTO `admins` (`id`, `name`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', '/default-uploads/avatar.png', 'superadmin@gmail.com', NULL, '$2y$12$yTFAlZ44OAYp0pzTjDNtR.6Bgj6cWqsBBs6khEUaDCngZ3OXgnobu', NULL, '2024-02-07 22:29:28', '2024-02-07 22:29:28');

-- Dumping structure for table job_portal.admin_menus
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.admin_menus: ~5 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Navigation Menu', NULL, NULL),
	(3, 'Footer Menu One', '2024-01-31 20:35:53', '2024-01-31 20:35:53'),
	(4, 'Footer Menu Two', '2024-01-31 20:36:11', '2024-01-31 20:36:11'),
	(5, 'Footer Menu Three', '2024-01-31 20:36:25', '2024-01-31 20:36:25'),
	(6, 'Footer Menu Four', '2024-01-31 20:36:38', '2024-01-31 20:36:38');

-- Dumping structure for table job_portal.admin_menu_items
DROP TABLE IF EXISTS `admin_menu_items`;
CREATE TABLE IF NOT EXISTS `admin_menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `depth` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `admin_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.admin_menu_items: ~26 rows (approximately)
DELETE FROM `admin_menu_items`;
INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent_id`, `sort`, `class`, `menu_id`, `depth`, `created_at`, `updated_at`) VALUES
	(1, 'Home', '/', 0, 0, NULL, 1, 0, '2024-02-09 04:05:52', '2024-02-09 04:06:08'),
	(2, 'Find a Job', '/jobs', 0, 1, NULL, 1, 0, '2024-02-09 04:06:08', '2024-02-09 04:06:21'),
	(3, 'Recrutires', '/companies', 0, 2, NULL, 1, 0, '2024-02-09 04:06:20', '2024-02-09 04:06:30'),
	(4, 'Candidates', '/candidates', 0, 3, NULL, 1, 0, '2024-02-09 04:06:30', '2024-02-09 04:07:17'),
	(5, 'Pricings', '/pricing', 0, 4, NULL, 1, 0, '2024-02-09 04:07:17', '2024-02-09 04:07:35'),
	(6, 'Pages', '#', 0, 5, NULL, 1, 0, '2024-02-09 04:07:35', '2024-02-09 04:08:07'),
	(7, 'About us', '/about-us', 6, 6, NULL, 1, 1, '2024-02-09 04:08:07', '2024-02-09 04:08:20'),
	(8, 'Contact', '/contact', 6, 7, NULL, 1, 1, '2024-02-09 04:08:17', '2024-02-09 04:08:30'),
	(9, 'Blogs', '/blogs', 6, 9, NULL, 1, 0, '2024-02-09 04:08:30', '2024-02-09 04:31:53'),
	(10, 'About Us', '/', 0, 0, NULL, 3, 0, '2024-02-09 04:12:25', '2024-02-09 04:12:35'),
	(11, 'Our Team', '/', 0, 1, NULL, 3, 0, '2024-02-09 04:12:34', '2024-02-09 04:12:41'),
	(12, 'Products', '/', 0, 2, NULL, 3, 0, '2024-02-09 04:12:41', '2024-02-09 04:12:47'),
	(13, 'Contact', '/', 0, 4, NULL, 3, 0, '2024-02-09 04:12:47', '2024-02-09 04:12:47'),
	(14, 'Feature', '/', 0, 0, NULL, 4, 0, '2024-02-09 04:13:04', '2024-02-09 04:13:19'),
	(15, 'Priceing', '/', 0, 1, NULL, 4, 0, '2024-02-09 04:13:19', '2024-02-09 04:13:25'),
	(16, 'Credit', '/', 0, 2, NULL, 4, 0, '2024-02-09 04:13:25', '2024-02-09 04:13:33'),
	(17, 'FAQ', '/', 0, 4, NULL, 4, 0, '2024-02-09 04:13:33', '2024-02-09 04:13:33'),
	(18, 'IOS', '#', 0, 0, NULL, 5, 0, '2024-02-09 04:13:50', '2024-02-09 04:13:57'),
	(19, 'Android', '#', 0, 1, NULL, 5, 0, '2024-02-09 04:13:57', '2024-02-09 04:14:06'),
	(20, 'Microsoft', '#', 0, 2, NULL, 5, 0, '2024-02-09 04:14:05', '2024-02-09 04:14:12'),
	(21, 'Desktop', '#', 0, 3, NULL, 5, 0, '2024-02-09 04:14:12', '2024-02-09 04:14:33'),
	(26, 'Privacy', '#', 0, 0, NULL, 6, 0, '2024-02-09 04:25:16', '2024-02-09 04:25:23'),
	(27, 'Help', '#', 0, 1, NULL, 6, 0, '2024-02-09 04:25:23', '2024-02-09 04:25:28'),
	(28, 'Terms', '#', 0, 2, NULL, 6, 0, '2024-02-09 04:25:28', '2024-02-09 04:25:34'),
	(29, 'FAQ', '#', 0, 4, NULL, 6, 0, '2024-02-09 04:25:34', '2024-02-09 04:25:34'),
	(30, 'Custom Page', '/page/custom-page', 0, 8, NULL, 1, 1, '2024-02-09 04:31:48', '2024-02-09 04:32:01');

-- Dumping structure for table job_portal.applied_jobs
DROP TABLE IF EXISTS `applied_jobs`;
CREATE TABLE IF NOT EXISTS `applied_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.applied_jobs: ~0 rows (approximately)
DELETE FROM `applied_jobs`;

-- Dumping structure for table job_portal.benefits
DROP TABLE IF EXISTS `benefits`;
CREATE TABLE IF NOT EXISTS `benefits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.benefits: ~131 rows (approximately)
DELETE FROM `benefits`;
INSERT INTO `benefits` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
	(3, 1, 'free coffee', '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(4, 2, 'free coffee', '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(5, 2, ' free tea', '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(6, 2, ' free break fast', '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(7, 2, ' on time salary', '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(12, 2, 'free coffee', '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(13, 2, ' free tea', '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(14, 2, ' free break fast', '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(15, 2, ' on time salary', '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(16, 2, 'free coffee', '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(17, 2, ' free tea', '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(18, 2, ' free break fast', '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(19, 2, ' on time salary', '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(20, 2, 'free coffee', '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(21, 2, ' free tea', '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(22, 2, ' free break fast', '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(23, 2, ' on time salary', '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(24, 2, 'free coffee', '2024-02-08 23:02:33', '2024-02-08 23:02:33'),
	(25, 2, ' free tea', '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(26, 2, ' free break fast', '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(27, 2, ' on time salary', '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(52, 3, 'free coffee', '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(53, 3, ' free tea', '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(54, 3, ' free break fast', '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(55, 3, ' on time salary', '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(56, 3, 'free coffee', '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(57, 3, ' free tea', '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(58, 3, ' free break fast', '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(59, 3, ' on time salary', '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(60, 3, 'free coffee', '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(61, 3, ' free tea', '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(62, 3, ' free break fast', '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(63, 3, ' on time salary', '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(64, 3, 'free coffee', '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(65, 3, ' free tea', '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(66, 3, ' free break fast', '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(67, 3, ' on time salary', '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(68, 3, 'free coffee', '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(69, 3, ' free tea', '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(70, 3, ' free break fast', '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(71, 3, ' on time salary', '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(72, 3, 'free coffee', '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(73, 3, ' free tea', '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(74, 3, ' free break fast', '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(75, 3, ' on time salary', '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(76, 3, 'free coffee', '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(77, 3, ' free tea', '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(78, 3, ' free break fast', '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(79, 3, ' on time salary', '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(80, 3, 'free coffee', '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(81, 3, ' free tea', '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(82, 3, ' free break fast', '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(83, 3, ' on time salary', '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(84, 9, 'free coffee', '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(85, 9, ' free tea', '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(86, 9, ' free break fast', '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(87, 9, ' on time salary', '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(88, 12, 'free coffee', '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(89, 12, ' free tea', '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(90, 12, ' free break fast', '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(91, 12, ' on time salary', '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(92, 14, 'free coffee', '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(93, 14, ' free tea', '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(94, 14, ' free break fast', '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(95, 14, ' on time salary', '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(96, 6, 'free coffee', '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(97, 6, ' free tea', '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(98, 6, ' free break fast', '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(99, 6, ' on time salary', '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(100, 11, 'free coffee', '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(101, 11, ' free tea', '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(102, 11, ' free break fast', '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(103, 11, ' on time salary', '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(104, 13, 'free coffee', '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(105, 13, ' free tea', '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(106, 13, ' free break fast', '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(107, 13, ' on time salary', '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(108, 10, 'free coffee', '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(109, 10, ' free tea', '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(110, 10, ' free break fast', '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(111, 10, ' on time salary', '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(112, 11, 'free coffee', '2024-02-09 03:00:47', '2024-02-09 03:00:47'),
	(113, 11, ' free tea', '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(114, 11, ' free break fast', '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(115, 11, ' on time salary', '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(116, 14, 'free coffee', '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(117, 14, ' free tea', '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(118, 14, ' free break fast', '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(119, 14, ' on time salary', '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(120, 6, 'free coffee', '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(121, 6, ' free tea', '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(122, 6, ' free break fast', '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(123, 6, ' on time salary', '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(124, 7, 'free coffee', '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(125, 7, ' free tea', '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(126, 7, ' free break fast', '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(127, 7, ' on time salary', '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(128, 15, 'free coffee', '2024-02-09 03:05:44', '2024-02-09 03:05:44'),
	(129, 15, ' free tea', '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(130, 15, ' free break fast', '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(131, 15, ' on time salary', '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(132, 2, 'free coffee', '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(133, 2, ' free tea', '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(138, 13, 'free coffee', '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(139, 13, ' free tea', '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(140, 13, ' free break fast', '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(141, 13, ' on time salary', '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(142, 8, 'free coffee', '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(143, 8, ' free tea', '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(144, 8, ' free break fast', '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(145, 8, ' on time salary', '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(146, 4, 'free coffee', '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(147, 4, ' free tea', '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(148, 4, ' free break fast', '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(149, 4, ' on time salary', '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(150, 5, 'free coffee', '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(151, 5, ' free tea', '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(152, 5, ' free break fast', '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(153, 5, ' on time salary', '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(154, 7, 'free coffee', '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(155, 7, ' free tea', '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(156, 7, ' free break fast', '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(157, 7, ' on time salary', '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(158, 13, 'free coffee', '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(159, 13, ' free tea', '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(160, 13, ' free break fast', '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(161, 13, ' on time salary', '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(162, 15, 'free coffee', '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(163, 15, ' free tea', '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(164, 15, ' free break fast', '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(165, 15, ' on time salary', '2024-02-09 03:09:12', '2024-02-09 03:09:12');

-- Dumping structure for table job_portal.blogs
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_author_id_foreign` (`author_id`),
  CONSTRAINT `blogs_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.blogs: ~3 rows (approximately)
DELETE FROM `blogs`;
INSERT INTO `blogs` (`id`, `image`, `title`, `slug`, `author_id`, `description`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c5f83eb3f75.jpg', 'Can Artificial Intelligence Write a Hit Song', 'can-artificial-intelligence-write-a-hit-song', 1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare pellentesque sollicitudin. Suspendisse potenti. Fusce ex risus, iaculis sit amet sapien nec, finibus malesuada mi. Proin at turpis eget sapien pulvinar luctus. Vestibulum bibendum pharetra lorem eu aliquam. In feugiat placerat risus, sed rutrum neque mattis sit amet. Nullam vestibulum ante ac quam tempor, id venenatis velit eleifend. Duis id iaculis risus, quis ullamcorper augue. Nunc tristique venenatis ipsum at euismod. Pellentesque id arcu est.</p><h4><strong>In ut odio libero</strong></h4><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills </li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><p>&nbsp;</p><p>Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus, eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor justo sodales. Quisque tincidunt laoreet malesuada. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ante enim. Fusce sed elit est. Suspendisse sit amet mauris in quam pretium faucibus et aliquam odio.</p>', 1, 1, '2024-02-09 04:02:38', '2024-02-09 04:02:38'),
	(2, '/uploads/media_65c5f85605a6d.jpg', 'Time Travel for Tourists: What Would You See in Different Eras', 'time-travel-for-tourists-what-would-you-see-in-different-eras', 1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare pellentesque sollicitudin. Suspendisse potenti. Fusce ex risus, iaculis sit amet sapien nec, finibus malesuada mi. Proin at turpis eget sapien pulvinar luctus. Vestibulum bibendum pharetra lorem eu aliquam. In feugiat placerat risus, sed rutrum neque mattis sit amet. Nullam vestibulum ante ac quam tempor, id venenatis velit eleifend. Duis id iaculis risus, quis ullamcorper augue. Nunc tristique venenatis ipsum at euismod. Pellentesque id arcu est.</p><h4><strong>In ut odio libero</strong></h4><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills </li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><p>&nbsp;</p><p>Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus, eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor justo sodales. Quisque tincidunt laoreet malesuada. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ante enim. Fusce sed elit est. Suspendisse sit amet mauris in quam pretium faucibus et aliquam odio.</p>', 1, 1, '2024-02-09 04:03:02', '2024-02-09 04:03:02'),
	(3, '/uploads/media_65c5f87127f42.jpg', 'The Art of Folding Laundry: Mastering the Perfect Zen Fold', 'the-art-of-folding-laundry-mastering-the-perfect-zen-fold', 1, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare pellentesque sollicitudin. Suspendisse potenti. Fusce ex risus, iaculis sit amet sapien nec, finibus malesuada mi. Proin at turpis eget sapien pulvinar luctus. Vestibulum bibendum pharetra lorem eu aliquam. In feugiat placerat risus, sed rutrum neque mattis sit amet. Nullam vestibulum ante ac quam tempor, id venenatis velit eleifend. Duis id iaculis risus, quis ullamcorper augue. Nunc tristique venenatis ipsum at euismod. Pellentesque id arcu est.</p><h4><strong>In ut odio libero</strong></h4><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills </li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><p>&nbsp;</p><p>Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus, eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor justo sodales. Quisque tincidunt laoreet malesuada. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ante enim. Fusce sed elit est. Suspendisse sit amet mauris in quam pretium faucibus et aliquam odio.</p>', 1, 1, '2024-02-09 04:03:29', '2024-02-09 04:03:29');

-- Dumping structure for table job_portal.candidates
DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `experience_id` bigint unsigned DEFAULT NULL,
  `profession_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci,
  `phone_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `marital_status` enum('married','single') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` bigint unsigned DEFAULT NULL,
  `state` bigint unsigned DEFAULT NULL,
  `country` bigint unsigned DEFAULT NULL,
  `status` enum('available','not_available') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidates_user_id_foreign` (`user_id`),
  CONSTRAINT `candidates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.candidates: ~11 rows (approximately)
DELETE FROM `candidates`;
INSERT INTO `candidates` (`id`, `user_id`, `experience_id`, `profession_id`, `title`, `image`, `full_name`, `slug`, `gender`, `website`, `phone_one`, `phone_two`, `email`, `cv`, `bio`, `marital_status`, `birth_date`, `address`, `city`, `state`, `country`, `status`, `profile_complete`, `visibility`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 2, 'Developer', '/uploads/media_65c47b16cbe0c.png', 'Jhon Deo', 'jhon-deo', 'male', 'https://www.demo.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'jhon@gmail.com', '/uploads/media_65c47b77a1320.pdf', '<h4>About Me</h4><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!<br>&nbsp;</p><h4>Work Experience</h4><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h4>Education</h4><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '1990-02-13', NULL, 1, 5233, 260, 'available', 1, 1, '2024-02-08 00:56:22', '2024-02-08 01:03:51'),
	(2, 2, 3, 2, 'Senior Software Engineer', '/uploads/media_65c47ef1332b7.png', 'Ol Thompson', 'olivia-thompson', 'male', 'https://www.demo.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'demo@gmail.com', '/uploads/media_65c47ef133786.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'married', '2024-02-19', NULL, 5, 5234, 260, 'available', 1, 1, '2024-02-08 01:12:49', '2024-02-08 01:18:49'),
	(3, 3, 4, 1, 'Software Engineer', '/uploads/media_65c480c1aa765.png', 'James Ward', 'james-ward', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'user@gmail.com', '/uploads/media_65c480c1aac6d.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-12', NULL, 9, 5235, 260, 'available', 1, 1, '2024-02-08 01:20:33', '2024-02-08 01:23:26'),
	(4, 4, 4, 8, 'Content Writer', '/uploads/media_65c4837f15524.png', 'Noah Turner', 'noah-turner', 'female', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'demo@gmail.com', '/uploads/media_65c4837f159e5.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-20', '4408 Norma Lane Shreveport, LA 71101', 3, 5233, 260, 'not_available', 1, 1, '2024-02-08 01:32:15', '2024-02-08 01:42:55'),
	(5, 5, 5, 1, 'IT Support Specialist', '/uploads/media_65c4865b46509.png', 'Evelyn Diaz', 'evelyn-diaz', 'male', 'https://www.google.com', '+1 (106) 882-8138', '+1 (135) 935-2729', 'user@gmail.com', '/uploads/media_65c4865b469f1.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-19', '4408 Norma Lane Shreveport, LA 71101', 8, 5235, 260, 'available', 1, 1, '2024-02-08 01:44:27', '2024-02-08 01:46:56'),
	(6, 6, 3, 9, 'Product Designer', '/uploads/media_65c488803f5d9.png', 'William Phillips', 'william-phillips', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'user@gmail.com', '/uploads/media_65c488803fbb1.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-05', '3166 Chestnut Street Winter Haven', 5, 5234, 260, 'available', 1, 1, '2024-02-08 01:53:36', '2024-02-08 03:10:52'),
	(7, 7, 4, 16, 'Product Designer', '/uploads/media_65c49b8eb5cb1.png', 'Logan Adams', 'logan-adams', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'user@gmail.com', '/uploads/media_65c49b8eb636c.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-12', '4408 Norma Lane Shreveport, LA 71101', 1, 5233, 260, 'available', 1, 1, '2024-02-08 03:14:54', '2024-02-08 03:17:56'),
	(8, 8, 4, 11, 'Data Scientist', '/uploads/media_65c49d1fbff76.png', 'Mia Stewart', 'mia-stewart', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'demo@gmail.com', '/uploads/media_65c49d1fc049b.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-11', '4408 Norma Lane Shreveport', 9, 5235, 260, 'available', 1, 1, '2024-02-08 03:21:35', '2024-02-08 03:23:49'),
	(9, 9, 4, 3, 'Product Designer', '/uploads/media_65c49df3a6026.png', 'Elijah Cooper', 'elijah-cooper', 'female', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'user@gmail.com', '/uploads/media_65c49dfc324a8.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-21', '4408 Norma Lane Shreveport, LA 71101', 2, 5233, 260, 'not_available', 1, 1, '2024-02-08 03:25:07', '2024-02-08 03:26:04'),
	(10, 10, 6, 3, 'Data Scientist', '/uploads/media_65c49fa2e0ea2.png', 'Mason Rivera', 'mason-rivera', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'superadmin@gmail.com', '/uploads/media_65c49fa2e1338.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-19', NULL, 4, 5234, 260, 'available', 1, 1, '2024-02-08 03:32:18', '2024-02-08 03:34:04'),
	(11, 11, 4, 1, 'Project Manager', '/uploads/media_65c4a15d6efdd.png', 'Harper Hill', 'harper-hill', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'superadmin@gmail.com', '/uploads/media_65c4a16548252.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-22', '4408 Norma Lane Shreveport, LA 71101', 5, 5234, 260, 'available', 1, 1, '2024-02-08 03:39:41', '2024-02-08 03:42:15'),
	(12, 12, 4, 2, 'Customer Success', '/uploads/media_65c4a34b686e4.png', 'Liam Ramirez', 'liam-ramirez', 'male', 'https://www.google.com', '+1 (135) 935-2729', '+1 (135) 935-2729', 'superadmin@gmail.com', '/uploads/media_65c4a34b68c3c.pdf', '<h3>About Me</h3><p>Hello there! My name is Alan Walker. I am a graphic designer, and I’m very passionate and dedicated to my work. With 20 years experience as a professional a graphic designer, I have acquired the skills and knowledge necessary to make your project a success.</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p><h3>Work Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Education</h3><ul><li>Necessitatibus quibusdam facilis</li><li>Velit unde aliquam et voluptas reiciendis non sapiente labore</li><li>Commodi quae ipsum quas est itaque</li><li>Lorem ipsum dolor sit amet, consectetur adipisicing elit</li><li>Deleniti asperiores blanditiis nihil quia officiis dolor</li></ul>', 'single', '2024-02-19', '4408 Norma Lane Shreveport, LA 71101', 7, 5235, 260, 'available', 1, 1, '2024-02-08 03:47:55', '2024-02-08 03:50:58');

-- Dumping structure for table job_portal.candidate_education
DROP TABLE IF EXISTS `candidate_education`;
CREATE TABLE IF NOT EXISTS `candidate_education` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_education_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_education_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.candidate_education: ~21 rows (approximately)
DELETE FROM `candidate_education`;
INSERT INTO `candidate_education` (`id`, `candidate_id`, `level`, `degree`, `year`, `note`, `created_at`, `updated_at`) VALUES
	(1, 1, 'BSC', 'BSC / Graduation', '2020', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical', '2024-02-08 01:03:15', '2024-02-08 01:03:15'),
	(2, 2, 'SSC', 'SSC / Secondary', '2023', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:17:25', '2024-02-08 01:17:25'),
	(3, 2, 'BSC', 'BSC / Graduation', '2025', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:17:35', '2024-02-08 01:17:35'),
	(4, 3, 'SSC', 'SSC / Secondary', '2023', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:22:38', '2024-02-08 01:22:38'),
	(5, 3, 'BSC', 'BSC / Graduation', '2024', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:22:52', '2024-02-08 01:22:52'),
	(6, 4, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:42:12', '2024-02-08 01:42:12'),
	(7, 4, 'BSC', 'BSC / Graduation', '2029', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:42:24', '2024-02-08 01:42:24'),
	(8, 5, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:46:22', '2024-02-08 01:46:22'),
	(9, 5, 'BSC', 'BSC / Graduation', '2404', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 01:46:32', '2024-02-08 01:46:32'),
	(10, 6, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:10:00', '2024-02-08 03:10:00'),
	(11, 6, 'BSC', 'BSC / Graduation', '2023', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:10:11', '2024-02-08 03:10:11'),
	(12, 7, 'SSC', 'SSC / Secondary', '2023', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:17:19', '2024-02-08 03:17:19'),
	(13, 7, 'BSC', 'BSC / Graduation', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:17:35', '2024-02-08 03:17:35'),
	(14, 8, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:23:15', '2024-02-08 03:23:15'),
	(15, 8, 'BSC', 'BSC / Graduation', '2027', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:23:26', '2024-02-08 03:23:26'),
	(16, 10, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:33:42', '2024-02-08 03:33:42'),
	(17, 10, 'BSC', 'BSC / Graduation', '2020', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:33:51', '2024-02-08 03:33:51'),
	(18, 11, 'BSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:41:48', '2024-02-08 03:41:48'),
	(19, 11, 'SSC', 'SSC / Secondary', '2027', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:41:59', '2024-02-08 03:41:59'),
	(20, 12, 'SSC', 'SSC / Secondary', '2028', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:49:14', '2024-02-08 03:49:14'),
	(21, 12, 'BSC', 'BSC / Graduation', '2024', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', '2024-02-08 03:49:23', '2024-02-08 03:49:23');

-- Dumping structure for table job_portal.candidate_experiences
DROP TABLE IF EXISTS `candidate_experiences`;
CREATE TABLE IF NOT EXISTS `candidate_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `responsibilities` text COLLATE utf8mb4_unicode_ci,
  `currently_working` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_experiences_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_experiences_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.candidate_experiences: ~26 rows (approximately)
DELETE FROM `candidate_experiences`;
INSERT INTO `candidate_experiences` (`id`, `candidate_id`, `company`, `department`, `designation`, `start`, `end`, `responsibilities`, `currently_working`, `created_at`, `updated_at`) VALUES
	(1, 1, 'InnovateEdge Solutions', 'Developer', 'Senior Developer', '2024-02-21', '2024-02-24', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:02:14', '2024-02-08 01:02:14'),
	(2, 1, 'ApexTech Innovations', 'Developer', 'Senior Developer', '2024-02-04', '2024-02-13', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 01:02:53', '2024-02-08 01:02:53'),
	(3, 2, 'EliteEdge Ventures', 'Developer', 'Senior Developer', '2024-02-13', '2024-02-13', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:15:26', '2024-02-08 01:16:59'),
	(4, 2, 'DynamicPulse Enterprises', 'UI Designer', 'CEO', '2024-02-11', '2024-02-26', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:15:47', '2024-02-08 01:17:03'),
	(5, 3, 'Skyline Solutions Inc', 'Developer', 'CEO', '2024-02-12', '2024-02-12', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:21:31', '2024-02-08 01:21:31'),
	(6, 3, 'CoreNexa Technologies', 'Developer', 'Senior Developer', '2024-02-19', '2024-02-28', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:21:55', '2024-02-08 01:21:55'),
	(7, 3, 'NovaGen Corporation', 'Developer', 'Senior Developer', '2024-02-14', '2024-02-14', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 01:22:20', '2024-02-08 01:22:20'),
	(13, 4, 'ProximaTech Solutions', 'Developer', 'Intern', '2024-02-20', '2024-02-19', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:41:34', '2024-02-08 01:41:34'),
	(14, 4, 'VisionQuest Corporation', 'Developer', 'Senior Developer', '2024-02-29', '2024-02-26', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 01:41:58', '2024-02-08 01:41:58'),
	(15, 5, 'ApexTech Innovations', 'Developer', 'Armand Flores', '2024-02-19', '2024-02-29', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:45:17', '2024-02-08 01:45:17'),
	(16, 5, 'GOOGLE', 'Developer', 'Intern', '2024-02-23', '2024-02-26', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 01:45:32', '2024-02-08 01:45:32'),
	(17, 5, 'CoreNexa Technologies', 'Developer', 'Senior Developer', '2024-02-19', '2024-02-29', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 01:45:48', '2024-02-08 01:45:57'),
	(18, 6, 'VitalLink Ventures', 'Developer', 'CEO', '2024-02-13', '2024-02-21', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 03:09:08', '2024-02-08 03:09:08'),
	(19, 6, 'CoreNexa Technologies', 'Developer', 'Intern', '2024-02-28', '2024-02-19', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:09:27', '2024-02-08 03:09:37'),
	(20, 7, 'ZenithWave Innovations', 'Developer', 'Intern', '2024-02-12', '2024-02-15', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:16:25', '2024-02-08 03:16:25'),
	(21, 7, 'CoreNexa Technologies', 'Developer', 'Intern', '2024-02-21', '2024-02-24', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:16:47', '2024-02-08 03:16:47'),
	(22, 7, 'EliteEdge Ventures', 'Developer', 'Intern', '2024-02-19', '2024-02-20', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:17:06', '2024-02-08 03:17:06'),
	(23, 8, 'CoreNexa Technologies', 'Developer', 'Intern', '2024-02-19', '2024-02-20', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:22:43', '2024-02-08 03:22:43'),
	(24, 8, 'Austin Terry Trading 2', 'UI Designer', 'Senior Developer', '2024-02-21', '2024-02-23', NULL, 1, '2024-02-08 03:22:57', '2024-02-08 03:22:57'),
	(25, 10, 'CoreNexa Technologies', 'Developer', 'CEO', '2024-02-19', '2024-02-22', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:33:12', '2024-02-08 03:33:12'),
	(26, 10, 'ApexTech Innovations', 'Developer', 'Senior Developer', '2024-02-21', '2024-03-02', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 03:33:31', '2024-02-08 03:33:31'),
	(27, 11, 'CoreNexa Technologies', 'Developer', 'CEO', '2024-02-20', '2024-02-27', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:40:48', '2024-02-08 03:40:48'),
	(28, 11, 'ApexTech Innovations', 'UI Designer', 'Intern', '2024-02-28', '2024-02-11', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:41:39', '2024-02-08 03:41:39'),
	(29, 12, 'CoreNexa Technologies', 'Developer', 'CEO', '2024-02-20', '2024-02-21', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:48:41', '2024-02-08 03:48:41'),
	(30, 12, 'ApexTech Innovations', 'Developer', 'Intern', '2024-02-21', '2024-03-08', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 0, '2024-02-08 03:48:53', '2024-02-08 03:48:53'),
	(31, 12, 'DynamicPulse Enterprises', 'UI Designer', 'CEO', '2024-02-21', '2024-03-25', 'Embracing responsibility means continuously learning, adapting, and advocating for ethical practices to build a more inclusive and sustainable digital world.', 1, '2024-02-08 03:49:05', '2024-02-08 03:49:05');

-- Dumping structure for table job_portal.candidate_languages
DROP TABLE IF EXISTS `candidate_languages`;
CREATE TABLE IF NOT EXISTS `candidate_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `language_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_languages_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_languages_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.candidate_languages: ~34 rows (approximately)
DELETE FROM `candidate_languages`;
INSERT INTO `candidate_languages` (`id`, `candidate_id`, `language_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(2, 1, 2, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(3, 1, 3, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(4, 2, 1, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(5, 2, 4, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(9, 3, 1, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(10, 3, 3, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(11, 3, 4, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(12, 4, 1, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(13, 4, 5, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(14, 5, 1, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(15, 5, 2, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(16, 5, 3, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(17, 6, 1, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(18, 6, 2, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(19, 6, 3, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(20, 7, 1, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(21, 7, 2, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(22, 7, 4, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(23, 8, 1, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(24, 8, 2, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(25, 8, 3, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(26, 9, 1, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(27, 9, 2, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(28, 9, 3, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(29, 10, 1, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(30, 10, 2, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(31, 10, 3, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(32, 11, 1, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(33, 11, 2, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(34, 11, 3, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(35, 11, 5, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(36, 12, 1, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(37, 12, 2, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(38, 12, 3, '2024-02-08 03:48:22', '2024-02-08 03:48:22');

-- Dumping structure for table job_portal.candidate_skills
DROP TABLE IF EXISTS `candidate_skills`;
CREATE TABLE IF NOT EXISTS `candidate_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint unsigned NOT NULL,
  `skill_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_skills_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_skills_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.candidate_skills: ~59 rows (approximately)
DELETE FROM `candidate_skills`;
INSERT INTO `candidate_skills` (`id`, `candidate_id`, `skill_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(2, 1, 4, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(3, 1, 9, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(4, 1, 12, '2024-02-08 00:59:07', '2024-02-08 00:59:07'),
	(5, 2, 2, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(6, 2, 3, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(7, 2, 4, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(8, 2, 5, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(9, 2, 9, '2024-02-08 01:14:26', '2024-02-08 01:14:26'),
	(14, 3, 1, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(15, 3, 2, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(16, 3, 4, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(17, 3, 6, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(18, 3, 8, '2024-02-08 01:24:32', '2024-02-08 01:24:32'),
	(19, 4, 1, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(20, 4, 2, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(21, 4, 3, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(22, 4, 4, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(23, 4, 5, '2024-02-08 01:32:54', '2024-02-08 01:32:54'),
	(24, 5, 1, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(25, 5, 2, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(26, 5, 3, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(27, 5, 4, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(28, 5, 5, '2024-02-08 01:44:57', '2024-02-08 01:44:57'),
	(29, 6, 1, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(30, 6, 2, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(31, 6, 3, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(32, 6, 4, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(33, 6, 5, '2024-02-08 01:54:36', '2024-02-08 01:54:36'),
	(34, 7, 1, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(35, 7, 2, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(36, 7, 3, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(37, 7, 4, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(38, 7, 5, '2024-02-08 03:15:53', '2024-02-08 03:15:53'),
	(39, 8, 1, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(40, 8, 2, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(41, 8, 3, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(42, 8, 4, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(43, 8, 5, '2024-02-08 03:22:25', '2024-02-08 03:22:25'),
	(44, 9, 1, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(45, 9, 2, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(46, 9, 3, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(47, 9, 4, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(48, 9, 5, '2024-02-08 03:25:45', '2024-02-08 03:25:45'),
	(49, 10, 1, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(50, 10, 2, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(51, 10, 3, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(52, 10, 4, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(53, 10, 5, '2024-02-08 03:32:50', '2024-02-08 03:32:50'),
	(54, 11, 1, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(55, 11, 2, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(56, 11, 3, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(57, 11, 4, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(58, 11, 5, '2024-02-08 03:40:18', '2024-02-08 03:40:18'),
	(59, 12, 1, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(60, 12, 2, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(61, 12, 3, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(62, 12, 4, '2024-02-08 03:48:22', '2024-02-08 03:48:22'),
	(63, 12, 5, '2024-02-08 03:48:22', '2024-02-08 03:48:22');

-- Dumping structure for table job_portal.cities
DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint unsigned NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.cities: ~8 rows (approximately)
DELETE FROM `cities`;
INSERT INTO `cities` (`id`, `name`, `state_id`, `country_id`, `created_at`, `updated_at`) VALUES
	(1, 'Los Angeles', 5233, 260, '2024-02-08 00:50:52', '2024-02-08 00:50:52'),
	(2, 'San Francisco', 5233, 260, '2024-02-08 00:51:03', '2024-02-08 00:51:03'),
	(3, 'San Diego', 5233, 260, '2024-02-08 00:51:13', '2024-02-08 00:51:13'),
	(4, 'Houston', 5234, 260, '2024-02-08 00:51:30', '2024-02-08 00:51:30'),
	(5, 'Dallas', 5234, 260, '2024-02-08 00:51:40', '2024-02-08 00:51:40'),
	(6, 'Austin', 5234, 260, '2024-02-08 00:51:49', '2024-02-08 00:51:49'),
	(7, 'New York City', 5235, 260, '2024-02-08 00:52:18', '2024-02-08 00:52:18'),
	(8, 'Buffalo', 5235, 260, '2024-02-08 00:52:29', '2024-02-08 00:52:29'),
	(9, 'Albany', 5235, 260, '2024-02-08 00:52:41', '2024-02-08 00:52:41');

-- Dumping structure for table job_portal.companies
DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry_type_id` bigint unsigned DEFAULT NULL,
  `organization_type_id` bigint unsigned DEFAULT NULL,
  `team_size_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `vision` text COLLATE utf8mb4_unicode_ci,
  `total_views` int NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` bigint unsigned DEFAULT NULL,
  `state` bigint unsigned DEFAULT NULL,
  `country` bigint unsigned DEFAULT NULL,
  `map_link` text COLLATE utf8mb4_unicode_ci,
  `is_profile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `document_verified_at` timestamp NULL DEFAULT NULL,
  `profile_completion` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_user_id_foreign` (`user_id`),
  CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.companies: ~13 rows (approximately)
DELETE FROM `companies`;
INSERT INTO `companies` (`id`, `user_id`, `name`, `slug`, `industry_type_id`, `organization_type_id`, `team_size_id`, `logo`, `banner`, `establishment_date`, `website`, `phone`, `email`, `bio`, `vision`, `total_views`, `address`, `city`, `state`, `country`, `map_link`, `is_profile_verified`, `document_verified_at`, `profile_completion`, `visibility`, `created_at`, `updated_at`) VALUES
	(1, 22, 'Skyline Solutions Inc', 'skyline-solutions-inc', 1, 1, 4, '/uploads/media_65c4b478746ea.png', '/uploads/media_65c4b47874ff4.jpg', '2024-02-05', 'https://www.google.com', '+1 (135) 935-2729', 'superadmin@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', NULL, 5233, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:01:12', '2024-02-08 05:03:20'),
	(2, 23, 'HorizonWave', 'horizonwave-enterprises', 2, 3, 4, '/uploads/media_65c4b5b730a2c.png', '/uploads/media_65c4b5b731169.jpg', '2024-02-19', 'https://www.google.com', '+1 (135) 935-2729', 'superadmin@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', 5, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:06:31', '2024-02-08 05:07:02'),
	(3, 24, 'VitalLink Ventures', 'vitallink-ventures', 3, 4, 5, '/uploads/media_65c4b65e691ac.png', '/uploads/media_65c4b65e6a6ad.jpg', '2024-02-13', 'https://www.google.com', '+1 (135) 935-2729', 'superadmin@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 7, 5235, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:09:18', '2024-02-08 05:10:07'),
	(4, 25, 'ZenithWave Innovations', 'zenithwave-innovations', 5, 2, 9, '/uploads/media_65c4b6d56ef57.png', '/uploads/media_65c4b6d56f3bf.jpg', '2024-02-19', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', 4, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:11:17', '2024-02-08 05:11:58'),
	(5, 26, 'NexusGlobe', 'nexusglobe', 2, 5, 8, '/uploads/media_65c4b7b8bd7bb.png', '/uploads/media_65c4b7b8bdc3e.jpg', '2024-02-20', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', 4, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:15:04', '2024-02-08 05:15:34'),
	(6, 27, 'CoreNexa', 'corenexa', 4, 2, 3, '/uploads/media_65c4b86799ddc.png', '/uploads/media_65c4b8679a1e6.jpg', '2024-02-21', 'https://www.google.com', '+1 (135) 935-2729', 'superadmin@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', NULL, 5233, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:17:59', '2024-02-08 05:19:38'),
	(7, 28, 'PeakPulse', 'peakpulse', 8, 1, 3, '/uploads/media_65c4ba322b58d.png', '/uploads/media_65c4ba322b9b6.jpg', '2024-02-19', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 8, 5235, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 05:25:38', '2024-02-08 05:26:08'),
	(8, 31, 'ProximaTech Solutions', 'proximatech-solutions', 3, 2, 3, '/uploads/media_65c51118648b1.png', '/uploads/media_65c5111864ed1.jpg', '2024-02-21', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 5, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 11:36:24', '2024-02-08 11:37:09'),
	(9, 32, 'EliteEdge Ventures', 'eliteedge-ventures', 2, 1, 4, '/uploads/media_65c511f949e2a.png', '/uploads/media_65c511f94a204.jpg', '2024-02-13', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 5, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 11:39:52', '2024-02-08 11:42:50'),
	(10, 33, 'BrightStar Enterprises', 'brightstar-enterprises', 2, 2, 4, '/uploads/media_65c513928270f.png', '/uploads/media_65c5139282b4c.jpg', '2024-02-21', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '4408 Norma Lane Shreveport, LA 71101', NULL, 5233, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 11:46:58', '2024-02-08 11:47:48'),
	(11, 34, 'SwiftStream', 'swiftstream-technologies', 3, 2, 4, '/uploads/media_65c5174e9cab7.png', '/uploads/media_65c5174e9d02c.jpg', '2024-02-06', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 4, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 12:02:54', '2024-02-08 12:03:26'),
	(12, 35, 'EliteEdge Ventures', 'eliteedge-ventures-2', 2, 2, 4, '/uploads/media_65c518539e822.png', '/uploads/media_65c518539ecc0.jpg', '2024-02-13', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 4, 5234, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 12:07:15', '2024-02-08 12:08:03'),
	(13, 36, 'NovaGen Corporation', 'novagen-corporation', 2, 2, 5, '/uploads/media_65c518f5aca97.jpg', '/uploads/media_65c518f5acef8.jpg', '2024-02-21', 'https://www.google.com', '+1 (135) 935-2729', 'superadmin@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', NULL, 5233, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 12:09:57', '2024-02-08 12:10:27'),
	(14, 37, 'PeakPulse Industries', 'peakpulse-industries', 3, 2, 2, '/uploads/media_65c5199687a06.png', '/uploads/media_65c5199688360.jpg', '2024-02-22', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms', 0, '1731 Arbor Court Rawlins, WY 82301', 7, 5235, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 12:12:38', '2024-02-08 12:13:12'),
	(15, 39, 'FusionAxis', 'fusionaxis', 6, 2, 4, '/uploads/media_65c597c88d328.png', '/uploads/media_65c597c88d95f.jpg', '2024-02-21', 'https://www.google.com', '+1 (135) 935-2729', 'user@gmail.com', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h3>Essential Knowledge, Skills, and Experience</h3><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h3>Preferred Experience</h3><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul>', 'The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.\r\n\r\nThe ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.', 0, '1731 Arbor Court Rawlins, WY 82301', 7, 5235, 260, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', 0, NULL, 1, 1, '2024-02-08 21:11:04', '2024-02-08 21:11:37');

-- Dumping structure for table job_portal.counters
DROP TABLE IF EXISTS `counters`;
CREATE TABLE IF NOT EXISTS `counters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `counter_one` int NOT NULL,
  `title_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_two` int NOT NULL,
  `title_two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_three` int NOT NULL,
  `title_three` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_four` int NOT NULL,
  `title_four` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.counters: ~0 rows (approximately)
DELETE FROM `counters`;
INSERT INTO `counters` (`id`, `counter_one`, `title_one`, `counter_two`, `title_two`, `counter_three`, `title_three`, `counter_four`, `title_four`, `created_at`, `updated_at`) VALUES
	(1, 200, 'Completed Cases', 20, 'Offices', 500, 'Skilled People', 1000, 'Happy Clients', '2024-02-09 03:16:42', '2024-02-09 03:16:42');

-- Dumping structure for table job_portal.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.countries: ~8 rows (approximately)
DELETE FROM `countries`;
INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(260, 'United States', '2024-02-08 00:49:58', '2024-02-08 00:49:58'),
	(261, 'India', '2024-02-09 03:22:09', '2024-02-09 03:24:15'),
	(262, 'Spain', '2024-02-09 03:22:20', '2024-02-09 03:22:20'),
	(263, 'Italy', '2024-02-09 03:22:44', '2024-02-09 03:22:44'),
	(264, 'Turkey', '2024-02-09 03:22:50', '2024-02-09 03:22:50'),
	(265, 'Mexico', '2024-02-09 03:22:57', '2024-02-09 03:22:57'),
	(266, 'Thailand', '2024-02-09 03:23:12', '2024-02-09 03:23:12'),
	(267, 'Greece', '2024-02-09 03:23:21', '2024-02-09 03:23:21');

-- Dumping structure for table job_portal.custom_page_builders
DROP TABLE IF EXISTS `custom_page_builders`;
CREATE TABLE IF NOT EXISTS `custom_page_builders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.custom_page_builders: ~0 rows (approximately)
DELETE FROM `custom_page_builders`;
INSERT INTO `custom_page_builders` (`id`, `page_name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'Custom Page', 'custom-page', '<p>&nbsp;</p><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills </li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><p>&nbsp;</p><p>Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus, eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor justo sodales. Quisque tincidunt laoreet malesuada. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ante enim. Fusce sed elit est. Suspendisse sit amet mauris in quam pretium faucibus et aliquam odio.</p>', '2024-02-09 04:28:48', '2024-02-09 04:31:02');

-- Dumping structure for table job_portal.education
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.education: ~5 rows (approximately)
DELETE FROM `education`;
INSERT INTO `education` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'intermediate', 'intermediate', '2024-02-08 22:22:44', '2024-02-08 22:22:44'),
	(2, 'Bachelor Degree', 'bachelor-degree', '2024-02-08 22:22:44', '2024-02-08 22:22:44'),
	(3, 'PhD', 'phd', '2024-02-08 22:22:44', '2024-02-08 22:22:44'),
	(4, 'High School', 'high-school', '2024-02-08 22:22:44', '2024-02-08 22:22:44'),
	(5, 'Any', 'any', '2024-02-08 22:22:44', '2024-02-08 22:22:44');

-- Dumping structure for table job_portal.experiences
DROP TABLE IF EXISTS `experiences`;
CREATE TABLE IF NOT EXISTS `experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.experiences: ~8 rows (approximately)
DELETE FROM `experiences`;
INSERT INTO `experiences` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Fresher', NULL, NULL),
	(2, '1 Year', NULL, NULL),
	(3, '2 Year', NULL, NULL),
	(4, '3+ Year', NULL, NULL),
	(5, '5+ Year', NULL, NULL),
	(6, '8+ Year', NULL, NULL),
	(7, '10+ Year', NULL, NULL),
	(8, '15+ Year', NULL, NULL);

-- Dumping structure for table job_portal.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table job_portal.footers
DROP TABLE IF EXISTS `footers`;
CREATE TABLE IF NOT EXISTS `footers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.footers: ~1 rows (approximately)
DELETE FROM `footers`;
INSERT INTO `footers` (`id`, `logo`, `copyright`, `details`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c5fa1e0ff7c.png', 'Copyright © 2024. JOBLIST all right reserved', 'joblist is the heart of the design community and the best resource to discover and connect with designers and jobs worldwide.', '2024-02-09 04:10:38', '2024-02-09 04:10:38');

-- Dumping structure for table job_portal.heroes
DROP TABLE IF EXISTS `heroes`;
CREATE TABLE IF NOT EXISTS `heroes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.heroes: ~0 rows (approximately)
DELETE FROM `heroes`;
INSERT INTO `heroes` (`id`, `image`, `background_image`, `title`, `sub_title`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c4631307ffc.jpg', '/uploads/media_65c46341ce16c.jpg', 'Join us & Explore Thousands of Jobs', 'Find Jobs, Employment & Career Opportunities', '2024-02-07 23:13:55', '2024-02-07 23:14:41');

-- Dumping structure for table job_portal.industry_types
DROP TABLE IF EXISTS `industry_types`;
CREATE TABLE IF NOT EXISTS `industry_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.industry_types: ~20 rows (approximately)
DELETE FROM `industry_types`;
INSERT INTO `industry_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Manufacturing', 'manufacturing', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(2, 'Technology', 'technology', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(3, 'Healthcare', 'healthcare', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(4, 'Financial Services', 'financial-services', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(5, 'Energy', 'energy', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(6, 'Retail', 'retail', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(7, 'Telecommunications', 'telecommunications', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(8, 'Agriculture', 'agriculture', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(9, 'Transportation and Logistics', 'transportation-and-logistics', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(10, 'Entertainment and Media', 'entertainment-and-media', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(11, 'Construction', 'construction', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(12, 'Automotive', 'automotive', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(13, 'Tourism and Hospitality', 'tourism-and-hospitality', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(14, 'Education', 'education', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(15, 'Real Estate', 'real-estate', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(16, 'Pharmaceutical', 'pharmaceutical', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(17, 'Consumer Goods', 'consumer-goods', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(18, 'Environmental', 'environmental', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(19, 'Defense and Aerospace', 'defense-and-aerospace', '2024-02-08 04:42:26', '2024-02-08 04:42:26'),
	(20, 'Legal and Professional Services', 'legal-and-professional-services', '2024-02-08 04:42:26', '2024-02-08 04:42:26');

-- Dumping structure for table job_portal.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `job_category_id` bigint unsigned NOT NULL,
  `job_role_id` bigint unsigned NOT NULL,
  `job_experience_id` bigint unsigned NOT NULL,
  `education_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL,
  `salary_type_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacancies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL,
  `custom_salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','active','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `apply_on` enum('app','email','custom_url') COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_url` text COLLATE utf8mb4_unicode_ci,
  `featured` tinyint(1) DEFAULT NULL,
  `highlight` tinyint(1) DEFAULT NULL,
  `featured_until` date DEFAULT NULL,
  `highlight_until` date DEFAULT NULL,
  `total_views` int NOT NULL DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_mode` enum('range','custom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_company_id_foreign` (`company_id`),
  KEY `jobs_job_category_id_foreign` (`job_category_id`),
  CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `jobs_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.jobs: ~34 rows (approximately)
DELETE FROM `jobs`;
INSERT INTO `jobs` (`id`, `company_id`, `job_category_id`, `job_role_id`, `job_experience_id`, `education_id`, `job_type_id`, `salary_type_id`, `title`, `slug`, `vacancies`, `min_salary`, `max_salary`, `custom_salary`, `deadline`, `description`, `status`, `apply_on`, `apply_email`, `apply_url`, `featured`, `highlight`, `featured_until`, `highlight_until`, `total_views`, `city_id`, `state_id`, `country_id`, `address`, `salary_mode`, `company_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 2, 1, 2, 3, 2, 1, 1, 'Growth Hacker Mastermind: Help us take our user base to Mars!', 'growth-hacker-mastermind-help-us-take-our-user-base-to-mars', '3', 1000, 2000, NULL, '2026-01-23', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, 1, NULL, NULL, 0, 1, 5233, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 22:34:26', '2024-02-09 03:06:38', NULL),
	(2, 1, 2, 3, 3, 3, 1, 1, 'AI Whisperer: Bridge the gap between humans and machines.', 'ai-whisperer-bridge-the-gap-between-humans-and-machines', '5', 3000, 10000, NULL, '2025-12-18', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 5, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 22:37:06', '2024-02-09 05:58:39', NULL),
	(3, 2, 1, 2, 4, 1, 3, 1, 'Sustainability Superhero: Champion the planet, propel our progress', 'sustainability-superhero-champion-the-planet-propel-our-progress', '3', 1000, 2000, NULL, '2026-02-05', '<p>The AliStudio Design team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, 1, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 22:55:23', '2024-02-08 22:55:52', NULL),
	(4, 13, 3, 4, 4, 3, 2, 1, 'Content Crafter: Spin words into website magic', 'content-crafter-spin-words-into-website-magic', '3', 3000, 50000, NULL, '2025-07-23', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, 1, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 22:59:25', '2024-02-09 03:07:19', NULL),
	(5, 2, 4, 5, 3, 4, 5, 1, 'Data Detective: Uncover hidden insights, solve business mysteries', 'data-detective-uncover-hidden-insights-solve-business-mysteries', '3', 2000, 3000, NULL, '2025-02-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:01:19', '2024-02-08 23:04:52', NULL),
	(6, 2, 4, 5, 3, 4, 5, 1, 'Data Detective: Uncover hidden insights, solve business mysteries', 'data-detective-uncover-hidden-insights-solve-business-mysteries-2', '3', 2000, 3000, NULL, '2025-02-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:01:41', '2024-02-08 23:06:10', NULL),
	(7, 2, 4, 5, 3, 4, 5, 1, 'Data Detective: Uncover hidden insights, solve business mysteries', 'data-detective-uncover-hidden-insights-solve-business-mysteries-3', '3', 2000, 3000, NULL, '2025-02-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:02:07', '2024-02-08 23:04:54', NULL),
	(8, 2, 4, 5, 3, 4, 5, 1, 'Data Detective: Uncover hidden insights, solve business mysteries', 'data-detective-uncover-hidden-insights-solve-business-mysteries-4', '3', 2000, 3000, NULL, '2025-02-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:02:33', '2024-02-08 23:04:55', NULL),
	(9, 8, 4, 1, 4, 4, 5, 1, 'Data Detective: Uncover hidden insights, solve business mysteries', 'data-detective-uncover-hidden-insights-solve-business-mysteries-5', '3', 2000, 5000, NULL, '2024-06-18', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:04:23', '2024-02-09 03:07:57', NULL),
	(10, 15, 5, 3, 3, 2, 2, 2, 'Marketing Maverick: Outsmart the competition, own the market', 'marketing-maverick-outsmart-the-competition-own-the-market', '3', 2000, 3000, NULL, '2065-06-17', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 9, 5235, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:13:29', '2024-02-09 03:09:12', NULL),
	(11, 13, 3, 5, 4, 3, 1, 1, 'Social Media Magician: Make our brand the talk of the town', 'social-media-magician-make-our-brand-the-talk-of-the-town', '5', 2000, 10000, NULL, '2026-02-18', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:15:39', '2024-02-09 03:09:05', NULL),
	(12, 7, 1, 3, 4, 2, 4, 4, 'Customer Experience Guru: Craft journeys that leave smiles for miles', 'customer-experience-guru-craft-journeys-that-leave-smiles-for-miles', '3', 10000, 20000, NULL, '2025-10-27', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 8, 5235, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:21:47', '2024-02-09 03:08:57', NULL),
	(13, 5, 2, 3, 2, 2, 2, 1, 'Sales Samurai: Close deals like a boss, conquer targets with finesse', 'sales-samurai-close-deals-like-a-boss-conquer-targets-with-finesse', '3', 2000, 10000, NULL, '2030-02-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 1, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:23:57', '2024-02-09 03:08:49', NULL),
	(15, 4, 1, 3, 2, 3, 3, 1, 'Launch Your Tech Career Remotely: Coding Cadet Wanted!', 'launch-your-tech-career-remotely-coding-cadet-wanted', '3', 2000, 10000, NULL, '2024-02-12', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p><p><strong>Communication:</strong>&nbsp;Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:36:45', '2024-02-09 03:08:41', NULL),
	(16, 6, 1, 3, 4, 1, 2, 1, 'Learn & Earn: Entry-Level Tech Guru in the Making (Remote + Travel)', 'learn-earn-entry-level-tech-guru-in-the-making-remote-travel', '3', 10000, 50000, NULL, '2025-07-17', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:40:15', '2024-02-08 23:40:31', NULL),
	(17, 3, 1, 2, 3, 4, 2, 1, 'Explore the World While You Code: Junior Tech Traveler (Remote & Global)', 'explore-the-world-while-you-code-junior-tech-traveler-remote-global', '3', 2000, 3000, NULL, '2025-07-24', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:42:34', '2024-02-08 23:46:56', NULL),
	(18, 4, 1, 1, 2, 3, 3, 3, 'Ignite Your Passion: Entry-Level Tech Rockstar Wanted (Remote)', 'ignite-your-passion-entry-level-tech-rockstar-wanted-remote', '3', 3000, 10000, NULL, '2025-07-24', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:45:34', '2024-02-08 23:47:00', NULL),
	(19, 7, 1, 6, 4, 3, 4, 1, 'Join Our Remote Tech Family: Collaborative Coder (Entry-Level)', 'join-our-remote-tech-family-collaborative-coder-entry-level', '3', 2000, 20000, NULL, '2025-07-10', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:46:45', '2024-02-08 23:46:57', NULL),
	(20, 13, 1, 2, 4, 3, 1, 1, 'Innovate & Lead: Tech Trailblazer - Mid-Level Remote Role', 'innovate-lead-tech-trailblazer-mid-level-remote-role', '3', 1000, 5000, NULL, '2026-10-27', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:49:13', '2024-02-08 23:53:25', NULL),
	(21, 11, 1, 8, 4, 4, 4, 1, 'Tackle Tech Challenges Remotely (Travel Bonus!): Problem-Solving Rockstar', 'tackle-tech-challenges-remotely-travel-bonus-problem-solving-rockstar', '3', 2000, 10000, NULL, '2026-07-21', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-08 23:50:24', '2024-02-08 23:53:38', NULL),
	(22, 6, 1, 2, 4, 3, 1, 1, 'Globetrotting Tech Wiz: Mid-Level Remote Role with Global Impact', 'globetrotting-tech-wiz-mid-level-remote-role-with-global-impact', '3', 2000, 20000, NULL, '2025-07-24', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:51:37', '2024-02-08 23:53:39', NULL),
	(23, 3, 1, 3, 3, 3, 3, 1, 'Build the Future: Mid-Level Remote Security Engineer - Impact Matters', 'build-the-future-mid-level-remote-security-engineer-impact-matters', '3', 4000, 50000, NULL, '2025-07-24', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-08 23:53:15', '2024-02-08 23:53:40', NULL),
	(24, 9, 2, 1, 2, 1, 2, 1, 'Uncover Insights, Drive Impact: Data Detective (Mid-Level, Remote)', 'uncover-insights-drive-impact-data-detective-mid-level-remote', '3', 3000, 10000, NULL, '2025-05-15', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane', 'range', NULL, '2024-02-09 00:10:28', '2024-02-09 00:10:28', NULL),
	(25, 12, 3, 2, 1, 2, 2, 2, 'Lead Our Remote Team, Shape the Future: Tech Visionary', 'lead-our-remote-team-shape-the-future-tech-visionary', '5', 10000, 50000, NULL, '2025-06-10', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 7, 5235, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-09 00:13:07', '2024-02-09 00:13:07', NULL),
	(26, 14, 2, 2, 2, 2, 2, 3, 'Build, Lead, Inspire: Mastermind Engineer - Senior Remote Role', 'build-lead-inspire-mastermind-engineer-senior-remote-role', '3', 2000, 50000, NULL, '2025-10-02', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 6, 5234, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 00:16:05', '2024-02-09 00:16:05', NULL),
	(27, 6, 2, 2, 3, 2, 2, 1, 'Share Your Knowledge: Senior Remote Expert, Global Tech Guru', 'share-your-knowledge-senior-remote-expert-global-tech-guru', '3', NULL, NULL, 'compatitive', '2025-06-26', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 5, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'custom', NULL, '2024-02-09 00:19:03', '2024-02-09 00:19:03', NULL),
	(28, 11, 2, 2, 1, 2, 2, 3, 'Scale Our Impact: Senior Remote Strategist - Growth Architect', 'scale-our-impact-senior-remote-strategist-growth-architect', '3', 2000, 20000, NULL, '2025-03-13', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 7, 5235, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 00:21:34', '2024-02-09 00:21:34', NULL),
	(29, 13, 2, 2, 3, 2, 3, 3, 'Protect Our World: Senior Remote Defender - Cybersecurity Champion', 'protect-our-world-senior-remote-defender-cybersecurity-champion', '5', 1000, 20000, NULL, '2025-03-05', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 00:22:36', '2024-02-09 00:22:36', NULL),
	(30, 10, 2, 3, 2, 2, 2, 3, 'Make a Difference Remotely in Tech: Code With a Cause', 'make-a-difference-remotely-in-tech-code-with-a-cause', '3', 2000, 5000, NULL, '2025-04-16', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 4, 5234, 260, '1731 Arbor Court Rawlins, WY 82301', 'range', NULL, '2024-02-09 00:23:48', '2024-02-09 00:23:48', NULL),
	(31, 11, 3, 3, 2, 3, 2, 1, 'Craft Beautiful Experiences: Remote Tech Designer - Design Alchemist', 'craft-beautiful-experiences-remote-tech-designer-design-alchemist', '3', 1000, 3000, NULL, '2025-04-22', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 03:00:47', '2024-02-09 03:00:47', NULL),
	(32, 14, 3, 2, 2, 1, 2, 1, 'Build Connections, Grow Our Remote Tribe: Community Catalyst', 'build-connections-grow-our-remote-tribe-community-catalyst', '5', NULL, NULL, 'compatitive', '2025-04-03', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'custom', NULL, '2024-02-09 03:01:55', '2024-02-09 03:01:55', NULL),
	(33, 6, 3, 2, 1, 1, 2, 2, 'Share Your Voice, Shape Our Remote Story: Content Crafter', 'share-your-voice-shape-our-remote-story-content-crafter', '5', 2000, 3000, NULL, '2025-03-11', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 5233, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 03:03:04', '2024-02-09 03:03:04', NULL),
	(34, 7, 3, 3, 2, 2, 2, 2, 'Reach the World Remotely: Tech Growth Marketer - Marketing Maverick', 'reach-the-world-remotely-tech-growth-marketer-marketing-maverick', '5', 1000, 10000, NULL, '2025-03-06', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 5, 5234, 260, '4408 Norma Lane Shreveport, LA 71101', 'range', NULL, '2024-02-09 03:04:35', '2024-02-09 03:04:35', NULL),
	(35, 15, 3, 2, 3, 2, 2, 3, 'Join Our Fast-Paced Tech Adventure: Remotely Awesome', 'join-our-fast-paced-tech-adventure-remotely-awesome', '3', NULL, NULL, 'compatitive', '2025-05-14', '<p>our team has a vision to establish a trusted platform that enables productive and healthy enterprises in a world of digital and remote everything, constantly changing work patterns and norms, and the need for organizational resiliency.</p><p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms.</p><h2><strong>Essential Knowledge, Skills, and Experience</strong></h2><ul><li>A portfolio demonstrating well thought through and polished end to end customer journeys</li><li>5+ years of industry experience in interactive design and / or visual design</li><li>Excellent interpersonal skills</li><li>Aware of trends in mobile, communications, and collaboration</li><li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li><li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li><li>History of impacting shipping products with your work</li><li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li><li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li></ul><h2><strong>Preferred Experience</strong></h2><ul><li>Designing user experiences for enterprise software / services</li><li>Creating and applying established design principles and interaction patterns</li><li>Aligning or influencing design thinking with teams working in other geographies</li></ul><h2><strong>Product Designer</strong></h2><p><strong>Product knowledge:</strong>&nbsp;Deeply understand the technology and features of the product area to which you are assigned.</p><p><strong>Research:</strong>&nbsp;Provide human and business impact and insights for products.</p><p><strong>Deliverables:</strong>&nbsp;Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>', 'active', 'app', NULL, NULL, 1, NULL, NULL, NULL, 0, 5, 5234, 260, '4408 Norma Lane Shreveport, LA 71101', 'custom', NULL, '2024-02-09 03:05:44', '2024-02-09 03:05:44', NULL);

-- Dumping structure for table job_portal.job_benefits
DROP TABLE IF EXISTS `job_benefits`;
CREATE TABLE IF NOT EXISTS `job_benefits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `benefit_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_benefits_job_id_foreign` (`job_id`),
  CONSTRAINT `job_benefits_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_benefits: ~131 rows (approximately)
DELETE FROM `job_benefits`;
INSERT INTO `job_benefits` (`id`, `job_id`, `benefit_id`, `created_at`, `updated_at`) VALUES
	(3, 2, 3, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(4, 3, 4, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(5, 3, 5, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(6, 3, 6, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(7, 3, 7, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(12, 5, 12, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(13, 5, 13, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(14, 5, 14, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(15, 5, 15, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(16, 6, 16, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(17, 6, 17, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(18, 6, 18, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(19, 6, 19, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(20, 7, 20, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(21, 7, 21, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(22, 7, 22, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(23, 7, 23, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(24, 8, 24, '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(25, 8, 25, '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(26, 8, 26, '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(27, 8, 27, '2024-02-08 23:02:34', '2024-02-08 23:02:34'),
	(52, 16, 52, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(53, 16, 53, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(54, 16, 54, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(55, 16, 55, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(56, 17, 56, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(57, 17, 57, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(58, 17, 58, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(59, 17, 59, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(60, 18, 60, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(61, 18, 61, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(62, 18, 62, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(63, 18, 63, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(64, 19, 64, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(65, 19, 65, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(66, 19, 66, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(67, 19, 67, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(68, 20, 68, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(69, 20, 69, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(70, 20, 70, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(71, 20, 71, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(72, 21, 72, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(73, 21, 73, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(74, 21, 74, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(75, 21, 75, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(76, 22, 76, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(77, 22, 77, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(78, 22, 78, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(79, 22, 79, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(80, 23, 80, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(81, 23, 81, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(82, 23, 82, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(83, 23, 83, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(84, 24, 84, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(85, 24, 85, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(86, 24, 86, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(87, 24, 87, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(88, 25, 88, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(89, 25, 89, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(90, 25, 90, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(91, 25, 91, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(92, 26, 92, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(93, 26, 93, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(94, 26, 94, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(95, 26, 95, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(96, 27, 96, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(97, 27, 97, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(98, 27, 98, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(99, 27, 99, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(100, 28, 100, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(101, 28, 101, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(102, 28, 102, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(103, 28, 103, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(104, 29, 104, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(105, 29, 105, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(106, 29, 106, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(107, 29, 107, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(108, 30, 108, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(109, 30, 109, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(110, 30, 110, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(111, 30, 111, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(112, 31, 112, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(113, 31, 113, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(114, 31, 114, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(115, 31, 115, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(116, 32, 116, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(117, 32, 117, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(118, 32, 118, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(119, 32, 119, '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(120, 33, 120, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(121, 33, 121, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(122, 33, 122, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(123, 33, 123, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(124, 34, 124, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(125, 34, 125, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(126, 34, 126, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(127, 34, 127, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(128, 35, 128, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(129, 35, 129, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(130, 35, 130, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(131, 35, 131, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(132, 1, 132, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(133, 1, 133, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(138, 4, 138, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(139, 4, 139, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(140, 4, 140, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(141, 4, 141, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(142, 9, 142, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(143, 9, 143, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(144, 9, 144, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(145, 9, 145, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(146, 15, 146, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(147, 15, 147, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(148, 15, 148, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(149, 15, 149, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(150, 13, 150, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(151, 13, 151, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(152, 13, 152, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(153, 13, 153, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(154, 12, 154, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(155, 12, 155, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(156, 12, 156, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(157, 12, 157, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(158, 11, 158, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(159, 11, 159, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(160, 11, 160, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(161, 11, 161, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(162, 10, 162, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(163, 10, 163, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(164, 10, 164, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(165, 10, 165, '2024-02-09 03:09:12', '2024-02-09 03:09:12');

-- Dumping structure for table job_portal.job_bookmarks
DROP TABLE IF EXISTS `job_bookmarks`;
CREATE TABLE IF NOT EXISTS `job_bookmarks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_bookmarks: ~0 rows (approximately)
DELETE FROM `job_bookmarks`;

-- Dumping structure for table job_portal.job_categories
DROP TABLE IF EXISTS `job_categories`;
CREATE TABLE IF NOT EXISTS `job_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_at_popular` tinyint(1) NOT NULL DEFAULT '0',
  `show_at_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_categories: ~30 rows (approximately)
DELETE FROM `job_categories`;
INSERT INTO `job_categories` (`id`, `icon`, `name`, `slug`, `show_at_popular`, `show_at_featured`, `created_at`, `updated_at`) VALUES
	(1, 'fas fa-dollar-sign', 'Accounting/Finance', 'accounting-finance', 1, 1, '2024-02-07 22:46:15', '2024-02-09 05:22:53'),
	(2, 'fas fa-chess-king', 'Administration', 'administration', 1, 1, '2024-02-07 22:46:15', '2024-02-07 22:58:10'),
	(3, 'fas fa-ad', 'Advertising', 'advertising', 1, 1, '2024-02-07 22:46:15', '2024-02-07 22:58:23'),
	(4, 'fas fa-tree', 'Agriculture', 'agriculture', 1, 1, '2024-02-07 22:46:15', '2024-02-07 22:58:36'),
	(5, 'fas fa-microphone', 'Arts/Entertainment', 'arts-entertainment', 1, 1, '2024-02-07 22:46:15', '2024-02-07 22:58:55'),
	(6, 'fas fa-donate', 'Banking', 'banking', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:50:02'),
	(7, 'fas fa-building', 'Construction', 'construction', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:50:22'),
	(8, 'fas fa-hands-helping', 'Customer Service', 'customer-service', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:50:42'),
	(9, 'fas fa-book-open', 'Education/Training', 'education-training', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:50:54'),
	(10, 'fas fa-users-cog', 'Engineering', 'engineering', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:51:11'),
	(11, 'far fa-building', 'Government/Military', 'government-military', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:51:47'),
	(12, 'fas fa-heart', 'Healthcare', 'healthcare', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:52:38'),
	(13, 'fas fa-dove', 'Human Resources', 'human-resources', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:52:56'),
	(14, 'fas fa-tv', 'Information Technology', 'information-technology', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:53:13'),
	(15, 'fas fa-poll', 'Legal', 'legal', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:53:29'),
	(16, 'fas fa-align-justify', 'Management', 'management', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:54:53'),
	(17, 'fas fa-tshirt', 'Manufacturing', 'manufacturing', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:53:49'),
	(18, 'fas fa-headphones-alt', 'Communications', 'communications', 1, 0, '2024-02-07 22:46:15', '2024-02-07 22:55:10'),
	(19, 'fas fa-dot-circle', 'Nonprofit', 'nonprofit', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(20, 'fas fa-dot-circle', 'Real Estate', 'real-estate', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(21, 'fas fa-dot-circle', 'Restaurant/Food Service', 'restaurant-food-service', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(22, 'fas fa-dot-circle', 'Retail', 'retail', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(23, 'fas fa-dot-circle', 'Sales', 'sales', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(24, 'fas fa-dot-circle', 'Science/Biotech', 'science-biotech', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(25, 'fas fa-dot-circle', 'Telecommunications', 'telecommunications', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(26, 'fas fa-dot-circle', 'Transportation', 'transportation', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(27, 'fas fa-dot-circle', 'Travel/Hospitality', 'travel-hospitality', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(28, 'fas fa-dot-circle', 'Warehousing', 'warehousing', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(29, 'fas fa-dot-circle', 'Writing/Editing', 'writing-editing', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15'),
	(30, 'fas fa-dot-circle', 'Other', 'other', 0, 0, '2024-02-07 22:46:15', '2024-02-07 22:46:15');

-- Dumping structure for table job_portal.job_experiences
DROP TABLE IF EXISTS `job_experiences`;
CREATE TABLE IF NOT EXISTS `job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_experiences: ~0 rows (approximately)
DELETE FROM `job_experiences`;

-- Dumping structure for table job_portal.job_locations
DROP TABLE IF EXISTS `job_locations`;
CREATE TABLE IF NOT EXISTS `job_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `status` enum('featured','trending','hot') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_locations: ~8 rows (approximately)
DELETE FROM `job_locations`;
INSERT INTO `job_locations` (`id`, `image`, `country_id`, `status`, `created_at`, `updated_at`) VALUES
	(2, '/uploads/media_65c5f2d4c7ce1.jpg', 260, 'featured', '2024-02-09 03:39:32', '2024-02-09 03:39:32'),
	(3, '/uploads/media_65c5f2ef31214.jpg', 261, 'trending', '2024-02-09 03:39:59', '2024-02-09 03:39:59'),
	(4, '/uploads/media_65c5f30842e82.jpg', 262, 'featured', '2024-02-09 03:40:24', '2024-02-09 03:40:24'),
	(5, '/uploads/media_65c5f3325684f.jpg', 265, 'hot', '2024-02-09 03:41:06', '2024-02-09 03:41:06'),
	(6, '/uploads/media_65c5f35c2fcbc.jpg', 266, 'trending', '2024-02-09 03:41:48', '2024-02-09 03:41:48'),
	(7, '/uploads/media_65c5f38552b54.jpg', 267, 'featured', '2024-02-09 03:42:29', '2024-02-09 03:42:29'),
	(8, '/uploads/media_65c5f3cd1ecf3.jpg', 263, 'featured', '2024-02-09 03:43:41', '2024-02-09 03:43:41'),
	(9, '/uploads/media_65c5f47a21387.jpg', 263, 'trending', '2024-02-09 03:46:34', '2024-02-09 03:46:34');

-- Dumping structure for table job_portal.job_roles
DROP TABLE IF EXISTS `job_roles`;
CREATE TABLE IF NOT EXISTS `job_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_roles: ~20 rows (approximately)
DELETE FROM `job_roles`;
INSERT INTO `job_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Project Manager', 'project-manager', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(2, 'Marketing Manager', 'marketing-manager', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(3, 'Customer Service Representative', 'customer-service-representative', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(4, 'Data Scientist', 'data-scientist', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(5, 'Cybersecurity Analyst', 'cybersecurity-analyst', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(6, 'Human Resources Manager', 'human-resources-manager', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(7, 'Architect', 'architect', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(8, 'Chef', 'chef', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(9, 'Veterinarian', 'veterinarian', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(10, 'Writer', 'writer', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(11, 'Photographer', 'photographer', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(12, 'Videographer', 'videographer', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(13, 'Editor', 'editor', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(14, 'Musician', 'musician', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(15, 'Actor', 'actor', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(16, 'Artist', 'artist', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(17, 'Filmmaker', 'filmmaker', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(18, 'Lawyer', 'lawyer', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(19, 'Engineer', 'engineer', '2024-02-07 23:16:48', '2024-02-07 23:16:48'),
	(20, 'Police Officer', 'police-officer', '2024-02-07 23:16:48', '2024-02-07 23:16:48');

-- Dumping structure for table job_portal.job_skills
DROP TABLE IF EXISTS `job_skills`;
CREATE TABLE IF NOT EXISTS `job_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `skill_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_skills_job_id_foreign` (`job_id`),
  CONSTRAINT `job_skills_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_skills: ~118 rows (approximately)
DELETE FROM `job_skills`;
INSERT INTO `job_skills` (`id`, `job_id`, `skill_id`, `created_at`, `updated_at`) VALUES
	(6, 2, 1, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(7, 2, 3, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(8, 2, 4, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(9, 3, 1, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(10, 3, 2, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(11, 3, 3, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(12, 3, 4, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(42, 16, 1, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(43, 16, 2, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(44, 16, 3, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(45, 16, 4, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(46, 17, 1, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(47, 17, 2, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(48, 17, 3, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(49, 17, 4, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(50, 18, 1, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(51, 18, 2, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(52, 18, 3, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(53, 18, 4, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(54, 19, 1, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(55, 19, 2, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(56, 19, 3, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(57, 19, 4, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(58, 20, 1, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(59, 20, 2, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(60, 20, 3, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(61, 20, 4, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(62, 21, 1, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(63, 21, 2, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(64, 21, 3, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(65, 21, 4, '2024-02-08 23:50:25', '2024-02-08 23:50:25'),
	(66, 22, 1, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(67, 22, 2, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(68, 22, 3, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(69, 22, 4, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(70, 23, 1, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(71, 23, 2, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(72, 23, 3, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(73, 23, 4, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(74, 24, 1, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(75, 24, 2, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(76, 24, 3, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(77, 25, 1, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(78, 25, 2, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(79, 25, 3, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(80, 26, 1, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(81, 26, 2, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(82, 26, 3, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(83, 26, 4, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(84, 27, 1, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(85, 27, 2, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(86, 27, 3, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(87, 27, 5, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(88, 28, 1, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(89, 28, 2, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(90, 28, 3, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(91, 28, 4, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(92, 29, 1, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(93, 29, 2, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(94, 29, 3, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(95, 30, 1, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(96, 30, 2, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(97, 30, 3, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(98, 30, 4, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(99, 31, 1, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(100, 31, 2, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(101, 31, 3, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(102, 31, 4, '2024-02-09 03:00:48', '2024-02-09 03:00:48'),
	(103, 32, 1, '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(104, 32, 2, '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(105, 32, 3, '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(106, 32, 4, '2024-02-09 03:01:56', '2024-02-09 03:01:56'),
	(107, 33, 1, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(108, 33, 2, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(109, 33, 3, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(110, 33, 4, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(111, 34, 1, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(112, 34, 2, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(113, 34, 3, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(114, 34, 4, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(115, 35, 1, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(116, 35, 2, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(117, 35, 3, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(118, 35, 4, '2024-02-09 03:05:45', '2024-02-09 03:05:45'),
	(119, 1, 1, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(120, 1, 3, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(121, 1, 4, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(122, 1, 6, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(123, 1, 9, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(128, 4, 1, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(129, 4, 2, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(130, 4, 3, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(131, 4, 4, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(132, 9, 1, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(133, 9, 2, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(134, 9, 3, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(135, 9, 4, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(136, 15, 1, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(137, 15, 2, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(138, 15, 3, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(139, 15, 4, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(140, 13, 1, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(141, 13, 2, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(142, 13, 3, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(143, 13, 4, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(144, 12, 1, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(145, 12, 2, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(146, 12, 3, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(147, 12, 4, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(148, 11, 1, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(149, 11, 2, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(150, 11, 3, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(151, 11, 4, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(152, 10, 1, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(153, 10, 2, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(154, 10, 3, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(155, 10, 4, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(156, 10, 5, '2024-02-09 03:09:12', '2024-02-09 03:09:12');

-- Dumping structure for table job_portal.job_tags
DROP TABLE IF EXISTS `job_tags`;
CREATE TABLE IF NOT EXISTS `job_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_tags_job_id_foreign` (`job_id`),
  CONSTRAINT `job_tags_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_tags: ~137 rows (approximately)
DELETE FROM `job_tags`;
INSERT INTO `job_tags` (`id`, `job_id`, `tag_id`, `created_at`, `updated_at`) VALUES
	(5, 2, 2, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(6, 2, 3, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(7, 2, 5, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(8, 2, 9, '2024-02-08 22:37:06', '2024-02-08 22:37:06'),
	(9, 3, 2, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(10, 3, 3, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(11, 3, 4, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(12, 3, 5, '2024-02-08 22:55:23', '2024-02-08 22:55:23'),
	(17, 5, 1, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(18, 5, 2, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(19, 5, 3, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(20, 5, 4, '2024-02-08 23:01:19', '2024-02-08 23:01:19'),
	(21, 6, 1, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(22, 6, 2, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(23, 6, 3, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(24, 6, 4, '2024-02-08 23:01:41', '2024-02-08 23:01:41'),
	(25, 7, 1, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(26, 7, 2, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(27, 7, 3, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(28, 7, 4, '2024-02-08 23:02:07', '2024-02-08 23:02:07'),
	(29, 8, 1, '2024-02-08 23:02:33', '2024-02-08 23:02:33'),
	(30, 8, 2, '2024-02-08 23:02:33', '2024-02-08 23:02:33'),
	(31, 8, 3, '2024-02-08 23:02:33', '2024-02-08 23:02:33'),
	(32, 8, 4, '2024-02-08 23:02:33', '2024-02-08 23:02:33'),
	(58, 16, 1, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(59, 16, 2, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(60, 16, 3, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(61, 16, 4, '2024-02-08 23:40:15', '2024-02-08 23:40:15'),
	(62, 17, 1, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(63, 17, 2, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(64, 17, 3, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(65, 17, 4, '2024-02-08 23:42:34', '2024-02-08 23:42:34'),
	(66, 18, 1, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(67, 18, 2, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(68, 18, 3, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(69, 18, 4, '2024-02-08 23:45:34', '2024-02-08 23:45:34'),
	(70, 19, 1, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(71, 19, 2, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(72, 19, 3, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(73, 19, 4, '2024-02-08 23:46:45', '2024-02-08 23:46:45'),
	(74, 20, 1, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(75, 20, 2, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(76, 20, 3, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(77, 20, 4, '2024-02-08 23:49:13', '2024-02-08 23:49:13'),
	(78, 21, 1, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(79, 21, 2, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(80, 21, 3, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(81, 21, 4, '2024-02-08 23:50:24', '2024-02-08 23:50:24'),
	(82, 22, 1, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(83, 22, 2, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(84, 22, 3, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(85, 22, 4, '2024-02-08 23:51:37', '2024-02-08 23:51:37'),
	(86, 23, 1, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(87, 23, 2, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(88, 23, 3, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(89, 23, 4, '2024-02-08 23:53:15', '2024-02-08 23:53:15'),
	(90, 24, 1, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(91, 24, 2, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(92, 24, 3, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(93, 24, 6, '2024-02-09 00:10:28', '2024-02-09 00:10:28'),
	(94, 25, 1, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(95, 25, 2, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(96, 25, 4, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(97, 25, 6, '2024-02-09 00:13:07', '2024-02-09 00:13:07'),
	(98, 26, 1, '2024-02-09 00:16:05', '2024-02-09 00:16:05'),
	(99, 26, 2, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(100, 26, 3, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(101, 26, 5, '2024-02-09 00:16:06', '2024-02-09 00:16:06'),
	(102, 27, 1, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(103, 27, 2, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(104, 27, 3, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(105, 27, 4, '2024-02-09 00:19:03', '2024-02-09 00:19:03'),
	(106, 28, 1, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(107, 28, 2, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(108, 28, 3, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(109, 28, 4, '2024-02-09 00:21:34', '2024-02-09 00:21:34'),
	(110, 29, 1, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(111, 29, 2, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(112, 29, 3, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(113, 29, 4, '2024-02-09 00:22:36', '2024-02-09 00:22:36'),
	(114, 30, 1, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(115, 30, 2, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(116, 30, 3, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(117, 30, 4, '2024-02-09 00:23:48', '2024-02-09 00:23:48'),
	(118, 31, 1, '2024-02-09 03:00:47', '2024-02-09 03:00:47'),
	(119, 31, 2, '2024-02-09 03:00:47', '2024-02-09 03:00:47'),
	(120, 31, 3, '2024-02-09 03:00:47', '2024-02-09 03:00:47'),
	(121, 31, 4, '2024-02-09 03:00:47', '2024-02-09 03:00:47'),
	(122, 32, 1, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(123, 32, 2, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(124, 32, 3, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(125, 32, 4, '2024-02-09 03:01:55', '2024-02-09 03:01:55'),
	(126, 33, 1, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(127, 33, 2, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(128, 33, 3, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(129, 33, 4, '2024-02-09 03:03:04', '2024-02-09 03:03:04'),
	(130, 34, 1, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(131, 34, 2, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(132, 34, 3, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(133, 34, 4, '2024-02-09 03:04:35', '2024-02-09 03:04:35'),
	(134, 35, 1, '2024-02-09 03:05:44', '2024-02-09 03:05:44'),
	(135, 35, 2, '2024-02-09 03:05:44', '2024-02-09 03:05:44'),
	(136, 35, 3, '2024-02-09 03:05:44', '2024-02-09 03:05:44'),
	(137, 35, 4, '2024-02-09 03:05:44', '2024-02-09 03:05:44'),
	(138, 1, 1, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(139, 1, 3, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(140, 1, 4, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(141, 1, 8, '2024-02-09 03:06:38', '2024-02-09 03:06:38'),
	(146, 4, 1, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(147, 4, 2, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(148, 4, 3, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(149, 4, 4, '2024-02-09 03:07:19', '2024-02-09 03:07:19'),
	(150, 9, 1, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(151, 9, 2, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(152, 9, 3, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(153, 9, 4, '2024-02-09 03:07:57', '2024-02-09 03:07:57'),
	(154, 15, 1, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(155, 15, 2, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(156, 15, 3, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(157, 15, 4, '2024-02-09 03:08:42', '2024-02-09 03:08:42'),
	(158, 13, 2, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(159, 13, 3, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(160, 13, 4, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(161, 13, 5, '2024-02-09 03:08:49', '2024-02-09 03:08:49'),
	(162, 12, 1, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(163, 12, 2, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(164, 12, 3, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(165, 12, 4, '2024-02-09 03:08:57', '2024-02-09 03:08:57'),
	(166, 11, 1, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(167, 11, 2, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(168, 11, 3, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(169, 11, 4, '2024-02-09 03:09:05', '2024-02-09 03:09:05'),
	(170, 10, 1, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(171, 10, 2, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(172, 10, 3, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(173, 10, 4, '2024-02-09 03:09:12', '2024-02-09 03:09:12'),
	(174, 10, 5, '2024-02-09 03:09:12', '2024-02-09 03:09:12');

-- Dumping structure for table job_portal.job_types
DROP TABLE IF EXISTS `job_types`;
CREATE TABLE IF NOT EXISTS `job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.job_types: ~10 rows (approximately)
DELETE FROM `job_types`;
INSERT INTO `job_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Full-time', 'full-time', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(2, 'Part-time', 'part-time', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(3, 'Contract', 'contract', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(4, 'Temporary', 'temporary', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(5, 'Remote', 'remote', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(6, 'Freelance', 'freelance', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(7, 'Internship', 'internship', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(8, 'Entry-level', 'entry-level', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(9, 'Mid-level', 'mid-level', '2024-02-08 22:23:18', '2024-02-08 22:23:18'),
	(10, 'Senior-level', 'senior-level', '2024-02-08 22:23:18', '2024-02-08 22:23:18');

-- Dumping structure for table job_portal.languages
DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.languages: ~5 rows (approximately)
DELETE FROM `languages`;
INSERT INTO `languages` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'English', 'english', '2024-02-07 23:37:45', '2024-02-07 23:37:45'),
	(2, 'Hindi', 'hindi', '2024-02-07 23:37:45', '2024-02-07 23:37:45'),
	(3, 'Arabic', 'arabic', '2024-02-07 23:37:45', '2024-02-07 23:37:45'),
	(4, 'Bangla', 'bangla', '2024-02-07 23:37:45', '2024-02-07 23:37:45'),
	(5, 'Other', 'other', '2024-02-07 23:37:45', '2024-02-07 23:37:45');

-- Dumping structure for table job_portal.learn_mores
DROP TABLE IF EXISTS `learn_mores`;
CREATE TABLE IF NOT EXISTS `learn_mores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.learn_mores: ~0 rows (approximately)
DELETE FROM `learn_mores`;
INSERT INTO `learn_mores` (`id`, `image`, `title`, `main_title`, `sub_title`, `url`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c5ed3e6f8e9.png', 'Millions Of Jobs.', 'Find The One That’s Right For You', 'Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.', '/', '2024-02-09 03:15:42', '2024-02-09 03:15:42');

-- Dumping structure for table job_portal.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2017_08_11_073824_create_menus_wp_table', 1),
	(4, '2017_08_11_074006_create_menu_items_wp_table', 1),
	(5, '2019_08_19_000000_create_failed_jobs_table', 1),
	(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(7, '2023_12_11_093917_create_admins_table', 1),
	(8, '2023_12_14_095631_create_companies_table', 1),
	(9, '2023_12_18_102543_create_industry_types_table', 1),
	(10, '2023_12_19_111743_create_organization_types_table', 1),
	(11, '2023_12_20_045833_create_team_sizes_table', 1),
	(12, '2023_12_20_061004_create_countries_table', 1),
	(13, '2023_12_20_061016_create_states_table', 1),
	(14, '2023_12_20_061027_create_cities_table', 1),
	(15, '2023_12_24_095516_create_languages_table', 1),
	(16, '2023_12_24_112740_create_professions_table', 1),
	(17, '2023_12_25_042432_create_skills_table', 1),
	(18, '2023_12_25_055605_create_candidates_table', 1),
	(19, '2023_12_25_100255_create_experiences_table', 1),
	(20, '2023_12_26_062851_create_candidate_languages_table', 1),
	(21, '2023_12_26_062857_create_candidate_skills_table', 1),
	(22, '2023_12_27_031235_create_candidate_experiences_table', 1),
	(23, '2023_12_28_043744_create_candidate_education_table', 1),
	(24, '2024_01_01_091246_create_plans_table', 1),
	(25, '2024_01_02_050030_add_show_at_home_to_plans', 1),
	(26, '2024_01_02_091108_create_payment_settings_table', 1),
	(27, '2024_01_03_061551_create_site_settings_table', 1),
	(28, '2024_01_04_055809_create_orders_table', 1),
	(29, '2024_01_04_095501_create_user_plans_table', 1),
	(30, '2024_01_09_035110_create_job_categories_table', 1),
	(31, '2024_01_09_055023_create_education_table', 1),
	(32, '2024_01_09_065443_create_job_types_table', 1),
	(33, '2024_01_09_092041_create_salary_types_table', 1),
	(34, '2024_01_09_101223_create_tags_table', 1),
	(35, '2024_01_09_105927_create_job_roles_table', 1),
	(36, '2024_01_10_032256_create_job_experiences_table', 1),
	(37, '2024_01_10_053636_create_jobs_table', 1),
	(38, '2024_01_14_063326_create_job_tags_table', 1),
	(39, '2024_01_14_070836_create_benefits_table', 1),
	(40, '2024_01_14_070853_create_job_benefits_table', 1),
	(41, '2024_01_14_092122_create_job_skills_table', 1),
	(42, '2024_01_15_063950_add_softdelete_to_jobs_table', 1),
	(43, '2024_01_22_092311_create_applied_jobs_table', 1),
	(44, '2024_01_23_063900_create_job_bookmarks_table', 1),
	(45, '2024_01_23_103114_create_blogs_table', 1),
	(46, '2024_01_24_093258_create_heroes_table', 1),
	(47, '2024_01_25_085554_create_why_choose_us_table', 1),
	(48, '2024_01_28_044404_create_learn_mores_table', 1),
	(49, '2024_01_28_062423_create_counters_table', 1),
	(50, '2024_01_28_110347_create_job_locations_table', 1),
	(51, '2024_01_29_064929_create_reviews_table', 1),
	(52, '2024_01_30_033018_create_abouts_table', 1),
	(53, '2024_01_30_102934_create_custom_page_builders_table', 1),
	(54, '2024_01_31_045344_create_subscribers_table', 1),
	(55, '2024_02_01_031615_create_footers_table', 1),
	(56, '2024_02_01_041322_create_social_icons_table', 1),
	(57, '2024_02_05_102755_create_permission_tables', 1);

-- Dumping structure for table job_portal.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table job_portal.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.model_has_roles: ~0 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\Admin', 1);

-- Dumping structure for table job_portal.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `paid_in_currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_company_id_foreign` (`company_id`),
  CONSTRAINT `orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.orders: ~2 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `company_id`, `plan_id`, `package_name`, `transaction_id`, `order_id`, `payment_provider`, `amount`, `paid_in_currency`, `default_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 'Pro', '3WS24724BF547811R', '65c5a6d8939fb', 'payPal', 60, 'USD', '60USD', 'paid', '2024-02-08 22:15:20', '2024-02-08 22:15:20'),
	(2, 2, 3, 'Pro', '7V881838262076433', '65c5af45ae6e6', 'payPal', 60, 'USD', '60USD', 'paid', '2024-02-08 22:51:17', '2024-02-08 22:51:17'),
	(3, 3, 3, 'Pro', '66M82048XB063825R', '65c5b3bf845af', 'payPal', 60, 'USD', '60USD', 'paid', '2024-02-08 23:10:23', '2024-02-08 23:10:23');

-- Dumping structure for table job_portal.organization_types
DROP TABLE IF EXISTS `organization_types`;
CREATE TABLE IF NOT EXISTS `organization_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.organization_types: ~6 rows (approximately)
DELETE FROM `organization_types`;
INSERT INTO `organization_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Government', 'government', '2024-02-08 04:42:46', '2024-02-08 04:42:46'),
	(2, 'Semi Government', 'semi-government', '2024-02-08 04:42:46', '2024-02-08 04:42:46'),
	(3, 'Public', 'public', '2024-02-08 04:42:46', '2024-02-08 04:42:46'),
	(4, 'Private', 'private', '2024-02-08 04:42:46', '2024-02-08 04:42:46'),
	(5, 'NGO', 'ngo', '2024-02-08 04:42:46', '2024-02-08 04:42:46'),
	(6, 'International Agencies', 'international-agencies', '2024-02-08 04:42:46', '2024-02-08 04:42:46');

-- Dumping structure for table job_portal.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table job_portal.payment_settings
DROP TABLE IF EXISTS `payment_settings`;
CREATE TABLE IF NOT EXISTS `payment_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.payment_settings: ~20 rows (approximately)
DELETE FROM `payment_settings`;
INSERT INTO `payment_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'paypal_status', 'active', '2024-01-02 21:36:16', '2024-01-07 22:31:01'),
	(2, 'paypal_account_mode', 'sandbox', '2024-01-02 21:36:16', '2024-01-02 21:36:16'),
	(3, 'paypal_country_name', 'US', '2024-01-02 21:36:16', '2024-01-02 21:36:16'),
	(4, 'paypal_currency_name', 'USD', '2024-01-02 21:36:16', '2024-01-03 22:11:42'),
	(5, 'paypal_currency_rate', '1', '2024-01-02 21:36:16', '2024-01-03 22:11:42'),
	(6, 'paypal_client_id', 'AVNUDKwMZBRre6GdfGusYp8nnFMbyRrzKb46A-s9OgsziUpMRGSWvdaBM2B8EUTM_NIxIX45MetVbkCK', '2024-01-02 21:36:16', '2024-01-03 03:41:24'),
	(7, 'paypal_client_secret', 'EL6KjLuP1g38qLZ3axMhcp3uMzBgYXiAyOekEMsXbtng5Mgb0aG0ofDM7sURAbRKnKCEAPiQYntkh8bO', '2024-01-02 21:36:16', '2024-01-03 03:41:24'),
	(8, 'paypal_app_id', 'Client_app_id', '2024-01-02 21:36:16', '2024-01-02 21:36:16'),
	(9, 'stripe_status', 'active', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(10, 'stripe_country_name', 'US', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(11, 'stripe_currency_name', 'USD', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(12, 'stripe_currency_rate', '1', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(13, 'stripe_publishable_key', 'pk_test_51OVRhFHgrCz0Smml5mxCMyUU1zWdegTdMkUMyubU3wL9yjDZA6LGpLpgCsFD7KX4JUBQb67z2iyUJFuPL0ClcDZi00Yui5p25Y', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(14, 'stripe_secret_key', 'sk_test_51OVRhFHgrCz0SmmlZq11q3KVSZbCDEsYawGFGdhYBiEDACTJKwAnVZhF7bVmAKveGel1ubry1DX6taNlNSYe9APO00veYq6d3w', '2024-01-05 23:34:39', '2024-01-05 23:34:39'),
	(15, 'razorpay_status', 'active', '2024-01-06 03:41:18', '2024-01-06 03:41:18'),
	(16, 'razorpay_country_name', 'IN', '2024-01-06 03:41:18', '2024-01-06 03:41:18'),
	(17, 'razorpay_currency_name', 'INR', '2024-01-06 03:41:18', '2024-01-06 03:41:18'),
	(18, 'razorpay_currency_rate', '83.19', '2024-01-06 03:41:18', '2024-01-06 03:41:18'),
	(19, 'razorpay_key', 'rzp_test_K7CipNQYyyMPiS', '2024-01-06 03:41:18', '2024-01-06 04:28:38'),
	(20, 'razorpay_secret_key', 'zSBmNMorJrirOrnDrbOd1ALO', '2024-01-06 03:41:18', '2024-01-06 04:28:38');

-- Dumping structure for table job_portal.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.permissions: ~23 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group`, `created_at`, `updated_at`) VALUES
	(1, 'dashboard analytics', 'admin', 'Dashboard', '2024-02-05 21:56:14', '2024-02-05 21:56:14'),
	(2, 'dashboard pending posts', 'admin', 'Dashboard', '2024-02-05 21:56:31', '2024-02-05 21:56:31'),
	(3, 'order index', 'admin', 'Order', '2024-02-05 22:41:50', '2024-02-05 22:41:50'),
	(4, 'job category create', 'admin', 'Job Category', '2024-02-05 22:42:54', '2024-02-05 22:42:54'),
	(5, 'job category update', 'admin', 'Job Category', '2024-02-05 22:43:00', '2024-02-05 22:43:00'),
	(6, 'job category delete', 'admin', 'Job Category', '2024-02-05 22:43:06', '2024-02-05 22:43:06'),
	(7, 'job create', 'admin', 'Job', '2024-02-05 22:44:13', '2024-02-05 22:44:13'),
	(8, 'job update', 'admin', 'Job', '2024-02-05 22:44:19', '2024-02-05 22:44:19'),
	(9, 'job delete', 'admin', 'Job', '2024-02-05 22:44:27', '2024-02-05 22:44:27'),
	(10, 'job role', 'admin', 'Job Role', '2024-02-05 22:46:17', '2024-02-05 22:46:17'),
	(11, 'job attributes', 'admin', 'Job Attributes', '2024-02-05 22:48:23', '2024-02-05 22:48:23'),
	(12, 'job locations', 'admin', 'Job Locations', '2024-02-05 22:49:00', '2024-02-05 22:49:00'),
	(13, 'sections', 'admin', 'Site Sections', '2024-02-05 22:49:31', '2024-02-05 22:49:31'),
	(14, 'site pages', 'admin', 'Site Pages', '2024-02-05 22:50:09', '2024-02-05 22:50:09'),
	(15, 'site footer', 'admin', 'Site Footer', '2024-02-05 22:50:48', '2024-02-05 22:50:48'),
	(16, 'blogs', 'admin', 'Blogs', '2024-02-05 22:51:23', '2024-02-05 22:51:23'),
	(17, 'price plan', 'admin', 'Price Plan', '2024-02-05 22:51:54', '2024-02-05 22:51:54'),
	(18, 'news letter', 'admin', 'News Letter', '2024-02-05 22:52:37', '2024-02-05 22:52:37'),
	(19, 'menu builder', 'admin', 'Menu Builder', '2024-02-05 22:53:11', '2024-02-05 22:53:11'),
	(20, 'access management', 'admin', 'Access Management', '2024-02-05 22:53:58', '2024-02-05 22:53:58'),
	(21, 'payment settings', 'admin', 'Payment Settings', '2024-02-05 22:54:36', '2024-02-05 22:54:36'),
	(22, 'site settings', 'admin', 'Site Settings', '2024-02-05 22:54:44', '2024-02-05 22:54:44'),
	(23, 'database clear', 'admin', 'Database Clear', '2024-02-05 22:54:54', '2024-02-05 22:54:54');

-- Dumping structure for table job_portal.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table job_portal.plans
DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `job_limit` int NOT NULL,
  `featured_job_limit` int NOT NULL,
  `highlight_job_limit` int NOT NULL,
  `profile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_show` tinyint(1) NOT NULL DEFAULT '0',
  `show_at_home` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.plans: ~2 rows (approximately)
DELETE FROM `plans`;
INSERT INTO `plans` (`id`, `label`, `price`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `profile_verified`, `recommended`, `frontend_show`, `show_at_home`, `created_at`, `updated_at`) VALUES
	(1, 'Basic', 0, 5, 0, 0, 0, 0, 1, 1, '2024-02-08 21:16:43', '2024-02-08 21:16:43'),
	(2, 'Standerd', 30, 10, 3, 3, 0, 1, 1, 1, '2024-02-08 21:17:23', '2024-02-08 21:17:23'),
	(3, 'Pro', 60, 15, 7, 7, 1, 0, 1, 1, '2024-02-08 21:18:17', '2024-02-08 21:18:17');

-- Dumping structure for table job_portal.professions
DROP TABLE IF EXISTS `professions`;
CREATE TABLE IF NOT EXISTS `professions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.professions: ~20 rows (approximately)
DELETE FROM `professions`;
INSERT INTO `professions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Software Developer', 'software-developer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(2, 'Web Designer', 'web-designer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(3, 'Data Scientist', 'data-scientist', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(4, 'Digital Marketer', 'digital-marketer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(5, 'UX/UI Designer', 'ux-ui-designer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(6, 'Network Administrator', 'network-administrator', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(7, 'Content Creator', 'content-creator', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(8, 'Project Manager', 'project-manager', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(9, 'Graphic Designer', 'graphic-designer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(10, 'Database Administrator', 'database-administrator', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(11, 'Cybersecurity Analyst', 'cybersecurity-analyst', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(12, 'Systems Analyst', 'systems-analyst', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(13, 'Mobile App Developer', 'mobile-app-developer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(14, 'Game Developer', 'game-developer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(15, 'Technical Writer', 'technical-writer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(16, 'DevOps Engineer', 'devops-engineer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(17, 'Cloud Architect', 'cloud-architect', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(18, 'Business Analyst', 'business-analyst', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(19, 'UI/UX Developer', 'ui-ux-developer', '2024-02-07 23:35:59', '2024-02-07 23:35:59'),
	(20, 'Artificial Intelligence Engineer', 'artificial-intelligence-engineer', '2024-02-07 23:35:59', '2024-02-07 23:35:59');

-- Dumping structure for table job_portal.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.reviews: ~5 rows (approximately)
DELETE FROM `reviews`;
INSERT INTO `reviews` (`id`, `image`, `name`, `title`, `review`, `rating`, `created_at`, `updated_at`) VALUES
	(1, '/uploads/media_65c5f508e91d9.png', 'Taylor Anny', 'Digital Artist', 'Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt. Labore et dolore nostrud temp exercitation.', 5, '2024-02-09 03:48:56', '2024-02-09 03:48:56'),
	(2, '/uploads/media_65c5f5473f2df.png', 'Mr Stark', 'Developer', 'Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt. Labore et dolore nostrud temp exercitation.', 5, '2024-02-09 03:49:59', '2024-02-09 03:49:59'),
	(3, '/uploads/media_65c5f5701b628.png', 'Ellis Kim', 'Product Designer', 'Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt. Labore et dolore nostrud temp exercitation.', 5, '2024-02-09 03:50:40', '2024-02-09 03:50:40'),
	(4, '/uploads/media_65c5f59496248.png', 'Jhon Smith', 'Data Scientist', 'Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt. Labore et dolore nostrud temp exercitation.', 5, '2024-02-09 03:51:16', '2024-02-09 03:51:16'),
	(5, '/uploads/media_65c5f5bc32fc4.jpg', 'Sayen Ahomd', 'UI/UX Designer', 'Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt. Labore et dolore nostrud temp exercitation.', 5, '2024-02-09 03:51:56', '2024-02-09 03:51:56');

-- Dumping structure for table job_portal.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.roles: ~0 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'admin', '2024-02-06 03:55:55', '2024-02-06 03:55:55');

-- Dumping structure for table job_portal.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.role_has_permissions: ~23 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1);

-- Dumping structure for table job_portal.salary_types
DROP TABLE IF EXISTS `salary_types`;
CREATE TABLE IF NOT EXISTS `salary_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.salary_types: ~4 rows (approximately)
DELETE FROM `salary_types`;
INSERT INTO `salary_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Monthly', 'monthly', '2024-02-08 22:22:07', '2024-02-08 22:22:07'),
	(2, 'Hourly', 'hourly', '2024-02-08 22:22:07', '2024-02-08 22:22:07'),
	(3, 'Yearly', 'yearly', '2024-02-08 22:22:07', '2024-02-08 22:22:07'),
	(4, 'Project Basis', 'project-basis', '2024-02-08 22:22:07', '2024-02-08 22:22:07');

-- Dumping structure for table job_portal.site_settings
DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.site_settings: ~6 rows (approximately)
DELETE FROM `site_settings`;
INSERT INTO `site_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'site_name', 'JobFinder', '2024-01-03 01:03:35', '2024-01-30 03:57:08'),
	(2, 'site_email', 'marieangedieng@gmail.com', '2024-01-03 01:03:35', '2024-01-03 01:03:35'),
	(3, 'site_phone', '+228-92-45-88-30', '2024-01-03 01:03:35', '2024-01-03 01:03:35'),
	(4, 'site_default_currency', 'USD', '2024-01-03 01:03:35', '2024-01-03 01:03:35'),
	(5, 'site_currency_icon', '$', '2024-01-03 01:03:35', '2024-01-03 01:03:35'),
	(6, 'site_map', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1824.8667200308832!2d90.42592680669435!3d23.828076048215905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c646adb2897f%3A0x4b007974289814ab!2sInternational%20Convention%20City%20Bashundhara%2C%20Joar%20Sahara%2C%20Khilkhet%20(Beside%20300ft%20Purbachal%20Link%20Road)%2C%20Purbachal%20Expy%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1701764233068!5m2!1sen!2sbd"           width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"           referrerpolicy="no-referrer-when-downgrade"></iframe>', '2024-01-30 03:53:20', '2024-01-30 03:59:42');

-- Dumping structure for table job_portal.skills
DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.skills: ~85 rows (approximately)
DELETE FROM `skills`;
INSERT INTO `skills` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Communication Skills', 'communication-skills', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(2, 'Critical Thinking', 'critical-thinking', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(3, 'Problem Solving', 'problem-solving', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(4, 'Creativity', 'creativity', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(5, 'Teamwork', 'teamwork', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(6, 'Leadership', 'leadership', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(7, 'Adaptability', 'adaptability', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(8, 'Time Management', 'time-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(9, 'Emotional Intelligence', 'emotional-intelligence', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(10, 'Decision Making', 'decision-making', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(11, 'Analytical Skills', 'analytical-skills', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(12, 'Project Management', 'project-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(13, 'Collaboration', 'collaboration', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(14, 'Negotiation', 'negotiation', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(15, 'Conflict Resolution', 'conflict-resolution', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(16, 'Networking', 'networking', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(17, 'Presentation Skills', 'presentation-skills', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(18, 'Strategic Planning', 'strategic-planning', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(19, 'Research', 'research', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(20, 'Data Analysis', 'data-analysis', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(21, 'Digital Literacy', 'digital-literacy', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(22, 'Python', 'python', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(23, 'Java', 'java', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(24, 'JavaScript', 'javascript', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(25, 'C++', 'c', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(26, 'Ruby', 'ruby', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(27, 'PHP', 'php', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(28, 'Swift', 'swift', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(29, 'Kotlin', 'kotlin', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(30, 'TypeScript', 'typescript', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(31, 'HTML/CSS', 'html-css', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(32, 'Cybersecurity', 'cybersecurity', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(33, 'AWS (Amazon Web Services)', 'aws-amazon-web-services', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(34, 'Azure', 'azure', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(35, 'Google Cloud Platform', 'google-cloud-platform', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(36, 'Kubernetes', 'kubernetes', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(37, 'Docker', 'docker', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(38, 'TensorFlow', 'tensorflow', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(39, 'PyTorch', 'pytorch', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(40, 'scikit-learn', 'scikit-learn', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(41, 'Keras', 'keras', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(42, 'R', 'r', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(43, 'SAS', 'sas', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(44, 'SPSS', 'spss', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(45, 'Financial Literacy', 'financial-literacy', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(46, 'Marketing Strategy', 'marketing-strategy', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(47, 'Sales', 'sales', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(48, 'Customer Service', 'customer-service', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(49, 'Adobe Creative Suite (Photoshop, Illustrator, InDesign)', 'adobe-creative-suite-photoshop-illustrator-indesign', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(50, 'Sketch', 'sketch', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(51, 'Canva', 'canva', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(52, 'Adobe Premiere Pro', 'adobe-premiere-pro', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(53, 'Final Cut Pro', 'final-cut-pro', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(54, 'DaVinci Resolve', 'davinci-resolve', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(55, 'Content Writing', 'content-writing', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(56, 'Foreign Language Proficiency', 'foreign-language-proficiency', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(57, 'Public Speaking', 'public-speaking', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(58, 'Sales', 'sales-2', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(59, 'Quality Assurance', 'quality-assurance', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(60, 'Figma', 'figma', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(61, 'Sketch', 'sketch-2', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(62, 'Adobe XD', 'adobe-xd', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(63, 'React.js', 'react-js', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(64, 'Angular', 'angular', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(65, 'Vue.js', 'vue-js', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(66, 'Node.js', 'node-js', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(67, 'Django', 'django', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(68, 'Flask', 'flask', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(69, 'Ruby on Rails', 'ruby-on-rails', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(70, 'ASP.NET', 'asp-net', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(71, 'React Native', 'react-native', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(72, 'Flutter', 'flutter', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(73, 'Xamarin', 'xamarin', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(74, 'Swift (iOS)', 'swift-ios', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(75, 'Kotlin (Android)', 'kotlin-android', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(76, 'Social Media Management', 'social-media-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(77, 'SEO (Search Engine Optimization)', 'seo-search-engine-optimization', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(78, 'Supply Chain Management', 'supply-chain-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(79, 'Public Relations', 'public-relations', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(80, 'Risk Management', 'risk-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(81, 'Coaching/Mentoring', 'coaching-mentoring', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(82, 'Learning Agility', 'learning-agility', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(83, 'Crisis Management', 'crisis-management', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(84, 'Health and Wellness', 'health-and-wellness', '2024-02-07 23:36:44', '2024-02-07 23:36:44'),
	(85, 'Cultural Competence', 'cultural-competence', '2024-02-07 23:36:44', '2024-02-07 23:36:44');

-- Dumping structure for table job_portal.social_icons
DROP TABLE IF EXISTS `social_icons`;
CREATE TABLE IF NOT EXISTS `social_icons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.social_icons: ~4 rows (approximately)
DELETE FROM `social_icons`;
INSERT INTO `social_icons` (`id`, `icon`, `url`, `created_at`, `updated_at`) VALUES
	(1, 'fab fa-facebook-f', 'https://www.facebook.com/', '2024-02-09 04:11:04', '2024-02-09 04:11:04'),
	(2, 'fab fa-instagram', 'https://www.twitch.tv/', '2024-02-09 04:11:18', '2024-02-09 04:11:18'),
	(3, 'fab fa-twitch', 'https://www.twitch.tv/', '2024-02-09 04:11:28', '2024-02-09 04:11:28'),
	(4, 'fab fa-twitter', 'https://www.twitch.tv/', '2024-02-09 04:11:45', '2024-02-09 04:11:45');

-- Dumping structure for table job_portal.states
DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.states: ~2 rows (approximately)
DELETE FROM `states`;
INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
	(5233, 'California', 260, '2024-02-08 00:50:11', '2024-02-08 00:50:11'),
	(5234, 'Texas', 260, '2024-02-08 00:50:24', '2024-02-08 00:50:24'),
	(5235, 'New York', 260, '2024-02-08 00:50:33', '2024-02-08 00:50:33');

-- Dumping structure for table job_portal.subscribers
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.subscribers: ~0 rows (approximately)
DELETE FROM `subscribers`;
INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'testuser@gmail.com', '2024-02-09 04:26:01', '2024-02-09 04:26:01');

-- Dumping structure for table job_portal.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.tags: ~20 rows (approximately)
DELETE FROM `tags`;
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'remote-friendly', 'remote-friendly', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(2, 'fully-distributed', 'fully-distributed', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(3, 'software-development', 'software-development', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(4, 'data-science', 'data-science', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(5, 'cybersecurity', 'cybersecurity', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(6, 'cloud-computing', 'cloud-computing', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(7, 'open-source-experience', 'open-source-experience', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(8, 'agile-methodology', 'agile-methodology', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(9, 'strong-communication-skills', 'strong-communication-skills', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(10, 'time-zone-flexibility', 'time-zone-flexibility', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(11, 'global-collaboration', 'global-collaboration', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(12, 'startup-environment', 'startup-environment', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(13, 'work-life-balance', 'work-life-balance', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(14, 'continuous-learning', 'continuous-learning', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(15, 'competitive-benefits', 'competitive-benefits', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(16, 'equity-compensation', 'equity-compensation', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(17, 'high-growth-opportunity', 'high-growth-opportunity', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(18, 'diverse-and-inclusive', 'diverse-and-inclusive', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(19, 'positive-company-culture', 'positive-company-culture', '2024-02-08 22:30:37', '2024-02-08 22:30:37'),
	(20, 'impactful-work', 'impactful-work', '2024-02-08 22:30:37', '2024-02-08 22:30:37');

-- Dumping structure for table job_portal.team_sizes
DROP TABLE IF EXISTS `team_sizes`;
CREATE TABLE IF NOT EXISTS `team_sizes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.team_sizes: ~10 rows (approximately)
DELETE FROM `team_sizes`;
INSERT INTO `team_sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Only Me', 'only-me', NULL, NULL),
	(2, '1-5 Members', '1-5-members', NULL, NULL),
	(3, '5-10 Members', '5-10-members', NULL, NULL),
	(4, '10-20 Members', '10-20-members', NULL, NULL),
	(5, '20-50 Members', '20-50-members', NULL, NULL),
	(6, '50-100 Members', '50-100-members', NULL, NULL),
	(7, '100-200 Members', '100-200-members', NULL, NULL),
	(8, '200-300 Members', '200-300-members', NULL, NULL),
	(9, '300-400 Members', '300-400-members', NULL, NULL),
	(10, '500+ Members', '500-members', NULL, NULL);

-- Dumping structure for table job_portal.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/default-uploads/avatar.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('company','candidate') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'candidate',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.users: ~41 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `image`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Fleur Stevenson', '/default-uploads/avatar.png', 'candidate@gmail.com', NULL, 'candidate', '$2y$12$emm8TiuImnTh2NnoDwKI1OqlZK6uuo/FBpNcv7RVN3xyW0Uvp7G5a', NULL, '2024-02-07 23:23:55', '2024-02-07 23:23:55'),
	(2, 'Torrance Eichmann', '/default-uploads/avatar.png', 'mckenzie.alvis@gmail.com', NULL, 'candidate', '$2y$12$uigaYQMUxXMd0WAolzQ3Z.M65jHH5cN4RFoX7tdZkxVX09RgqCT0y', NULL, '2024-02-08 01:06:38', '2024-02-08 01:06:38'),
	(3, 'Prof. Kattie Herzog', '/default-uploads/avatar.png', 'hilpert.meggie@gmail.com', NULL, 'candidate', '$2y$12$62W/CMAjAEqUTm6dgCTXYO5o2eSeUT9Ffoovazm41aYBCTgRmFewC', NULL, '2024-02-08 01:06:38', '2024-02-08 01:06:38'),
	(4, 'Prof. Tyler Bayer', '/default-uploads/avatar.png', 'murray.claudie@gmail.com', NULL, 'candidate', '$2y$12$H1F.ZdOLdcucxrofVjiGaO533Lz1Twj/yoDBlo73X8ZvQo2YS748C', NULL, '2024-02-08 01:06:39', '2024-02-08 01:06:39'),
	(5, 'Filiberto McCullough', '/default-uploads/avatar.png', 'dion67@bartell.com', NULL, 'candidate', '$2y$12$Zw18MuqlpPE9TfH5ZYGo5.K8TqXHl6AXjK6j1A2dCevER5H2vGWnq', NULL, '2024-02-08 01:06:39', '2024-02-08 01:06:39'),
	(6, 'Bradly Fadel', '/default-uploads/avatar.png', 'harris.tabitha@frami.net', NULL, 'candidate', '$2y$12$Jcd5afGaqfypZ5ECwmX8vejVBi0c9XKwRcy5cJ1YBsn.RZVzb5PW6', NULL, '2024-02-08 01:06:39', '2024-02-08 01:06:39'),
	(7, 'Elna Prohaska', '/default-uploads/avatar.png', 'abernathy.davon@medhurst.org', NULL, 'candidate', '$2y$12$P2y6nBuwmRIE7ydTq3vz8OGXB6YSW2gFK7zOgKNPth3ZYsXDOXPe2', NULL, '2024-02-08 01:06:40', '2024-02-08 01:06:40'),
	(8, 'Alexandro Reilly III', '/default-uploads/avatar.png', 'terrance50@gmail.com', NULL, 'candidate', '$2y$12$NKriQuepWYP0YSIkr45OE.SMeO/OlNucrVJ2hIQyC8fLvNcLY6sKW', NULL, '2024-02-08 01:06:40', '2024-02-08 01:06:40'),
	(9, 'Napoleon Wiegand', '/default-uploads/avatar.png', 'kdavis@gmail.com', NULL, 'candidate', '$2y$12$SU7BWV9Q2Y9X7y/29TJHyeZbyqoTyctUXnWf7Vr2R36n9ken91v2m', NULL, '2024-02-08 01:06:40', '2024-02-08 01:06:40'),
	(10, 'Prof. Misael Howell V', '/default-uploads/avatar.png', 'hodkiewicz.angelina@grady.com', NULL, 'candidate', '$2y$12$ZzU0uPxyGrTUVFj.ca21Je0uuphZirZkIUwRt56wUmsNahQI3QLS.', NULL, '2024-02-08 01:06:40', '2024-02-08 01:06:40'),
	(11, 'Prof. Domenico O\'Reilly', '/default-uploads/avatar.png', 'elyse51@hotmail.com', NULL, 'candidate', '$2y$12$n3GjZLPqVKK0O8ZttEF5t.BILn8UfsLmaYHCGXahys4GLPTXYw9le', NULL, '2024-02-08 01:06:41', '2024-02-08 01:06:41'),
	(12, 'Sofia Kuvalis', '/default-uploads/avatar.png', 'amos39@will.com', NULL, 'candidate', '$2y$12$JZt7nA5DQdRHmBeyGoj6xO.lbvIBTyM92oX80RtM65manjGC3OW.K', NULL, '2024-02-08 01:06:41', '2024-02-08 01:06:41'),
	(13, 'Eryn Bartell', '/default-uploads/avatar.png', 'nienow.alberto@hotmail.com', NULL, 'candidate', '$2y$12$r1o2j2j80sg4BE3Cm3VFQeQF3yz5wr8hmNZk4aANR9h0hBeLtPA66', NULL, '2024-02-08 01:06:41', '2024-02-08 01:06:41'),
	(14, 'Rita Dickinson DDS', '/default-uploads/avatar.png', 'shanon39@hotmail.com', NULL, 'candidate', '$2y$12$p/15VX.xISxfh0m/MWlkqe/gPwA0NWGIegLijhAuq1b0lFv4rMRsa', NULL, '2024-02-08 01:06:42', '2024-02-08 01:06:42'),
	(15, 'Sanford Hill', '/default-uploads/avatar.png', 'hauck.lue@bartell.com', NULL, 'candidate', '$2y$12$lAeh6Bdwg8cp.Uj/CZlyv.O9ABD7GJjJKwGD/jJhhjnR3mMCC8tUW', NULL, '2024-02-08 01:06:42', '2024-02-08 01:06:42'),
	(16, 'Dr. Nikko Becker II', '/default-uploads/avatar.png', 'upton.bartholome@haley.info', NULL, 'candidate', '$2y$12$xXNfCCklqz2EgFm9ltxaoe5IGm/j4SLIBu7Ff/4hKPV2DQ1G7NBPe', NULL, '2024-02-08 01:06:42', '2024-02-08 01:06:42'),
	(17, 'Dr. Michael Gutkowski', '/default-uploads/avatar.png', 'bernhard.demetris@lesch.biz', NULL, 'candidate', '$2y$12$cckavZF3LTHbrafZpparU.XSXvtWjLPVOx7JJ92hYBqYU45qDHloC', NULL, '2024-02-08 01:06:42', '2024-02-08 01:06:42'),
	(18, 'Clemens Fisher I', '/default-uploads/avatar.png', 'keegan.lang@cassin.net', NULL, 'candidate', '$2y$12$HXGHd4F.MaxlC5KKcXXeHuHuRNOYw7cGVKUKvpcD7wYfh55LQ9Ity', NULL, '2024-02-08 01:06:43', '2024-02-08 01:06:43'),
	(19, 'Dr. Gus Green', '/default-uploads/avatar.png', 'henry66@gmail.com', NULL, 'candidate', '$2y$12$ahgHdhKJ860nWf6u5HQ71Oebopr6FxO.q5h0NOz1AIbVBKwciCp0q', NULL, '2024-02-08 01:06:43', '2024-02-08 01:06:43'),
	(20, 'Prof. Elwin Hintz DVM', '/default-uploads/avatar.png', 'maureen52@auer.com', NULL, 'candidate', '$2y$12$m4pSz5QXRt1sGMvdSrHYIu3CqdkXz1EKyYgzJ4oqYnVndlIEPnCKK', NULL, '2024-02-08 01:06:43', '2024-02-08 01:06:43'),
	(21, 'Noemi Bruen', '/default-uploads/avatar.png', 'jerde.maynard@yahoo.com', NULL, 'candidate', '$2y$12$WwQsRCbHcFumpnTp4GuJcu2Fux8vL.lBvuxm0v3WXcNsE8dj.Crdq', NULL, '2024-02-08 01:06:44', '2024-02-08 01:06:44'),
	(22, 'Mya Hauck', '/default-uploads/avatar.png', 'company@gmail.com', NULL, 'company', '$2y$12$ihXkKtItdgkBtiGOCFOajOgMEfbF9U8l6cozympu8QtUj/Dsx.s7e', NULL, '2024-02-08 03:53:38', '2024-02-08 03:53:38'),
	(23, 'Francesca Marks', '/default-uploads/avatar.png', 'kking@dach.net', NULL, 'company', '$2y$12$xyLnl0YZJ5bObOfbCMOmSOaWajPwpeiKyiiWYMrDrsIpntR6KPynu', NULL, '2024-02-08 03:53:38', '2024-02-08 03:53:38'),
	(24, 'Lonnie Zemlak', '/default-uploads/avatar.png', 'adrienne.johnson@abshire.biz', NULL, 'company', '$2y$12$mbxmWG7J6v/nlo266t3mSeyL7AWr31mGRhiugiftm6bbTfiKMpcDG', NULL, '2024-02-08 03:53:39', '2024-02-08 03:53:39'),
	(25, 'Prof. Everett Abshire', '/default-uploads/avatar.png', 'dkuvalis@ledner.com', NULL, 'company', '$2y$12$K43eE4E36lFH6LqL73lUIehS21puvqNXzBAnqdKoX6DQpZNXxFCFq', NULL, '2024-02-08 03:53:39', '2024-02-08 03:53:39'),
	(26, 'Cristian Lesch', '/default-uploads/avatar.png', 'kemmer.clair@hotmail.com', NULL, 'company', '$2y$12$0JJTkTqbbYrKOaN9JWJt6uWtFXqNMEhe/56DKewIhhc2YE1INjSg.', NULL, '2024-02-08 03:53:39', '2024-02-08 03:53:39'),
	(27, 'Clementine Barton II', '/default-uploads/avatar.png', 'dkirlin@keebler.net', NULL, 'company', '$2y$12$bK3Z/HT3lM31suWioaUrwexbGn0oVVOswdcvit13UwUTCCuIu7Amy', NULL, '2024-02-08 03:53:40', '2024-02-08 03:53:40'),
	(28, 'Susie Boyle', '/default-uploads/avatar.png', 'fhand@rempel.org', NULL, 'company', '$2y$12$FGJBxSJG9hxtzhuf5jqx..0Vz7WKtj9v1FetRKdXDFLCOUtumce..', NULL, '2024-02-08 03:53:40', '2024-02-08 03:53:40'),
	(29, 'Adolphus Balistreri', '/default-uploads/avatar.png', 'madie.gleason@yahoo.com', NULL, 'company', '$2y$12$tLaUSrIytThrIopTmNvID.hv31hjEKZzcIrwlta73T4pfPscU0tZO', NULL, '2024-02-08 03:53:40', '2024-02-08 03:53:40'),
	(30, 'Fiona Ledner', '/default-uploads/avatar.png', 'mathilde25@lueilwitz.info', NULL, 'company', '$2y$12$2Iz0LhutbDNDCytb0Gu6RexH9cMbgC1ccNtNdc9yTJAKlGuOZCEza', NULL, '2024-02-08 03:53:40', '2024-02-08 03:53:40'),
	(31, 'Prof. Oren Anderson II', '/default-uploads/avatar.png', 'waino.lind@hotmail.com', NULL, 'company', '$2y$12$MpdR4A8QvQxvz/Z.xQWYAudLWpIMO.0qP05gLNVqZJAEkB/iGa5/G', NULL, '2024-02-08 03:53:41', '2024-02-08 03:53:41'),
	(32, 'Ms. Isabelle Grant', '/default-uploads/avatar.png', 'agoodwin@haag.org', NULL, 'company', '$2y$12$DPixN9QrU985sEg9IhXJ9O4NuQoWOXtaEgmzhctejkiqgpge7OzpK', NULL, '2024-02-08 03:53:41', '2024-02-08 03:53:41'),
	(33, 'Litzy Donnelly', '/default-uploads/avatar.png', 'heidi.pfannerstill@kuhic.com', NULL, 'company', '$2y$12$r/WDzlGRGARt8ufra50GHuzDdotC6G2pN/8W9NeHQQw..tlIBYcIy', NULL, '2024-02-08 03:53:41', '2024-02-08 03:53:41'),
	(34, 'Lexus Crona', '/default-uploads/avatar.png', 'bins.abdul@hotmail.com', NULL, 'company', '$2y$12$RurK6XxgqjDl2170PT2OIONhXb2gR97WIGZkD9qRugmE7LUTnm/nq', NULL, '2024-02-08 03:53:42', '2024-02-08 03:53:42'),
	(35, 'Prof. Lexie Crist', '/default-uploads/avatar.png', 'qbode@rau.com', NULL, 'company', '$2y$12$fnULHjcNHh6KmCNJbHMm7ummRe/o3oRRMLZqMxBpn9ho.ZrWfVo7e', NULL, '2024-02-08 03:53:42', '2024-02-08 03:53:42'),
	(36, 'Darrick Shanahan', '/default-uploads/avatar.png', 'ozella86@turcotte.com', NULL, 'company', '$2y$12$mxe.mX0ukLYIDti023WqZ.FLvw2veSPOl7xpzwIeDNxsjXds2PMwO', NULL, '2024-02-08 03:53:42', '2024-02-08 03:53:42'),
	(37, 'Tomasa Crist', '/default-uploads/avatar.png', 'ggutmann@stroman.biz', NULL, 'company', '$2y$12$mUnbBfiBBOk.TZUStC8PZ.AzYO.dHlMpQmn9pFVzDwDSau3WzBK72', NULL, '2024-02-08 03:53:43', '2024-02-08 03:53:43'),
	(38, 'Johann Kris', '/default-uploads/avatar.png', 'apollich@hotmail.com', NULL, 'company', '$2y$12$wfqfhhN1Fzv9ulrE14/LCu.DFAIzrLnqO6MKeziCCZVxwzs1QluNS', NULL, '2024-02-08 03:53:43', '2024-02-08 03:53:43'),
	(39, 'Dr. Dusty Block IV', '/default-uploads/avatar.png', 'brandy37@stehr.com', NULL, 'company', '$2y$12$8Bn/8zRMmlGx4m8qHIPwBO.jfHm82bpeYn21wZ8wYXLgABR/aywNS', NULL, '2024-02-08 03:53:43', '2024-02-08 03:53:43'),
	(40, 'Aurelie Stroman', '/default-uploads/avatar.png', 'lea55@gmail.com', NULL, 'company', '$2y$12$6Nm0uHXbRJtKEfPEup6LceodFKwN2y9hJIctTxqLc268qNJYauqAy', NULL, '2024-02-08 03:53:43', '2024-02-08 03:53:43'),
	(41, 'Sedrick Kessler', '/default-uploads/avatar.png', 'desiree74@gibson.com', NULL, 'company', '$2y$12$bZaCP9DGYhpqp1bNtEBViewfBBN7ifmtMGM46jXlmBq/r2gDdRaaG', NULL, '2024-02-08 03:53:44', '2024-02-08 03:53:44');

-- Dumping structure for table job_portal.user_plans
DROP TABLE IF EXISTS `user_plans`;
CREATE TABLE IF NOT EXISTS `user_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `job_limit` int NOT NULL DEFAULT '0',
  `featured_job_limit` int NOT NULL DEFAULT '0',
  `highlight_job_limit` int NOT NULL DEFAULT '0',
  `profile_verified` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_plans_company_id_foreign` (`company_id`),
  CONSTRAINT `user_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.user_plans: ~2 rows (approximately)
DELETE FROM `user_plans`;
INSERT INTO `user_plans` (`id`, `company_id`, `plan_id`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `profile_verified`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 13, 5, 6, 1, '2024-02-08 22:15:20', '2024-02-08 22:37:06'),
	(2, 2, 3, 12, 4, 5, 1, '2024-02-08 22:51:17', '2024-02-08 23:04:23'),
	(3, 3, 3, 2, 2, 7, 1, '2024-02-08 23:10:23', '2024-02-08 23:53:15');

-- Dumping structure for table job_portal.why_choose_us
DROP TABLE IF EXISTS `why_choose_us`;
CREATE TABLE IF NOT EXISTS `why_choose_us` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table job_portal.why_choose_us: ~0 rows (approximately)
DELETE FROM `why_choose_us`;
INSERT INTO `why_choose_us` (`id`, `icon_one`, `title_one`, `sub_title_one`, `icon_two`, `title_two`, `sub_title_two`, `icon_three`, `title_three`, `sub_title_three`, `created_at`, `updated_at`) VALUES
	(1, 'fas fa-dollar-sign', 'Cost Effective', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do', 'fas fa-check', 'Easy to Use', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do', 'fas fa-award', 'Quality Candidate', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do', '2024-02-09 03:14:36', '2024-02-09 03:14:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
