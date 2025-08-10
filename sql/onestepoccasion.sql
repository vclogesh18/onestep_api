-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 10, 2025 at 07:02 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onestepoccasion`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `balance_pending` decimal(24,2) NOT NULL DEFAULT 0.00,
  `received_balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `account_payable` decimal(24,2) NOT NULL DEFAULT 0.00,
  `account_receivable` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_expense` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `balance_pending`, `received_balance`, `account_payable`, `account_receivable`, `total_withdrawn`, `total_expense`, `created_at`, `updated_at`) VALUES
('83d9168d-dfcd-423f-aa9b-cddda021249d', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-06-25 15:53:26', '2023-06-25 15:53:26'),
('95f5655c-ba2d-40da-a780-d9b078a6e98e', 'ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2025-06-10 07:18:47', '2025-06-10 07:18:47'),
('c79da936-e848-4114-82f4-7553a9776bc2', '8ea23f49-a5ba-4938-828d-19d275158a90', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-11-06 23:41:43', '2023-11-06 23:41:43'),
('e051abae-0e2d-494e-b54b-94499e4a4deb', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 0.00, 5100.00, 1200.00, 0.00, 0.00, 0.00, '2023-06-25 16:33:45', '2023-08-09 03:03:34'),
('ec3daf60-3970-41f0-a539-941e64ce7358', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, '2023-06-25 03:24:19', '2023-08-09 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `added_to_carts`
--

CREATE TABLE `added_to_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `service_id` char(36) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `added_to_carts`
--

INSERT INTO `added_to_carts` (`id`, `user_id`, `service_id`, `count`, `created_at`, `updated_at`) VALUES
(1, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 8, '2023-06-25 16:17:27', '2023-06-25 21:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` char(36) NOT NULL,
  `provider_id` char(36) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch_name` varchar(191) DEFAULT NULL,
  `acc_no` varchar(191) DEFAULT NULL,
  `acc_holder_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `routing_number` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` char(36) NOT NULL,
  `banner_title` varchar(191) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` char(36) DEFAULT NULL,
  `redirect_link` varchar(191) DEFAULT NULL,
  `banner_image` varchar(255) NOT NULL DEFAULT 'def.png',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` char(36) NOT NULL,
  `readable_id` bigint(20) NOT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `zone_id` char(36) DEFAULT NULL,
  `booking_status` varchar(255) NOT NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cash',
  `transaction_id` varchar(255) DEFAULT NULL,
  `total_booking_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_tax_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `service_schedule` datetime DEFAULT NULL,
  `service_address_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `sub_category_id` char(36) DEFAULT NULL,
  `serviceman_id` char(36) DEFAULT NULL,
  `total_campaign_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_coupon_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `coupon_code` varchar(255) DEFAULT NULL,
  `is_checked` tinyint(1) NOT NULL DEFAULT 0,
  `additional_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `additional_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `additional_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `additional_campaign_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `readable_id`, `customer_id`, `provider_id`, `zone_id`, `booking_status`, `is_paid`, `payment_method`, `transaction_id`, `total_booking_amount`, `total_tax_amount`, `total_discount_amount`, `service_schedule`, `service_address_id`, `created_at`, `updated_at`, `category_id`, `sub_category_id`, `serviceman_id`, `total_campaign_discount_amount`, `total_coupon_discount_amount`, `coupon_code`, `is_checked`, `additional_charge`, `additional_tax_amount`, `additional_discount_amount`, `additional_campaign_discount_amount`) VALUES
('0ecbd569-0029-4dc6-aa69-efe704e93c7c', 100001, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'completed', 1, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-25 20:32:05', '2', '2023-06-25 17:32:21', '2023-08-09 02:57:59', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('1abe02e8-7b1f-4a68-a002-950bf6548283', 100006, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'accepted', 0, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-30 21:38:00', '2', '2023-06-25 21:29:35', '2023-06-25 21:38:14', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('2d2dc835-9b72-4130-be8e-b9ba02af8f37', 100003, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'completed', 1, 'cash_after_service', 'cash-payment', 2100.000, 100.000, 0.000, '2023-06-26 00:21:39', '2', '2023-06-25 21:21:44', '2023-08-09 03:03:01', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('4546f41f-d0ca-495c-b6ab-d018410a1705', 100004, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'completed', 1, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-26 00:24:07', '2', '2023-06-25 21:24:11', '2023-08-09 03:02:32', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('541c733f-d9e2-4143-8dd8-d395f0edaa8d', 100002, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'completed', 1, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-25 22:12:08', '2', '2023-06-25 19:12:18', '2023-08-09 03:03:34', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('64ac2813-450d-485e-a357-b072166459f2', 100005, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'completed', 1, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-26 00:26:12', '2', '2023-06-25 21:26:15', '2023-08-09 03:02:00', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00),
('792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', 100000, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'canceled', 0, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-25 19:17:31', '2', '2023-06-25 16:20:45', '2023-06-25 19:15:58', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 1, 0.00, 0.00, 0.00, 0.00),
('abb166c9-52cf-415e-bbfd-4493421e76b7', 100007, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'accepted', 0, 'cash_after_service', 'cash-payment', 1050.000, 50.000, 0.000, '2023-06-26 00:33:09', '2', '2023-06-25 21:33:12', '2023-06-25 21:37:42', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', NULL, 0.000, 0.000, NULL, 0, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `variant_key` varchar(255) DEFAULT NULL,
  `service_cost` decimal(24,3) NOT NULL DEFAULT 0.000,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `tax_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_cost` decimal(24,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campaign_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `overall_coupon_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `service_id`, `service_name`, `variant_key`, `service_cost`, `quantity`, `discount_amount`, `tax_amount`, `total_cost`, `created_at`, `updated_at`, `campaign_discount_amount`, `overall_coupon_discount_amount`) VALUES
(1, '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 16:20:45', '2023-06-25 16:20:45', 0.000, 0.000),
(2, '0ecbd569-0029-4dc6-aa69-efe704e93c7c', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 17:32:21', '2023-06-25 17:32:21', 0.000, 0.000),
(3, '541c733f-d9e2-4143-8dd8-d395f0edaa8d', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 19:12:18', '2023-06-25 19:12:18', 0.000, 0.000),
(4, '2d2dc835-9b72-4130-be8e-b9ba02af8f37', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 2, 0.000, 100.000, 2100.000, '2023-06-25 21:21:44', '2023-06-25 21:21:44', 0.000, 0.000),
(5, '4546f41f-d0ca-495c-b6ab-d018410a1705', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 21:24:11', '2023-06-25 21:24:11', 0.000, 0.000),
(6, '64ac2813-450d-485e-a357-b072166459f2', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 21:26:15', '2023-06-25 21:26:15', 0.000, 0.000),
(7, '1abe02e8-7b1f-4a68-a002-950bf6548283', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 21:29:35', '2023-06-25 21:29:35', 0.000, 0.000),
(8, 'abb166c9-52cf-415e-bbfd-4493421e76b7', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Balloon-Party', 1000.000, 1, 0.000, 50.000, 1050.000, '2023-06-25 21:33:12', '2023-06-25 21:33:12', 0.000, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `booking_details_amounts`
--

CREATE TABLE `booking_details_amounts` (
  `id` char(36) NOT NULL,
  `booking_details_id` char(36) NOT NULL,
  `booking_id` char(36) NOT NULL,
  `service_unit_cost` decimal(24,2) NOT NULL DEFAULT 0.00,
  `service_quantity` int(11) NOT NULL DEFAULT 0,
  `service_tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_by_admin` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_by_provider` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_by_admin` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_by_provider` decimal(24,2) NOT NULL DEFAULT 0.00,
  `campaign_discount_by_admin` decimal(24,2) NOT NULL DEFAULT 0.00,
  `campaign_discount_by_provider` decimal(24,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(24,2) NOT NULL DEFAULT 0.00,
  `provider_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_details_amounts`
--

INSERT INTO `booking_details_amounts` (`id`, `booking_details_id`, `booking_id`, `service_unit_cost`, `service_quantity`, `service_tax`, `discount_by_admin`, `discount_by_provider`, `coupon_discount_by_admin`, `coupon_discount_by_provider`, `campaign_discount_by_admin`, `campaign_discount_by_provider`, `admin_commission`, `provider_earning`, `created_at`, `updated_at`) VALUES
('2038a146-0400-4f26-bb8b-d2766116ad28', '7', '1abe02e8-7b1f-4a68-a002-950bf6548283', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-06-25 21:29:35', '2023-06-25 21:29:35'),
('4326694b-210e-4b7c-a018-2c5a5ca4aec2', '2', '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 850.00, '2023-06-25 17:32:21', '2023-08-09 02:57:59'),
('98f6427f-7db7-4fc3-a7e0-620510473390', '8', 'abb166c9-52cf-415e-bbfd-4493421e76b7', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-06-25 21:33:12', '2023-06-25 21:33:12'),
('9a0a1dc5-5a24-4da2-a9d9-42b5e210f590', '1', '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-06-25 16:20:45', '2023-06-25 16:20:45'),
('c86f274d-527d-495d-931f-41be030e1192', '3', '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 850.00, '2023-06-25 19:12:18', '2023-08-09 03:03:34'),
('d5c056c7-041c-4dd9-9380-821b41da6c93', '5', '4546f41f-d0ca-495c-b6ab-d018410a1705', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 850.00, '2023-06-25 21:24:11', '2023-08-09 03:02:32'),
('d79e6585-332e-41df-bb59-c880a14a0a96', '4', '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 1000.00, 2, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 1700.00, '2023-06-25 21:21:44', '2023-08-09 03:03:01'),
('f76ee9ec-2a69-4b0a-9809-42985d6e866c', '6', '64ac2813-450d-485e-a357-b072166459f2', 1000.00, 1, 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 850.00, '2023-06-25 21:26:15', '2023-08-09 03:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `booking_schedule_histories`
--

CREATE TABLE `booking_schedule_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` char(36) NOT NULL,
  `changed_by` char(36) NOT NULL,
  `schedule` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_schedule_histories`
--

INSERT INTO `booking_schedule_histories` (`id`, `booking_id`, `changed_by`, `schedule`, `created_at`, `updated_at`) VALUES
(1, '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-25 19:17:31', '2023-06-25 16:20:45', '2023-06-25 16:20:45'),
(2, '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-25 20:32:05', '2023-06-25 17:32:21', '2023-06-25 17:32:21'),
(3, '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-25 22:12:08', '2023-06-25 19:12:18', '2023-06-25 19:12:18'),
(4, '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-26 00:21:39', '2023-06-25 21:21:44', '2023-06-25 21:21:44'),
(5, '4546f41f-d0ca-495c-b6ab-d018410a1705', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-26 00:24:07', '2023-06-25 21:24:11', '2023-06-25 21:24:11'),
(6, '64ac2813-450d-485e-a357-b072166459f2', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-26 00:26:12', '2023-06-25 21:26:15', '2023-06-25 21:26:15'),
(7, '1abe02e8-7b1f-4a68-a002-950bf6548283', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-26 00:29:33', '2023-06-25 21:29:35', '2023-06-25 21:29:35'),
(8, 'abb166c9-52cf-415e-bbfd-4493421e76b7', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2023-06-26 00:33:09', '2023-06-25 21:33:12', '2023-06-25 21:33:12'),
(9, '1abe02e8-7b1f-4a68-a002-950bf6548283', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-06-30 21:38:00', '2023-06-25 21:38:14', '2023-06-25 21:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `booking_status_histories`
--

CREATE TABLE `booking_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` char(36) NOT NULL,
  `changed_by` char(36) NOT NULL,
  `booking_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_status_histories`
--

INSERT INTO `booking_status_histories` (`id`, `booking_id`, `changed_by`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', 'pending', '2023-06-25 16:20:45', '2023-06-25 16:20:45'),
(2, '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-06-25 16:49:22', '2023-06-25 16:49:22'),
(3, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 'pending', '2023-06-25 17:32:21', '2023-06-25 17:32:21'),
(4, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 'pending', '2023-06-25 19:12:18', '2023-06-25 19:12:18'),
(5, '792d72e6-4521-49a6-bfa2-fbd8ebb7bb62', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', 'canceled', '2023-06-25 19:15:58', '2023-06-25 19:15:58'),
(6, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 'pending', '2023-06-25 21:21:44', '2023-06-25 21:21:44'),
(7, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '4546f41f-d0ca-495c-b6ab-d018410a1705', 'pending', '2023-06-25 21:24:11', '2023-06-25 21:24:11'),
(8, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '64ac2813-450d-485e-a357-b072166459f2', 'pending', '2023-06-25 21:26:15', '2023-06-25 21:26:15'),
(9, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '1abe02e8-7b1f-4a68-a002-950bf6548283', 'pending', '2023-06-25 21:29:35', '2023-06-25 21:29:35'),
(10, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', 'abb166c9-52cf-415e-bbfd-4493421e76b7', 'pending', '2023-06-25 21:33:12', '2023-06-25 21:33:12'),
(11, 'abb166c9-52cf-415e-bbfd-4493421e76b7', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-06-25 21:37:42', '2023-06-25 21:37:42'),
(12, '1abe02e8-7b1f-4a68-a002-950bf6548283', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-06-25 21:37:55', '2023-06-25 21:37:55'),
(13, '0ecbd569-0029-4dc6-aa69-efe704e93c7c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-08-09 02:48:24', '2023-08-09 02:48:24'),
(14, '0ecbd569-0029-4dc6-aa69-efe704e93c7c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'completed', '2023-08-09 02:57:59', '2023-08-09 02:57:59'),
(15, '64ac2813-450d-485e-a357-b072166459f2', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-08-09 03:01:53', '2023-08-09 03:01:53'),
(16, '64ac2813-450d-485e-a357-b072166459f2', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'completed', '2023-08-09 03:02:00', '2023-08-09 03:02:00'),
(17, '4546f41f-d0ca-495c-b6ab-d018410a1705', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-08-09 03:02:25', '2023-08-09 03:02:25'),
(18, '4546f41f-d0ca-495c-b6ab-d018410a1705', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'completed', '2023-08-09 03:02:32', '2023-08-09 03:02:32'),
(19, '2d2dc835-9b72-4130-be8e-b9ba02af8f37', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-08-09 03:02:55', '2023-08-09 03:02:55'),
(20, '2d2dc835-9b72-4130-be8e-b9ba02af8f37', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'completed', '2023-08-09 03:03:01', '2023-08-09 03:03:01'),
(21, '541c733f-d9e2-4143-8dd8-d395f0edaa8d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'accepted', '2023-08-09 03:03:28', '2023-08-09 03:03:28'),
(22, '541c733f-d9e2-4143-8dd8-d395f0edaa8d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'completed', '2023-08-09 03:03:34', '2023-08-09 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` char(36) NOT NULL COMMENT '(DC2Type:guid)',
  `key_name` varchar(191) DEFAULT NULL,
  `live_values` longtext DEFAULT NULL,
  `test_values` longtext DEFAULT NULL,
  `settings_type` varchar(255) DEFAULT NULL,
  `mode` varchar(20) NOT NULL DEFAULT 'live',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`) VALUES
('0098459d-9115-4c58-a6f8-becc65d3cb97', 'service_section_image', '\"2022-10-04-633bfb7862d95.png\"', '\"2022-10-04-633bfb7862d95.png\"', 'landing_images', 'live', 0, '2022-10-03 17:37:21', '2022-10-04 16:23:04'),
('01b2c108-18fe-4ad0-8693-04be1bfa59aa', 'cancellation_policy', '\"<p>Privacy and Confidentialit<\\/p>\\r\\n\\r\\n<p>Test12345hhhh jhjhjhjh<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Welcome to the daraz.com.bd website (the \\\\&quot;Site\\\\&quot;) operated by Daraz Bangladesh Ltd. , We respect your privacy and want to protect your personal information. To learn more, please read this Privacy Policy.<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<ol>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>This Privacy Policy explains how we collect, use and (under certain conditions) disclose your personal information. This Privacy Policy also explains the steps we have taken to secure your personal information. Finally, this Privacy Policy explains your options regarding the collection, use and disclosure of your personal information. By visiting the Site directly or through another site, you accept the practices described in this Policy.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Data protection is a matter of trust and your privacy is important to us. We shall therefore only use your name and other information which relates to you in the manner set out in this Privacy Policy. We will only collect information where it is necessary for us to do so and we will only collect information if it is relevant to our dealings with you.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>We will only keep your information for as long as we are either required to by law or as is relevant for the purposes for which it was collected.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>We will cease to retain your personal data, or remove the means by which the data can be associated with you, as soon as it is reasonable to assume that such retention no longer serves the purposes for which the personal data was collected, and is no longer necessary for any legal or business purpose.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>You can visit the Site and browse without having to provide personal details. During your visit to the Site you remain anonymous and at no time can we identify you unless you have an account on the Site and log on with your user name and password.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Data that we collect\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may collect various pieces of information if you seek to place an order for a product with us on the Site.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We collect, store and process your data for processing your purchase on the Site and any possible later claims, and to provide you with our services. We may collect personal information including, but not limited to, your title, name, gender, date of birth, email address, postal address, delivery address (if different), telephone number, mobile number, fax number, payment details, payment card details or bank account details.\\\\n\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>Daraz shall collect the following information where you are a buyer:\\\\n\\r\\n\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Identity data, such as your name, gender, profile picture, and date of birth;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Contact data, such as billing address, delivery address\\/location, email address and phone numbers;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Biometric data, such as voice files and face recognition when you use our voice search function, and your facial features of when you use the Site;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Billing account information: bank account details, credit card account and payment information (such account data may also be collected directly by our affiliates and\\/or third party payment service providers);<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Transaction records\\/data, such as details about orders and payments, user clicks, and other details of products and Services related to you;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Technical data, such as Internet protocol (IP) address, your login data, browser type and version, time zone setting and location, device information, browser plug-in types and versions, operating system and platform, international mobile equipment identity, device identifier, IMEI, MAC address, cookies (where applicable) and other information and technology on the devices you use to access the Site;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Profile data, such as your username and password, account settings, orders related to you, user research, your interests, preferences, feedback and survey responses;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Usage data, such as information on how you use the Site, products and Services or view any content on the Site, including the time spent on the Site, items and data searched for on the Site, access times and dates, as well as websites you were visiting before you came to the Site and other similar statistics;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Location data, such as when you capture and share your location with us in the form of photographs or videos and upload such content to the Site;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Marketing and communications data, such as your preferences in receiving marketing from us and our third parties, your communication preferences and your chat, email or call history on the Site or with third party customer service providers; and<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Additional information we may request you to submit for due diligence checks or required by relevant authorities as required for identity verification (such as copies of government issued identification, e.g. passport, ID cards, etc.) or if we believe you are violating our Privacy Policy or our Customer Terms and Conditions.<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>Daraz shall collect the following information where you are a seller:\\\\n\\r\\n\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Identity and contact data, such as your name, date of birth or incorporation, company name, address, email address, phone number and other business-related information (e.g. company registration number, business licence, tax information, shareholder and director information, etc.);<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Account data, such as bank account details, bank statements, credit card details and payment details (such account data may also be collected directly by our affiliates and\\/or third party payment service providers);<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Transaction data, such as details about orders and payments, and other details of products and Services related to you;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Technical data, such as Internet protocol (IP) address, your login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, international mobile equipment identity, device identifier, IMEI, MAC address, cookies (where applicable) and other information and technology on the devices you use to access the Site;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Profile data, such as your username and password, orders related to you, your interests, preferences, feedback and survey responses;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Usage data, such as information on how you use the Site, products and Services or view any content on the Site, including the time spent on the Site, items and data searched for on the Site, access times and dates, as well as websites you were visiting before you came to the Site and other similar statistics;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Location data, such as when you capture and share your location with us in the form of photographs or videos and upload such content to the Site;<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Marketing and communications data, such as your preferences in receiving marketing from us and our third parties and your communication preferences and your chat, email or call history on the Site or with our third party seller service providers; and<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Additional information we may request you to submit for authentication (such as copies of government issued identification, e.g. passport, ID cards, etc.) or if we believe you are violating our Privacy Policy or our Terms of Use.<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<\\/ol>\\r\\n\\t\\t\\\\n<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We will use the information you provide to enable us to process your orders and to provide you with the services and information offered through our website and which you request in the following ways:.\\\\n\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>If you are a buyer:\\\\n\\r\\n\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Processing your orders for products:\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Process orders you submit through the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Deliver the products you have purchased through the Site for which we may pass your personal information on to a third party (e.g. our logistics partner) in order to make delivery of the product to you;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Update you on the delivery of the products;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Provide customer support for your orders;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Verify and carry out payment transactions (including any credit card payments, bank transfers, offline payments, remittances, or e-wallet transactions) in relation to payments related to you and\\/or services used by you. In order to verify and carry out such payment transactions, payment information, which may include personal data, will be transferred to third parties such as our payment service providers;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Providing services\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Facilitate your use of the services or access to the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Administer your account with us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Display your name, username or profile on the Site (including on any reviews you may post);<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Respond to your queries, feedback, claims or disputes, whether directly or through our third party service providers; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Display on scoreboards on the Site in relation to campaigns, mobile games or any other activity;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Marketing and advertising:\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Provide you with information we think you may find useful or which you have requested from us (provided you have opted to receive such information);<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Send you marketing or promotional information about \\\\\\\\ products and services on the Site from time to time (provided you have opted to receive such information); and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Help us conduct marketing and advertising;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Legal and operational purposes:\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Ascertain your identity in connection with fraud detection purposes;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Compare information, and verify with third parties in order to ensure that the information is accurate;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Process any complaints, feedback, enforcement action you may have lodged with us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Produce statistics and research for internal and statutory reporting and\\/or record-keeping requirements;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Store, host, back up your personal data;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Prevent or investigate any actual or suspected violations of our Terms of Use, Privacy Policy, fraud, unlawful activity, omission or misconduct, whether relating to your use of Site or any other matter arising from your relationship with us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Perform due diligence checks;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Comply with legal and regulatory requirements (including, where applicable, the display of your name, contact details and company details), including any law enforcement requests, in connection with any legal proceedings, or otherwise deemed necessary by us; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Where necessary to prevent a threat to life, health or safety.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Analytics, research, business and development:\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Understand your user experience on the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Improve the layout or content of the pages of the Site and customize them for users;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Identify visitors on the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Conduct surveys, including carrying out research on our users&rsquo; demographics and behavior;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Derive further attributes relating to you based on personal data provided by you (whether to us or third parties), in order to provide you with more targeted and\\/or relevant information;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Conduct data analysis, testing and research, monitoring and analyzing usage and activity trends;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Further develop our products and services; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Other\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Any other purpose to which your consent has been obtained; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Conduct automated decision-making processes in accordance with any of the above purposes.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>If you are a seller:\\\\n\\r\\n\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Providing Services\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To facilitate your use of the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To ship or deliver the products you have listed or sold through the Site. We may pass your personal information on to a third party (e.g. our logistics partners) or relevant regulatory authority (e.g. customs) in order to carry out shipping or delivery of the products listed or sold by you;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To respond to your queries, feedback, claims or disputes, whether directly or through our third party service agents;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To verify your documentation submitted to us facilitate your onboarding with us as a seller on the Site, including the testing of technologies to enable faster and more efficient onboarding;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To administer your account (if any) with us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To display your name, username or profile on the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To verify and carry out financial transactions (including any credit card payments, bank transfers, offline payments, remittances, or e-wallet transactions) in relation to payments related to you and\\/or Services used by you. In order to verify and carry out such payment transactions, payment information, which may include personal data, will be transferred to third parties such as our payment service providers;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To assess your application for loan facilities and\\/or to perform credit risk assessments in relation to your application for seller financing (where applicable);<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To provide you with ancillary logistics services to protect against risks of failed deliveries or customer returns; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To facilitate the return of products to you (which may be through our logistics partner).<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Marketing and advertising\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To send you marketing or promotional materials about our or third-party sellers&rsquo; products and services on our Site from time to time (provided you have opted to receive such information); and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To help us conduct marketing and advertising.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Legal and operational purposes\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To produce statistics and research for internal and statutory reporting and\\/or record-keeping requirements;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To store, host, back up your personal data;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To prevent or investigate any actual or suspected violations of our Terms of Use, Privacy Policy, fraud, unlawful activity, omission or misconduct, whether relating to your use of our Services or any other matter arising from your relationship with us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To comply with legal and regulatory requirements (including, where applicable, the display of your name, contact details and company details), including any law enforcement requests, in connection with any legal proceedings or otherwise deemed necessary by us;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Where necessary to prevent a threat to life, health or safety;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To process any complaints, feedback, enforcement action and take-down requests in relation to any content you have uploaded to the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To compare information, and verify with third parties in order to ensure that the information is accurate;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To ascertain your identity in connection with fraud detection purposes; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To facilitate the takedown of prohibited and controlled items from our Site.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Analytics, research, business and development\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To audit the downloading of data from the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To understand the user experience with the Services and the Site;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To improve the layout or content of the pages of the Site and customise them for users;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To conduct surveys, including carrying out research on our users&rsquo; demographics and behaviour to improve our current technology (e.g. voice recognition tech, etc) via machine learning or other means;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To derive further attributes relating to you based on personal data provided by you (whether to us or third parties), in order to provide you with more targeted and\\/or relevant information;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To conduct data analysis, testing and research, monitoring and analysing usage and activity trends;<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To further develop our products and services; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To know our sellers better.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>Other\\\\n\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>Any other purpose to which your consent has been obtained; and<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>To conduct automated decision-making processes in accordance with any of these purposes.<\\/li>\\r\\n\\t\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<\\/ol>\\r\\n\\t\\t\\t\\\\n<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<\\/ol>\\r\\n\\t\\t\\\\n<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>Further, we will use the information you provide to administer your account with us; verify and carry out financial transactions in relation to payments you make; audit the downloading of data from our website; improve the layout and\\/or content of the pages of our website and customize them for users; identify visitors on our website; carry out research on our users&#39; demographics; send you information we think you may find useful or which you have requested from us, including information about our products and services, provided you have indicated that you have not objected to being contacted for these purposes.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>Subject to obtaining your consent we may contact you by email with details of other products and services. You may unsubscribe from receiving marketing information at any time in our mobile application settings or by using the unsubscribe function within the electronic marketing material. We may use your contact information to send newsletters from us and from our related companies. If you prefer not to receive any marketing communications from us, you can opt out at any time.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may pass your name and address on to a third party in order to make delivery of the product to you (for example to our courier or supplier). You must only submit to us the Site information which is accurate and not misleading and you must keep it up to date and are responsible for informing us of changes to your personal data, or in the event you believe that the personal data we have about you is inaccurate, incomplete, misleading or out of date.inform us of changes. You can update your personal data anytime by accessing your account on the Site.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>Your actual order details may be stored with us but for security reasons cannot be retrieved directly by us. However, you may access this information by logging into your account on the Site. Here you can view the details of your orders that have been completed, those which are open and those which are shortly to be dispatched and administer your address details, bank details ( for refund purposes) and any newsletter to which you may have subscribed. You undertake to treat the personal access data confidentially and not make it available to unauthorized third parties. We cannot assume any liability for misuse of passwords unless this misuse is our fault.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Other uses of your Personal Information\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may use your personal information for opinion and market research. Your details are anonymous and will only be used for statistical purposes. You can choose to opt out of this at any time. Any answers to surveys or opinion polls we may ask you to complete will not be forwarded on to third parties. Disclosing your email address is only necessary if you would like to take part in competitions. We save the answers to our surveys separately from your email address.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may also send you other information about us, the Site, our other websites, our products, sales promotions, our newsletters, anything relating to other companies in our group or our business partners. If you would prefer not to receive any of this additional information as detailed in this paragraph (or any part of it) please click the &#39;unsubscribe&#39; link in any email that we send to you. Within 7 working days (days which are neither (i) a Sunday, nor (ii) a public holiday anywhere in Bangladesh) of receipt of your instruction we will cease to send you information as requested. If your instruction is unclear we will contact you for clarification.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may further anonymize data about users of the Site generally and use it for various purposes, including ascertaining the general location of the users and usage of certain aspects of the Site or a link contained in an email to those registered to receive them, and supplying that anonymized data to third parties such as publishers. However, that anonymized data will not be capable of identifying you personally.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Competitions\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>For any competition we use the data to notify winners and advertise our offers. You can find more details where applicable in our participation terms for the respective competition.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Third Parties and Links\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may pass your details to other companies in our group. We may also pass your details to our agents and subcontractors to help us with any of our uses of your data set out in our Privacy Policy. For example, we may use third parties to assist us with delivering products to you, to help us to collect payments from you, to analyze data and to provide us with marketing or customer service assistance. We may also exchange information with third parties for the purposes of fraud protection and credit risk reduction.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may share (or permit the sharing of) your personal data with and\\/or transfer your personal data to third parties and\\/or our affiliates for the above-mentioned purposes. These third parties and affiliates, which may be located inside or outside your jurisdiction, include but are not limited to:\\\\n\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>Service providers (such as agents, vendors, contractors and partners) in areas such as payment services, logistics and shipping, marketing, data analytics, market or consumer research, survey, social media, customer service, installation services, information technology and website hosting;<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>Their service providers and related companies; and<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t\\t<li>Other users of the Site.<\\/li>\\r\\n\\t\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<\\/ol>\\r\\n\\t\\t\\\\n<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may transfer our databases containing your personal information if we sell our business or part of it, provided that we satisfy the requirements of applicable data protection law when disclosing your personal data. Other than as set out in this Privacy Policy, we shall NOT sell or disclose your personal data to third parties without obtaining your prior consent unless this is necessary for the purposes set out in this Privacy Policy or unless we are required to do so by law. The Site may contain advertising of third parties and links to other sites or frames of other sites. Please be aware that we are not responsible for the privacy practices or content of those third parties or other sites, nor for any third party to whom we transfer your data in accordance with our Privacy Policy. You are advised to check on the applicable privacy policies of those websites to determine how they will handle any information they collect from you.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>In disclosing your personal data to third parties, we endeavor to ensure that the third parties and our affiliates keep your personal data secure from unauthorized access, collection, use, disclosure, processing or similar risks and retain your personal data only for as long as your personal data helps with any of the uses of your data as set out in our Privacy Policy.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may transfer or permit the transfer of your personal data outside of Bangladesh for any of the purposes set out in this Privacy Policy. However, we will not transfer or permit any of your personal data to be transferred outside of Bangladesh unless the transfer is in compliance with applicable laws and this Privacy Policy.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We may share your personal data with our third party service providers or affiliates (e.g. payment service providers) in order for them to offer services to you other than those related to your use of the Site. Your acceptance and use of the third party service provider&rsquo;s or our affiliate&rsquo;s services shall be subject to terms and conditions as may be agreed between you and the third party service provider or our affiliate. Upon your acceptance of the third party service provider&rsquo;s or our affiliate&rsquo;s service offering, the collection, use, disclosure, storage, transfer and processing of your data (including your personal data and any data disclosed by us to such third party service provider or affiliate) shall be subject to the applicable privacy policy of the third party service provider or our affiliate, which shall be the data controller of such data. You agree that any queries or complaints relating to your acceptance or use of the third party service provider&rsquo;s or our affiliate&rsquo;s services shall be directed to the party named in the applicable privacy policy.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Cookies\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We or our authorised service providers may use cookies, web beacons, and other similar technologies in connection with your use of the Site.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>The acceptance of cookies is not a requirement for visiting the Site. However, we would like to point out that the use of the &#39;basket&#39; functionality on the Site and ordering is only possible with the activation of cookies. Cookies are small text files (typically made up of letters and numbers) placed in the memory of your browser or device when you visit a website or view a message. They allow us to recognise a particular device or browser. Web beacons are small graphic images that may be included on the Site. They allow us to count users who have viewed these pages so that we can better understand your preference and interests. Cookies are tiny text files which identify your computer to our server as a unique user when you visit certain pages on the Site and they are stored by your Internet browser on your computer&#39;s hard drive. Cookies can be used to recognize your Internet Protocol address, saving you time while you are on, or want to enter, the Site. We only use cookies for your convenience in using the Site (for example to remember who you are when you want to amend your shopping cart without having to re-enter your email address) and not for obtaining or using any other information about you (for example targeted advertising). However, certain cookies are required to enable core functionality (such as adding items to your shopping basket), so please note that changing and deleting cookies may affect the functionality available on the Sit. Your browser can be set to not accept cookies, but this would restrict your use of the Site. Please accept our assurance that our use of cookies does not contain any personal or private details and are free from viruses. If you want to find out more information about cookies, go to&nbsp;<a href=\\\"%5C%22https:\\/\\/www.allaboutcookies.org\\/%5C%22\\\" target=\\\"\\\\\\\">all-about-cookies<\\/a> or to find out about removing them from your browser, go to&nbsp;<a href=\\\"%5C%22https:\\/\\/www.allaboutcookies.org\\/manage-cookies\\/index.html%5C%22\\\" target=\\\"\\\\\\\">here<\\/a>.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>This website uses Google Analytics, a web analytics service provided by Google, Inc. (\\\\&quot;Google\\\\&quot;). Google Analytics uses cookies, which are text files placed on your computer, to help the website analyze how users use the site. The information generated by the cookie about your use of the website (including your IP address) will be transmitted to and stored by Google on servers in the United States. Google will use this information for the purpose of evaluating your use of the website, compiling reports on website activity for website operators and providing other services relating to website activity and internet usage. Google may also transfer this information to third parties where required to do so by law, or where such third parties process the information on Google&#39;s behalf. Google will not associate your IP address with any other data held by Google. You may refuse the use of cookies by selecting the appropriate settings on your browser, however please note that if you do this you may not be able to use the full functionality of this website. By using this website, you consent to the processing of data about you by Google in the manner and for the purposes set out above.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Security\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We have in place appropriate technical and security measures to prevent unauthorized or unlawful access to or accidental loss of or destruction or damage to your information. When we collect data through the Site, we collect your personal details on a secure server. We use firewalls on our servers. Our security procedures mean that we may occasionally request proof of identity before we disclose personal information to you. You are responsible for protecting against unauthorized access to your password and to your computer.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>You should be aware, however, that no method of transmission over the Internet or method of electronic storage is completely secure. While security cannot be guaranteed, we strive to protect the security of your information and are constantly reviewing and enhancing our information security measures.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Your rights\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>If you are concerned about your data, you have the right to request access to the personal data which we may hold or process about you. You have the right to require us to correct any inaccuracies in your data free of charge. At any stage you also have the right to ask us to stop using your personal data for direct marketing purposes.<br \\/>\\r\\n\\t\\tWhere permitted by applicable data protection laws, we reserve the right to charge a reasonable administrative fee for retrieving your personal data records. If so, we will inform you of the fee before processing your request.<br \\/>\\r\\n\\t\\tYou may communicate the withdrawal of your consent to the continued use, disclosure, storing and\\/or processing of your personal data by contacting our customer services, subject to the conditions and\\/or limitations imposed by applicable laws or regulations. Please note that if you communicate your withdrawal of your consent to our use, disclosure, storing or processing of your personal data for the purposes and in the manner as stated above or exercise your other rights as available under applicable local laws, we may not be in a position to continue to provide the Services to you or perform any contract we have with you, and we will not be liable in the event that we do not continue to provide the Services to, or perform our contract with you. Our legal rights and remedies are expressly reserved in such an event.<br \\/>\\r\\n\\t\\t<br \\/>\\r\\n\\t\\tFurthermore, you also have the right to ask us to delete your data. If you would like to have your data deleted, fill out the&nbsp;<a href=\\\"%5C%22https:\\/\\/ai.alimebot.daraz.com.bd\\/intl\\/index.htm?from=0zKpjMUW7x&amp;attemptquery=account_deactivation_form%5C%22\\\">Account Deactivation\\/Deletion Request Form&nbsp;<\\/a>(&ldquo;Deletion Request&rdquo;) or email your request to&nbsp;<strong>customer.bd@care.daraz.com<\\/strong>. Once your request is received, we follow an internal deletion process to make sure that your data is safely removed in the next fifteen (15) working days. You&#39;ll be contacted for verification and your account will be deleted after necessary protocols are conformed to. Read more about the deletion process&nbsp;<a href=\\\"%5C%22https:\\/\\/helpcenter.daraz.com.bd\\/page\\/knowledge?pageId=40&amp;knowledge=1000005458%5C%22\\\">here<\\/a>.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Minors\\\\n\\r\\n\\t<ol>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We do not sell products to minors, i.e. individuals below the age of 18, on the Site and we do not knowingly collect any personal data relating to minors. You hereby confirm and warrant that you are above the age of 18 and are capable of understanding and accepting the terms of this Privacy Policy.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>If you allow a minor to access the Site and buy products from the Site by using your account, you hereby consent to the processing of the minor&rsquo;s personal data and accept and agree to be bound by this Privacy Policy and take responsibility for his or her actions.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li>We will not be responsible for any unauthorized use of your account on the Site by yourself, users who act on your behalf or any unauthorized users. It is your responsibility to make your own informed decisions about the use of the Site and take necessary steps to prevent any misuse of the Site.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ol>\\r\\n\\t\\\\n<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ol>\\r\\n\\r\\n<p>&quot;<\\/p>\"', NULL, 'pages_setup', 'live', 0, '2022-08-06 03:54:38', '2022-10-04 11:10:03'),
('053c7a7b-75f0-4e01-9961-5e81fdd001f6', 'email_verification', '\"0\"', '\"0\"', 'service_setup', 'live', 0, '2022-07-21 11:59:22', '2023-11-06 23:49:31'),
('078c60ff-a05f-4386-88c4-9b48e98dc7dd', 'releans', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":\"1\",\"api_key\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":\"1\",\"api_key\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', 'sms_config', 'live', 1, '2022-06-08 06:44:58', '2022-10-04 16:26:11'),
('0a2e5ef2-4e4e-40b1-8ea6-9455a3549891', 'forget_password_verification_method', '\"email\"', '\"email\"', 'business_information', 'live', 1, '2023-05-29 16:22:38', '2023-05-29 16:22:38'),
('0b0ac068-a661-4e13-ab25-858b9f9bab9d', 'currency_code', '\"INR\"', '\"INR\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('0d08217a-f52d-4ce2-a63c-88cd1445193f', 'provider_can_cancel_booking', '\"1\"', '\"1\"', 'service_setup', 'live', 1, '2022-07-20 06:04:17', '2023-11-06 23:50:01'),
('14290db3-1876-44a3-a70d-1410d753d673', 'campaign_cost_bearer', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"campaign\"}', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"campaign\"}', 'promotional_setup', 'live', 1, '2023-01-22 17:33:48', '2023-01-22 17:33:48'),
('14eaf75b-68f2-412b-8062-189cff9582cc', 'app_url_appstore', '\"\\/\"', '\"\\/\"', 'landing_button_and_links', 'live', 1, '2022-10-03 16:00:01', '2022-10-04 16:22:24'),
('16212625-a1cb-428e-b201-1975495a32cc', 'provider_self_registration', '\"1\"', '\"1\"', 'service_setup', 'live', 1, '2022-07-21 11:59:22', '2023-11-06 23:49:44'),
('18ff5091-1416-4b68-8a11-4a4db54d94bc', 'rating_review', '{\"push_notification_rating_review\":\"1\",\"email_rating_review\":\"1\"}', '{\"push_notification_rating_review\":\"1\",\"email_rating_review\":\"1\"}', 'notification_settings', 'live', 1, '2022-06-06 12:41:28', '2022-08-16 07:43:35'),
('193e005b-a715-4f6f-97cc-2554377b1f28', 'app_url_playstore', '\"\\/\"', '\"\\/\"', 'landing_button_and_links', 'live', 1, '2022-10-03 16:00:01', '2022-10-04 16:22:24'),
('1acfd678-38f4-4aab-8431-7f066e8de7f2', 'phone_verification', '0', '0', 'service_setup', 'live', 1, '2023-05-29 16:22:38', '2023-05-29 16:22:38'),
('1bc292a4-4244-4eb2-8760-5c0bd4d5e236', 'default_commission', '\"20\"', '\"20\"', 'business_information', 'live', 1, '2022-08-18 09:14:58', '2022-08-24 02:53:43'),
('1c7e7c69-dd9d-4e7b-9379-b5314bb6ec58', 'testimonial', '[{\"id\":\"978915c4-0bfd-4a1d-9dee-04c3852bfabd\",\"name\":\"Mike\",\"designation\":\"Designer\",\"review\":\"Thank you! That was very helpful! The Service men were very professionals & very caution about safety\",\"image\":\"2022-10-03-633ab162070fe.png\"}]', '[{\"id\":\"978915c4-0bfd-4a1d-9dee-04c3852bfabd\",\"name\":\"Mike\",\"designation\":\"Designer\",\"review\":\"Thank you! That was very helpful! The Service men were very professionals & very caution about safety\",\"image\":\"2022-10-03-633ab162070fe.png\"}]', 'landing_testimonial', 'live', 0, '2022-10-03 16:54:42', '2022-10-03 16:54:42'),
('1e8316f2-660a-44c5-b24c-97320ae212d0', 'booking_service_complete', '{\"booking_service_complete_status\":\"1\",\"booking_service_complete_message\":\"Booking Service successfully complete done\"}', '{\"booking_service_complete_status\":\"1\",\"booking_service_complete_message\":\"Booking Service successfully complete done\"}', 'notification_messages', 'live', 1, '2022-06-06 12:41:28', '2022-09-14 17:44:04'),
('2dd9ca52-ebd2-45b4-9d38-30a6a16b44ca', 'top_title', '\"Customer Statisfaciton is our main moto\"', '\"Customer Statisfaciton is our main moto\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('31c5e759-3d31-4522-8ed7-2a067c623c68', 'booking_place', '{\"booking_place_status\":\"1\",\"booking_place_message\":\"Booking Service successfully placed\"}', '{\"booking_place_status\":\"1\",\"booking_place_message\":\"Booking Service successfully placed\"}', 'notification_messages', 'live', 1, '2022-06-06 12:41:28', '2022-10-04 16:23:49'),
('35fdbc13-5505-4f08-a480-9a7922fde375', 'senang_pay', '{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":\"https:\\/\\/url\\/return-senang-pay\",\"secret_key\":\"data\",\"merchant_id\":\"data\"}', '{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":\"https:\\/\\/url\\/return-senang-pay\",\"secret_key\":\"data\",\"merchant_id\":\"data\"}', 'payment_config', 'live', 0, '2022-06-09 07:21:16', '2022-10-04 16:28:53'),
('382abfc4-4742-4080-9f17-350bbc57d813', 'booking_cancel', '{\"booking_cancel_status\":\"0\",\"booking_cancel_message\":\"Booking Cancel Successfully\"}', '{\"booking_cancel_status\":\"0\",\"booking_cancel_message\":\"Booking Cancel Successfully\"}', 'notification_messages', 'live', 0, '2022-06-06 12:41:28', '2022-09-14 20:11:36'),
('3a9cf40c-c7ec-481c-8a79-5f33b154a561', 'email_config', '{\"mailer_name\":\"OneStepOccasion\",\"host\":\"smtp.sendgrid.net\",\"driver\":\"smtp\",\"port\":\"587\",\"user_name\":\"apikey\",\"email_id\":\"vclogesh@outlook.com\",\"encryption\":\"tls\",\"password\":\"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\"}', '{\"mailer_name\":\"OneStepOccasion\",\"host\":\"smtp.sendgrid.net\",\"driver\":\"smtp\",\"port\":\"587\",\"user_name\":\"apikey\",\"email_id\":\"vclogesh@outlook.com\",\"encryption\":\"tls\",\"password\":\"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\"}', 'email_config', 'live', 1, '2022-06-07 12:32:47', '2023-06-25 16:13:52'),
('3b0b4644-9ba9-48e9-8622-59426198e3b9', 'time_zone', '\"Asia\\/Kolkata\"', '\"Asia\\/Kolkata\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('3dd386b8-066c-48c3-af22-f3f197347ea3', 'customer_wallet', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('3e0fe0fa-e697-437e-a0a9-9ff4316f4d39', 'about_us_description', '\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\"', '\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('3e4c8b9f-28a2-4f72-b3b5-8b5808121dc8', 'recaptcha', '{\"party_name\":\"recaptcha\",\"status\":\"0\",\"site_key\":\"apikey\",\"secret_key\":\"apikey\"}', '{\"party_name\":\"recaptcha\",\"status\":\"0\",\"site_key\":\"apikey\",\"secret_key\":\"apikey\"}', 'third_party', 'live', 0, '2022-07-25 10:57:25', '2022-10-04 16:24:50'),
('4007291b-5078-42ba-9051-fe9c991b9b2f', 'mid_title', '\"SERVICE WE PROVIDE FOR YOU\"', '\"SERVICE WE PROVIDE FOR YOU\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('43c89209-172b-47a1-851a-efb90f848aa0', 'top_image_1', '\"2022-10-04-633bfb5d90bd6.png\"', '\"2022-10-04-633bfb5d90bd6.png\"', 'landing_images', 'live', 0, '2022-10-03 16:06:10', '2022-10-04 16:22:37'),
('45721749-c637-498c-ad0b-5d369a2d6425', 'cookies_text', '\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept All\\\", you consent to our use of cookies.\"', '\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept All\\\", you consent to our use of cookies.\"', 'business_information', 'live', 1, '2023-02-23 00:25:16', '2023-06-25 22:57:22'),
('47817d69-8ec9-4730-b81f-838c4fc9d533', 'top_image_3', '\"2022-10-04-633bfb6720e16.png\"', '\"2022-10-04-633bfb6720e16.png\"', 'landing_images', 'live', 0, '2022-10-03 16:06:15', '2022-10-04 16:22:47'),
('4ad0c0ce-157c-46b2-b93d-261ca4f1a575', 'top_image_4', '\"2022-10-04-633bfb6b5e0c0.png\"', '\"2022-10-04-633bfb6b5e0c0.png\"', 'landing_images', 'live', 0, '2022-10-03 16:07:26', '2022-10-04 16:22:51');
INSERT INTO `business_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`) VALUES
('4cdc5c2e-054d-485b-a906-f0c6032880db', 'subscription', '{\"push_notification_subscription\":\"1\",\"email_subscription\":\"1\"}', '{\"push_notification_subscription\":\"1\",\"email_subscription\":\"1\"}', 'notification_settings', 'live', 1, '2022-06-06 12:41:28', '2022-08-16 07:43:35'),
('4dcb5aae-3a76-4754-b23a-286726a60d61', 'business_logo', '\"2023-06-25-649812055831b.png\"', '\"2023-06-25-649812055831b.png\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 15:38:05'),
('4ddd1410-e290-4e3f-a66c-ee70f86368db', 'bottom_title', '\"GET ALL UPDATES & EXCITING NEWS\"', '\"GET ALL UPDATES & EXCITING NEWS\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 16:14:45'),
('4e1af097-855e-43b8-ae10-0a0039039706', 'booking_accepted', '{\"booking_accepted_status\":\"0\",\"booking_accepted_message\":\"Booking Service successfully complete done\"}', '{\"booking_accepted_status\":\"0\",\"booking_accepted_message\":\"Booking Service successfully complete done\"}', 'notification_messages', 'live', 0, '2022-06-06 12:41:28', '2022-10-04 16:23:59'),
('4e6fda04-d5b3-4ddd-a086-3c6567346e5c', 'tnc_update', '{\"push_notification_tnc_update\":\"0\",\"email_tnc_update\":0}', '{\"push_notification_tnc_update\":\"0\",\"email_tnc_update\":0}', 'notification_settings', 'live', 1, '2022-06-06 12:41:28', '2022-10-04 16:23:28'),
('539b1d42-0730-418d-83b0-46911e42cc39', 'privacy_policy', '\"\\\"<p>Test 12345<\\/p>\\\\n<p>testv asdfghjk test 12334 l;\' ok hyhyhyh dfgdgdgdg<\\/p>\\\"\"', NULL, 'pages_setup', 'live', 1, '2022-08-06 04:00:09', '2022-09-08 14:37:37'),
('54b42ef4-2f17-4424-aebc-7e5490b97557', 'bottom_description', '\"Subcribe to out newsletters to receive all the latest activty we provide for you\"', '\"Subcribe to out newsletters to receive all the latest activty we provide for you\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 16:14:45'),
('5675c00e-9686-4032-96f9-ce4631b9960a', 'speciality', '[{\"id\":\"5bbe5dbf-d056-4d01-b203-cb7a67db77cb\",\"title\":\"srfasv\",\"description\":\"sadvasvdas\",\"image\":\"2022-10-04-633ac3e50ea3e.png\"}]', '[{\"id\":\"5bbe5dbf-d056-4d01-b203-cb7a67db77cb\",\"title\":\"srfasv\",\"description\":\"sadvasvdas\",\"image\":\"2022-10-04-633ac3e50ea3e.png\"}]', 'landing_speciality', 'live', 0, '2022-10-03 18:13:41', '2022-10-03 18:13:41'),
('57b3d923-139a-430b-a7b8-2c0797110cfd', 'sms_verification', '1', '1', 'service_setup', 'live', 1, '2022-07-21 11:59:22', '2022-08-13 07:35:03'),
('59d855e6-06ad-487a-9ca1-bbd8d3db2dfa', 'stripe', '{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"published_key\":\"data\"}', '{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"published_key\":\"data\"}', 'payment_config', 'test', 1, '2022-06-09 05:41:48', '2022-10-04 16:28:57'),
('59f6e3d4-382f-47e6-b973-2c1cb2054016', 'digital_payment', '1', '1', 'service_setup', 'live', 1, '2023-05-29 16:22:38', '2023-05-29 16:22:38'),
('5e470acd-7935-4394-ab56-008fdeb65029', 'third_party', '{\"party_name\":\"push_notification\",\"server_key\":\"56789fghjk\"}', '{\"party_name\":\"push_notification\",\"server_key\":\"56789fghjk\"}', 'third_party', 'live', 1, '2022-06-08 10:57:43', '2022-06-08 10:57:43'),
('6170b133-2556-4eb0-b5bf-3352566e5c83', 'booking_ongoing', '{\"booking_ongoing_status\":\"0\",\"booking_ongoing_message\":\"Booking Service successfully complete done\"}', '{\"booking_ongoing_status\":\"0\",\"booking_ongoing_message\":\"Booking Service successfully complete done\"}', 'notification_messages', 'live', 0, '2022-10-04 16:24:02', '2022-10-04 16:24:02'),
('668cdb3b-63a4-4ad4-ac35-407c811576b6', 'flutterwave', '{\"gateway\":\"flutterwave\",\"mode\":\"test\",\"status\":\"1\",\"secret_key\":\"data\",\"public_key\":\"data\",\"hash\":\"data\"}', '{\"gateway\":\"flutterwave\",\"mode\":\"test\",\"status\":\"1\",\"secret_key\":\"data\",\"public_key\":\"data\",\"hash\":\"data\"}', 'payment_config', 'test', 1, '2022-09-03 08:47:46', '2022-10-04 16:29:07'),
('66ab82b2-e50f-4dcc-9008-378bdf46d0bb', 'direct_provider_booking', '\"1\"', '\"1\"', 'business_information', 'live', 1, '2023-06-25 22:57:22', '2023-06-25 22:57:22'),
('6d3c9600-0fd9-4ebe-a740-22c21c90f619', 'pp_update', '{\"push_notification_pp_update\":\"0\",\"email_pp_update\":0}', '{\"push_notification_pp_update\":\"0\",\"email_pp_update\":0}', 'notification_settings', 'live', 1, '2022-06-06 12:41:28', '2022-10-04 16:23:30'),
('6fcf21de-e1c8-4bd4-ab2c-dff708e79277', 'currency_symbol_position', '\"left\"', '\"left\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2022-09-14 06:07:12'),
('7014ab21-7c89-4f6f-9e63-05806292802f', 'customer_loyalty_point', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('749dc8fa-b2f0-4236-a400-f52fe3b8193b', 'refund_policy', '\"\\\"<div class=\\\\\\\"clearfix\\\\\\\">\\\\n<h4>Test123456<\\/h4>\\\\n<h4>Issuance of Refunds<\\/h4>\\\\n<ul>\\\\n<li>1. The processing time of your refund depends on the type of refund and the payment method you used.<\\/li>\\\\n<li>2. The refund period \\/ process starts when Daraz has processed your refund according to your refund type.<\\/li>\\\\n<li>3. The refund amogunt covers the item price and shipping fee for your returned product.<\\/li>\\\\n<\\/ul>\\\\n<\\/div>\\\\n<div class=\\\\\\\"clearfix\\\\\\\">\\\\n<h4>Refund Types<\\/h4>\\\\n<p>Daraz will process your refund according to the following refund types<\\/p>\\\\n<ul>\\\\n<li>1. Refund from returns - Refund is processed once your item is returned to the warehouse and QC is completed (successful). To learn how to return an item, read our Return Policy.<\\/li>\\\\n<li>2. Refunds from cancelled orders - Refund is automatically triggered once cancelation is successfully processed.<\\/li>\\\\n<li>3. Refunds from failed deliveries - Refund process starts when the item has reached the seller. Please take note that this may take more time depending on the area of your shipping address. Screen reader support enabled.<\\/li>\\\\n<\\/ul>\\\\n<\\/div>\\\\n<div class=\\\\\\\"panel-group\\\\\\\">\\\\n<div class=\\\\\\\"panel panel-default\\\\\\\">\\\\n<table class=\\\\\\\"table table-bordered\\\\\\\">\\\\n<tbody>\\\\n<tr>\\\\n<th class=\\\\\\\"th\\\\\\\">Payment Method<\\/th>\\\\n<th class=\\\\\\\"th\\\\\\\">Refund Option<\\/th>\\\\n<th class=\\\\\\\"th\\\\\\\">Refund Time<\\/th>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Debit or Credit Card<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Debit or Credit Card Payment Reversal<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>10 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Equated Monthly Installments<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Debit or Credit Card<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>10 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Rocket (Wallet DBBL)<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Mobile Wallet Reversal \\/ Rocket<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>7 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>DBBL Nexus (Online Banking)<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Card Payment Reversal (Nexus)<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>7 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>bKash<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Mobile Wallet Reversal \\/ bKash<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>5 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td rowspan=\\\\\\\"2\\\\\\\" width=\\\\\\\"208\\\\\\\">\\\\n<p>Cash on Delivery (COD)<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Bank Deposit<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>5 working days<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td>\\\\n<p>Daraz Refund Voucher<\\/p>\\\\n<\\/td>\\\\n<td>\\\\n<p>1 working day<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Daraz Voucher<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Refund Voucher<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>1 working day<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<\\/tbody>\\\\n<\\/table>\\\\n<\\/div>\\\\n<p><strong>Note:<\\/strong>&nbsp;Maximum refund timeline excludes weekends and public holidays.<\\/p>\\\\n<div class=\\\\\\\"panel-group\\\\\\\">\\\\n<div class=\\\\\\\"panel panel-default\\\\\\\">\\\\n<table class=\\\\\\\"table table-bordered\\\\\\\">\\\\n<tbody>\\\\n<tr>\\\\n<th class=\\\\\\\"th\\\\\\\">Modes of Refund<\\/th>\\\\n<th class=\\\\\\\"th\\\\\\\">Description<\\/th>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Bank Deposit<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"416\\\\\\\" data-spm-anchor-id=\\\\\\\"a2a0e.11887082.4745536990.i2.6b6b18ceSYU3Um\\\\\\\">\\\\n<p>The bank account details provided must be correct. The account must be active and should hold some balance.<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Debit Card or Credit Card<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"416\\\\\\\">\\\\n<p>If the refunded amount is not reflecting in your card statement after the refund is completed and you have received a notification by Daraz, please contact your personal bank.<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>bKash \\/ Rocket Mobile Wallet<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"416\\\\\\\" data-spm-anchor-id=\\\\\\\"a2a0e.11887082.4745536990.i1.6b6b18ceSYU3Um\\\\\\\">\\\\n<p>Similar to bank deposit, the amount will be refunded to the same mobile account details which you inserted at the time of payment.<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<tr>\\\\n<td width=\\\\\\\"208\\\\\\\">\\\\n<p>Refund Voucher<\\/p>\\\\n<\\/td>\\\\n<td width=\\\\\\\"416\\\\\\\" data-spm-anchor-id=\\\\\\\"a2a0e.11887082.4745536990.i4.6b6b18ceSYU3Um\\\\\\\">\\\\n<p>Vouchers will be sent to the customer registered email ID on Daraz and can be redeemed against the same email ID.<\\/p>\\\\n<\\/td>\\\\n<\\/tr>\\\\n<\\/tbody>\\\\n<\\/table>\\\\n<\\/div>\\\\n<p><strong>Important Note:&nbsp;<\\/strong>The Voucher discount code can only be applied once. The leftover amount will not be refunded or used for next purchase even if the value of order is smaller than voucher value<\\/p>\\\\n<\\/div>\\\\n<\\/div>\\\"\"', NULL, 'pages_setup', 'live', 1, '2022-08-06 04:02:38', '2022-09-08 14:37:27'),
('7f266d17-6867-499f-bad6-9a8b55ab3ff1', 'order', '{\"push_notification_order\":\"1\",\"email_order\":\"1\"}', '{\"push_notification_order\":\"1\",\"email_order\":\"1\"}', 'notification_settings', 'live', 1, '2022-06-06 12:41:28', '2022-07-23 07:08:34'),
('848492c2-b2c9-4fed-b486-77db4ff141ae', 'msg91', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}', 'sms_config', 'live', 0, '2022-06-08 09:06:49', '2022-10-04 16:26:16'),
('8541b70b-0739-4bc5-b694-290da4bc79eb', 'facebook_social_login', '\"0\"', '\"0\"', 'social_login', 'live', 1, '2023-06-25 15:28:39', '2023-06-25 15:54:48'),
('873986dd-541b-4648-bd32-edac7504143e', 'nexmo', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_secret\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_secret\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', 'sms_config', 'live', 0, '2022-06-08 07:19:18', '2022-10-04 16:26:27'),
('89d237b1-861e-4066-9cb6-c9adfd672726', 'schedule_booking', '1', '1', 'service_setup', 'live', 1, '2022-07-20 06:04:14', '2022-08-13 07:35:03'),
('8c296af0-65c5-43f9-aa4a-854cbbf19148', 'pagination_limit', '\"20\"', '\"20\"', 'business_information', 'live', 1, '2022-09-05 10:06:02', '2022-10-04 16:21:24'),
('8d6b0e16-f753-4833-8f79-7d049a50deb7', 'registration_description', '\"Become e provider & Start your own business online with on demand service platform\"', '\"Become e provider & Start your own business online with on demand service platform\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('8dddf0eb-2021-4d16-9d84-687603f71285', 'coupon_cost_bearer', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"coupon\"}', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"coupon\"}', 'promotional_setup', 'live', 1, '2023-01-22 17:33:48', '2023-01-22 17:33:48'),
('92043fa7-f54f-4733-9dbf-3719970a5b62', 'paytm', '{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":\"1\",\"merchant_key\":\"data\",\"merchant_id\":\"data\",\"merchant_website_link\":\"data\"}', '{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":\"1\",\"merchant_key\":\"data\",\"merchant_id\":\"data\",\"merchant_website_link\":\"data\"}', 'payment_config', 'test', 1, '2022-06-09 07:21:49', '2022-10-04 16:29:15'),
('9288358a-cab7-4c5c-b342-75b7ab17c29a', 'business_phone', '\"+919789234550\"', '\"+919789234550\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('93670ab4-e54d-46ea-a8ed-101cb968208e', 'about_us_title', '\"WHO WE ARE\"', '\"WHO WE ARE\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('94f715e7-164d-4e05-bb64-e3547d94a5e4', 'business_address', '\"Perambar\"', '\"Perambar\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('973e0fe3-b6ff-4156-aa9a-78e52e069527', 'booking', '{\"push_notification_booking\":\"0\",\"email_booking\":0}', '{\"push_notification_booking\":\"0\",\"email_booking\":0}', 'notification_settings', 'live', 1, '2022-07-28 04:31:15', '2022-10-04 16:23:32'),
('98a973f9-0ec8-4fe5-b31d-d04c045bab41', 'referral_value_per_currency_unit', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('9a961fd3-b032-4260-a9dd-93ad7c0b76b8', 'paystack', '{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":\"1\",\"callback_url\":\"https:\\/\\/api.paystack.co\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_email\":\"data\"}', '{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":\"1\",\"callback_url\":\"https:\\/\\/api.paystack.co\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_email\":\"data\"}', 'payment_config', 'test', 1, '2022-06-09 06:12:45', '2022-10-04 16:29:25'),
('9ec59242-4fd2-4f54-898c-4b4c60270ecd', 'business_favicon', '\"2023-06-25-64981205577eb.png\"', '\"2023-06-25-64981205577eb.png\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 15:38:05'),
('9ff4b51f-0edd-4a33-ab15-bc79f7542ecd', 'about_us', '\"<p>hello world hero greatth weh fvaaafawefdsdsdsd<\\/p>\"', NULL, 'pages_setup', 'live', 1, '2022-08-04 13:04:19', '2022-10-04 11:57:25'),
('a38599a7-fb8f-4f3c-a955-b975cdd8fae5', 'customer_referral_earning', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('a6cd4791-0276-4fa4-b2a1-13d3d5a8f232', 'twilio', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', 'sms_config', 'live', 0, '2022-06-08 07:03:02', '2022-10-04 16:26:39'),
('a8c1f49a-be3b-4609-8242-37142ff05acd', 'currency_decimal_point', '\"2\"', '\"2\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2022-10-04 16:21:24'),
('a8df1463-56bd-4498-89ae-31df3477aea6', 'google_social_login', '\"0\"', '\"0\"', 'social_login', 'live', 1, '2023-06-25 15:28:34', '2023-06-25 15:54:46'),
('a9c93141-a7c9-473b-ac46-b3dadc7b067f', 'razor_pay', '{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"1\",\"api_key\":\"data\",\"api_secret\":\"data\"}', '{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"1\",\"api_key\":\"data\",\"api_secret\":\"data\"}', 'payment_config', 'live', 1, '2022-06-09 07:46:29', '2022-10-04 16:29:32'),
('af729332-d8ec-4822-854a-5f54e10a9061', 'sslcommerz', '{\"gateway\":\"sslcommerz\",\"mode\":\"test\",\"status\":\"1\",\"store_id\":\"data\",\"store_password\":\"data\"}', '{\"gateway\":\"sslcommerz\",\"mode\":\"test\",\"status\":\"1\",\"store_id\":\"data\",\"store_password\":\"data\"}', 'payment_config', 'test', 1, '2022-06-09 03:19:38', '2022-10-04 16:29:39'),
('b004a67d-df30-4a85-9ec0-54774cc2e616', 'min_loyalty_point_to_transfer', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('b0bf5be1-183a-4dbe-86f6-bd3ff2b9c68a', 'push_notification', '{\"party_name\":\"push_notification\",\"server_key\":\"AAAAoXt4hjI:APA91bGyLAXD8EtTHfbCOtdMdQZa-BHnWfCsMyZ2wIefEl6xp54b3O_OEgXPlCkQyr3GA3CilRxm_x5wDi_5FcoU9vGhaRJgVAIEs9tcISwNL2uwQ-ATaseIGQBQ-r95jykxUgqyksyN\"}', '{\"party_name\":\"push_notification\",\"server_key\":\"AAAAoXt4hjI:APA91bGyLAXD8EtTHfbCOtdMdQZa-BHnWfCsMyZ2wIefEl6xp54b3O_OEgXPlCkQyr3GA3CilRxm_x5wDi_5FcoU9vGhaRJgVAIEs9tcISwNL2uwQ-ATaseIGQBQ-r95jykxUgqyksyN\"}', 'third_party', 'live', 0, '2022-07-16 04:56:01', '2023-06-25 22:27:39'),
('b9525ca3-9c9e-432c-a2bb-a9f41c8a6b68', 'time_format', '\"24h\"', '\"24h\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2022-08-18 10:28:09'),
('ba08f7c0-a233-43f5-a801-cd727e3e7de9', 'admin_order_notification', '1', '1', 'service_setup', 'live', 1, '2022-07-20 06:04:23', '2022-08-13 07:35:03'),
('bbfd087c-eaa5-4868-8a69-3be87720ae86', 'top_description', '\"LARGEST BOOKING SERVICE PLATEFORM\"', '\"LARGEST BOOKING SERVICE PLATEFORM\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('bc4ed6e1-2c7e-4c95-8c7f-fe547a317c1e', 'about_us_image', '\"2022-10-04-633bfb711ac8f.png\"', '\"2022-10-04-633bfb711ac8f.png\"', 'landing_images', 'live', 0, '2022-10-03 17:37:45', '2022-10-04 16:22:57');
INSERT INTO `business_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`) VALUES
('c58ecce7-598f-4568-aa15-d875dfa12232', 'terms_and_conditions', '\"<p>&quot;<\\/p>\\r\\n\\r\\n<p>\\\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>1. INTRODUCTION<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>test12345655<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>terms and condition<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Welcome to Daraz.com.bd also hereby known as &ldquo;we\\\\&quot;, \\\\&quot;us\\\\&quot; or \\\\&quot;Daraz\\\\&quot;. We are an online marketplace and these are the terms and conditions governing your access and use of Daraz along with its related sub-domains, sites, mobile app, services and tools (the \\\\&quot;Site\\\\&quot;). By using the Site, you hereby accept these terms and conditions (including the linked information herein) and represent that you agree to comply with these terms and conditions (the \\\\&quot;User Agreement\\\\&quot;). This User Agreement is deemed effective upon your use of the Site which signifies your acceptance of these terms. If you do not agree to be bound by this User Agreement please do not access, register with or use this Site. This Site is owned and operated by&nbsp;<strong>Daraz Bangladesh Limited, a company incorporated under the Companies Act, 1994, (Registration Number: 117773\\/14).<\\/strong><br \\/>\\r\\n<br \\/>\\r\\nThe Site reserves the right to change, modify, add, or remove portions of these Terms and Conditions at any time without any prior notification. Changes will be effective when posted on the Site with no other notice provided. Please check these Terms and Conditions regularly for updates. Your continued use of the Site following the posting of changes to Terms and Conditions of use constitutes your acceptance of those changes.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>2. CONDITIONS OF USE<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>A. YOUR ACCOUNT<\\/p>\\r\\n\\r\\n<p>\\\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>To access certain services offered by the platform, we may require that you create an account with us or provide personal information to complete the creation of an account. We may at any time in our sole and absolute discretion, invalidate the username and\\/or password without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by, caused by, arising out of, in connection with or by reason of such request or invalidation.<br \\/>\\r\\n<br \\/>\\r\\nYou are responsible for maintaining the confidentiality of your user identification, password, account details and related private information. You agree to accept this responsibility and ensure your account and its related details are maintained securely at all times and all necessary steps are taken to prevent misuse of your account. You should inform us immediately if you have any reason to believe that your password has become known to anyone else, or if the password is being, or is likely to be, used in an unauthorized manner. You agree and acknowledge that any use of the Site and related services offered and\\/or any access to private information, data or communications using your account and password shall be deemed to be either performed by you or authorized by you as the case may be. You agree to be bound by any access of the Site and\\/or use of any services offered by the Site (whether such access or use are authorized by you or not). You agree that we shall be entitled (but not obliged) to act upon, rely on or hold you solely responsible and liable in respect thereof as if the same were carried out or transmitted by you. You further agree and acknowledge that you shall be bound by and agree to fully indemnify us against any and all losses arising from the use of or access to the Site through your account.<br \\/>\\r\\n<br \\/>\\r\\nPlease ensure that the details you provide us with are correct and complete at all times. You are obligated to update details about your account in real time by accessing your account online. For pieces of information you are not able to update by accessing Your Account on the Site, you must inform us via our customer service communication channels to assist you with these changes. We reserve the right to refuse access to the Site, terminate accounts, remove or edit content at any time without prior notice to you. We may at any time in our sole and absolute discretion, request that you update your Personal Data or forthwith invalidate the account or related details without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by or caused by you or arising out of or in connection with or by reason of such request or invalidation. You hereby agree to change your password from time to time and to keep your account secure and also shall be responsible for the confidentiality of your account and liable for any disclosure or use (whether such use is authorised or not) of the username and\\/or password.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>B. PRIVACY<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Please review our Privacy Agreement, which also governs your visit to the Site. The personal information \\/ data provided to us by you or your use of the Site will be treated as strictly confidential, in accordance with the Privacy Agreement and applicable laws and regulations. If you object to your information being transferred or used in the manner specified in the Privacy Agreement, please do not use the Site.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>C. PLATFORM FOR COMMUNICATION<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You agree, understand and acknowledge that the Site is an online platform that enables you to purchase products listed at the price indicated therein at any time from any location using a payment method of your choice. You further agree and acknowledge that we are only a facilitator and cannot be a party to or control in any manner any transactions on the Site or on a payment gateway as made available to you by an independent service provider. Accordingly, the contract of sale of products on the Site shall be a strictly bipartite contract between you and the sellers on our Site while the payment processing occurs between you, the service provider and in case of prepayments with electronic cards your issuer bank. Accordingly, the contract of payment on the Site shall be strictly a bipartite contract between you and the service provider as listed on our Site.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>D. CONTINUED AVAILABILITY OF THE SITE<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We will do our utmost to ensure that access to the Site is consistently available and is uninterrupted and error-free. However, due to the nature of the Internet and the nature of the Site, this cannot be guaranteed. Additionally, your access to the Site may also be occasionally suspended or restricted to allow for repairs, maintenance, or the introduction of new facilities or services at any time without prior notice. We will attempt to limit the frequency and duration of any such suspension or restriction.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>E. LICENSE TO ACCESS THE SITE<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We require that by accessing the Site, you confirm that you can form legally binding contracts and therefore you confirm that you are at least 18 years of age or are accessing the Site under the supervision of a parent or legal guardian. We grant you a non-transferable, revocable and non-exclusive license to use the Site, in accordance with the Terms and Conditions described herein, for the purposes of shopping for personal items and services as listed to be sold on the Site. Commercial use or use on behalf of any third party is prohibited, except as explicitly permitted by us in advance. If you are registering as a business entity, you represent that you have the authority to bind that entity to this User Agreement and that you and the business entity will comply with all applicable laws relating to online trading. No person or business entity may register as a member of the Site more than once. Any breach of these Terms and Conditions shall result in the immediate revocation of the license granted in this paragraph without notice to you.<br \\/>\\r\\n<br \\/>\\r\\nContent provided on this Site is solely for informational purposes. Product representations including price, available stock, features, add-ons and any other details as expressed on this Site are the responsibility of the vendors displaying them and is not guaranteed as completely accurate by us. Submissions or opinions expressed on this Site are those of the individual(s) posting such content and may not reflect our opinions.<br \\/>\\r\\n<br \\/>\\r\\nWe grant you a limited license to access and make personal use of this Site, but not to download (excluding page caches) or modify the Site or any portion of it in any manner. This license does not include any resale or commercial use of this Site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this Site or its contents; any downloading or copying of account information for the benefit of another seller; or any use of data mining, robots, or similar data gathering and extraction tools.<br \\/>\\r\\n<br \\/>\\r\\nThis Site or any portion of it (including but not limited to any copyrighted material, trademarks, or other proprietary information) may not be reproduced, duplicated, copied, sold, resold, visited, distributed or otherwise exploited for any commercial purpose without express written consent by us as may be applicable.<br \\/>\\r\\n<br \\/>\\r\\nYou may not frame or use framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) without our express written consent. You may not use any meta tags or any other text utilizing our name or trademark without our express written consent, as applicable. Any unauthorized use terminates the permission or license granted by us to you for access to the Site with no prior notice. You may not use our logo or other proprietary graphic or trademark as part of an external link for commercial or other purposes without our express written consent, as may be applicable.<br \\/>\\r\\n<br \\/>\\r\\nYou agree and undertake not to perform restricted activities listed within this section; undertaking these activities will result in an immediate cancellation of your account, services, reviews, orders or any existing incomplete transaction with us and in severe cases may also result in legal action:<br \\/>\\r\\n&nbsp;<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Refusal to comply with the Terms and Conditions described herein or any other guidelines and policies related to the use of the Site as available on the Site at all times.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Impersonate any person or entity or to falsely state or otherwise misrepresent your affiliation with any person or entity.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Use the Site for illegal purposes.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Attempt to gain unauthorized access to or otherwise interfere or disrupt other computer systems or networks connected to the Platform or Services.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Interfere with another&rsquo;s utilization and enjoyment of the Site;<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Post, promote or transmit through the Site any prohibited materials as deemed illegal by The People&#39;s Republic of Bangladesh.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Use or upload, in any way, any software or material that contains, or which you have reason to suspect that contains, viruses, damaging components, malicious code or harmful components which may impair or corrupt the Site&rsquo;s data or damage or interfere with the operation of another Customer&rsquo;s computer or mobile device or the Site and use the Site other than in conformance with the acceptable use policies of any connected computer networks, any applicable Internet standards and any other applicable laws.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>F. YOUR CONDUCT<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You must not use the website in any way that causes, or is likely to cause, the Site or access to it to be interrupted, damaged or impaired in any way. You must not engage in activities that could harm or potentially harm the Site, its employees, officers, representatives, stakeholders or any other party directly or indirectly associated with the Site or access to it to be interrupted, damaged or impaired in any way. You understand that you, and not us, are responsible for all electronic communications and content sent from your computer to us and you must use the Site for lawful purposes only. You are strictly prohibited from using the Site<br \\/>\\r\\n&nbsp;<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>for fraudulent purposes, or in connection with a criminal offense or other unlawful activity<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>to send, use or reuse any material that does not belong to you; or is illegal, offensive (including but not limited to material that is sexually explicit content or which promotes racism, bigotry, hatred or physical harm), deceptive, misleading, abusive, indecent, harassing, blasphemous, defamatory, libellous, obscene, pornographic, paedophilic or menacing; ethnically objectionable, disparaging or in breach of copyright, trademark, confidentiality, privacy or any other proprietary information or right; or is otherwise injurious to third parties; or relates to or promotes money laundering or gambling; or is harmful to minors in any way; or impersonates another person; or threatens the unity, integrity, security or sovereignty of Bangladesh or friendly relations with foreign States; or objectionable or otherwise unlawful in any manner whatsoever; or which consists of or contains software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any \\\\&quot;spam&rdquo;<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Use the Site for illegal purposes.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>to cause annoyance, inconvenience or needless anxiety<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>for any other purposes that is other than what is intended by us<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>G. YOUR SUBMISSION<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Anything that you submit to the Site and\\/or provide to us, including but not limited to, questions, reviews, comments, and suggestions (collectively, \\\\&quot;Submissions\\\\&quot;) will become our sole and exclusive property and shall not be returned to you. In addition to the rights applicable to any Submission, when you post comments or reviews to the Site, you also grant us the right to use the name that you submit, in connection with such review, comment, or other content. You shall not use a false e-mail address, pretend to be someone other than yourself or otherwise mislead us or third parties as to the origin of any Submissions. We may, but shall not be obligated to, remove or edit any Submissions without any notice or legal course applicable to us in this regard.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>H. CLAIMS AGAINST OBJECTIONABLE CONTENT<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We list thousands of products for sale offered by numerous sellers on the Site and host multiple comments on listings, it is not possible for us to be aware of the contents of each product listed for sale, or each comment or review that is displayed. Accordingly, we operate on a \\\\&quot;claim, review and takedown\\\\&quot; basis. If you believe that any content on the Site is illegal, offensive (including but not limited to material that is sexually explicit content or which promotes racism, bigotry, hatred or physical harm), deceptive, misleading, abusive, indecent, harassing, blasphemous, defamatory, libellous, obscene, pornographic, paedophilic or menacing; ethnically objectionable, disparaging; or is otherwise injurious to third parties; or relates to or promotes money laundering or gambling; or is harmful to minors in any way; or impersonates another person; or threatens the unity, integrity, security or sovereignty of Bangladesh or friendly relations with foreign States; or objectionable or otherwise unlawful in any manner whatsoever; or which consists of or contains software viruses, (\\\\&quot; objectionable content \\\\&quot;), please notify us immediately by following by writing to us on legal@daraz.com.bd. We will make all practical endeavours to investigate and remove valid objectionable content complained about within a reasonable amount of time.<br \\/>\\r\\n<br \\/>\\r\\nPlease ensure to provide your name, address, contact information and as many relevant details of the claim including name of objectionable content party, instances of objection, proof of objection amongst other. Please note that providing incomplete details will render your claim invalid and unusable for legal purposes.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>I. CLAIMS AGAINST INFRINGING CONTENT<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We respect the intellectual property of others. If you believe that your intellectual property rights have been used in a way that gives rise to concerns of infringement, please write to us at legal@daraz.com.bd and we will make all reasonable efforts to address your concern within a reasonable amount of time. Please ensure to provide your name, address, contact information and as many relevant details of the claim including name of infringing party, instances of infringement, proof of infringement amongst other. Please note that providing incomplete details will render your claim invalid and unusable for legal purposes. In addition, providing false or misleading information may be considered a legal offense and may be followed by legal proceedings.<br \\/>\\r\\n<br \\/>\\r\\nWe also respect a manufacturer&#39;s right to enter into exclusive distribution or resale agreements for its products. However, violations of such agreements do not constitute intellectual property rights infringement. As the enforcement of these agreements is a matter between the manufacturer, distributor and\\/or respective reseller, it would not be appropriate for us to assist in the enforcement of such activities. While we cannot provide legal advice, nor share private information as protected by the law, we recommend that any questions or concerns regarding your rights may be routed to a legal specialist.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>J. TRADEMARKS AND COPYRIGHTS<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Daraz.com.bd, Daraz logo, D for Daraz logo, Daraz, Daraz Fashion, Daraz Basics and other marks indicated on our Site are trademarks or registered trademarks in the relevant jurisdiction(s). Our graphics, logos, page headers, button icons, scripts and service names are the trademarks or trade dress and may not be used in connection with any product or service that does not belong to us or in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits us. All other trademarks that appear on this Site are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by us.<br \\/>\\r\\n<br \\/>\\r\\nAll intellectual property rights, whether registered or unregistered, in the Site, information content on the Site and all the website design, including, but not limited to text, graphics, software, photos, video, music, sound, and their selection and arrangement, and all software compilations, underlying source code and software shall remain our property. The entire contents of the Site also are protected by copyright as a collective work under Bangladeshi copyright laws and international conventions. All rights are reserved.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>K. DISCLAIMER<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You acknowledge and undertake that you are accessing the services on the Site and transacting at your own risk and are using your best and prudent judgment before entering into any transactions through the Site. We shall neither be liable nor responsible for any actions or inactions of sellers nor any breach of conditions, representations or warranties by the sellers or manufacturers of the products and hereby expressly disclaim and any all responsibility and liability in that regard. We shall not mediate or resolve any dispute or disagreement between you and the sellers or manufacturers of the products.<br \\/>\\r\\n<br \\/>\\r\\nWe further expressly disclaim any warranties or representations (express or implied) in respect of quality, suitability, accuracy, reliability, completeness, timeliness, performance, safety, merchantability, fitness for a particular purpose, or legality of the products listed or displayed or transacted or the content (including product or pricing information and\\/or specifications) on the Site. While we have taken precautions to avoid inaccuracies in content, this Site, all content, information (including the price of products), software, products, services and related graphics are provided as is basis, without warranty of any kind. We do not implicitly or explicitly support or endorse the sale or purchase of any products on the Site. At no time shall any right, title or interest in the products sold through or displayed on the Site vest with us nor shall Daraz have any obligations or liabilities in respect of any transactions on the Site.<br \\/>\\r\\n<br \\/>\\r\\nWe shall neither be liable or responsible for any actions or inactions of any other service provider as listed on our Site which includes but is not limited to payment providers, instalment offerings, warranty services amongst others.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>L. INDEMNITY<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You shall indemnify and hold harmless Daraz as owned by Daraz Singapore Private Limited, its subsidiaries, affiliates and their respective officers, directors, agents and employees, from any claim or demand, or actions including reasonable attorney&#39;s fees, made by any third party or penalty imposed due to or arising out of your breach of these Terms and Conditions or any document incorporated by reference, or your violation of any law, rules, regulations or the rights of a third party.<br \\/>\\r\\n<br \\/>\\r\\nYou hereby expressly release Daraz as owned by Daraz Singapore Private Limited and\\/or its affiliates and\\/or any of its officers and representatives from any cost, damage, liability or other consequence of any of the actions\\/inactions of the sellers or other service providers and specifically waiver any claims or demands that you may have in this behalf under any statute, contract or otherwise.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>M. THIRD PARTY BUSINESSES<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Parties other than Daraz and its affiliates may operate stores, provide services, or sell product lines on the Site. For example, businesses and individuals offer products via Marketplace. In addition, we provide links to the websites of affiliated companies and certain other businesses. We are not responsible for examining or evaluating, and we do not warrant or endorse the offerings of any of these businesses or individuals, or the content of their websites. We do not assume any responsibility or liability for the actions, products, and content of any of these and any other third-parties. You can tell when a third-party is involved in your transactions by reviewing your transaction carefully, and we may share customer information related to those transactions with that third-party. You should carefully review their privacy statements and related terms and conditions.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>N. COMMUNICATING WITH US<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>When you visit the Site, or send e-mails to us, you are communicating with us electronically. You will be required to provide a valid phone number while placing an order with us. We may communicate with you by e-mail, SMS, phone call or by posting notices on the Site or by any other mode of communication we choose to employ. For contractual purposes, you consent to receive communications (including transactional, promotional and\\/or commercial messages), from us with respect to your use of the website (and\\/or placement of your order) and agree to treat all modes of communication with the same importance.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>O. LOSSES<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We will not be responsible for any business or personal losses (including but not limited to loss of profits, revenue, contracts, anticipated savings, data, goodwill, or wasted expenditure) or any other indirect or consequential loss that is not reasonably foreseeable to both you and us when you commenced using the Site.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>P. AMENDMENTS TO CONDITIONS OR ALTERATIONS OF SERVICE AND RELATED PROMISE<\\/p>\\r\\n\\r\\n<p>\\\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>We reserve the right to make changes to the Site, its policies, these terms and conditions and any other publicly displayed condition or service promise at any time. You will be subject to the policies and terms and conditions in force at the time you used the Site unless any change to those policies or these conditions is required to be made by law or government authority (in which case it will apply to orders previously placed by you). If any of these conditions is deemed invalid, void, or for any reason unenforceable, that condition will be deemed severable and will not affect the validity and enforceability of any remaining condition.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>Q. EVENTS BEYOND OUR CONTROL<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We will not be held responsible for any delay or failure to comply with our obligations under these conditions if the delay or failure arises from any cause which is beyond our reasonable control. This condition does not affect your statutory rights.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>R. WAIVER<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You acknowledge and recognize that we are a private commercial enterprise and reserve the right to conduct business to achieve our objectives in a manner we deem fit. You also acknowledge that if you breach the conditions stated on our Site and we take no action, we are still entitled to use our rights and remedies in any other situation where you breach these conditions.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>S. TERMINATION<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>In addition to any other legal or equitable remedies, we may, without prior notice to you, immediately terminate the Terms and Conditions or revoke any or all of your rights granted under the Terms and Conditions. Upon any termination of this Agreement, you shall immediately cease all access to and use of the Site and we shall, in addition to any other legal or equitable remedies, immediately revoke all password(s) and account identification issued to you and deny your access to and use of this Site in whole or in part. Any termination of this agreement shall not affect the respective rights and obligations (including without limitation, payment obligations) of the parties arising before the date of termination. You furthermore agree that the Site shall not be liable to you or to any other person as a result of any such suspension or termination. If you are dissatisfied with the Site or with any terms, conditions, rules, policies, guidelines, or practices in operating the Site, your sole and exclusive remedy is to discontinue using the Site.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>T. GOVERNING LAW AND JURISDICTION<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>These terms and conditions are governed by and construed in accordance with the laws of The People&#39;s Republic of Bangladesh. You agree that the courts, tribunals and\\/or quasi-judicial bodies located in Dhaka, Bangladesh shall have the exclusive jurisdiction on any dispute arising inside Bangladesh under this Agreement.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>U. CONTACT US<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You may reach us&nbsp;<a href=\\\"\\\\\\\">here<\\/a><\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>V. OUR SOFTWARE<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Our software includes any software (including any updates or upgrades to the software and any related documentation) that we make available to you from time to time for your use in connection with the Site (the \\\\&quot;Software\\\\&quot;).<br \\/>\\r\\n<br \\/>\\r\\nYou may use the software solely for purposes of enabling you to use and enjoy our services as permitted by the Terms and Conditions and any related applicable terms as available on the Site. You may not incorporate any portion of the Software into your own programs or compile any portion of it in combination with your own programs, transfer it for use with another service, or sell, rent, lease, lend, loan, distribute or sub-license the Software or otherwise assign any rights to the Software in whole or in part. You may not use the Software for any illegal purpose. We may cease providing you service and we may terminate your right to use the Software at any time. Your rights to use the Software will automatically terminate without notice from us if you fail to comply with any of the Terms and Conditions listed here or across the Site. Additional third party terms contained within the Site or distributed as such that are specifically identified in related documentation may apply and will govern the use of such software in the event of a conflict with these Terms and Conditions. All software used in any of our services is our property and\\/or our affiliates or its software suppliers and protected by the laws of Bangladesh including but not limited to any other applicable copyright laws.<br \\/>\\r\\n<br \\/>\\r\\nWhen you use the Site, you may also be using the services of one or more third parties, such as a wireless carrier or a mobile platform provider. Your use of these third party services may be subject to separate policies, terms of use, and fees of these third parties.<br \\/>\\r\\n<br \\/>\\r\\nYou may not, and you will not encourage, assist or authorize any other person to copy, modify, reverse engineer, decompile or disassemble, or otherwise tamper with our software whether in whole or in part, or create any derivative works from or of the Software.<br \\/>\\r\\n<br \\/>\\r\\nIn order to keep the Software up-to-date, we may offer automatic or manual updates at any time and without notice to you.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>3. CONDITIONS OF SALE (BETWEEN SELLERS AND CUSTOMERS)<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Please read these conditions carefully before placing an order for any products with the Sellers (&ldquo;We&rdquo; or &ldquo;Our&rdquo; or &ldquo;Us&rdquo;, wherever applicable) on the Site. These conditions signify your agreement to be bound by these conditions.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>A. CONDITIONS RELATED TO SALE OF THE PRODUCT OR SERVICE<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>This section deals with conditions relating to the sale of products or services on the Site.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>B. THE CONTRACT<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Your order is a legal offer to the seller to buy the product or service displayed on our Site. When you place an order to purchase a product, any confirmations or status updates received prior to the dispatch of your order serves purely to validate the order details provided and in no way implies the confirmation of the order itself. The acceptance of your order is considered confirmed when the product is dispatched to you. If your order is dispatched in more than one package, you may receive separate dispatch confirmations. Upon time of placing the order, we indicate an approximate timeline that the processing of your order will take however we cannot guarantee this timeline to be rigorously precise in every instance as we are dependent on third party service providers to preserve this commitment. We commit to you to make every reasonable effort to ensure that the indicative timeline is met. All commercial\\/contractual terms are offered by and agreed to between you and the sellers alone. The commercial\\/contractual terms include without limitation price, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. Daraz does not have any control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial\\/contractual terms between the you and the Sellers. The seller retains the right to cancel any order at its sole discretion prior to dispatch. We will ensure that there is timely intimation to you of such cancellation via an email or sms. Any prepayments made in case of such cancellation(s), shall be refunded to you within the time frames stipulated&nbsp;<a href=\\\"\\\\\\\">here<\\/a>.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>\\\\n\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>D. RETURNS<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Please review our Returns Policy&nbsp;<a href=\\\"\\\\\\\">here<\\/a>.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>E. PRICING, AVAILABILITY AND ORDER PROCESSING<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>All prices are listed in Bangladeshi Taka (BDT) and are inclusive of VAT and are listed on the Site by the seller that is selling the product or service. Items in your Shopping Cart will always reflect the most recent price displayed on the item&#39;s product detail page. Please note that this price may differ from the price shown for the item when you first placed it in your cart. Placing an item in your cart does not reserve the price shown at that time. It is also possible that an item&#39;s price may decrease between the time you place it in your basket and the time you purchase it.<br \\/>\\r\\n<br \\/>\\r\\nWe do not offer price matching for any items sold by any seller on our Site or other websites.<br \\/>\\r\\n<br \\/>\\r\\nWe are determined to provide the most accurate pricing information on the Site to our users; however, errors may still occur, such as cases when the price of an item is not displayed correctly on the Site. As such, we reserve the right to refuse or cancel any order. In the event that an item is mispriced, we may, at our own discretion, either contact you for instructions or cancel your order and notify you of such cancellation. We shall have the right to refuse or cancel any such orders whether or not the order has been confirmed and your prepayment processed. If such a cancellation occurs on your prepaid order, our policies for refund will apply. Please note that Daraz posses 100% right on the refund amount. Usually refund amount is calculated based on the customer paid price after deducting any sort of discount and shipping fee.<br \\/>\\r\\n<br \\/>\\r\\nWe list availability information for products listed on the Site, including on each product information page. Beyond what we say on that page or otherwise on the Site, we cannot be more specific about availability. Please note that dispatch estimates are just that. They are not guaranteed dispatch times and should not be relied upon as such. As we process your order, you will be informed by e-mail or sms if any products you order turn out to be unavailable.<br \\/>\\r\\n<br \\/>\\r\\nPlease note that there are cases when an order cannot be processed for various reasons. The Site reserves the right to refuse or cancel any order for any reason at any given time. You may be asked to provide additional verifications or information, including but not limited to phone number and address, before we accept the order.<br \\/>\\r\\n<br \\/>\\r\\nIn order to avoid any fraud with credit or debit cards, we reserve the right to obtain validation of your payment details before providing you with the product and to verify the personal information you shared with us. This verification can take the shape of an identity, place of residence, or banking information check. The absence of an answer following such an inquiry will automatically cause the cancellation of the order within a reasonable timeline. We reserve the right to proceed to direct cancellation of an order for which we suspect a risk of fraudulent use of banking instruments or other reasons without prior notice or any subsequent legal liability.<br \\/>\\r\\n<br \\/>\\r\\n<strong>Refund Voucher<\\/strong><\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Refund voucher can be redeemed on our Website, as full or part payment of products from our Website within the given timeline.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Refund voucher cannot be used from different account.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Vouchers are not replaceable if expired.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Refund Voucher code can be applied only once. The residual amount of the Refund Voucher after applying it once, if any, will not be refunded and cannot be used for next purchases even if the value of order is smaller than remaining voucher value.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<strong>Promotional Vouchers<\\/strong>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Each issued promotional voucher (App voucher and New customer voucher) will be valid for use by a customer only once. Multiple usages changing the identity is illegal.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Both promotional voucher and cart rule discount may not be added at the same time.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Promotional voucher is non-refundable and cannot be exchanged for cash in part or full and is valid for a single transaction only.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Promotional voucher may not be valid during sale or in conjunction with any special promotion.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Voucher will work only if minimum purchase amount and other conditions are met.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Daraz reserves the right to vary or terminate the operation of any voucher at any time without notice.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Daraz shall not be liable to any customer or household for any financial loss arising out of the refusal, cancellation or withdrawal of any voucher or any failure or inability of a customer to use a voucher for any reason.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Vouchers are not replaceable if expired.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>No promotional offer can be made for baby nutrition products.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<strong>Reward Vouchers<\\/strong>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>Customers who have already been listed in Daraz for fraudulent activities will not be eligible to avail any voucher and will not be eligible to participate in any campaign.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>A customer shall not operate more than one account in a single device.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<strong>Promotional Items<\\/strong>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>One customer will be able to purchase one 11tk deal and mystery box during the promotional period.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<strong>Security and Fraud<\\/strong>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>When you use a voucher, you warrant to Daraz that you are the duly authorized recipient of the voucher and that you are using it in good faith.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>If you redeem, attempt to redeem or encourage the redemption of voucher to obtain discounts to which you are not entitled you may be committing a civil or criminal offence<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li>If we reasonably believe that any voucher is being used unlawfully or illegally we may reject or cancel any voucher\\/order and you agree that you will have no claim against us in respect of any rejection or cancellation. Daraz reserves the right to take any further action it deems appropriate in such instances<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>F. RESELLING DARAZ PRODUCTS<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>Reselling Daraz products for business purpose is strictly prohibited. If any unauthorized personnel is found committing the above act, legal action may be taken against him\\/her.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>G. TAXES<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>You shall be responsible for payment of all fees\\/costs\\/charges associated with the purchase of products from the Site and you agree to bear any and all applicable taxes as per prevailing law.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>H. REPRESENTATIONS AND WARRANTIES<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<p>We do not make any representation or warranty as to specifics (such as quality, value, saleability, etc) of the products or services listed to be sold on the Site when products or services are sold by third parties. We do not implicitly or explicitly support or endorse the sale or purchase of any products or services on the Site. We accept no liability for any errors or omissions, whether on behalf of itself or third parties.<br \\/>\\r\\n<br \\/>\\r\\nWe are not responsible for any non-performance or breach of any contract entered into between you and the sellers. We cannot and do not guarantee your actions or those of the sellers as they conclude transactions on the Site. We are not required to mediate or resolve any dispute or disagreement arising from transactions occurring on our Site.<br \\/>\\r\\n<br \\/>\\r\\nWe do not at any point of time during any transaction as entered into by you with a third party on our Site, gain title to or have any rights or claims over the products or services offered by a seller. Therefore, we do not have any obligations or liabilities in respect of such contract(s) entered into between you and the seller(s). We are not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.<br \\/>\\r\\n<br \\/>\\r\\nPricing on any product(s) or related information as reflected on the Site may due to some technical issue, typographical error or other reason by incorrect as published and as a result you accept that in such conditions the seller or the Site may cancel your order without prior notice or any liability arising as a result. Any prepayments made for such orders will be refunded to you per our refund policy as stipulated&nbsp;<a href=\\\"\\\\\\\">here<\\/a>.<\\/p>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<p>I. OTHERS<\\/p>\\r\\n\\r\\n<p>\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li><strong>Stock availability:<\\/strong>&nbsp;The orders are subject to availability of stock.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li><strong>Delivery Timeline:<\\/strong>&nbsp;The delivery might take longer than usual timeframe\\/line to be followed by Daraz.<br \\/>\\r\\n\\t\\tDelivery might be delayed due to force majeure event which includes, but not limited to, political unrest, political event, national\\/public holidays,etc<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t\\t<li><strong>Cancellation:<\\/strong>&nbsp;Daraz retains unqualified right to cancel any order at its sole discretion prior to dispatch and for any reason which may include, but not limited to, the product being mispriced, out of stock, expired, defective, malfunctioned, and containing incorrect information or description arising out of technical or typographical error or for any other reason.<\\/li>\\r\\n\\t\\t<li>\\\\n<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<br \\/>\\r\\n\\\\n<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n\\t<li><strong>Refund Timeline:<\\/strong>&nbsp;If any order is canceled, the payment against such order shall be refunded within 10 to 15 working days, but it may take longer time in exceptional cases. Provided that received cash back amount, if any, will be adjusted with the refund amount.<\\/li>\\r\\n\\t<li>\\\\n<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>\\\\n<a href=\\\"\\\\\\\">Back to Top<\\/a><br \\/>\\r\\n<br \\/>\\r\\nYou confirm that the product(s) or service(s) ordered by you are purchased for your internal \\/ personal consumption and not for commercial re-sale. You authorize us to declare and provide declaration to any governmental authority on your behalf stating the aforesaid purpose for your orders on the Site. The Seller or the Site may cancel an order wherein the quantities exceed the typical individual consumption. This applies both to the number of products ordered within a single order and the placing of several orders for the same product where the individual orders comprise a quantity that exceeds the typical individual consumption. What comprises a typical individual&#39;s consumption quantity limit shall be based on various factors and at the sole discretion of the Seller or ours and may vary from individual to individual.<br \\/>\\r\\n<br \\/>\\r\\nYou may cancel your order at no cost any time before the item is dispatched to you.<br \\/>\\r\\n<br \\/>\\r\\nPlease note that we sell products only in quantities which correspond to the typical needs of an average household. This applies both to the number of products ordered within a single order and the placing of several orders for the same product where the individual orders comprise a quantity typical for a normal household.Please review our Refund Policy&nbsp;<a href=\\\"\\\\\\\">here<\\/a>.<br \\/>\\r\\n<br \\/>\\r\\n<a href=\\\"\\\\\\\">Back to Top<\\/a>\\\\n\\\\n<\\/p>\\r\\n\\r\\n<p>&quot;<\\/p>\"', NULL, 'pages_setup', 'live', 0, '2022-08-06 04:02:24', '2022-10-04 11:11:05');
INSERT INTO `business_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`) VALUES
('c68a9f47-7504-4fc9-b4f6-6a5aa274e4b8', 'business_name', '\"Onestep Occasion\"', '\"Onestep Occasion\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('c8dd2bcf-44e5-41e4-a121-fe4cc6f44e33', 'discount_cost_bearer', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"discount\"}', '{\"bearer\":\"provider\",\"admin_percentage\":0,\"provider_percentage\":100,\"type\":\"coupon\"}', 'promotional_setup', 'live', 1, '2023-01-22 17:33:48', '2023-01-22 17:33:48'),
('cd206dd3-6d91-4608-8bc5-9be80cbf2e42', 'top_sub_title', '\"Get all services from one App.\"', '\"Get all services from one App.\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('cfb57339-dc26-48f0-9815-896aebee243f', 'features', '[{\"id\":\"c02f1efe-1cc8-41fc-952f-4f111613be19\",\"title\":\"GET YOUR SERVICE 24\\/7\",\"sub_title\":\"Visit our app and select your location to see available services near you\",\"image_1\":\"2022-10-03-633ab8f119f43.png\",\"image_2\":\"2022-10-03-633ab8f11a2b9.png\"}]', '[{\"id\":\"c02f1efe-1cc8-41fc-952f-4f111613be19\",\"title\":\"GET YOUR SERVICE 24\\/7\",\"sub_title\":\"Visit our app and select your location to see available services near you\",\"image_1\":\"2022-10-03-633ab8f119f43.png\",\"image_2\":\"2022-10-03-633ab8f11a2b9.png\"}]', 'landing_features', 'live', 0, '2022-10-03 17:26:57', '2022-10-03 17:26:57'),
('d27c7746-520f-470d-a3e0-6ac0b427ae61', 'registration_title', '\"REGISTER AS PROVIDER\"', '\"REGISTER AS PROVIDER\"', 'landing_text_setup', 'live', 0, '2022-10-03 15:36:11', '2022-10-03 15:36:11'),
('d2b531d9-4cf1-4f7c-b96f-395856f5003d', 'google_map', '{\"party_name\":\"google_map\",\"map_api_key_client\":\"AIzaSyDmWaSUZM5P4qQwaBPe4hoW8nWZBF9OaG4\",\"map_api_key_server\":\"AIzaSyDmWaSUZM5P4qQwaBPe4hoW8nWZBF9OaG4\"}', '{\"party_name\":\"google_map\",\"map_api_key_client\":\"AIzaSyDmWaSUZM5P4qQwaBPe4hoW8nWZBF9OaG4\",\"map_api_key_server\":\"AIzaSyDmWaSUZM5P4qQwaBPe4hoW8nWZBF9OaG4\"}', 'third_party', 'live', 0, '2022-09-14 19:49:51', '2023-06-25 22:18:17'),
('d5ff36a8-634b-42a1-ab49-08375eeb21ac', 'footer_text', '\"All rights reserved By @ onestepoccasion\"', '\"All rights reserved By @ onestepoccasion\"', 'business_information', 'live', 1, '2022-09-05 10:06:02', '2023-06-25 22:57:22'),
('d8a4c244-0e6c-4511-a156-93db22a66b7e', 'phone_number_visibility_for_chatting', '\"0\"', '\"0\"', 'business_information', 'live', 1, '2023-02-23 00:25:16', '2023-06-25 22:57:22'),
('db386429-6982-4f46-82f9-08ec70f13f57', 'maximum_withdraw_amount', '\"10000\"', '\"10000\"', 'business_information', 'live', 1, '2023-01-22 17:33:48', '2023-06-25 22:57:22'),
('dbd7d22a-299e-49be-869e-efdcaf8ee7e4', 'web_url', '\"\\/\"', '\"\\/\"', 'landing_button_and_links', 'live', 1, '2022-10-03 16:00:01', '2022-10-04 16:22:24'),
('dbf71089-a769-4025-b971-307c08a6b455', 'service_man_can_cancel_booking', '\"0\"', '\"0\"', 'service_setup', 'live', 0, '2022-07-20 06:04:21', '2022-10-04 16:00:21'),
('e28b7af4-2284-40bf-b28b-84baad4dc1a7', 'top_image_2', '\"2022-10-04-633bfb6314d59.png\"', '\"2022-10-04-633bfb6314d59.png\"', 'landing_images', 'live', 0, '2022-10-03 16:06:00', '2022-10-04 16:22:43'),
('e80a7c3d-9371-4959-8463-c67973a42e56', 'business_email', '\"onestepoccasion@gmail.com\"', '\"onestepoccasion@gmail.com\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('e82e188c-d7de-478b-a83b-26c086b0576d', '2factor', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\"}', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\"}', 'sms_config', 'live', 0, '2022-06-08 08:56:14', '2022-10-04 16:26:44'),
('ea0c3ccd-6db7-4b34-8f21-d0eb637cc47c', 'minimum_withdraw_amount', '\"100\"', '\"100\"', 'business_information', 'live', 1, '2023-01-22 17:33:48', '2023-06-25 22:57:22'),
('ea71998b-2399-44cc-8949-1786e753eb9c', 'country_code', '\"IN\"', '\"IN\"', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2023-06-25 22:57:22'),
('eb2430a8-8d49-4bbe-b19d-1de8bd80be64', 'cash_after_service', '1', '1', 'service_setup', 'live', 1, '2023-05-29 16:22:38', '2023-05-29 16:22:38'),
('eb59a509-e7c2-499b-9c44-57554cbfe015', 'language_code', '[\"Bengali\",\"English\",\"Arabic\",\"Abkhaz\",\"Afar\",\"Akan\",\"Albanian\",\"Amharic\"]', '[\"Bengali\",\"English\",\"Arabic\",\"Abkhaz\",\"Afar\",\"Akan\",\"Albanian\",\"Amharic\"]', 'business_information', 'live', 1, '2022-06-14 09:39:24', '2022-07-23 07:26:01'),
('eeca1881-9a28-4be9-9c27-95f4e84e6aca', 'loyalty_point_value_per_currency_unit', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16'),
('f99e20b3-dfb1-431f-891b-7d78c413e964', 'booking_refund', '{\"booking_refund_status\":1,\"booking_refund_message\":\"Booking Refund Successfully\"}', '{\"booking_refund_status\":1,\"booking_refund_message\":\"Booking Refund Successfully\"}', 'notification_messages', 'live', 1, '2022-06-06 12:41:28', '2022-09-05 15:17:05'),
('fc9ca7b4-4f21-4d45-a0cb-04693ebee4dc', 'provider_section_image', '\"2022-10-04-633bfb7cc79de.png\"', '\"2022-10-04-633bfb7cc79de.png\"', 'landing_images', 'live', 0, '2022-10-03 17:17:01', '2022-10-04 16:23:08'),
('fe386570-fee3-46bd-a9eb-1b34be33b7d6', 'loyalty_point_percentage_per_booking', '0', '0', 'customer_config', 'live', 1, '2023-02-23 00:25:16', '2023-02-23 00:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `campaign_name` varchar(191) DEFAULT NULL,
  `cover_image` varchar(191) NOT NULL DEFAULT 'def.png',
  `thumbnail` varchar(191) NOT NULL DEFAULT 'def.png',
  `discount_id` char(36) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` char(36) NOT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `sub_category_id` char(36) DEFAULT NULL,
  `variant_key` varchar(191) DEFAULT NULL,
  `service_cost` decimal(24,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `campaign_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `image`, `position`, `description`, `is_active`, `is_featured`, `created_at`, `updated_at`) VALUES
('23b2d807-e69c-465e-bd1e-a6dec3abbb98', '44b85c65-fe75-4cff-9825-53b24895b489', 'Birthday Party', '2023-06-25-6498107672cd0.png', 2, 'Bitrthday Party Celebration', 1, 0, '2023-06-25 15:31:26', '2023-06-25 15:31:26'),
('44b85c65-fe75-4cff-9825-53b24895b489', '0', 'Decorators', '2023-06-25-64981041cc282.png', 1, NULL, 1, 1, '2023-06-25 15:30:33', '2023-06-25 15:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `category_zone`
--

CREATE TABLE `category_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` char(36) NOT NULL,
  `zone_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_zone`
--

INSERT INTO `category_zone` (`id`, `category_id`, `zone_id`, `created_at`, `updated_at`) VALUES
(1, '44b85c65-fe75-4cff-9825-53b24895b489', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channel_conversations`
--

CREATE TABLE `channel_conversations` (
  `id` char(36) NOT NULL,
  `channel_id` char(36) NOT NULL,
  `message` text DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_conversations`
--

INSERT INTO `channel_conversations` (`id`, `channel_id`, `message`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('03b3dd93-4e8a-4126-8bdd-a456a6008e3d', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'good', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 16:51:26', '2023-06-25 16:51:26'),
('11b208b5-69f1-4745-afc9-5e378e781d32', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Then', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:51:53', '2023-06-25 16:51:53'),
('27e02c6e-440b-4bbf-803f-d214ca0b546e', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Good', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 19:54:33', '2023-06-25 19:54:33'),
('47d09d51-8b0f-435e-a272-1c1ef7f2aad7', '7ac594ee-1391-4a5f-8889-b70e82ec8d94', 'Hello', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', NULL, '2023-06-25 20:40:06', '2023-06-25 20:40:06'),
('64cdc6ac-0762-4216-be8c-33a8b7abcbc7', '17e9a0ff-0f64-4ade-895a-18bb5e016872', NULL, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:54:21', '2023-06-25 16:54:21'),
('667e3dc4-413f-46ba-bc22-15c5bbb15159', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Hi', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 19:13:45', '2023-06-25 19:13:45'),
('6d6425b0-e779-4edd-ae9f-f043216d56f6', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'we are ok for 1000', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 16:52:15', '2023-06-25 16:52:15'),
('6f414b90-6736-46b8-8584-32f60c497365', '7ac594ee-1391-4a5f-8889-b70e82ec8d94', 'Hi', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 20:39:07', '2023-06-25 20:39:07'),
('a503f158-cda1-41ec-b732-7dbe861982da', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Hi', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:49:50', '2023-06-25 16:49:50'),
('a7dab339-d55c-428f-bd5d-850281540df9', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Good', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:50:59', '2023-06-25 16:50:59'),
('aad70d85-4520-4b6a-8ec0-71503baa157c', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Hi', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 19:17:30', '2023-06-25 19:17:30'),
('b52a9689-041e-40e1-850b-91a5a7e323cf', '17e9a0ff-0f64-4ade-895a-18bb5e016872', NULL, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:55:10', '2023-06-25 16:55:10'),
('c5d628dd-02ef-4fb0-9916-eb1f41732f8b', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'Hi', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:57:35', '2023-06-25 16:57:35'),
('fc6559ab-2108-4712-b854-603d3e529b05', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'how are u', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 16:50:10', '2023-06-25 16:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `channel_lists`
--

CREATE TABLE `channel_lists` (
  `id` char(36) NOT NULL,
  `reference_id` char(36) DEFAULT NULL COMMENT '(DC2Type:guid)',
  `reference_type` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_lists`
--

INSERT INTO `channel_lists` (`id`, `reference_id`, `reference_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
('17e9a0ff-0f64-4ade-895a-18bb5e016872', '100000', 'booking_id', NULL, '2023-06-25 16:49:45', '2023-06-25 19:54:33'),
('57aa802d-2a86-4d77-b4a4-0598b391536c', NULL, 'booking_id', NULL, '2024-01-24 13:39:01', '2024-01-24 13:39:01'),
('7ac594ee-1391-4a5f-8889-b70e82ec8d94', NULL, 'booking_id', NULL, '2023-06-25 20:38:22', '2023-06-25 20:40:06'),
('d8dd6184-cc3b-4872-814a-7299c6c05d13', NULL, 'booking_id', NULL, '2023-06-25 19:54:24', '2023-06-25 19:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `channel_users`
--

CREATE TABLE `channel_users` (
  `id` char(36) NOT NULL,
  `channel_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_users`
--

INSERT INTO `channel_users` (`id`, `channel_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `is_read`) VALUES
('21463890-100d-4d15-b19c-3ba7f5397177', '17e9a0ff-0f64-4ade-895a-18bb5e016872', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 16:49:45', '2023-06-25 19:54:34', 1),
('2ece6a95-8986-4ad5-b3a8-af9f02d3f9c5', '7ac594ee-1391-4a5f-8889-b70e82ec8d94', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 20:38:22', '2024-03-30 20:54:45', 1),
('32ecd54a-100c-4d82-aaa9-ba6cb421cde6', 'd8dd6184-cc3b-4872-814a-7299c6c05d13', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', NULL, '2023-06-25 19:54:24', '2023-12-17 23:05:04', 1),
('337ad8fc-66b2-41bf-8780-b0dbf5153171', '57aa802d-2a86-4d77-b4a4-0598b391536c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', NULL, '2024-01-24 13:39:01', '2024-01-24 13:39:01', 0),
('7074c4fb-ddc9-4c44-acf7-7df6324d8a55', 'd8dd6184-cc3b-4872-814a-7299c6c05d13', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', NULL, '2023-06-25 19:54:24', '2023-06-25 19:54:24', 0),
('a85e6d3a-4f64-4932-af85-7e5bb5f678a9', '57aa802d-2a86-4d77-b4a4-0598b391536c', '8ea23f49-a5ba-4938-828d-19d275158a90', NULL, '2024-01-24 13:39:01', '2024-11-01 22:53:23', 1),
('f95d2a54-ad9e-4624-a539-a594d0e88c13', '7ac594ee-1391-4a5f-8889-b70e82ec8d94', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', NULL, '2023-06-25 20:38:22', '2023-06-25 20:39:55', 1),
('fcb68a42-864a-40b9-a703-bf2425194998', '17e9a0ff-0f64-4ade-895a-18bb5e016872', '129f5af9-fd0a-43d0-8227-c5b788395e5c', NULL, '2023-06-25 16:49:45', '2024-03-30 20:54:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `conversation_files`
--

CREATE TABLE `conversation_files` (
  `id` char(36) NOT NULL,
  `conversation_id` char(36) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation_files`
--

INSERT INTO `conversation_files` (`id`, `conversation_id`, `file_name`, `file_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
('61df9a40-a494-47ee-b1f7-534961fad001', '64cdc6ac-0762-4216-be8c-33a8b7abcbc7', '2023-06-25-649823e5c466c.pdf', 'pdf', NULL, '2023-06-25 16:54:21', '2023-06-25 16:54:21'),
('ab32b94a-f50d-4350-bea8-25a1d51ca977', 'b52a9689-041e-40e1-850b-91a5a7e323cf', '2023-06-25-6498241714dab.png', 'png', NULL, '2023-06-25 16:55:11', '2023-06-25 16:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` char(36) NOT NULL,
  `coupon_type` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `discount_id` char(36) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_customers`
--

CREATE TABLE `coupon_customers` (
  `id` char(36) NOT NULL,
  `coupon_id` char(36) DEFAULT NULL,
  `customer_user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` char(36) NOT NULL,
  `discount_title` varchar(191) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `discount_amount_type` varchar(191) NOT NULL DEFAULT 'percent',
  `min_purchase` decimal(24,3) NOT NULL DEFAULT 0.000,
  `max_discount_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `limit_per_user` int(11) NOT NULL DEFAULT 0,
  `promotion_type` varchar(191) NOT NULL DEFAULT 'discount',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL DEFAULT '2022-04-04',
  `end_date` date NOT NULL DEFAULT '2022-04-04',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_types`
--

CREATE TABLE `discount_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` char(36) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `type_wise_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` char(36) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ignored_posts`
--

CREATE TABLE `ignored_posts` (
  `id` char(36) NOT NULL,
  `post_id` char(36) NOT NULL,
  `provider_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_name`, `address`, `email`, `mobile`, `event_date`, `event_end_date`, `created_at`, `updated_at`, `provider_id`) VALUES
(1, 'logwsh', 'test', 'chandanlogesh@gmkail.com', '9789234550', '2023-08-02', NULL, '2023-08-07 11:31:35', '2023-08-07 11:31:35', NULL),
(2, 'logwsh', 'test', 'chandanlogesh@gmkail.com', '9789234550', '2023-08-02', NULL, '2023-08-07 11:31:44', '2023-08-07 11:31:44', NULL),
(3, 'logwsh', 'test', 'chandanlogesh@gmkail.com', '9789234550', '2023-08-02', NULL, '2023-08-07 11:35:48', '2023-08-07 11:35:48', NULL),
(4, 'logwsh', 'test', 'chandanlogesh@gmkail.com', '9789234550', '2023-08-02', NULL, '2023-08-07 11:37:40', '2023-08-07 11:37:40', NULL),
(5, 'logesh', 'test', 'chandranlogesh@gmail.com', '9789234550', '2023-08-07', NULL, '2023-08-07 20:33:32', '2023-08-07 20:33:32', NULL),
(6, 'logesh', 'test', 'chandranlogesh@gmail.com', '9789234550', '2023-08-07', NULL, '2023-08-08 00:01:02', '2023-08-08 00:01:02', NULL),
(7, 'logesh', 'test', 'chandranlogesh@gmail.com', '9789234550', '2023-08-07', NULL, '2023-08-08 00:07:19', '2023-08-08 00:07:19', NULL),
(8, 'logesh', 'test', 'chandranlogesh@gmail.com', '9789234550', '2023-08-07', NULL, '2023-08-08 00:07:20', '2023-08-08 00:07:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoices_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoices_id`, `description`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 3, 'Tesy', 10, 1, '2023-08-07 11:35:48', '2023-08-07 11:35:48'),
(2, 3, 'Tesy', 10, 1, '2023-08-07 11:35:48', '2023-08-07 11:35:48'),
(3, 4, 'Tesy', 10, 1, '2023-08-07 11:37:40', '2023-08-07 11:37:40'),
(4, 4, 'Tesy', 10, 1, '2023-08-07 11:37:40', '2023-08-07 11:37:40'),
(5, 5, 'Test', 10, 10, '2023-08-07 20:33:32', '2023-08-07 20:33:32'),
(6, 6, 'Test', 10, 10, '2023-08-08 00:01:02', '2023-08-08 00:01:02'),
(7, 7, 'Test', 10, 10, '2023-08-08 00:07:19', '2023-08-08 00:07:19'),
(8, 8, 'Test', 10, 10, '2023-08-08 00:07:20', '2023-08-08 00:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `credit` decimal(24,2) NOT NULL DEFAULT 0.00,
  `debit` decimal(24,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `reference` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2022_02_28_094005_create_users_table', 1),
(9, '2022_02_28_094802_create_roles_table', 1),
(10, '2022_02_28_094823_create_user_roles_table', 1),
(11, '2022_03_01_092248_create_modules_table', 1),
(12, '2022_03_01_093500_create_role_modules_table', 1),
(13, '2022_03_05_085155_create_zones_table', 1),
(14, '2022_03_06_035439_create_categories_table', 1),
(15, '2022_03_06_042053_create_category_zone_table', 1),
(16, '2022_03_06_091813_create_discounts_table', 1),
(17, '2022_03_06_092202_create_services_table', 1),
(18, '2022_03_06_094413_create_variations_table', 1),
(19, '2022_03_07_063157_create_discount_types_table', 1),
(21, '2022_03_07_065305_create_provider_sub_category_table', 1),
(22, '2022_03_07_090055_create_coupons_table', 1),
(23, '2022_03_07_110744_create_campaigns_table', 1),
(24, '2022_03_08_052530_create_banners_table', 1),
(25, '2022_03_08_090735_create_transactions_table', 1),
(26, '2022_03_10_074138_create_accounts_table', 1),
(27, '2022_05_09_122054_add_variant_key_in_variation', 2),
(28, '2022_05_12_100348_create_faqs_table', 3),
(29, '2022_05_18_041330_discount_table_col_modify', 4),
(30, '2022_05_21_035041_add_coupon_type', 5),
(31, '2022_05_22_120123_add_banner_redirection_link', 6),
(33, '2022_05_24_043332_remove_and_reformat_urder_table_col', 8),
(34, '2022_03_07_064337_create_providers_table', 9),
(35, '2022_05_25_054015_create_business_settings_table', 10),
(36, '2022_06_05_061932_create_bookings_table', 11),
(37, '2022_06_05_063828_create_booking_details_table', 11),
(38, '2022_06_05_065027_create_booking_status_histories_table', 11),
(39, '2022_06_05_065040_create_booking_schedule_histories_table', 11),
(40, '2022_06_08_070555_add_status_col_toRole', 12),
(41, '2022_06_11_074614_category_sub_added_booking', 13),
(42, '2022_06_11_110610_create_user_zones_table', 13),
(43, '2022_06_12_034552_create_user_addresses_table', 13),
(44, '2022_06_13_120346_add_column_is_approved_to_provider_table', 14),
(45, '2022_06_14_104816_create_bank_details_table', 15),
(46, '2022_06_15_025832_role_table_customization', 16),
(47, '2022_06_15_043227_create_subscribed_services_table', 16),
(48, '2022_06_16_060054_tnx_add', 17),
(49, '2022_06_16_060137_acc_add', 18),
(51, '2022_06_18_052537_create_reviews_table', 19),
(52, '2022_06_18_095222_create_withdraw_requests_table', 20),
(53, '2022_06_16_094936_create_servicemen_table', 21),
(54, '2022_06_19_063119_add_serviceman_col', 22),
(55, '2022_06_20_085647_add_col_to_serviceman', 23),
(56, '2022_06_22_082434_create_carts_table', 24),
(57, '2022_06_22_121556_create_cart_service_infos_table', 24),
(58, '2022_06_22_090257_column_add_to_withdraw_request_table', 25),
(59, '2022_07_03_065118_add_zone_id_in_providers', 26),
(61, '2022_07_17_064031_add_addres_type', 27),
(62, '2022_07_17_071324_add_addres_type1', 27),
(63, '2022_07_19_040550_change-col-name', 28),
(64, '2022_07_03_095424_create_push_notifications_table', 29),
(65, '2022_07_21_050907_pass_reset_table_col_add', 30),
(66, '2022_07_21_054008_pass_reset_table_col_add1', 30),
(67, '2022_07_21_104205_add_booking_id_col', 31),
(68, '2022_07_24_051517_add_cus_col_in_review', 32),
(69, '2022_07_31_093836_create_channel_lists_table', 33),
(70, '2022_07_31_093916_create_channel_users_table', 33),
(71, '2022_07_31_094036_create_channel_conversations_table', 33),
(72, '2022_07_31_104246_create_conversation_files_table', 33),
(73, '2022_07_31_113436_add_new_col_campaign', 33),
(74, '2022_08_02_054322_update_col_type', 34),
(75, '2022_08_06_031433_add_col_in_booking_table', 35),
(76, '2022_08_06_031649_add_col_in_booking_details_table', 35),
(77, '2022_08_06_045001_remove_col_from_user', 36),
(78, '2022_08_21_031258_add_col_to_channel_list', 37),
(79, '2022_08_21_033729_add_col_to_channel_user_table', 37),
(80, '2022_08_23_060744_col_add_to_tnx_table', 38),
(81, '2022_08_28_044249_col_change_to_business_settings_table', 39),
(82, '2022_08_31_070329_col_add_to_booking_details_table', 40),
(83, '2022_09_01_135800_create_user_verifications_table', 41),
(84, '2022_09_12_062925_col_add_to_booking_table', 42),
(85, '2022_09_17_185044_add_col_to_bank_destails', 43),
(86, '2022_09_21_235326_col_add_to_withdraw_requests_table', 44),
(87, '2022_10_03_175305_add_zone_id_in_address', 44),
(88, '2022_11_21_175412_add_col_to_withdraw_requests_table', 45),
(89, '2022_11_21_230747_create_withdrawal_methods_table', 45),
(90, '2022_11_29_232809_create_booking_details_amounts_table', 45),
(91, '2022_12_05_184417_col_add_to_services_table', 45),
(92, '2022_12_06_002432_create_recent_views_table', 45),
(93, '2022_12_08_201359_create_recent_searches_table', 45),
(94, '2022_12_26_115139_add_col_to_accounts_table', 45),
(95, '2023_01_16_152849_add_col_to_booking_details_amounts_table', 45),
(96, '2023_01_24_230519_add_col_to_users_table', 46),
(97, '2023_01_25_195038_add_col_to_transactions_table', 46),
(98, '2023_01_26_174101_Create_loyalty_point_transactions_table', 46),
(99, '2023_01_27_001826_add_col_to_categories_table', 46),
(100, '2023_01_29_011739_create_tags_table', 46),
(101, '2023_01_29_162753_create_table_service_tag', 46),
(102, '2023_02_02_231012_create_service_requests_table', 46),
(103, '2023_02_05_200352_create_added_to_carts_table', 46),
(104, '2023_02_05_214409_create_visited_services_table', 46),
(105, '2023_02_05_225314_create_searched_data_table', 46),
(106, '2023_02_08_174014_add_provider_id_to_carts_table', 46),
(107, '2023_04_29_185100_create_posts_table', 47),
(108, '2023_04_29_185107_create_post_additional_instructions_table', 47),
(109, '2023_04_29_185114_create_post_bids_table', 47),
(110, '2023_04_29_185127_create_ignored_posts_table', 47),
(111, '2023_05_08_161525_add_col_to_services_table', 47),
(112, '2023_05_16_130004_add_col_to_providers_table', 47),
(113, '2023_05_16_231127_create_coupon_customers_table', 47),
(115, '2023_05_21_095745_add_col_to_users_table', 47),
(116, '2023_05_21_101102_add_col_to_user_verifications_table', 47),
(117, '2023_05_29_184809_add_col_to_posts_table', 48),
(118, '2023_05_30_102205_add_additional_charge_col_to_bookings_table', 48),
(119, '2023_05_31_103005_add_col_to_bookings_table', 49),
(120, '2023_05_17_144146_add_col_to_posts_table', 50),
(121, '2023_08_06_175718_create_invoices_table', 51),
(122, '2023_08_07_010453_create_invoice_items_table', 51),
(123, '2023_08_07_085606_add_provider_id_to_invoices_table', 51),
(124, '2023_08_13_010103_create_vendor_services_table', 52),
(125, '2023_08_13_194110_create_vendor_invoices_table', 53),
(126, '2023_08_13_205934_create_vendor_invoices_items_table', 54),
(127, '2023_08_13_221056_alter_email_nullable_in_vendor_invoices_table', 54),
(128, '2023_08_13_233841_add_col_in_vendorInvoices', 55),
(129, '2023_08_14_010233_add_col_provider_id_vendor_invoices', 56),
(130, '2023_08_15_232140_create_vendor_expenses_table', 57),
(131, '2023_08_16_000509_add_col_vendor_invoices_table', 58),
(132, '2023_11_14_012317_add_qty_vendor_invoices_items', 59),
(133, '2023_11_14_012512_add_qty_vendor_expense_items', 59),
(134, '2023_12_09_012542_add_invoice_date_vendor_invoices', 60),
(135, '2024_01_27_234306_create_vendor_customers_table', 61),
(136, '2024_01_28_070752_add_customerId_vendor_invoices_table', 62),
(137, '2024_01_28_000941_alter_vendor_customers_table', 63),
(138, '2025_07_20_030339_create_vendor_invoice_images_table', 64),
(139, '2025_07_20_033556_create_vendor_invoice_images_table', 65),
(140, '2025_07_20_051227_add_description_to_vendor_invoice_images_table', 66);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` char(36) NOT NULL,
  `module_name` varchar(191) DEFAULT NULL,
  `module_display_name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00d3c5be0dcecd11141aceda59f7654565f335f2a5c882a56f5835a6b02e393c1d8e1389fd539de8', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 13:35:00', '2023-08-17 13:35:00', '2024-08-17 13:35:00'),
('0173a5287b5b5a92bc01f684fdfa8adaa518d9458fb3c7c7a05a0a3bd1577234eda739c201daffcf', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-16 15:55:48', '2025-05-16 15:55:48', '2026-05-16 15:55:48'),
('025d01402ddf55a603c44d87628a0793758e17cdf2cebd2eb5bc4d12618064d128996885f79f28c2', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 14:18:10', '2025-04-03 14:18:10', '2026-04-03 14:18:10'),
('02d835e72419660293085af4b80bd64059e7fb3cb11bb45b6db239d4feecb67bc7ae6181e653099d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-17 01:32:28', '2024-07-17 01:32:28', '2025-07-17 01:32:28'),
('04811bbb44371c86ada93a1fa55a825af83f0ca1a3c974d33adc7e09c7ceecb27002c45c80dbfe6b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-31 22:44:49', '2025-03-31 22:44:49', '2026-03-31 22:44:49'),
('056bb57de51b5f1ece14441eadec3644f33b52cd178a349ade35e1c95a4ec3c50b1ccec6f1520e81', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-17 23:17:59', '2023-12-17 23:17:59', '2024-12-17 23:17:59'),
('05ed61543241a30d0d51b242c1e820e4b98b71be0f38e8acdd1989705cba79564912c3a014b3b01d', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-04-25 04:42:40', '2024-04-25 04:42:40', '2025-04-25 04:42:40'),
('06930a9d1c9b704605826e905722df3587a472d1c0cbb57393c6e8510f32cb85705d91eb23c86427', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 12:25:31', '2025-05-28 12:25:31', '2026-05-28 12:25:31'),
('09024141f03abf7144971f740e23b798e0842e077a755acd759bfcfc8e02700813dc97c8a5368980', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-22 18:46:27', '2024-10-22 18:46:27', '2025-10-22 18:46:27'),
('09425a445a5f3793041124100ec603dad586d41a2fce1e60919faef0b1384d411e8085c004f9f8df', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-02 08:13:31', '2023-08-02 08:13:31', '2024-08-02 08:13:31'),
('0a903ac914e5e31827651b903042cfc9e39c64b8579611bb0a6c0d6e60b78149d11f84f85173a7b9', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-10-31 08:25:42', '2023-10-31 08:25:42', '2024-10-31 08:25:42'),
('0b7dd9e7895d02cc8fedeb44dae78e0bc83661d8e691743fd80598982e37622d5cae9581c10480ba', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-31 09:35:18', '2025-05-31 09:35:18', '2026-05-31 09:35:18'),
('0c7b894d4965fd3ea9b3f9ac52c6867f6335de553e7ba90f8444174d88e59b56dde484aafd151593', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-17 01:28:15', '2023-07-17 01:28:15', '2024-07-17 01:28:15'),
('0c9851c08051dd3b8d76155825759d51485ecb96f592665b42b28fda16ae4f8848cc61dcd4ee8597', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 19:11:42', '2025-03-27 19:11:42', '2026-03-27 19:11:42'),
('0cad4496c471300444ce17294aa9372da9d9a388eb78c288a01902001eebd08e49601c1c4f99421b', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 15:04:54', '2023-08-17 15:04:54', '2024-08-17 15:04:54'),
('0e0cfc31ec16b55f26288d0773ab256cc832bef13564f500c5fa3a95d44547f64a6769e6b176852b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 00:34:20', '2025-05-28 00:34:20', '2026-05-28 00:34:20'),
('0f40edee74c896eb31158d8832e46cfc2aea3666edd259949945b87ab10944104b89216b9672cdee', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-03 22:22:51', '2025-06-03 22:22:51', '2026-06-03 22:22:51'),
('1037ec247e7318de887caa968ab28d828a0690f63a2b8110a30a2c1c4c3a133f04a9428802914d79', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-25 16:24:28', '2024-10-25 16:24:28', '2025-10-25 16:24:28'),
('104f2c116f27fb3d8aaaad6ae33ab72c6fb37f8dcd8117be509dfe17260abc043f356934c02f23b2', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-31 16:11:48', '2024-10-31 16:11:48', '2025-10-31 16:11:48'),
('118214604dbb0cdedfcd82478c0d3c583dcd582d659850d29b19e6dc183e56d2281589f6993615aa', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-03 13:31:50', '2024-08-03 13:31:50', '2025-08-03 13:31:50'),
('12d16915d231bc6e9111d43e6132995b7e9833f08a4034fa90ba9d44b86bdaedd7735295dc213bdc', 'ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-07-20 11:36:15', '2025-07-20 11:36:15', '2026-07-20 17:06:15'),
('133e079ac420443837883cc19e21e2930b6f09b1881bb2f4f4b6c664d63b06837fbd960d06feafd4', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-12 16:40:09', '2024-10-12 16:40:09', '2025-10-12 16:40:09'),
('145da8b1f003d874742caebc886bc2c0e4f36d2a148fae98115fef52849c1e0c1d752074eef09c88', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-18 12:44:35', '2023-09-18 12:44:35', '2024-09-18 12:44:35'),
('172d712f7bbd399ae79e0c1b929b3760d1192512561b4df8666fe793541034da5a8badbd4bb322f6', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToAdmin', '[]', 0, '2023-06-25 19:03:41', '2023-06-25 19:03:41', '2024-06-25 19:03:41'),
('18a3cfa820aa6a0010f985a2641247a822683ac4797a01d024de20d5e22bc961e575d6bc11fa8c77', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-24 09:27:42', '2025-03-24 09:27:42', '2026-03-24 09:27:42'),
('1ba14dc704074a023bf397d9eebb1ada24eea76d3c1f3d24ffb7cb1c26b0acf1437046f83708bfe9', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 19:12:04', '2023-06-25 19:12:04', '2024-06-25 19:12:04'),
('1c8aff6c4841e496b4c8c0ca877659793db1b1be66bf1c62dc9404d8201de21e939a3c66dd7e6f5d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-02-15 07:11:41', '2024-02-15 07:11:41', '2025-02-15 07:11:41'),
('1c96626116e79be7ec5e47b399a7c7a543b37cd158b09a7dc4704338bb59555197a64fa0df5a8299', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-22 21:36:06', '2024-10-22 21:36:06', '2025-10-22 21:36:06'),
('1e407d22c4d5b884cb82b8597b4ce6e53619715905bc95126367c5e54fc980b64f7e38fdc53d6aa7', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-15 18:34:03', '2025-05-15 18:34:03', '2026-05-15 18:34:03'),
('1eda29aaf5a301fa8732eb45c845c7f635c19e436b45d48ca322c8c4a80eb7f7d04951af3d5ec0aa', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 15:15:33', '2023-08-17 15:15:33', '2024-08-17 15:15:33'),
('1eeda7d46b075f2acd0bdd18bac6722c169a0a793cbec1eac80c773195003577279b7eb9a16d11ab', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-20 11:42:06', '2024-10-20 11:42:06', '2025-10-20 11:42:06'),
('1f334e2b97573e2c9ea5c710845b6d13bae720f87e9fc9190362bc7c7b195317402e2fa4a7309fb0', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-11-07 02:08:05', '2023-11-07 02:08:05', '2024-11-07 02:08:05'),
('1f41c8fb4cf1c9929736f09ee67746335ead8fcd9d01503d90254e9b3b62c8ff358f669318c426d1', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-18 16:41:17', '2025-05-18 16:41:17', '2026-05-18 16:41:17'),
('201760e3c5143dd50ec542bd55db9177b2db6c69908fcf979dcc934ae4f24a2239678e9efaa7fd65', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-02 00:23:24', '2024-08-02 00:23:24', '2025-08-02 00:23:24'),
('20fffd5a6cc12d70512a4829d0b508299e4e887d142c3e8d9841215e792605d66289add008bf1027', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-28 00:22:00', '2024-01-28 00:22:00', '2025-01-28 00:22:00'),
('24579cc958e939d208b1aa731f3ed93bb5cfcc4b7d562880cf944a54b899b2c5f32409d772d806df', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-31 15:05:51', '2025-05-31 15:05:51', '2026-05-31 15:05:51'),
('24e206591f975c501c71ccf80d44c4a06dd4b8726d9c555f168ff811d01d24e5d78ed2c4fd109528', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-27 07:59:29', '2025-05-27 07:59:29', '2026-05-27 07:59:29'),
('25c2af00598c176744c150508281d41255cab7f27d8fde6755152ae126959ff9934abc2261417b3c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-31 06:29:15', '2025-05-31 06:29:15', '2026-05-31 06:29:15'),
('262a13220a96211b32c746abb86e02adb98ac2c91292371d472d04d9f5b36f6996448e3fc375ddb6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-21 17:02:36', '2025-05-21 17:02:36', '2026-05-21 17:02:36'),
('27bbbb96d0f40f85434624a6f021d1fa7443b11386cff6973a5fff3191a60cdeffb374cbce809dec', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-18 12:44:00', '2023-09-18 12:44:00', '2024-09-18 12:44:00'),
('281a8677c1ede7bd1cab51559f70a8bf1aada955a2606fc83787e45c4440644282a5414b84a211fa', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-19 23:29:42', '2025-05-19 23:29:42', '2026-05-19 23:29:42'),
('29a1702216021fa2de301482703624fa1f217610cbbab5ee4b4a9ef615537de7c2aa766189e39362', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-07 11:52:12', '2023-08-07 11:52:12', '2024-08-07 11:52:12'),
('2ba554bf4987a9f8715cb1f319880df64084d3d3f47f5699210f85729bf6c29fbb24d2d5f400ae09', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-28 07:50:57', '2024-01-28 07:50:57', '2025-01-28 07:50:57'),
('2cbc530d72ddb1d99a536987f1ee4bd290f9755397507546a72172632cf4bcd08e4f8a6d2ec71dfd', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-02 17:37:36', '2024-11-02 17:37:36', '2025-11-02 17:37:36'),
('2dfa6a2a5405f5087240c79f5cb7329951ce41e9f45ac6856dc1469815251cf0c913bb8ccb20e810', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-06-25 20:36:04', '2023-06-25 20:36:04', '2024-06-25 20:36:04'),
('30cb50862c44f6b9f549d962e92654ad2d38905d7929f322d9c95300726bf522436f04df5c5f7e67', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-15 16:32:30', '2024-08-15 16:32:30', '2025-08-15 16:32:30'),
('324c1cb36ef3bc83420075471b7bdda96cdf5bffb359030c800cbffdffa6338cbefbf739b4acb16a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-19 15:44:47', '2025-05-19 15:44:47', '2026-05-19 15:44:47'),
('3256ecfebc89990e241004f2738d22ae6c2705809a708f747b1e9feccdcd6f975515ada217c6a4ee', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-01 21:22:27', '2025-06-01 21:22:27', '2026-06-01 21:22:27'),
('3275b36579031731b6be7f9bb0bf80d0bbae6d851a57577a79a13336731a877fcb4a725a416b026a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-17 01:02:17', '2024-07-17 01:02:17', '2025-07-17 01:02:17'),
('3504c66387095ecb28d5d5fcc9f86e6a534b6787dd1809d7d26074e0565def4838c515e34a0cb1ad', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-18 14:21:25', '2023-08-18 14:21:25', '2024-08-18 14:21:25'),
('355cf64d30a6c29e95e96e30f5ce70845abbb5907076e04b6d61cc53446852eea9573df2d5cd0a24', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 19:53:06', '2025-04-04 19:53:06', '2026-04-04 19:53:06'),
('382bd1355090448747148036bad6b82d1114f4fcbcac13899782fa09ef4e40be30ab171c1f0665d2', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 10:35:30', '2025-03-27 10:35:30', '2026-03-27 10:35:30'),
('39510137be7c44d7a6d7ba88e153e5b2a2f41774a02ebf15a0ef4e42494d6d204815493b51847135', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-09 13:13:56', '2023-07-09 13:13:56', '2024-07-09 13:13:56'),
('39a3131c2a92681e6620598043ba45895642109aaf5d2b05e04196d1a380907bad01f84751cdeeca', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-28 21:19:25', '2025-03-28 21:19:25', '2026-03-28 21:19:25'),
('3a2bc0e20c5876a4680dabf48cafa786f6ace24dc9f901dfca6d1ccdeb9515f93686ee255279e272', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-14 18:49:47', '2025-06-14 18:49:47', '2026-06-14 18:49:47'),
('3cf35f68e3415dada0f585d8b910360a68164b5ffb8093c55bd014f7b3892db9a23950a43832bfed', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-11 16:14:34', '2024-08-11 16:14:34', '2025-08-11 16:14:34'),
('3d10b8ccb6c935b160ddc0c57615c8e434152a3a60a418c888da14ba8d81efe65b70c0d52e77dcaf', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-18 16:21:11', '2024-10-18 16:21:11', '2025-10-18 16:21:11'),
('3d43c0ea52d8fbc66cb7dd9c395d46bd82de8a4cd8ae9837976b75fa3ebe6f4bbd2f3e6e93729fc0', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-02 23:10:51', '2025-06-02 23:10:51', '2026-06-02 23:10:51'),
('3e26651abd580de50d2804d9a3404dda7e2f0dd88db8b5d3ff1efc413eccec501a41abdf054b7330', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-19 23:04:40', '2025-05-19 23:04:40', '2026-05-19 23:04:40'),
('3eea908f056d07465f9093503d603c23955c95c7e3f9b4bd01b761da0e6c91996bf131d26978dd16', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 20:42:23', '2025-04-04 20:42:23', '2026-04-04 20:42:23'),
('3f41218f7f70f1c2be4d9de22e0c277a7c833d193d919df6f91cafa107b90d9b593cd8b8cf858192', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-16 11:25:59', '2025-05-16 11:25:59', '2026-05-16 11:25:59'),
('3f86ab4d348bb68927db5b7abd718b362f08283c4d244b0ef4ed79ff93bd86cf5ea656aa6e62be8f', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-26 15:12:02', '2025-05-26 15:12:02', '2026-05-26 15:12:02'),
('3fff2877bba008a5af7466cff1f3a82a3b1ba323e97b16722687df8c8b33e5698a81c883ecb605f0', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-10-29 11:27:49', '2023-10-29 11:27:49', '2024-10-29 11:27:49'),
('418cb165fe03085332decfb8311713fac72026a2ff02cb896bc3c4b568ff2652f6cf8a58b94a3cf5', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-25 20:14:16', '2024-10-25 20:14:16', '2025-10-25 20:14:16'),
('458b5ff5ca95f49617635dfc0955e77a45ba74866c5b45530e4210fc68bd81e262c481fad8cdef65', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 16:27:56', '2025-05-30 16:27:56', '2026-05-30 16:27:56'),
('472a82132394d9667c84648ed2e32e69a5578c34cc38e9f164cb2dc4bfd1f365d8a0572065c8ad94', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-26 19:47:31', '2025-05-26 19:47:31', '2026-05-26 19:47:31'),
('473afb2570899e81d3da1ea17972c590facc4b7a64efbd5c15a900c0695477075baac922e4ddfce2', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-26 14:08:20', '2023-09-26 14:08:20', '2024-09-26 14:08:20'),
('4da0d5873b8e361af685af242b9c192ccbbbea8f2fee8c9e12b2404be3dfdbfcb8a89241e252bd5d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-29 22:24:36', '2024-01-29 22:24:36', '2025-01-29 22:24:36'),
('4ddfd4c2e47a3eac7da2349ba3f85a119c2862854da658f587782486b3aaa0c67f11751eb9168042', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-26 21:44:04', '2025-03-26 21:44:04', '2026-03-26 21:44:04'),
('4e69d4dc62527f2378097f5c38b474a1db3b4a6ba2ff3ed82826d61f21c87df2dee68ae0b3cbf238', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 14:28:13', '2025-05-20 14:28:13', '2026-05-20 14:28:13'),
('522542006067d3aa9a47296333bff4e1a9cdef72a0a99566eff17e840223b0af63b28aaa404c4fcf', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-23 16:25:10', '2024-07-23 16:25:10', '2025-07-23 16:25:10'),
('527f05ac5c32d8262f6d1639646d588f8dfaabdc0d4599f1575fdeb93d94a16f4796e3aab600673b', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-09 02:19:11', '2023-08-09 02:19:11', '2024-08-09 02:19:11'),
('52c43c0b5530ebd6a7707e1861c1e8f6e2ff91dcbc775ca2f0ce0d175952d58c2c932d2e21e8b8aa', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-28 10:01:50', '2025-03-28 10:01:50', '2026-03-28 10:01:50'),
('52eb7d90f4b1573e8ffcbbd068b863814e8ef175a19de675e3df73bf6b7a82ee612ef3aae3681bab', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 15:34:33', '2023-08-17 15:34:33', '2024-08-17 15:34:33'),
('53095bb55e2cd8eca563a2f4517896daa3b7e4b02e68900bc42f0ae21b5480d38eaea1b2ca288449', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-03 20:52:53', '2025-06-03 20:52:53', '2026-06-03 20:52:53'),
('53271a5244319b301e549ae3945b46f644aa207fb61341d19ebd77280f5b6e5f9c2705cb10515b1b', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-27 23:29:14', '2024-01-27 23:29:14', '2025-01-27 23:29:14'),
('5379225d9ad46315cc906324dcbd5644245c92d268ca2e8c8b9f4947cb49a9a83b5b09e20a0378e0', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-11 13:29:51', '2024-08-11 13:29:51', '2025-08-11 13:29:51'),
('540e01517049628226755bdebd665799691d477fdb430e0b6c7aac4fa0f6cdbc3d2b80c6ab063be8', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 19:10:16', '2023-06-25 19:10:16', '2024-06-25 19:10:16'),
('549d406ba5b91aafcb6a2176411010c78aede9d159ca9d40c86a5ecd9cb389789b8c26d95258182f', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-27 17:57:41', '2023-09-27 17:57:41', '2024-09-27 17:57:41'),
('56301b9621070529c5331ff5678d68dc96615e9360f57aa9712a66295fc65a8ec2da92fe3fb05f20', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 17:57:06', '2025-05-20 17:57:06', '2026-05-20 17:57:06'),
('5750d44a60ebc776f3cb007686537da716ca3886cb3653fac3f82b108358ead327b19d875bc3e014', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-17 17:32:57', '2025-05-17 17:32:57', '2026-05-17 17:32:57'),
('584e7a6e2d16ddab00cc7ed0fae4377dbe881e4200cba3e1ae207983ac23394bc22672d9a5b07011', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-22 17:59:53', '2025-05-22 17:59:53', '2026-05-22 17:59:53'),
('58fb966f50e31f2f2ddc24bd84decf518abcb81e39609a284443a21a99968fea6f80c3e182afb9c9', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-02 17:50:56', '2024-11-02 17:50:56', '2025-11-02 17:50:56'),
('5a8ed15f2ae8df6e6eddd38d05ed356f26761232e6aafa5ee0fa92d3e368de852b2a5be28fa1de58', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-22 19:38:37', '2024-10-22 19:38:37', '2025-10-22 19:38:37'),
('5bbabfbe6e55bf3d0f7b8b0061155f907a34def0981d08edd927ccc684159f91ece6e1495ad17232', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-28 00:03:30', '2024-01-28 00:03:30', '2025-01-28 00:03:30'),
('5c49baad823b675928a969b100ca6bed970ce7cd71ec049b2dde60d1bd6ba4cd37d9606a2e6f0721', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-19 11:41:48', '2025-05-19 11:41:48', '2026-05-19 11:41:48'),
('5c5151002046257cf899b001594542552fa010014447802bcb09e100069c32d844a9e6049f0101aa', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-16 16:12:12', '2025-05-16 16:12:12', '2026-05-16 16:12:12'),
('5c581f0e260a5f0f22baba6e0b893849690ac2f63eca4213e10828670ff8bfee126741d7f7ac1fc7', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 06:17:53', '2025-05-20 06:17:53', '2026-05-20 06:17:53'),
('5c972c0407b05c1088aeac6d218571a8e6904b2c154cc02b62a392f8f24c1d733cef1f60d71c3100', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-02 18:20:42', '2023-07-02 18:20:42', '2024-07-02 18:20:42'),
('5db1a67b516436f37a501b4be72836490f12daaa2ca35e0b1385ff7981c6cc8916b1dda4d6245d18', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-03-30 20:48:04', '2024-03-30 20:48:04', '2025-03-30 20:48:04'),
('5de8296f428cf54ed5468084d93382c082011f317b74793965a531c94f63a5a218f6870b5c5a244b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-29 18:57:43', '2025-03-29 18:57:43', '2026-03-29 18:57:43'),
('5f21ee28cd3212d63878cf03c2fa39ffa865fb3070912d5f7b993b28721dc25f31b47c970b97c882', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-21 15:38:10', '2025-05-21 15:38:10', '2026-05-21 15:38:10'),
('5f6233faf1bebf4adde36aeb5acd7ba55bad5c32d432ce0eac26c445e9d62909272243f74d19dc07', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-18 12:11:25', '2023-09-18 12:11:25', '2024-09-18 12:11:25'),
('5f9ac52462c900cc0e9aebb55a2b658cbcd9cf9873f202573c865fcfdf4d3671471b6ac3d55153b5', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-16 00:11:19', '2023-07-16 00:11:19', '2024-07-16 00:11:19'),
('60e5ad3ea644ae4f6b8165fbfacf54b460c22ca697ae492a97a6e0518237cb2767d57859227ea81e', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-05 14:47:24', '2025-04-05 14:47:24', '2026-04-05 14:47:24'),
('61013bd60b8cfe58f37f0a38d4cfaa47b312911a00f2fc02d7730e4127d68eb987c4040f09e742c5', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 19:08:07', '2025-05-20 19:08:07', '2026-05-20 19:08:07'),
('61bf297b948057f50c630724d5adc30c4e26c321bd6ae4f2e370e9bbaeec531a2baa6199f24e606d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 21:36:11', '2025-04-04 21:36:11', '2026-04-04 21:36:11'),
('625157dd576564061af94f85c382415cea5bf2c9e85375c97d79ab8d7e9f1e8ba8eab4d055c92092', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-18 22:15:25', '2023-08-18 22:15:25', '2024-08-18 22:15:25'),
('62d3c0c9ca3c8acdf9ad2f1180b51e82810ebcf39b06e0b9d47f2c33e3fba005432a72338ed70970', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-05 11:26:01', '2025-04-05 11:26:01', '2026-04-05 11:26:01'),
('6392c8567f243c97ea9bf386430af54e41115a9d8ba7f813ea97f562d71af127418f067f9744c698', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-10-31 18:30:59', '2023-10-31 18:30:59', '2024-10-31 18:30:59'),
('648accb6e8e387f26c8191739762c4b2732abda2f591a7a2794a9ee274e070f39cfb01ebd4900c67', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-16 20:22:55', '2025-05-16 20:22:55', '2026-05-16 20:22:55'),
('650d312c434adf772850e1bb90f0ddba436402c9489e3c0d0b076af6ae20e5ac54058f2e133aedee', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-01 23:00:33', '2024-11-01 23:00:33', '2025-11-01 23:00:33'),
('656135c3e7bc929c3782421e27f3de69efa404b812bc1e5dccd16a6ed362c6888b87d4748ed76e12', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-12 08:00:20', '2023-08-12 08:00:20', '2024-08-12 08:00:20'),
('66165cf5a2e86d8363ea41c5cabee128d944ced9a42242c9898de60b5cdfc7b8f3f54efd91d82183', 'ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-07-20 15:09:04', '2025-07-20 15:09:04', '2026-07-20 20:39:04'),
('67869c70d06f76c0aecb7a349b5417ca8c966affeeb89665cfd86ca05afb41ba1f2a0f3cdae7e16b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-01 09:11:41', '2025-04-01 09:11:41', '2026-04-01 09:11:41'),
('67b631ad8d5dd9951da7c1099f91418c1e3ac327ed265c24e08f249365f6d02e664870c25955eeda', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 12:58:30', '2025-04-04 12:58:30', '2026-04-04 12:58:30'),
('6992daa80dbbe3d67ccf504a38f34e76429177f2e6123913c75a569750f4a9b7813ffd92c8627e4c', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 21:03:53', '2025-04-04 21:03:53', '2026-04-04 21:03:53'),
('6ba028e01535b2f3451f11ba6a7d9e538a0f2c6d4ea35b24b169159369afce86dd5533f54c1fa73a', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-18 12:37:30', '2023-09-18 12:37:30', '2024-09-18 12:37:30'),
('6c0023a320ef5a5eba716611386f741cb02697ffd08661d704d0e95245dbdf0b45a571a332e852d4', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-10 22:25:59', '2023-08-10 22:25:59', '2024-08-10 22:25:59'),
('6c0e15415ffe0f3548b84e5d2ca3b3ef8a5a539985db8cdd3255069525dbef1b0c462fe08e5a3524', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-15 16:15:10', '2023-08-15 16:15:10', '2024-08-15 16:15:10'),
('6d2259dd89a9e40b3e4485768f45c2e27ef69fcfe634598ecf5b97a9e4b58c8f295f949469931ad6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 12:06:14', '2025-05-28 12:06:14', '2026-05-28 12:06:14'),
('6eff1ad443dbdc0ac20b9ecba4dca183f887aebb96a224683bc64cbbe88299b50e35d7e9cf93ce8a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-19 10:20:19', '2024-10-19 10:20:19', '2025-10-19 10:20:19'),
('7116b7cd19b0cabe8d12cca7f6a2e6ccc4f69b3d5e74e5a861bfcc3948f91c2a451454f2cba13d9a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 21:28:35', '2025-04-03 21:28:35', '2026-04-03 21:28:35'),
('76abf81fb604103df619969737f4dcfa943847207f411123e04cc8a6893f3962220aa640b0ba85a6', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-08 01:50:03', '2023-08-08 01:50:03', '2024-08-08 01:50:03'),
('782150d0cd748270603121c87beda837a33519036d352a6b06f4e8dfc06099afbb3b67048bcad0b6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-31 20:52:16', '2025-05-31 20:52:16', '2026-05-31 20:52:16'),
('7a14cd14c440322b345772c02fd2212852f5e45d1030eaba8b01d592bedbde7bb360b42142246bc0', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 19:53:49', '2023-06-25 19:53:49', '2024-06-25 19:53:49'),
('7c6a4e21d7f03d00d21f7d1a9dc9bd2ebd57b576ae193d4addbf4349bea272012786869bc4294b41', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-06 14:30:29', '2024-07-06 14:30:29', '2025-07-06 14:30:29'),
('7ce3d73f4d24e4f0b86c63db2bc5aea9af6b44c0aced78d8f5a44ba0ca7ed3f9c4fb5408514a1ba3', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-31 10:48:35', '2025-03-31 10:48:35', '2026-03-31 10:48:35'),
('7d8dc4ce5a562ce37529602b35c4b4c9eb3dc1563c6cd2586b75b5fdcf7f1af871367919a3b5cb97', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-10-29 23:09:17', '2023-10-29 23:09:17', '2024-10-29 23:09:17'),
('7e5c0b887cb36680a125b72a9a178b0e61a2568cdc50551599f69a97788f4fe8f85e8525de6c5fae', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-12 06:32:06', '2024-07-12 06:32:06', '2025-07-12 06:32:06'),
('805ef8b1e99fd9e50924d3d5df4077c9d17ba8d9659a719813285d88fd34e9198b425bc460d3597a', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-28 07:52:46', '2024-01-28 07:52:46', '2025-01-28 07:52:46'),
('808a771f3b173673cfab7c0e44e94fc0bc042d821e95e5ac3c350d5f9de9c74fc6f574e7b0a15150', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 13:08:57', '2025-04-03 13:08:57', '2026-04-03 13:08:57'),
('83124d17d9681516f6910827e893b68554eb5ca35b5657b9b8eff3c01047bd01407e217afb590ec1', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-20 16:57:25', '2024-10-20 16:57:25', '2025-10-20 16:57:25'),
('833a0a6e552d4a6f08c602edc35a53fd932fd5644f9989e2902a6397c11d6b5c0c42c12fee66f97a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-19 10:17:11', '2024-10-19 10:17:11', '2025-10-19 10:17:11'),
('83b4bf6a154c7f9b3ac26454a11ff7f939523e2c65ec1099cdc395625f2bd015d60f6d4f33ec1710', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-18 11:43:59', '2023-09-18 11:43:59', '2024-09-18 11:43:59'),
('840f7b576814f96a7494d0301c4ee8f5bf8d42ef0655305ed695f2fbc33c055db455c6dd40024b7b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 15:12:52', '2025-05-28 15:12:52', '2026-05-28 15:12:52'),
('843c303f3d78f35dfc1e21c689a5b922839ea08b32810821483b77b3d2560192ebf78d9e2f165823', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-27 06:54:06', '2024-10-27 06:54:06', '2025-10-27 06:54:06'),
('84a43e137474fe06951de641331cac1a833380ac822c01cddaf16302849ac548ff3899dc5ba561ca', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-16 00:30:00', '2023-08-16 00:30:00', '2024-08-16 00:30:00'),
('8500de3e36bd6d261b2000c37336516938c1b65da7b09d844b72b715546827f1c277b46628188642', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 15:02:09', '2025-05-30 15:02:09', '2026-05-30 15:02:09'),
('863fbabc2bf4c732537629981e4f8cca5780f028d3ca0a0b71b9f061c1581fcb44bb9d2293871ce4', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-05 07:22:39', '2025-04-05 07:22:39', '2026-04-05 07:22:39'),
('864ca396e57ca3f50cf35b70fa354563ca80425eb00624025cf4ea76b8c5ebe7fc9e37964832f3e6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 16:59:38', '2025-03-27 16:59:38', '2026-03-27 16:59:38'),
('891d319a13b5acc9170a402150f71d15340d64c34dc3574da1eeb56e9b10c3f6c30163df0d6ea7b3', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-29 12:03:42', '2025-05-29 12:03:42', '2026-05-29 12:03:42'),
('89251641f1d3fa1958545ce5fe65c599e475ff78df78188a36edd4f8f3a52ff8b2a99edb99e00143', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-15 23:48:49', '2023-08-15 23:48:49', '2024-08-15 23:48:49'),
('8a3fe3aa0c960387dd6e6f777f54b491e8e01f28815a4bc2ff1a2b4dab674e915a67bdb776f58056', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-13 02:29:18', '2023-08-13 02:29:18', '2024-08-13 02:29:18'),
('8a6624eafcfab098d545c0e536288dd5876a284c91605fc98176a488b94fb0d3d68d5ef0b6acbdff', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 19:04:23', '2023-06-25 19:04:23', '2024-06-25 19:04:23'),
('8ab36745077dc9df42ebe6789f7137b5d876ac29c5806d293ca8c3ee786576119779b7008413eafd', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-28 01:28:19', '2023-06-28 01:28:19', '2024-06-28 01:28:19'),
('8b3a7b42ecc6d9cbb68ceb50e327afca67969f08176495fa348f0a14d3e4f8cff7dd32360ca42ca1', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 22:24:52', '2025-05-30 22:24:52', '2026-05-30 22:24:52'),
('8badf8a2ea2ffbbd0dbc70dd653a0bcbc52a775b116ec8f76557ec3ef4a9d3f0dbf41984ec0e55e2', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-18 03:14:32', '2024-01-18 03:14:32', '2025-01-18 03:14:32'),
('8f4835ae15332084c85ca1bc478121ef2932ec2cdb17382b524e5949a3caf4df868e88fccadf7516', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-05 17:05:05', '2025-04-05 17:05:05', '2026-04-05 17:05:05'),
('8f7efc68f25bd59d5fe9c7c5620366e2f65a7295828753add34551e94b9454097570a1cd71a0cb33', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 17:39:00', '2025-05-30 17:39:00', '2026-05-30 17:39:00'),
('8fd9cca48056b209ae1b82daba69d663b32b7a3a7afd4f634740773af7d57b1f3f857463ff5a5cb4', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-17 02:39:05', '2023-12-17 02:39:05', '2024-12-17 02:39:05'),
('9041e36fc1e46ff91df611e950c01382327d97680a045774881628c1a3935052b2fdeaa321921b3e', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 19:05:21', '2023-06-25 19:05:21', '2024-06-25 19:05:21'),
('90813b8566fd9c350a012c5b00fe95932f3d55b4aef9643c4a9c023f0522c13675110f2a9e084a41', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 11:31:58', '2025-05-20 11:31:58', '2026-05-20 11:31:58'),
('9259828b4f7761882b8ebccc2bd2d7c8730d9b9e50e1dc9c5b6c4afda612b609e1a9f5583f15ec1d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-20 15:02:00', '2024-10-20 15:02:00', '2025-10-20 15:02:00'),
('92ef1134b7b47f8e4f2d109340b39b8900c57b5ad133ab6a0e70aab66d12e8bd4028f039506ff430', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-11-07 01:07:54', '2023-11-07 01:07:54', '2024-11-07 01:07:54'),
('9364976a73102ba59c73a3fd5dc4f6a8b965466426df89a6cc77e501a35d099ec22af5975dc2a5ea', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-23 08:15:50', '2023-12-23 08:15:50', '2024-12-23 08:15:50'),
('951b1cd71c6f00ae7f8304e9180ed2dd1e6d7e134776ebe01cedbe88f5745a7313a8ad643dcce951', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-28 19:48:18', '2025-03-28 19:48:18', '2026-03-28 19:48:18'),
('955e5fe7b8aca03c1c68a9bb8ad81ca64f31b647b624396aa7382d3c8b6587e1b48572c787f0ec78', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 20:16:46', '2025-04-03 20:16:46', '2026-04-03 20:16:46'),
('975780f0649994babe9ef6a79d61b9b0546501f77b38c88f4067c47ae7b5ae1a8c7a8b4a4661808d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-16 21:50:32', '2024-07-16 21:50:32', '2025-07-16 21:50:32'),
('9903b42ab22ba33d0566f2c758337a09278fc884a306da1db6e6d252c492c985696e570ffc35bf55', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-20 17:04:56', '2024-10-20 17:04:56', '2025-10-20 17:04:56'),
('9904a310c20af3bd86124c40db1c04dcba19869ebf8f2c07109b6098d420b6c1e190e580d09c9e77', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-01 13:54:40', '2025-06-01 13:54:40', '2026-06-01 13:54:40'),
('993fdb253167cf5b4210da69966dc31fbe9049cfaa7974330344008278ca3220863417ef01e4f999', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-03 18:37:35', '2025-06-03 18:37:35', '2026-06-03 18:37:35'),
('9b7af8bea6935eed86079f1e6b2114393b4ad1b10c1ae97d2dd7c7423d255477af7ef97700d7efaf', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-18 22:10:01', '2023-08-18 22:10:01', '2024-08-18 22:10:01'),
('9bef6a31bbb7e343d4ee011ba60b2675affc9b530109591676cf31af86cd10f6d5e57400e16a32fd', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-25 23:06:03', '2024-10-25 23:06:03', '2025-10-25 23:06:03'),
('9f9387cd24f045cdf0a61d6016d3b793b832f83be3809fbf3f171fed9917fc68e89190517b38f91a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 13:06:51', '2025-05-30 13:06:51', '2026-05-30 13:06:51'),
('9fedc1ce5f5439f41f9b1c436af812e095a0e5b31677b2e930e8aa4efdb8e778545572500786aec4', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-28 13:46:34', '2025-03-28 13:46:34', '2026-03-28 13:46:34'),
('a02aaa6bb1f06b56e723847ea6186a60bd809c6d98fb47a0dfe3d4a4cc7bf597fd6d64b6d3f1bd5e', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-15 23:55:20', '2023-08-15 23:55:20', '2024-08-15 23:55:20'),
('a09f823bd90b6072d5e3702e31efd5c34f98f9f61460c8993dbf5dfaffb1a62519189f6f89c82d2a', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-29 19:40:25', '2025-05-29 19:40:25', '2026-05-29 19:40:25'),
('a12a0f1fa0d7250e262d6d9cf50287cc36e458e989ec3536f9ba6ac4ee06ecd34f80bf4c1b25c119', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-17 19:11:41', '2025-05-17 19:11:41', '2026-05-17 19:11:41'),
('a44d6d7a8cf55545e1273bde2c3e336b4bbc095dacbb993555c34a40faed8eb26094f05f9006fda7', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-17 20:41:15', '2024-07-17 20:41:15', '2025-07-17 20:41:15'),
('a60fe19e6b34213b08e5a5f63e00a4a435a080088e006c5f78003052c53f7430c0b594ba5b1cdddc', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-10 01:52:48', '2023-08-10 01:52:48', '2024-08-10 01:52:48'),
('a78ee96746447654fb7b36ef68dc7bdb4dde82bf6d3bd6c7bb25264ca6eeab22eac5ac70cd6759a7', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-07 11:31:01', '2023-08-07 11:31:01', '2024-08-07 11:31:01'),
('a7a547961f638d69af7061699b56211de0ff3c99eef090021c7c6c3e85c50df2f09bf021b9702a71', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-13 12:23:04', '2023-08-13 12:23:04', '2024-08-13 12:23:04'),
('a90512c8728fa8b23de957d604f2eb9bde5fefed583adf3880b1ba5a72cf1e2c8689ecdaf5f4d714', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 10:12:26', '2025-03-27 10:12:26', '2026-03-27 10:12:26'),
('aa59e53460617975bbfd0bef42a632a0b0e8053cb286b2c0c8b02c49c12e1e1714f66b5a0b32baa6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-26 17:17:58', '2025-05-26 17:17:58', '2026-05-26 17:17:58'),
('ac3c62b858e8676b2dad4eaeff648af2c0f2d6070f964becc868ee2777887abea9192a86f3405d3d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 08:09:24', '2025-03-27 08:09:24', '2026-03-27 08:09:24'),
('ac54750901e02113b2cedc4a7491b567290ba0191cb3a954a82c09173f98f47bea3964976851d86d', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-31 05:56:41', '2024-07-31 05:56:41', '2025-07-31 05:56:41'),
('ae1311b7aac739ffd843122a835c9abcaecf17196919fd494c6d464c6bfa1cb746f0d274d73b7a8b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 22:15:57', '2025-05-20 22:15:57', '2026-05-20 22:15:57'),
('ae390ed0020107487b869eb97d275ed0415dede1b0e822365d0a4ed73d24f9469ffb168d5aeb6595', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-11-06 23:50:17', '2023-11-06 23:50:17', '2024-11-06 23:50:17'),
('aee8c0966c8bbd93c3de3632f14c21a3ae5d369b4c263dcb109166793f879cf558f88b103de1462e', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-28 16:16:47', '2025-03-28 16:16:47', '2026-03-28 16:16:47'),
('af69569cc1a0d8c947b131b6a176080a5c1aaec295fa93ea65163811dc79be49632733bba52d2d7d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-20 14:18:54', '2024-10-20 14:18:54', '2025-10-20 14:18:54'),
('afa24c7bfeaff1ffd752797b061659814fc04b8cbbaf8aaef4c68f832f2e482aca704d34c703f4eb', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-02 17:47:53', '2025-06-02 17:47:53', '2026-06-02 17:47:53'),
('b2177977e466828085fa764195d322c96c96ccfd36b50127c3eaa02e3629da67ed46b1e2aa4e8b64', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-09-26 14:07:32', '2023-09-26 14:07:32', '2024-09-26 14:07:32'),
('b3a61dfc482ba5afe7a7063d795821ec30b46e9a854dc6f20e9b3c1d35504e6f4e51453e80398350', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 07:18:22', '2025-04-04 07:18:22', '2026-04-04 07:18:22'),
('b5b124e31a67941d32b7f0c25b4ea0186bb9150104b8fdd62a75e37cf1a2aca0680efd7a6839df82', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-03-30 20:31:21', '2024-03-30 20:31:21', '2025-03-30 20:31:21'),
('b66972e5b18094b8ded38f2ad58a8a56e8e1c86515fe59aa568e6eccda615311cec762aa090c8e14', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-02 20:25:24', '2025-06-02 20:25:24', '2026-06-02 20:25:24'),
('b9120db06fa17d0449a35aed83ee8f6562c8df816f8e623ae4ab7cac95cb1b223b779c22538582ad', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-27 22:31:39', '2023-12-27 22:31:39', '2024-12-27 22:31:39'),
('b9b5e356ede541d30e5548791aa760a7bdf3678f0fbe384642b62bfd8a2c23da59b77d7c32799abd', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-02 16:53:43', '2024-11-02 16:53:43', '2025-11-02 16:53:43'),
('b9fd3f200d6072789639c24eeb90191ae93c7a0ad4da273fb1b255d048b3da937ff4d26073598125', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 08:49:12', '2023-08-17 08:49:12', '2024-08-17 08:49:12'),
('bad3b218bf909d540a4245d5fc615ba043f05f56f5019ccecd49b39b2748a2399765847745697924', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 23:53:47', '2025-03-27 23:53:47', '2026-03-27 23:53:47'),
('bddc151e435c5b55beb3e6c4db784243501be964b4d742060d075380e5e9b3722c76a7ed8e57d9f6', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-17 22:21:49', '2023-12-17 22:21:49', '2024-12-17 22:21:49'),
('be5cc31f25dcfe1b0b12eaf3bba6cf8c282674ac4a7f8af64202f440a75c053abc5053b0263c7c65', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-03 00:08:39', '2025-06-03 00:08:39', '2026-06-03 00:08:39'),
('bef10304523cba967fb13e043ea13393801f869f531338574dc66a9f4a7ba45a0a19cbe995032158', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 19:40:46', '2025-04-03 19:40:46', '2026-04-03 19:40:46'),
('bf044e41ffa089d395d510a4d5c604064443ed94cda1055bd911f1a0f05f6bbc5d64f1032d20212e', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-02-16 07:44:41', '2024-02-16 07:44:41', '2025-02-16 07:44:41'),
('c139b39f84ce65f5fb99821f6fe697e09e3c878cfdb183f86e32dd906a42b01979e01122554082f4', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-01 23:09:54', '2024-11-01 23:09:54', '2025-11-01 23:09:54'),
('c1579f9991520ac1f3612aee8326aa1afef5dfa62a1e52cbd044089abf5b33fc2844fd203cd00428', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-02 17:40:33', '2024-11-02 17:40:33', '2025-11-02 17:40:33'),
('c1cff4aa848d642d398cbf114de8daa18c38609260dc2b3caf8565df6a4b7f60fff4f94521af37f9', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-06-20 12:38:54', '2024-06-20 12:38:54', '2025-06-20 12:38:54'),
('c1e980aea3e32f7fdc8b56e89632442bca1c82d4237d1b9468c1ce869beb8ba46ff089ccedd1eff7', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-21 11:36:48', '2025-05-21 11:36:48', '2026-05-21 11:36:48'),
('c27c5e54d1d7671284218f90b1af865d0d0bc6e999e5af0711357bd9f96ee6caf467383e649d7038', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToCustomer', '[]', 0, '2023-06-25 16:16:06', '2023-06-25 16:16:06', '2024-06-25 16:16:06'),
('c3319aa01f933876c91e7d408f0bc651fd7a9b49d2b68b501a4cd410293b591a306c153905710caf', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-27 19:52:09', '2025-05-27 19:52:09', '2026-05-27 19:52:09');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c338e2d8a68f5f16ac56a172d2fcba15abc3a1a9df39125b78d7b594e198fdae78d2bd602ab8b0a7', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 17:25:24', '2025-05-28 17:25:24', '2026-05-28 17:25:24'),
('c372fc798fea75b0c9b92a5c36d268f3583d8c28a497ed41b128325011f2f8f58924ef6973515934', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-12 13:53:57', '2024-10-12 13:53:57', '2025-10-12 13:53:57'),
('c4a60ce19f150eaa33db52a8a56c484ab65e56789626783c6d449aefba525b9a5d9414205a18b33f', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-31 16:28:20', '2025-05-31 16:28:20', '2026-05-31 16:28:20'),
('c5997a7ec2e934be47399a0f2f18bb5d17582db7446f012b2e0c3d1dc8cb420075fcdf9096571ed6', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-29 20:43:03', '2025-05-29 20:43:03', '2026-05-29 20:43:03'),
('c80617fd64c654f67f95310d9d246b681aae7b90669c3a3a52e2bbc10d5717453b1635f8bb5bf860', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-29 23:03:02', '2025-03-29 23:03:02', '2026-03-29 23:03:02'),
('c9ca83440af9c4204a2463f7d0ffec1795d371c51d1984fe07f229bd7bf73ba1bcd7f588e862d6a9', 'ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-07-20 15:38:16', '2025-07-20 15:38:16', '2026-07-20 21:08:16'),
('c9ef00ac17dbe0c2fff027657bbca1543c383907d98fcad234011c29915d6326bce6f1c282066abe', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 22:58:39', '2025-05-28 22:58:39', '2026-05-28 22:58:39'),
('cb49aeb8e68688b8339cd63b02fc75248fc2f3992107b22a4d9323560fc331e50a7734c4338bade8', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 14:48:25', '2025-05-28 14:48:25', '2026-05-28 14:48:25'),
('cf3d674661af236dab8051271aba93f64276760960e9af1820e411e03f5f294cf3b30cc134f0a49f', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-10 18:05:57', '2024-08-10 18:05:57', '2025-08-10 18:05:57'),
('d06c67b77546511b4f8aecc9025f97d97b6ccfdd3551f1eb441cc8dc395504b287c4da902b19ce01', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 00:33:02', '2025-05-28 00:33:02', '2026-05-28 00:33:02'),
('d16428ab2c69c8856451db68a822010ed04dc8c0687b158e1ae35f1102378f5e8cdb5a61933d3df9', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-20 19:34:42', '2024-07-20 19:34:42', '2025-07-20 19:34:42'),
('d22ef4b7a44be9d77151c1994337f693967e9d95369b3abef4f04d0c96fcbb410411de4908d8e457', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-11-14 01:53:24', '2023-11-14 01:53:24', '2024-11-14 01:53:24'),
('d2671940d441a6076e5ac5eedfa439c98ee67a1729ee4668eede8fbd38cc94fb3d72f2925f50960d', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 13:19:35', '2023-08-17 13:19:35', '2024-08-17 13:19:35'),
('d2e62967a441dd1edfd6a88ee897035dc77c40d0b8929e7fd5c2369fa6ebf0b9c5c4d007c30d1016', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-22 00:36:56', '2024-10-22 00:36:56', '2025-10-22 00:36:56'),
('d447c927270d507d3f4ed2800e08eebb6076d028d90e6c4a0e4bde1f46017ca1e9b7fbbd39e3832f', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-06-25 20:38:01', '2023-06-25 20:38:01', '2024-06-25 20:38:01'),
('d5359bb8ee3859b789a5fec6c5ac2ded582693b017d86461a5c532174ea54d3c03aa8566dccd2c21', '8ea23f49-a5ba-4938-828d-19d275158a90', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-29 12:25:33', '2023-12-29 12:25:33', '2024-12-29 12:25:33'),
('d661caf80ce93a23f0f64c30d617f3a46c5bc11081269b0fe35e98bf505ffb35ca22953c87f90373', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-17 17:32:00', '2025-05-17 17:32:00', '2026-05-17 17:32:00'),
('d78d35676377b905fe5b27d4a20f3bdd23110c6ba621ebf643528c96fbab79ee644e0745021f98a0', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-27 17:24:11', '2025-05-27 17:24:11', '2026-05-27 17:24:11'),
('d79f66548cec2eb40d8d13967d1261d67b5872d7e2b9fae20d68222459bc69c547d5c03029cfe896', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-18 16:27:34', '2025-05-18 16:27:34', '2026-05-18 16:27:34'),
('d920d48847f09fa72f00f5379fd509f67a3d345a52690e79dd86d4e6954d9fb564997baf1c1404d8', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-26 20:54:59', '2025-03-26 20:54:59', '2026-03-26 20:54:59'),
('daf04fdc061e7f3dd52ec6d127051ef0d1788ec123c22b48e15624a81feaf46b35d067e9f08cb278', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-03 13:09:29', '2025-04-03 13:09:29', '2026-04-03 13:09:29'),
('ddddafc8dd41dd09316a94c201893bf55fa9468b2238b362c737826f66b37eeaf5efa74e37c1c574', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-17 10:56:42', '2025-05-17 10:56:42', '2026-05-17 10:56:42'),
('de2e1f8e87130d262c08dc5e4a6067918de639d857fcb0be414990df5af418eb26bd68bd5e4069fa', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-17 07:28:41', '2023-08-17 07:28:41', '2024-08-17 07:28:41'),
('e0011ccbdd563a044f989124da0c361c7b50cb23bdb4a243fe354265f8121e687e5df8e2ddbbb812', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-18 07:02:19', '2025-05-18 07:02:19', '2026-05-18 07:02:19'),
('e167a3bad008c3d1aed7250f3ae1ac5ab91ac7f93cd407e2d9a25e9431efa699cb879057b38b01f5', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 21:00:00', '2025-05-28 21:00:00', '2026-05-28 21:00:00'),
('e28750e97ea83dab087676cf0f89c2b9dae55c49f75ca1496b28ef5f2e0b2ca22c664a00812a047b', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-30 11:42:06', '2025-05-30 11:42:06', '2026-05-30 11:42:06'),
('e37650ef8541c1601ff986e4b23b0b9a42d1f860ce187b023fe3c913da9d376079b55c6f860f9b89', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-22 12:56:45', '2023-08-22 12:56:45', '2024-08-22 12:56:45'),
('e388510e2b77ca643fc49bfff08d766719b8c21429828b3c24aa64e46b727d90bf782cb0f7367af1', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-09 13:13:56', '2023-07-09 13:13:56', '2024-07-09 13:13:56'),
('e4bc18757c378543ccc63b1e80dd41fb4fc373a6b543eb9d8e65bc4b376d07ba667f3376b2598372', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-05 18:29:17', '2025-04-05 18:29:17', '2026-04-05 18:29:17'),
('e744ee11a14ae42a32b4a5df1c47f5dd9733dc8a28d61b608a3e7b7c937d75f6735c31adc5f27c13', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-07-31 02:35:04', '2023-07-31 02:35:04', '2024-07-31 02:35:04'),
('e806c5d462e82396f8a1ac131b3fd8a66022623c69653d78a912046bef33a07fdaf822ec23f9666e', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-11-02 19:20:33', '2024-11-02 19:20:33', '2025-11-02 19:20:33'),
('e92bd66f6be8ebe48ed5cc4bb5e81fed1068ae2a521af6edec76395ba2af016ae64e8dde7b3b3cf0', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-13 02:28:57', '2023-08-13 02:28:57', '2024-08-13 02:28:57'),
('e97f7fbecba3e19b9c37d7e44274803546e543b04aa553bfd6fc87e58d5048dfea4230cc021fed83', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-15 19:30:02', '2024-08-15 19:30:02', '2025-08-15 19:30:02'),
('e98717acf841afe190a1b4179c831bd30f1ed6b546bbfbec991c57dce3345852fded4ea4e900acfa', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-04 13:55:30', '2025-04-04 13:55:30', '2026-04-04 13:55:30'),
('ea4feab92252340a798cfcf91db982abb999a6136a5c096f52512c0f7f2e38861e8ebd22c5d08a6f', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-12-27 22:34:45', '2023-12-27 22:34:45', '2024-12-27 22:34:45'),
('ef8a920c3b6202dc3c4eda8edd9bbf1e45c28af7fd5837300ba266a552514a5385cc58119d6fe548', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-07-08 15:56:09', '2024-07-08 15:56:09', '2025-07-08 15:56:09'),
('f07943b961acf6eb657d3d1966a7a2c0548df561accd9147fe1ff66a2dadd2a60966b9d862268e91', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-15 19:45:12', '2025-05-15 19:45:12', '2026-05-15 19:45:12'),
('f0b540b6c8a1b31b7ff311fb74d1cd0de02f570106dbc25fc2b27595e781f2382f99ce848635539b', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToAdmin', '[]', 0, '2023-06-25 22:46:33', '2023-06-25 22:46:33', '2024-06-25 22:46:33'),
('f0bb88c74b869d4ae1abe8739ba9107d6eb639744e24cffcae9c102d8baad588c628b19634f18cae', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-10-22 19:14:19', '2024-10-22 19:14:19', '2025-10-22 19:14:19'),
('f1405f1ec545f4314bfd72a46ed9f70108286773be17e76f3aca76a318077991d73054fbd243a870', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-04-06 17:04:37', '2025-04-06 17:04:37', '2026-04-06 17:04:37'),
('f50da16e5112fb18b5acb9a89ec4fe61fb31bfe5a0cd499a259e9613b05ee69e0e58678ee71bcde5', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-20 18:14:15', '2025-05-20 18:14:15', '2026-05-20 18:14:15'),
('f6f55696457bea8b56b3dc7259af05b4cdd1941ec8daed7dec105a9978d24aac1213f9cfefef69a3', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-03-27 11:08:47', '2025-03-27 11:08:47', '2026-03-27 11:08:47'),
('f85c085e533efb611ca8dc894448984613eafd69923aeb684db99b1ab66ebeac0c65c572813bc526', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2023-08-13 03:47:05', '2023-08-13 03:47:05', '2024-08-13 03:47:05'),
('f9d47bb2875111f0407debabdd84525c391a453ac2e51596fd4d7c93551dfd778c9a6ad3cba9181e', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', 'AccessToProvider', '[]', 0, '2024-01-29 22:35:22', '2024-01-29 22:35:22', '2025-01-29 22:35:22'),
('fcdcd3c5cdefe70130d5a739e498b251fd0c6f36f2feb2561893d384b07f74d5a43899e58e005e36', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2024-08-03 18:54:54', '2024-08-03 18:54:54', '2025-08-03 18:54:54'),
('fd1cdb821787adaedb3a5283e5b7352a91a05286768a440fcafdaad0fa97daff1569f59de7973ff3', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-03 22:27:05', '2025-06-03 22:27:05', '2026-06-03 22:27:05'),
('fdec5673756c704a0d0b5f33e9515e00e963ac4ba55007f8e034d79a01bff107760ffa9c91670cac', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-28 00:36:12', '2025-05-28 00:36:12', '2026-05-28 00:36:12'),
('feab46dc1faa0adc214e62e9296b3b1c80c38cd2da8c2b30dd8b0366f2c69877b46cbee426c6c4cd', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-06-01 14:01:02', '2025-06-01 14:01:02', '2026-06-01 14:01:02'),
('ff3147fc8ec5da44db3dc727d886da8f6b8a94574d93b069030100e8e8034048470ecbd5b473bada', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-19 16:38:48', '2025-05-19 16:38:48', '2026-05-19 16:38:48'),
('fff3257e87e88e5251fd96a9bd562b526fc8d1925b5833728d0a3314452cdd700e6e96454a9db2f4', '8ea23f49-a5ba-4938-828d-19d275158a90', '9c2f6523-5378-4957-897f-0ab7cb879f83', 'AccessToProvider', '[]', 0, '2025-05-16 22:57:58', '2025-05-16 22:57:58', '2026-05-16 22:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', NULL, 'Laravel Personal Access Client', '75kQskqekdipFpesfWZZv85qPo2cT8aMsyWgsIrQ', NULL, 'http://localhost', 1, 0, 0, '2022-04-04 02:13:15', '2022-04-04 02:13:15'),
('95faaac6-c56a-4873-a880-79d252d65ab1', NULL, 'Laravel Password Grant Client', 'hnFqAvObupsF3BXW4T6MxD4IhvKCZPRzyIqEFciB', 'users', 'http://localhost', 0, 1, 0, '2022-04-04 02:13:15', '2022-04-04 02:13:15'),
('9c2f6523-5378-4957-897f-0ab7cb879f83', NULL, 'Demandium1687683124 Personal Access Client', '9qnVJz5L40X0OogG3r8YjZJeQEftacFFjn40iD3E', NULL, 'http://localhost', 1, 0, 0, '2024-06-02 01:59:02', '2024-06-02 01:59:02'),
('9c2f6523-79d9-4059-b60c-ede01ee8bc76', NULL, 'Demandium1687683124 Password Grant Client', 'Ahk20d9XXg4pEczcD6aWlJGKheX4NBaAblA0TUiu', 'users', 'http://localhost', 0, 1, 0, '2024-06-02 01:59:02', '2024-06-02 01:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '95faaac6-c1d2-4d4c-beb1-04196dd2fa8e', '2022-04-04 02:13:15', '2022-04-04 02:13:15'),
(2, '9c2f6523-5378-4957-897f-0ab7cb879f83', '2024-06-02 01:59:02', '2024-06-02 01:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` char(36) NOT NULL,
  `service_description` text DEFAULT NULL,
  `booking_schedule` datetime DEFAULT NULL,
  `is_booked` tinyint(1) NOT NULL DEFAULT 0,
  `is_checked` tinyint(1) NOT NULL DEFAULT 0,
  `customer_user_id` char(36) NOT NULL,
  `service_id` char(36) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `sub_category_id` char(36) DEFAULT NULL,
  `service_address_id` char(36) DEFAULT NULL,
  `zone_id` char(36) DEFAULT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_additional_instructions`
--

CREATE TABLE `post_additional_instructions` (
  `id` char(36) NOT NULL,
  `details` text DEFAULT NULL,
  `post_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_bids`
--

CREATE TABLE `post_bids` (
  `id` char(36) NOT NULL,
  `offered_price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `provider_note` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `post_id` char(36) NOT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `company_phone` varchar(25) DEFAULT NULL,
  `company_address` varchar(191) DEFAULT NULL,
  `company_email` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `contact_person_phone` varchar(25) DEFAULT NULL,
  `contact_person_email` varchar(191) DEFAULT NULL,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `service_man_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `service_capacity_per_day` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `avg_rating` double(8,4) NOT NULL DEFAULT 0.0000,
  `commission_status` tinyint(1) NOT NULL DEFAULT 0,
  `commission_percentage` double(8,4) NOT NULL DEFAULT 0.0000,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `zone_id` char(36) DEFAULT NULL,
  `coordinates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`coordinates`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `user_id`, `company_name`, `company_phone`, `company_address`, `company_email`, `logo`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `order_count`, `service_man_count`, `service_capacity_per_day`, `rating_count`, `avg_rating`, `commission_status`, `commission_percentage`, `is_active`, `created_at`, `updated_at`, `is_approved`, `zone_id`, `coordinates`) VALUES
('188a4ee9-493e-4ae5-8203-3b399060c72c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'Classic Enterprises', '+91 9841866286', '11/2A, Radhakrishnan St, Venkatesapuram, Vivekananda Nagar, Vyasarpadi, Chennai, Tamil Nadu 600118, India', 'classic2010events@gmail.com', '2025-06-25-685c1cc5baa1a.png', 'Boobathy V', '+91 9841866286', 'classic2010events@gmail.com', 0, 0, 0, 0, 0.0000, 0, 0.0000, 1, '2023-06-25 16:33:45', '2025-06-25 21:29:01', 1, 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', '{\"latitude\":\"13.127802194520557\",\"longitude\":\"80.25709837675095\"}'),
('41da0eaf-f410-47a7-87e7-3d565f0c3b8b', '8ea23f49-a5ba-4938-828d-19d275158a90', 'Sysbot Tech', '+919789234550', '11/2A, Radhakrishnan St, Venkatesapuram, Vivekananda Nagar, Vyasarpadi, Chennai, Tamil Nadu 600118, India', 'info@sysbottech.com', '2023-11-06-65492c5f19f57.png', 'Logesh', '+919789234550', 'chandranlogesh@gmail.com', 0, 0, 0, 0, 0.0000, 0, 0.0000, 1, '2023-11-06 23:41:43', '2023-11-06 23:41:43', 1, 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', '{\"latitude\":\"13.0826802\",\"longitude\":\"80.2707184\"}'),
('e6bf66a2-e78a-455d-9945-94eea405ca76', 'ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', 'Onfleek', '+919884999983', '1/225, Vengaivasal, Medavakkam, Chennai, Tamil Nadu 600100, India', 'info@onfleek.com', '2025-06-10-68478eff3757d.png', 'Onfleek', '+919884999983', 'info@onfleek.com', 0, 0, 0, 0, 0.0000, 0, 0.0000, 0, '2025-06-10 07:18:47', '2025-06-10 07:18:47', 2, 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', '{\"latitude\":\"12.92042614045747\",\"longitude\":\"80.1929198205471\"}');

-- --------------------------------------------------------

--
-- Table structure for table `provider_sub_category`
--

CREATE TABLE `provider_sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` char(36) NOT NULL,
  `sub_category_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` char(36) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `zone_ids` text NOT NULL,
  `to_users` varchar(255) NOT NULL DEFAULT '["customer"]',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recent_searches`
--

CREATE TABLE `recent_searches` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recent_views`
--

CREATE TABLE `recent_views` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `service_id` char(36) DEFAULT NULL,
  `total_service_view` int(11) NOT NULL DEFAULT 0,
  `category_id` char(36) DEFAULT NULL,
  `total_category_view` int(11) NOT NULL DEFAULT 0,
  `sub_category_id` char(36) DEFAULT NULL,
  `total_sub_category_view` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recent_views`
--

INSERT INTO `recent_views` (`id`, `user_id`, `service_id`, `total_service_view`, `category_id`, `total_category_view`, `sub_category_id`, `total_sub_category_view`, `deleted_at`, `created_at`, `updated_at`) VALUES
('f8d4ffe6-cc70-4e35-b315-f10c615aa0e5', 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 6, NULL, 0, NULL, 0, NULL, '2023-06-25 16:17:18', '2023-06-25 21:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` char(36) NOT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `review_rating` int(11) NOT NULL DEFAULT 1,
  `review_comment` text DEFAULT NULL,
  `review_images` text DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `create` tinyint(1) NOT NULL DEFAULT 0,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `update` tinyint(1) NOT NULL DEFAULT 0,
  `delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `modules` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_modules`
--

CREATE TABLE `role_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` char(36) DEFAULT NULL,
  `module_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searched_data`
--

CREATE TABLE `searched_data` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `zone_id` char(36) NOT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `attribute_id` char(36) DEFAULT NULL,
  `response_data_count` int(11) NOT NULL DEFAULT 0,
  `volume` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicemen`
--

CREATE TABLE `servicemen` (
  `id` char(36) NOT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` char(36) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `sub_category_id` char(36) DEFAULT NULL,
  `tax` decimal(24,3) NOT NULL DEFAULT 0.000,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `avg_rating` double(8,4) NOT NULL DEFAULT 0.0000,
  `min_bidding_price` decimal(24,3) NOT NULL DEFAULT 0.000,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `short_description`, `description`, `cover_image`, `thumbnail`, `category_id`, `sub_category_id`, `tax`, `order_count`, `is_active`, `rating_count`, `avg_rating`, `min_bidding_price`, `deleted_at`, `created_at`, `updated_at`) VALUES
('8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'Birthday Party Baloon Decration', 'Birthday party', '<p>Birthday party</p>', '2023-06-25-6498115bdff7f.png', '2023-06-25-6498115be0353.png', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', 5.000, 0, 1, 0, 0.0000, 1000.000, NULL, '2023-06-25 15:35:15', '2023-06-25 15:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_description` text NOT NULL,
  `status` varchar(20) NOT NULL COMMENT 'pending,accepted,denied',
  `admin_feedback` text DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_tag`
--

CREATE TABLE `service_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` char(36) NOT NULL,
  `tag_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_tag`
--

INSERT INTO `service_tag` (`id`, `service_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, '8c1b198f-3d69-43f0-b9a9-b9919880f53b', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_services`
--

CREATE TABLE `subscribed_services` (
  `id` char(36) NOT NULL,
  `provider_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `sub_category_id` char(36) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribed_services`
--

INSERT INTO `subscribed_services` (`id`, `provider_id`, `category_id`, `sub_category_id`, `is_subscribed`, `created_at`, `updated_at`) VALUES
('70e43515-7f85-4fc6-a754-c1c094e88016', '188a4ee9-493e-4ae5-8203-3b399060c72c', '44b85c65-fe75-4cff-9825-53b24895b489', '23b2d807-e69c-465e-bd1e-a6dec3abbb98', 1, '2023-06-25 16:47:18', '2023-06-25 16:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'birthday', '2023-06-25 15:35:15', '2023-06-25 15:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) NOT NULL,
  `ref_trx_id` char(36) DEFAULT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `trx_type` varchar(255) DEFAULT NULL,
  `debit` decimal(24,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(24,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(24,2) NOT NULL DEFAULT 0.00,
  `from_user_id` char(36) DEFAULT NULL,
  `to_user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from_user_account` varchar(255) DEFAULT NULL,
  `to_user_account` varchar(255) DEFAULT NULL,
  `reference_note` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `ref_trx_id`, `booking_id`, `trx_type`, `debit`, `credit`, `balance`, `from_user_id`, `to_user_id`, `created_at`, `updated_at`, `from_user_account`, `to_user_account`, `reference_note`) VALUES
('186335ca-1887-46c9-8e25-371f7e9106f6', NULL, '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 'received_amount', 0.00, 850.00, 5100.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:03:34', '2023-08-09 03:03:34', NULL, 'received_balance', NULL),
('438355c4-ceff-48f1-9510-4135a0556800', '4a82cd37-967e-49d1-a120-cc6e5dde94cd', '4546f41f-d0ca-495c-b6ab-d018410a1705', 'receivable_commission', 0.00, 200.00, 600.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '2023-08-09 03:02:32', '2023-08-09 03:02:32', 'account_receivable', NULL, NULL),
('49eb00d2-9abf-4162-9889-38e3bfbabce8', '186335ca-1887-46c9-8e25-371f7e9106f6', '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 'receivable_commission', 0.00, 200.00, 1200.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '2023-08-09 03:03:34', '2023-08-09 03:03:34', 'account_receivable', NULL, NULL),
('4a82cd37-967e-49d1-a120-cc6e5dde94cd', NULL, '4546f41f-d0ca-495c-b6ab-d018410a1705', 'received_amount', 0.00, 850.00, 2550.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:02:32', '2023-08-09 03:02:32', NULL, 'received_balance', NULL),
('577f9f24-9ed9-4e47-84e0-775a6a93c28d', '5da596a3-9035-4bb9-a8ea-7c01f329cde8', '64ac2813-450d-485e-a357-b072166459f2', 'payable_commission', 0.00, 200.00, 400.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:02:00', '2023-08-09 03:02:00', 'account_payable', NULL, NULL),
('5ce829c6-2fc2-4657-9cab-4b69207f2077', '5f1a369f-1db0-479a-9d54-13d5450f156d', '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 'receivable_commission', 0.00, 400.00, 1000.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '2023-08-09 03:03:01', '2023-08-09 03:03:01', 'account_receivable', NULL, NULL),
('5da596a3-9035-4bb9-a8ea-7c01f329cde8', NULL, '64ac2813-450d-485e-a357-b072166459f2', 'received_amount', 0.00, 850.00, 1700.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:02:00', '2023-08-09 03:02:00', NULL, 'received_balance', NULL),
('5f1a369f-1db0-479a-9d54-13d5450f156d', NULL, '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 'received_amount', 0.00, 1700.00, 4250.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:03:01', '2023-08-09 03:03:01', NULL, 'received_balance', NULL),
('6325fad2-a2ee-46d6-b3b1-1685ddf2e98e', NULL, '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 'received_amount', 0.00, 850.00, 850.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 02:57:59', '2023-08-09 02:57:59', NULL, 'received_balance', NULL),
('8d79885d-b55a-4776-bc32-a5a9879712bb', '186335ca-1887-46c9-8e25-371f7e9106f6', '541c733f-d9e2-4143-8dd8-d395f0edaa8d', 'payable_commission', 0.00, 200.00, 1200.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:03:34', '2023-08-09 03:03:34', 'account_payable', NULL, NULL),
('93e151c4-dff2-448d-a838-b56af791fe90', '5f1a369f-1db0-479a-9d54-13d5450f156d', '2d2dc835-9b72-4130-be8e-b9ba02af8f37', 'payable_commission', 0.00, 400.00, 1000.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:03:01', '2023-08-09 03:03:01', 'account_payable', NULL, NULL),
('c5555730-6c80-465b-88b8-f18f48b2038f', '4a82cd37-967e-49d1-a120-cc6e5dde94cd', '4546f41f-d0ca-495c-b6ab-d018410a1705', 'payable_commission', 0.00, 200.00, 600.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 03:02:32', '2023-08-09 03:02:32', 'account_payable', NULL, NULL),
('cc0d7e9c-564a-49f9-aef4-0285b1350578', '6325fad2-a2ee-46d6-b3b1-1685ddf2e98e', '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 'payable_commission', 0.00, 200.00, 200.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', '129f5af9-fd0a-43d0-8227-c5b788395e5c', '2023-08-09 02:57:59', '2023-08-09 02:57:59', 'account_payable', NULL, NULL),
('cff4d6f8-8b7b-4db5-982c-1bc9f80f36d4', '6325fad2-a2ee-46d6-b3b1-1685ddf2e98e', '0ecbd569-0029-4dc6-aa69-efe704e93c7c', 'receivable_commission', 0.00, 200.00, 200.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '2023-08-09 02:57:59', '2023-08-09 02:57:59', 'account_receivable', NULL, NULL),
('e67d4853-675d-4efc-93db-f1315794fdc8', '5da596a3-9035-4bb9-a8ea-7c01f329cde8', '64ac2813-450d-485e-a357-b072166459f2', 'receivable_commission', 0.00, 200.00, 400.00, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'bc9dee6e-8866-47c8-8ab8-420bb276c7be', '2023-08-09 03:02:00', '2023-08-09 03:02:00', 'account_receivable', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `identification_number` varchar(191) DEFAULT NULL,
  `identification_type` varchar(191) NOT NULL DEFAULT 'nid',
  `identification_image` varchar(255) NOT NULL DEFAULT '[]',
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) NOT NULL DEFAULT 'male',
  `profile_image` varchar(191) NOT NULL DEFAULT 'default.png',
  `fcm_token` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(50) DEFAULT NULL,
  `referred_by` char(36) DEFAULT NULL,
  `login_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `identification_number`, `identification_type`, `identification_image`, `date_of_birth`, `gender`, `profile_image`, `fcm_token`, `is_phone_verified`, `is_email_verified`, `phone_verified_at`, `email_verified_at`, `password`, `is_active`, `user_type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `wallet_balance`, `loyalty_point`, `ref_code`, `referred_by`, `login_hit_count`, `is_temp_blocked`, `temp_block_time`, `isactive`) VALUES
('129f5af9-fd0a-43d0-8227-c5b788395e5c', 'Saran', 'Admin', 'classic2010events@gmail.com', '+91 9884166286', '123', 'trade_license', '[\"2023-06-25-64981f11b6786.png\"]', NULL, 'male', 'default.png', 'fVqLdFIkTPexYVt0buIxN1:APA91bGhfjZIu9IdPdcVXwVhXqe63ejqchsSrDAidmgW_B34E7B8hcc9ugX4XVpl9MIfRkKVipLm5Pex5v-8Ia3uyhlMaTTLe79ZNI6GoeiC_bFAxXFyF6c', 0, 1, NULL, NULL, '$2y$10$kscvBxjwk4VqThrIJFgMtutxZVtQ9xK0ECmm/pA0OyYFhZXpulnxi', 1, 'provider-admin', NULL, NULL, '2023-06-25 16:33:45', '2025-06-14 18:49:48', 0.000, 0.000, '0RPJS3GDVU', NULL, 2, 0, NULL, NULL),
('8ea23f49-a5ba-4938-828d-19d275158a90', 'Logesh', 'Chandran', 'info@sysbottech.com', '+919384946825', '1234', 'trade_license', '[\"2023-11-06-65492c5f0bc85.png\"]', NULL, 'male', 'default.png', '@', 0, 0, NULL, NULL, '$2y$10$Xd.etwL4nkMq6Z9khmlwE.q1VzGWkly3zg0N30YXhjgKmYiIrsEHW', 1, 'super-admin', NULL, NULL, '2023-11-06 23:41:43', '2025-06-10 07:15:51', 0.000, 0.000, 'OXTUOPRVW2', NULL, 4, 0, NULL, NULL),
('ea5abdd0-3862-4251-a9a9-a5688e2ab1a5', 'Silambarsan', 'K', 'info@onfleek.com', '+919884999943', '123456', 'company_id', '[\"2025-06-10-68478eff22d7c.png\"]', NULL, 'male', 'default.png', NULL, 0, 0, NULL, NULL, '$2y$10$AlS7gwHxigU4VmRKh1XMNetrXZF8tEag4ovYVO2.l4ZhscyjKhmmu', 1, 'provider-admin', NULL, NULL, '2025-06-10 07:18:47', '2025-06-10 07:18:47', 0.000, 0.000, 'DAIDPPG8LN', NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `lon` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `street` varchar(191) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `contact_person_number` varchar(255) DEFAULT NULL,
  `address_label` varchar(255) DEFAULT NULL,
  `zone_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `lat`, `lon`, `city`, `street`, `zip_code`, `country`, `address`, `created_at`, `updated_at`, `address_type`, `contact_person_name`, `contact_person_number`, `address_label`, `zone_id`) VALUES
(1, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '12.9207186150563', '80.19350219517946', 'Chennai', 'PB road', '600112', 'India', 'perambur', '2023-06-25 16:19:21', '2023-06-25 16:19:21', 'service', 'Logesh', '9789234550', 'office', NULL),
(2, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '13.121030201304139', '80.23257795721292', 'chennai', 'PB road', '600100', 'India', 'Perambur, Chennai, Tamil Nadu, India', '2023-06-25 16:20:30', '2023-06-25 16:20:30', 'service', 'Logesh', '9789234550', 'others', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_verifications`
--

CREATE TABLE `user_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identity` varchar(255) NOT NULL,
  `identity_type` varchar(255) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `otp` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_verifications`
--

INSERT INTO `user_verifications` (`id`, `identity`, `identity_type`, `user_id`, `otp`, `expires_at`, `updated_at`, `created_at`, `hit_count`, `is_temp_blocked`, `temp_block_time`) VALUES
(2, 'sysbotttech@gmail.com', 'email', NULL, '6299', '2023-06-25 16:37:39', '2023-06-25 16:34:39', '2023-06-25 16:34:39', 0, 0, NULL),
(5, 'classic2010events@gmail.com', 'email', NULL, '1234', '2024-01-29 22:23:17', '2024-01-29 22:20:17', '2024-01-29 22:19:05', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_zones`
--

CREATE TABLE `user_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `zone_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_zones`
--

INSERT INTO `user_zones` (`id`, `user_id`, `zone_id`, `created_at`, `updated_at`) VALUES
(1, '129f5af9-fd0a-43d0-8227-c5b788395e5c', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', NULL, NULL),
(2, '8ea23f49-a5ba-4938-828d-19d275158a90', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(191) DEFAULT NULL,
  `variant_key` varchar(191) NOT NULL,
  `service_id` char(36) NOT NULL,
  `zone_id` char(36) NOT NULL,
  `price` decimal(24,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `variant`, `variant_key`, `service_id`, `zone_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Balloon Party', 'Balloon-Party', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 'cc6b4535-e755-4eb1-9b32-54ccc14c164c', 1000.000, '2023-06-25 15:35:15', '2023-06-25 15:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_customers`
--

CREATE TABLE `vendor_customers` (
  `id` char(36) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `bitlling_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_customers`
--

INSERT INTO `vendor_customers` (`id`, `name`, `phone`, `email`, `bitlling_address`, `created_at`, `updated_at`) VALUES
('04cd0c5b-f439-4d79-af2a-471bbb08df51', 'Evoke', '9841866286', NULL, '686/2, Link Rd, CIT Nagar East, Nandanam, Chennai, Tamil Nadu 600035, India', '2025-06-25 20:45:08', '2025-06-25 20:45:08'),
('0dcafdc8-009d-4586-8e99-9824f8c9e6d9', 'Ganesh anna ref', '9841866286', NULL, '30, Red Cross Rd, Egmore, Chennai, Tamil Nadu 600008, India', '2025-06-28 13:42:28', '2025-06-28 13:42:28'),
('34c66397-ba2f-4cf3-b848-cad98b07cd8a', 'Sabari', '9841866286', NULL, '36MR+4PR, Davidpuram, Kilpauk, Chennai, Tamil Nadu 600010, India', '2025-06-28 13:36:34', '2025-06-28 13:36:34'),
('35b26a45-0742-49a8-9b07-99e4007b6522', 'Poes garden', '9841866286', NULL, '27V3+89M, Poes Garden, Teynampet, Chennai, Tamil Nadu 600018, India', '2025-06-25 21:18:32', '2025-06-25 21:18:32'),
('4613ace9-ed3f-496a-96ba-21c4dec86a48', 'New customer', '9841866286', NULL, '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', '2025-06-25 20:21:01', '2025-06-25 20:21:01'),
('4ee62266-5b13-4091-a3fa-7f22e1d962f7', 'Anbu', '9841866206', NULL, '32/4, Austin Nagar, Alwarpet, Chennai, Tamil Nadu 600018, India', '2025-06-14 18:54:35', '2025-06-14 18:54:35'),
('6efd7576-6f28-4648-9e81-7e10c9224112', 'Park elanza owner', '9841866286', NULL, '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', '2025-06-25 20:32:05', '2025-06-25 20:32:05'),
('73174d41-047f-40f7-a231-56a4eb4bd39b', 'Ssi new customer', '9841866286', NULL, '2/3, Erukkancheri, Kodungaiyur, Chennai, Tamil Nadu 600118, India', '2025-06-28 13:32:59', '2025-06-28 13:32:59'),
('766c0e68-26c6-4519-9128-de5d926b7151', 'Logesh', '9841866286', NULL, 'X6GC+57P Vayal roooted in Nature, Velachery, Chennai, Tamil Nadu 600042, India', '2025-06-28 13:52:18', '2025-06-28 13:52:18'),
('8a2598ea-6e42-4a8c-9af7-0cca6f6d7c6d', 'Joe event', '9841866286', NULL, '67/42, 4th Main Rd, Block V, V Block, Anna Nagar, Chennai, Tamil Nadu 600040, India', '2025-06-28 13:27:17', '2025-06-28 13:27:17'),
('9fbbf643-85ed-4aea-82d2-7e9009e15087', 'Anbu stage 3', '9841866206', NULL, '1236, near MM Clinic, New Akash Nagar, Stage 3, Indiranagar, Bengaluru, Karnataka 560038, India', '2025-07-01 15:24:04', '2025-07-01 15:24:04'),
('f4728647-5e7d-424e-b4fc-b71736b7c642', 'New customer', '9841866286', NULL, '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', '2025-06-14 19:00:34', '2025-06-14 19:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_event_types`
--

CREATE TABLE `vendor_event_types` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_expenses`
--

CREATE TABLE `vendor_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_invoices_id` char(36) NOT NULL,
  `expense_type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `unit` varchar(24) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_expenses`
--

INSERT INTO `vendor_expenses` (`id`, `vendor_invoices_id`, `expense_type`, `amount`, `date`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'cef48938-2961-4b11-b09a-84cab9b4abdb', 'Led Wall Gopi', '6000', '2025-06-18 00:00:00', NULL, '2025-06-25 20:23:02', '2025-06-25 20:23:02'),
(2, 'cef48938-2961-4b11-b09a-84cab9b4abdb', 'Stage Classicenterprises', '3000', '2025-06-18 00:00:00', NULL, '2025-06-25 20:23:34', '2025-06-25 20:23:34'),
(3, 'd957c4a5-cfa1-4082-a351-104b8e9ecf57', 'Led Wall Gopi', '6000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:27:30', '2025-06-25 20:27:30'),
(4, 'd957c4a5-cfa1-4082-a351-104b8e9ecf57', 'Stage Classicenterprises10', '4000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:27:53', '2025-06-25 20:27:53'),
(5, 'd957c4a5-cfa1-4082-a351-104b8e9ecf57', 'Transport Classicenterprises', '2000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:28:11', '2025-06-25 20:28:11'),
(6, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Led Wall', '6000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:35:24', '2025-06-25 20:35:24'),
(7, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Stage Raju', '4800', '2025-06-19 00:00:00', NULL, '2025-06-25 20:36:17', '2025-06-25 20:36:17'),
(8, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Balloon', '1000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:36:34', '2025-06-25 20:36:34'),
(9, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Flex 123', '1500', '2025-06-19 00:00:00', NULL, '2025-06-25 20:37:34', '2025-06-25 20:37:34'),
(10, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Transport', '1500', '2025-06-19 00:00:00', NULL, '2025-06-25 20:37:47', '2025-06-25 20:37:47'),
(11, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Labour', '5000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:38:07', '2025-06-25 20:38:07'),
(12, 'cf0aba50-49ef-4073-a47f-389b5806aebe', 'Labour', '4000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:45:55', '2025-06-25 20:45:55'),
(13, 'cf0aba50-49ef-4073-a47f-389b5806aebe', 'Sofa', '1000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:46:06', '2025-06-25 20:46:06'),
(14, 'cf0aba50-49ef-4073-a47f-389b5806aebe', 'Transport', '2000', '2025-06-19 00:00:00', NULL, '2025-06-25 20:46:16', '2025-06-25 20:46:16'),
(18, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Balloon', '500', '2025-06-25 00:00:00', NULL, '2025-06-25 20:54:53', '2025-06-25 20:54:53'),
(19, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Labour', '5000', '2025-06-25 00:00:00', NULL, '2025-06-25 20:55:15', '2025-06-25 20:55:15'),
(20, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Transport', '2500', '2025-06-25 00:00:00', NULL, '2025-06-25 20:55:30', '2025-06-25 20:55:30'),
(21, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Balloon', '1200', '2025-06-25 00:00:00', NULL, '2025-06-25 21:20:55', '2025-06-25 21:20:55'),
(22, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Labour', '4000', '2025-06-25 00:00:00', NULL, '2025-06-25 21:21:07', '2025-06-25 21:21:07'),
(23, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Transport', '1500', '2025-06-25 00:00:00', NULL, '2025-06-25 21:21:22', '2025-06-25 21:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_invoices`
--

CREATE TABLE `vendor_invoices` (
  `id` char(36) NOT NULL,
  `readable_id` bigint(20) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `billing_address` varchar(300) NOT NULL,
  `event_place` varchar(100) NOT NULL,
  `event_type` varchar(100) NOT NULL DEFAULT 'Others',
  `event_date` datetime NOT NULL,
  `event_end_date` datetime DEFAULT NULL,
  `meal_type` text NOT NULL,
  `invoice_date` datetime NOT NULL DEFAULT '1971-01-01 00:00:00',
  `state` varchar(255) NOT NULL,
  `is_taxable` tinyint(1) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `gstin` varchar(30) DEFAULT NULL,
  `sub_total` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_tax` decimal(24,3) NOT NULL DEFAULT 0.000,
  `total_expense` decimal(24,3) NOT NULL DEFAULT 0.000,
  `booking_status` varchar(255) NOT NULL DEFAULT 'pending',
  `total` decimal(24,3) NOT NULL DEFAULT 0.000,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_invoices`
--

INSERT INTO `vendor_invoices` (`id`, `readable_id`, `customer_id`, `provider_id`, `customer_name`, `address`, `email`, `mobile`, `billing_address`, `event_place`, `event_type`, `event_date`, `event_end_date`, `meal_type`, `invoice_date`, `state`, `is_taxable`, `is_paid`, `gstin`, `sub_total`, `total_tax`, `total_expense`, `booking_status`, `total`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
('0c609d14-85ed-48bc-9665-a3bf6916e3f8', 100011, '73174d41-047f-40f7-a231-56a4eb4bd39b', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Ssi new customer', 'SSI Mahal A/C, Kumaran Street, Erukkancheri, Kodungaiyur, Chennai, Tamil Nadu, India', NULL, '9841866286', '2/3, Erukkancheri, Kodungaiyur, Chennai, Tamil Nadu 600118, India', 'ssi', '60th wedding anniversary', '2025-06-22 11:30:00', '2025-06-22 13:30:00', 'Breakfast', '2025-06-28 13:30:40', 'Tamil Nadu', 0, 1, NULL, 16000.000, 0.000, 0.000, 'pending', 16000.000, '13.125764', '80.2486483', '2025-06-28 13:34:21', '2025-06-28 13:34:21'),
('2e78c4a2-7a5e-4482-a80b-a736d44cf4b4', 100007, '4613ace9-ed3f-496a-96ba-21c4dec86a48', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza hall 2', 'meeting', '2025-06-21 10:14:00', '2025-06-21 19:14:00', 'It', '2025-06-25 22:14:09', 'Tamil Nadu', 0, 0, NULL, 5000.000, 0.000, 0.000, 'pending', 5000.000, '0.0', '0.0', '2025-06-25 22:43:43', '2025-06-28 13:24:27'),
('42c7de63-f25b-43b9-a4f0-f545c0d03d41', 100004, '6efd7576-6f28-4648-9e81-7e10c9224112', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Park elanza owner', 'Park Elanza, Valluvar Kottam High Road, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza hall 1', 'meeting', '2025-06-19 17:31:00', '2025-06-19 20:31:00', 'Dinner', '2025-06-25 20:31:02', 'Tamil Nadu', 0, 0, NULL, 18840.000, 0.000, 19800.000, 'pending', 18840.000, '13.0564501', '80.2428714', '2025-06-25 20:35:07', '2025-06-25 20:38:07'),
('44611cf6-d143-49a9-b1d2-e70d5888a75b', 100013, '0dcafdc8-009d-4586-8e99-9824f8c9e6d9', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Ganesh anna ref', 'Ambassador Pallava Chennai, Red Cross Road, Egmore, Chennai, Tamil Nadu, India', NULL, '9841866286', '30, Red Cross Rd, Egmore, Chennai, Tamil Nadu 600008, India', 'Egmore', 'meeting', '2025-06-23 01:40:00', '2025-06-23 22:40:00', 'Fullday', '2025-06-28 13:40:52', 'Tamil Nadu', 0, 1, NULL, 7000.000, 0.000, 0.000, 'pending', 7000.000, '13.067157', '80.25845500000001', '2025-06-28 13:42:41', '2025-06-28 13:43:36'),
('56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 100006, '35b26a45-0742-49a8-9b07-99e4007b6522', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Poes garden', 'Poes Garden, Teynampet, Chennai, Tamil Nadu, India', NULL, '9841866286', '27V3+89M, Poes Garden, Teynampet, Chennai, Tamil Nadu 600018, India', 'super star house', 'birthday', '2025-06-20 11:16:00', '2025-06-21 00:16:00', 'Dinner', '2025-06-25 21:16:47', 'Tamil Nadu', 0, 0, NULL, 10000.000, 0.000, 6700.000, 'pending', 10000.000, '13.0434008', '80.2533896', '2025-06-25 21:20:09', '2025-06-25 21:21:22'),
('5b1cb957-48ba-45c1-a4c9-3be961caafa0', 100015, '4613ace9-ed3f-496a-96ba-21c4dec86a48', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza', 'engagement', '2025-06-27 10:15:00', '2025-06-27 22:15:00', 'Lunch', '2025-06-28 22:15:22', 'Tamil Nadu', 0, 1, NULL, 38000.000, 0.000, 0.000, 'pending', 38000.000, '13.056450181867994', '80.2428712695837', '2025-06-28 22:17:41', '2025-06-28 22:17:41'),
('6b6b1b78-66ef-42ac-975f-029f1d6b57ce', 100014, '766c0e68-26c6-4519-9128-de5d926b7151', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Logesh', 'Velachery, Chennai, Tamil Nadu, India', NULL, '9841866286', 'X6GC+57P Vayal roooted in Nature, Velachery, Chennai, Tamil Nadu 600042, India', 'surprise party', 'birthday', '2025-06-24 13:50:00', '2025-06-24 16:50:00', 'Lunch', '2025-06-28 13:50:58', 'Tamil Nadu', 0, 0, NULL, 3000.000, 0.000, 0.000, 'pending', 3000.000, '12.9754605', '80.2207047', '2025-06-28 13:52:30', '2025-06-28 13:52:30'),
('6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 100000, '4ee62266-5b13-4091-a3fa-7f22e1d962f7', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Anbu', 'Arsha Vidya Mandir, 113/94,114/95,115/96, Velachery Rd, Little Mount, Guindy, Chennai, Tamil Nadu 600032, India', NULL, '9841866206', '32/4, Austin Nagar, Alwarpet, Chennai, Tamil Nadu 600018, India', 'Velachery', 'school reopen', '2025-06-16 04:00:00', '2025-06-16 20:49:00', 'Fullday event', '2025-06-14 18:49:54', 'Tamil Nadu', 0, 0, NULL, 9500.000, 0.000, 16100.000, 'accepted', 9500.000, '13.012081003034124', '80.22236377000809', '2025-06-14 18:57:28', '2025-06-25 20:55:30'),
('9962a2e3-3d81-4de2-b344-30dcc5320302', 100008, '4613ace9-ed3f-496a-96ba-21c4dec86a48', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza hall 1', '50th birthday party', '2025-06-21 17:43:00', '2025-06-21 22:43:00', 'Dinner', '2025-06-25 00:00:00', 'Tamil Nadu', 0, 0, NULL, 17500.000, 0.000, 0.000, 'pending', 17500.000, '13.056450181867994', '80.2428712695837', '2025-06-25 22:45:58', '2025-06-25 22:45:58'),
('a683b8ac-f0e6-4242-94fe-25ffcc9f48e2', 100012, '34c66397-ba2f-4cf3-b848-cad98b07cd8a', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Sabari', '89, TT Krishnamachari Rd, Parthasarathypuram, Alwarpet, Chennai, Tamil Nadu 600018, India', NULL, '9841866286', '36MR+4PR, Davidpuram, Kilpauk, Chennai, Tamil Nadu 600010, India', 'royapet', 'inauguration', '2025-06-22 22:34:00', '2025-06-23 22:34:00', 'Breakfast', '2025-06-28 13:34:30', 'Tamil Nadu', 0, 0, NULL, 28000.000, 0.000, 0.000, 'pending', 28000.000, '13.067157', '80.25845500000001', '2025-06-28 13:38:21', '2025-06-28 13:46:35'),
('cef48938-2961-4b11-b09a-84cab9b4abdb', 100002, '4613ace9-ed3f-496a-96ba-21c4dec86a48', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', 'Park Elanza, Valluvar Kottam High Road, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza', 'meeting', '2025-06-18 10:19:00', '2025-06-18 15:19:00', 'Lunch', '2025-06-25 20:19:25', 'Tamil Nadu', 0, 1, NULL, 10500.000, 0.000, 9000.000, 'pending', 10500.000, '13.0564501', '80.2428714', '2025-06-25 20:22:35', '2025-06-25 20:23:34'),
('cf0aba50-49ef-4073-a47f-389b5806aebe', 100005, '04cd0c5b-f439-4d79-af2a-471bbb08df51', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Evoke', '36, Sardar Patel Rd, Venkta Puram, Guindy, Chennai, Tamil Nadu 600032, India', NULL, '9841866286', '686/2, Link Rd, CIT Nagar East, Nandanam, Chennai, Tamil Nadu 600035, India', 'ramada Guindy', 'wedding', '2025-06-19 17:43:00', '2025-06-19 23:43:00', 'Dinner', '2025-06-25 20:43:14', 'Tamil Nadu', 0, 0, NULL, 10000.000, 0.000, 7000.000, 'pending', 10000.000, '13.012081003034124', '80.22236377000809', '2025-06-25 20:45:28', '2025-06-25 20:46:16'),
('d957c4a5-cfa1-4082-a351-104b8e9ecf57', 100003, '4613ace9-ed3f-496a-96ba-21c4dec86a48', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza hall 2', 'meeting', '2025-06-19 18:24:00', '2025-06-19 22:24:00', 'Dinner', '2025-06-25 20:24:39', 'Tamil Nadu', 0, 1, NULL, 13500.000, 0.000, 12000.000, 'pending', 13500.000, '13.056450181867994', '80.2428712695837', '2025-06-25 20:27:07', '2025-06-25 20:28:11'),
('dfdc3576-e2d0-42af-ba28-22cb967edf49', 100001, 'f4728647-5e7d-424e-b4fc-b71736b7c642', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'New customer', 'Park Elanza, Valluvar Kottam High Road, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu, India', NULL, '9841866286', '125, Valluvar Kottam High Rd, Ponnangipuram, Tirumurthy Nagar, Nungambakkam, Chennai, Tamil Nadu 600034, India', 'park elanza', 'birthday', '2025-06-17 16:00:00', '2025-06-17 23:59:00', 'Dinner', '2025-06-14 18:59:12', 'Tamil Nadu', 0, 0, NULL, 12000.000, 0.000, 0.000, 'accepted', 12000.000, '13.0564501', '80.2428714', '2025-06-14 19:01:39', '2025-06-14 19:01:45'),
('e3f73d79-511b-4cf1-8ef6-50301ce09952', 100016, '0dcafdc8-009d-4586-8e99-9824f8c9e6d9', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Ganesh anna ref', 'Royapettah, Chennai, Tamil Nadu, India', NULL, '9841866286', '3737+HJP, Ganapathy Colony, Royapettah, Chennai, Tamil Nadu 600014, India', 'house royapet', 'birthday', '2025-06-27 10:19:00', '2025-06-27 22:19:00', 'Dinner', '2025-06-28 22:19:06', 'Tamil Nadu', 0, 0, NULL, 15000.000, 0.000, 0.000, 'pending', 15000.000, '13.0539587', '80.2640711', '2025-06-28 22:20:44', '2025-06-28 22:20:44'),
('e5c4e2d9-a45b-416c-bc54-607e4bcb729f', 100010, '73174d41-047f-40f7-a231-56a4eb4bd39b', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Ssi new customer', 'SSI Mahal A/C, Kumaran Street, Erukkancheri, Kodungaiyur, Chennai, Tamil Nadu, India', NULL, '9841866286', '2/3, Erukkancheri, Kodungaiyur, Chennai, Tamil Nadu 600118, India', 'ssi', '60th wedding anniversary', '2025-06-22 11:30:00', '2025-06-22 13:30:00', 'Breakfast', '2025-06-28 13:30:40', 'Tamil Nadu', 0, 1, NULL, 16000.000, 0.000, 0.000, 'pending', 16000.000, '13.125764', '80.2486483', '2025-06-28 13:33:28', '2025-06-28 13:33:28'),
('ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 100009, '8a2598ea-6e42-4a8c-9af7-0cca6f6d7c6d', '188a4ee9-493e-4ae5-8203-3b399060c72c', 'Joe event', 'CTS Speciality Hospital, 4th Main Road, near Mahakali Amman Koil, V Block, Anna Nagar, Chennai, Tamil Nadu, India', NULL, '9841866286', '67/42, 4th Main Rd, Block V, V Block, Anna Nagar, Chennai, Tamil Nadu 600040, India', 'anna nagar', 'meeting', '2025-06-22 01:25:00', '2025-06-22 16:25:00', 'Lunch', '2025-06-28 13:25:22', 'Tamil Nadu', 0, 1, NULL, 18860.000, 0.000, 0.000, 'pending', 18860.000, '13.0904494', '80.2128367', '2025-06-28 13:30:25', '2025-06-28 13:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_invoices_items`
--

CREATE TABLE `vendor_invoices_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_invoices_id` char(36) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `unit` varchar(24) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `size` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_invoices_items`
--

INSERT INTO `vendor_invoices_items` (`id`, `vendor_invoices_id`, `service_name`, `unit_price`, `quantity`, `unit`, `tax`, `size`, `created_at`, `updated_at`) VALUES
(1, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Backdrop', '2500', '1', 'null', '18', '8*8', '2025-06-14 18:57:28', '2025-06-25 20:49:41'),
(2, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Balloon decoration', '4500', '1', 'null', '18', '12*8', '2025-06-14 18:57:28', '2025-06-25 20:49:41'),
(4, '6c7274b5-9108-4dbd-acd5-d385ad8ead6b', 'Transport', '2500', '1', 'km', '18', '30', '2025-06-14 18:57:28', '2025-06-14 18:57:28'),
(6, '272ba2c4-288c-423e-a2e5-fbdca51c5b68', 'Backdrop', '3500', '1', 'feet', '18', '8*8', '2025-06-14 18:58:09', '2025-06-14 18:58:09'),
(7, '272ba2c4-288c-423e-a2e5-fbdca51c5b68', 'Balloon decoration', '5000', '1', 'feet', '18', '12*8', '2025-06-14 18:58:09', '2025-06-14 18:58:09'),
(8, '272ba2c4-288c-423e-a2e5-fbdca51c5b68', 'Balloon decoration', '1500', '2', 'feet', '18', '8', '2025-06-14 18:58:09', '2025-06-14 18:58:09'),
(9, '272ba2c4-288c-423e-a2e5-fbdca51c5b68', 'Transport', '2500', '1', 'km', '18', '30', '2025-06-14 18:58:09', '2025-06-14 18:58:09'),
(10, '272ba2c4-288c-423e-a2e5-fbdca51c5b68', 'Others', '5000', '1', 'km', '18', 'null', '2025-06-14 18:58:09', '2025-06-14 18:58:09'),
(11, 'dfdc3576-e2d0-42af-ba28-22cb967edf49', 'Backdrop', '6000', '1', 'sq ft', '18', '8*16', '2025-06-14 19:01:39', '2025-06-14 19:01:39'),
(12, 'dfdc3576-e2d0-42af-ba28-22cb967edf49', 'Balloon decoration', '6000', '1', 'sq ft', '18', 'null', '2025-06-14 19:01:39', '2025-06-14 19:01:39'),
(13, 'cef48938-2961-4b11-b09a-84cab9b4abdb', 'Stage', '3000', '1', 'sq ft', '18', '16*12', '2025-06-25 20:22:35', '2025-06-25 20:22:35'),
(14, 'cef48938-2961-4b11-b09a-84cab9b4abdb', 'Led wall', '7500', '1', 'sq ft', '18', '8*6', '2025-06-25 20:22:35', '2025-06-25 20:22:35'),
(15, 'd957c4a5-cfa1-4082-a351-104b8e9ecf57', 'Stage', '6000', '1', 'feet', '18', '16*8', '2025-06-25 20:27:07', '2025-06-25 20:27:07'),
(16, 'd957c4a5-cfa1-4082-a351-104b8e9ecf57', 'Led wall', '7500', '1', 'feet', '18', '8*6', '2025-06-25 20:27:07', '2025-06-25 20:27:07'),
(17, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Led wall', '7500', '1', 'null', '18', '8*6', '2025-06-25 20:35:07', '2025-06-25 20:35:07'),
(18, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Flex box arch', '3960', '1', 'feet', '18', '8*8', '2025-06-25 20:35:07', '2025-06-25 20:35:07'),
(19, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Flex', '540', '2', 'feet', '18', '6*2', '2025-06-25 20:35:07', '2025-06-25 20:35:07'),
(20, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Stage', '4800', '1', 'feet', '18', '12*12', '2025-06-25 20:35:07', '2025-06-25 20:35:07'),
(21, '42c7de63-f25b-43b9-a4f0-f545c0d03d41', 'Balloon decoration', '1500', '1', 'feet', '18', 'null', '2025-06-25 20:35:52', '2025-06-25 20:35:52'),
(22, 'cf0aba50-49ef-4073-a47f-389b5806aebe', 'Backdrop', '10000', '1', 'null', '18', 'null', '2025-06-25 20:45:28', '2025-06-25 20:45:28'),
(23, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Balloon decoration', '4000', '1', 'null', '18', '800', '2025-06-25 21:20:09', '2025-06-25 21:20:09'),
(24, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Flex fixing', '2000', '1', 'feet', '18', '8*8', '2025-06-25 21:20:09', '2025-06-25 21:20:09'),
(25, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Others', '2500', '1', 'feet', '18', NULL, '2025-06-25 21:20:09', '2025-06-25 21:20:09'),
(26, '56933b6b-6fed-49b5-81a1-19d1dbd3f5d5', 'Transport', '1500', '1', 'feet', '18', 'null', '2025-06-25 21:20:09', '2025-06-25 21:20:09'),
(27, '2e78c4a2-7a5e-4482-a80b-a736d44cf4b4', 'Flex fixing', '1000', '1', 'null', '18', '8*8', '2025-06-25 22:43:43', '2025-06-28 13:24:13'),
(28, '2e78c4a2-7a5e-4482-a80b-a736d44cf4b4', 'Pathway carpet', '1000', '1', 'null', '18', '6*50', '2025-06-25 22:43:43', '2025-06-28 13:24:13'),
(29, '2e78c4a2-7a5e-4482-a80b-a736d44cf4b4', 'Balloon decoration', '15', '200', 'feet', '18', '1', '2025-06-25 22:43:43', '2025-06-25 22:43:43'),
(30, '9962a2e3-3d81-4de2-b344-30dcc5320302', 'Backdrop', '15000', '1', 'null', '18', 'null', '2025-06-25 22:45:58', '2025-06-25 22:45:58'),
(31, '9962a2e3-3d81-4de2-b344-30dcc5320302', 'Tv', '2500', '1', 'null', '18', 'null', '2025-06-25 22:45:58', '2025-06-25 22:45:58'),
(32, 'ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 'Flower decoration', '10000', '1', 'feet', '18', '8*8', '2025-06-28 13:30:25', '2025-06-28 13:30:25'),
(33, 'ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 'Pathway carpet', '2700', '1', 'feet', '18', '10*18', '2025-06-28 13:30:25', '2025-06-28 13:30:25'),
(34, 'ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 'Red carpet', '2160', '1', 'feet', '18', '6*24', '2025-06-28 13:30:25', '2025-06-28 13:30:25'),
(35, 'ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 'Flex', '2000', '1', 'feet', '18', '10*8', '2025-06-28 13:30:25', '2025-06-28 13:30:25'),
(36, 'ecd0fb24-2d01-4112-8d0c-8fed85c3b34e', 'Transport', '2000', '1', 'km', '18', '20', '2025-06-28 13:30:25', '2025-06-28 13:30:25'),
(37, 'e5c4e2d9-a45b-416c-bc54-607e4bcb729f', 'Stage decoration', '16000', '1', 'km', '18', 'null', '2025-06-28 13:33:28', '2025-06-28 13:33:28'),
(38, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'Stage decoration', '16000', '1', 'km', '18', 'null', '2025-06-28 13:34:21', '2025-06-28 13:34:21'),
(39, 'a683b8ac-f0e6-4242-94fe-25ffcc9f48e2', 'Marigold Flower decoration', '17000', '1', 'km', '18', '80', '2025-06-28 13:38:22', '2025-06-28 13:38:22'),
(40, 'a683b8ac-f0e6-4242-94fe-25ffcc9f48e2', 'Garland', '3000', '3', 'km', '18', '8*8', '2025-06-28 13:38:22', '2025-06-28 13:38:22'),
(41, 'a683b8ac-f0e6-4242-94fe-25ffcc9f48e2', 'Transport', '2000', '1', 'km', '18', '30', '2025-06-28 13:38:22', '2025-06-28 13:38:22'),
(42, '44611cf6-d143-49a9-b1d2-e70d5888a75b', 'Flex fixing', '7000', '1', 'km', '18', 'null', '2025-06-28 13:42:41', '2025-06-28 13:42:41'),
(43, '6b6b1b78-66ef-42ac-975f-029f1d6b57ce', 'Balloon decoration', '3000', '1', 'km', '18', 'null', '2025-06-28 13:52:30', '2025-06-28 13:52:30'),
(44, '5b1cb957-48ba-45c1-a4c9-3be961caafa0', 'Stage decoration', '38000', '1', 'null', '18', 'null', '2025-06-28 22:17:41', '2025-06-28 22:17:41'),
(45, 'e3f73d79-511b-4cf1-8ef6-50301ce09952', 'Backdrop', '8000', '1', 'feet', '18', '8*12', '2025-06-28 22:20:44', '2025-06-28 22:20:44'),
(46, 'e3f73d79-511b-4cf1-8ef6-50301ce09952', 'Balloon decoration', '7000', '1', 'feet', '18', 'null', '2025-06-28 22:20:44', '2025-06-28 22:20:44'),
(47, 'c24ef861-6df1-46ef-9fe3-b742c312d2b0', 'Balloon.', '2000', '8', 'null', '18', '1', '2025-07-01 15:24:32', '2025-07-01 15:24:32'),
(48, 'c24ef861-6df1-46ef-9fe3-b742c312d2b0', 'Transport', '2500', '1', 'null', '18', 'null', '2025-07-01 15:24:32', '2025-07-01 15:24:32');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_invoice_images`
--

CREATE TABLE `vendor_invoice_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_invoice_id` char(36) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_invoice_images`
--

INSERT INTO `vendor_invoice_images` (`id`, `vendor_invoice_id`, `path`, `description`, `created_at`, `updated_at`) VALUES
(1, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/ebncLjrphQ5d2Lqf5OdteL2rUuo4o1usK3Whgk8t.webp', NULL, '2025-07-19 22:50:22', '2025-07-19 22:50:22'),
(2, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/CAOG9PCKacFB04moCe7FO6EXTyWc32UcPnJWyIKp.webp', NULL, '2025-07-19 22:50:59', '2025-07-19 22:50:59'),
(3, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/lUWGN2FFUBRM6vlZRFCHmUjrrgQZhMxsicVGo0yv.webp', NULL, '2025-07-19 22:51:19', '2025-07-19 22:51:19'),
(4, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/6E66vOE4IUV4xZ3wxnxEL70w3hoBByPgXwSsirrT.webp', NULL, '2025-07-19 22:51:31', '2025-07-19 22:51:31'),
(5, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/oSjq1tenvmsFrtyI37CPWbd1R3puNBM1SITwGCAc.jpg', NULL, '2025-07-19 22:52:15', '2025-07-19 22:52:15'),
(6, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/BaOBNjznsAF0FfaebwckGMxxgQjKhr7d78nkNtEi.jpg', NULL, '2025-07-19 22:54:04', '2025-07-19 22:54:04'),
(7, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/cff19yaRZ5LzkWRD8Piv4V3LPo9ibKK84ZGax51x.jpg', NULL, '2025-07-19 23:22:37', '2025-07-19 23:22:37'),
(8, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/n95yZHoxddZ1RKQZEKHe0e5qaN7aRYKQYSM2DAqe.webp', NULL, '2025-07-19 23:49:18', '2025-07-19 23:49:18'),
(9, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/s3gqmIZ4N4N1WFVItg8mQTs1i5RyzJ3yxEyaPhnF.webp', NULL, '2025-07-19 23:49:47', '2025-07-19 23:49:47'),
(10, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/ZzL9wXI510LsVFjS73V17wlFeP4HJvCHAdvMbVPV.webp', NULL, '2025-07-19 23:50:47', '2025-07-19 23:50:47'),
(11, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/X6Kkh8EHoLMZQoxW5CknZdtpqvM9V2v0m3JBua4o.webp', 'test teast', '2025-07-19 23:52:26', '2025-07-19 23:52:26'),
(12, '0c609d14-85ed-48bc-9665-a3bf6916e3f8', 'uploads/vendor_invoices/0c609d14-85ed-48bc-9665-a3bf6916e3f8/9wVMe1l59YwmQaZ9wMY6ybtRHlx99GKItMxmocTX.webp', 'test test', '2025-07-19 23:56:51', '2025-07-19 23:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_services`
--

CREATE TABLE `vendor_services` (
  `id` char(36) NOT NULL,
  `service_name` varchar(191) DEFAULT NULL,
  `unit_price` text NOT NULL DEFAULT '0',
  `quantity` text NOT NULL DEFAULT '1',
  `tax` decimal(24,3) NOT NULL DEFAULT 0.000,
  `size` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_services`
--

INSERT INTO `vendor_services` (`id`, `service_name`, `unit_price`, `quantity`, `tax`, `size`, `created_at`, `updated_at`) VALUES
('042bac56-2b2e-4287-b305-31587365e912', 'Pathway carpet', '1500', '1', 18.000, '6*50', '2025-06-25 22:42:55', '2025-06-25 22:42:55'),
('04a6803e-9b73-4501-a1c5-9bc59d6c4c43', 'Stage decoration', '16000', '1', 18.000, 'null', '2025-06-28 13:33:20', '2025-06-28 13:33:20'),
('0ab877d2-3954-458e-8eb4-344515721756', 'Flex fixing', '2000', '1', 18.000, '8*8', '2025-06-25 22:41:50', '2025-06-25 22:41:50'),
('113016f6-9f2b-46fa-bf6e-5be1e97cb7f4', 'Others', '5000', '1', 18.000, 'null', '2025-06-14 18:56:28', '2025-06-14 18:56:28'),
('11b24d6a-9de3-49cd-bb2b-72d315d04b0b', 'Transport', '2500', '1', 18.000, '30', '2025-06-28 22:25:11', '2025-06-28 22:25:11'),
('1d31ac62-5a12-410c-8163-1c6f6c15a7fa', 'Flex', '2560', '1', 18.000, '8*8', '2025-06-28 22:24:54', '2025-06-28 22:24:54'),
('262ae4fa-b052-4a1a-9f00-755c22ae52fe', 'Flex', '540', '2', 18.000, '6*2', '2025-06-25 20:34:20', '2025-06-25 20:34:20'),
('3621ede5-c83b-44ad-aee3-473da56c4292', 'Transport', '2000', '1', 18.000, '20', '2025-06-28 13:30:01', '2025-06-28 13:30:01'),
('379c717d-1c88-47ce-9825-fd03449b8e56', 'Backdrop', '3500', '1', 18.000, '8*8', '2025-06-14 18:55:04', '2025-06-14 18:55:04'),
('3d6e8026-b741-44d1-bab4-f47c6eab07ba', 'Balloon.', '200', '8', 18.000, '1', '2025-07-01 15:24:16', '2025-07-01 15:24:16'),
('44a4a4af-a8aa-4ade-823c-511956e9415d', 'Transport', '2000', '1', 18.000, '30', '2025-06-28 13:37:43', '2025-06-28 13:37:43'),
('65086dac-5281-4b2f-8780-eefc7b2c1c48', 'Flex', '2560', '1', 18.000, '8*8', '2025-06-28 22:26:56', '2025-06-28 22:26:56'),
('6924c845-bc96-4757-a765-7202289393a6', 'Flex box arch', '3960', '1', 18.000, '8*8', '2025-06-25 20:33:37', '2025-06-25 20:33:37'),
('71796043-1fe8-44bd-93b8-94d96733c414', 'Stage', '4800', '1', 18.000, '12*12', '2025-06-25 20:34:54', '2025-06-25 20:34:54'),
('725d7ba8-8113-4f0a-8355-9e1183ec02a0', 'Name board', '700', '1', 18.000, '1', '2025-06-28 22:24:35', '2025-06-28 22:24:35'),
('77c82eda-9362-48ab-9a47-d61b21ad0b96', 'Marigold Flower decoration', '10000', '1', 18.000, '80', '2025-06-28 13:37:01', '2025-06-28 13:37:01'),
('840e8a2e-ad2c-44d4-8d63-96149cc61ef5', 'Garland', '3000', '3', 18.000, '8*8', '2025-06-28 13:38:18', '2025-06-28 13:38:18'),
('8730d932-1b4a-4eaa-8713-84165de985fd', 'Balloon.', '2000', '8', 18.000, '1', '2025-07-01 15:24:22', '2025-07-01 15:24:22'),
('90706f06-fcea-48f4-91b8-341bdc1b45d9', 'Tv', '2500', '1', 18.000, 'null', '2025-06-25 22:45:56', '2025-06-25 22:45:56'),
('9d775fc6-e2d9-40aa-97f8-f403340c0df1', 'Transport', '2500', '1', 18.000, '30', '2025-06-14 18:56:03', '2025-06-14 18:56:03'),
('9ddc27d7-735e-4e48-ae6e-a275052e5fb1', 'Others', '2500', '1', 18.000, NULL, '2025-06-25 21:19:56', '2025-06-25 21:19:56'),
('a11e2b93-3d65-4832-abd1-b892ad89739a', 'Marigold Flower decoration', '15000', '1', 18.000, '80', '2025-06-28 13:37:55', '2025-06-28 13:37:55'),
('a7666c65-47c6-44b2-a0e5-d3f081e4f18a', 'Garland', '2500', '3', 18.000, '8*8', '2025-06-28 13:37:23', '2025-06-28 13:37:23'),
('a9814a66-3191-4a9c-afe1-b90bc343a933', 'Flower decoration', '10000', '1', 18.000, '8*8', '2025-06-28 13:27:46', '2025-06-28 13:27:46'),
('aa0f28c2-f31d-4cdd-b392-9b4aeff5b2d9', 'Marigold Flower decoration', '17000', '1', 18.000, '80', '2025-06-28 13:38:05', '2025-06-28 13:38:05'),
('aa86ec77-c4f1-40c1-a521-d231c21a0505', 'Balloon decoration', '5000', '1', 18.000, '12*8', '2025-06-14 18:55:21', '2025-06-14 18:55:21'),
('ae4408e5-a7e8-4dba-b601-f6d616e0c8d5', 'Flex', '2000', '1', 18.000, '10*8', '2025-06-28 13:29:40', '2025-06-28 13:29:40'),
('b4e59e60-4f1a-4d49-8715-89e1d18ba586', 'Led wall', '7500', '1', 18.000, '8*6', '2025-06-25 20:22:31', '2025-06-25 20:22:31'),
('b5ed6c94-1e36-4880-9ce9-0fb80730bda6', 'Stage', '3000', '1', 18.000, '16*12', '2025-06-25 20:21:42', '2025-06-25 20:21:42'),
('be19ec44-5f89-4f2f-96db-b6aed137de09', 'Red carpet', '2160', '1', 18.000, '6*24', '2025-06-28 13:29:17', '2025-06-28 13:29:17'),
('beb81415-1c5d-4b7c-8c79-2c15521e9d6d', 'Backdrop', '6000', '1', 18.000, '8*16', '2025-06-14 19:01:06', '2025-06-14 19:01:06'),
('d6bef186-7086-4c48-b08d-428bc2d6541c', 'Flex fixing', '2000', '1', 18.000, '8*8', '2025-06-25 21:19:27', '2025-06-25 21:19:27'),
('e06e29f3-2fce-4a8d-9959-bcba6065834d', 'Stage lights', '500', '4', 18.000, 'null', '2025-06-28 22:26:01', '2025-06-28 22:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `visited_services`
--

CREATE TABLE `visited_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `service_id` char(36) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visited_services`
--

INSERT INTO `visited_services` (`id`, `user_id`, `service_id`, `count`, `created_at`, `updated_at`) VALUES
(1, 'a914b7b1-efb4-4cc5-a887-1c5e053fcbef', '8c1b198f-3d69-43f0-b9a9-b9919880f53b', 6, '2023-06-25 16:17:18', '2023-06-25 21:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` char(36) NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `request_updated_by` char(36) DEFAULT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `request_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `note` varchar(255) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `withdrawal_method_id` char(36) DEFAULT NULL,
  `withdrawal_method_fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `coordinates` polygon DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `is_active`, `created_at`, `updated_at`) VALUES
('cc6b4535-e755-4eb1-9b32-54ccc14c164c', 'Chennai', 0x000000000103000000010000000500000007f939ef2d135440f88e607758452a40d2f839ef7c0f5440aab705b79d4f2a40d2f839ef440b5440820a6d5d4f1e2a40d2f839ef4c125440b7a710489c102a4007f939ef2d135440f88e607758452a40, 1, '2023-06-25 22:41:10', '2023-06-25 22:41:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `added_to_carts`
--
ALTER TABLE `added_to_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_details_amounts`
--
ALTER TABLE `booking_details_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_schedule_histories`
--
ALTER TABLE `booking_schedule_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_status_histories`
--
ALTER TABLE `booking_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `category_zone`
--
ALTER TABLE `category_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel_conversations`
--
ALTER TABLE `channel_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel_lists`
--
ALTER TABLE `channel_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel_users`
--
ALTER TABLE `channel_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversation_files`
--
ALTER TABLE `conversation_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_customers`
--
ALTER TABLE `coupon_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_types`
--
ALTER TABLE `discount_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ignored_posts`
--
ALTER TABLE `ignored_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoices_id`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_additional_instructions`
--
ALTER TABLE `post_additional_instructions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_bids`
--
ALTER TABLE `post_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_sub_category`
--
ALTER TABLE `provider_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_searches`
--
ALTER TABLE `recent_searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_views`
--
ALTER TABLE `recent_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_modules`
--
ALTER TABLE `role_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searched_data`
--
ALTER TABLE `searched_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicemen`
--
ALTER TABLE `servicemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_tag`
--
ALTER TABLE `service_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribed_services`
--
ALTER TABLE `subscribed_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_verifications`
--
ALTER TABLE `user_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_zones`
--
ALTER TABLE `user_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_customers`
--
ALTER TABLE `vendor_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_event_types`
--
ALTER TABLE `vendor_event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_expenses`
--
ALTER TABLE `vendor_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_invoices`
--
ALTER TABLE `vendor_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_invoices_items`
--
ALTER TABLE `vendor_invoices_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_invoice_images`
--
ALTER TABLE `vendor_invoice_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_invoice_images_vendor_invoice_id_foreign` (`vendor_invoice_id`);

--
-- Indexes for table `vendor_services`
--
ALTER TABLE `vendor_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visited_services`
--
ALTER TABLE `visited_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `added_to_carts`
--
ALTER TABLE `added_to_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `booking_schedule_histories`
--
ALTER TABLE `booking_schedule_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `booking_status_histories`
--
ALTER TABLE `booking_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `category_zone`
--
ALTER TABLE `category_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_types`
--
ALTER TABLE `discount_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider_sub_category`
--
ALTER TABLE `provider_sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_modules`
--
ALTER TABLE `role_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_tag`
--
ALTER TABLE `service_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_verifications`
--
ALTER TABLE `user_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_zones`
--
ALTER TABLE `user_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_event_types`
--
ALTER TABLE `vendor_event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_expenses`
--
ALTER TABLE `vendor_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vendor_invoices_items`
--
ALTER TABLE `vendor_invoices_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `vendor_invoice_images`
--
ALTER TABLE `vendor_invoice_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `visited_services`
--
ALTER TABLE `visited_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoices_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_invoice_images`
--
ALTER TABLE `vendor_invoice_images`
  ADD CONSTRAINT `vendor_invoice_images_vendor_invoice_id_foreign` FOREIGN KEY (`vendor_invoice_id`) REFERENCES `vendor_invoices` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
