-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2025 at 09:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elitech_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `harga` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `kode`, `nama`, `stok`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'ITM/2025/0001', 'Sabun Mandi', 65, 6000.00, '2025-11-14 04:46:35', '2025-11-15 01:20:58'),
(4, 'ITM/2025/0002', 'Shampoo', 80, 15000.00, '2025-11-15 01:36:41', '2025-11-15 01:36:41'),
(5, 'ITM/2025/0003', 'Sikat Gigi', 10, 7500.00, '2025-11-15 01:36:57', '2025-11-15 01:36:57'),
(6, 'ITM/2025/0004', 'Energen', 150, 2500.00, '2025-11-15 01:37:39', '2025-11-15 01:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api_token', '83c3ecfddb049211dc6e98094b2e75620870f895bc27e41aa35ce9215583ce47', '[\"*\"]', NULL, NULL, '2025-11-14 04:09:00', '2025-11-14 04:09:00'),
(3, 'App\\Models\\User', 1, 'api_token', '70949da565d81e466f475094af4f14086860246183a2df0a1e6e572adc2b88ee', '[\"*\"]', '2025-11-14 05:24:13', NULL, '2025-11-14 04:31:01', '2025-11-14 05:24:13'),
(4, 'App\\Models\\User', 1, 'api_token', '669490ef9419a22126db73542c6a7bfe0779a1bd52b17347cfef20a7b0db751a', '[\"*\"]', '2025-11-14 17:57:54', NULL, '2025-11-14 17:57:53', '2025-11-14 17:57:54'),
(5, 'App\\Models\\User', 1, 'api_token', '596035f031db40f0a86f9e0e2651e027333f0ad23e7e357079eb647fc850f93a', '[\"*\"]', '2025-11-14 18:05:49', NULL, '2025-11-14 18:03:24', '2025-11-14 18:05:49'),
(6, 'App\\Models\\User', 1, 'api_token', '61dd69b8e64c145a486f8ccdd9e343ba626897415e10215738829a346231456f', '[\"*\"]', '2025-11-14 18:14:25', NULL, '2025-11-14 18:10:25', '2025-11-14 18:14:25'),
(7, 'App\\Models\\User', 1, 'api_token', '3c448100e62a74e3b4a57537efdc659bbc76a0fa5a17d8373c23455a65e2804b', '[\"*\"]', '2025-11-14 18:15:33', NULL, '2025-11-14 18:15:33', '2025-11-14 18:15:33'),
(8, 'App\\Models\\User', 1, 'api_token', '946151dd39acbcf9735fae2d04fa8e2f04eddcbb237f466d478c6a446a4886e6', '[\"*\"]', '2025-11-14 19:29:04', NULL, '2025-11-14 18:29:02', '2025-11-14 19:29:04'),
(9, 'App\\Models\\User', 1, 'api_token', 'caf5829e3407f6a16c734fd0afaee92d4da4a0b7d71f0a698988b79a6e8ea9eb', '[\"*\"]', '2025-11-14 18:37:37', NULL, '2025-11-14 18:32:01', '2025-11-14 18:37:37'),
(10, 'App\\Models\\User', 1, 'api_token', 'e84e3b4e97c87cb52c8f52e337f7b69c4f4fcad4b3a66936b321b40021b32e61', '[\"*\"]', '2025-11-14 19:37:06', NULL, '2025-11-14 19:37:06', '2025-11-14 19:37:06'),
(12, 'App\\Models\\User', 1, 'api_token', 'c15827c5db92bbb4e6ff0928f394f0d699782e6b411f25a23cc80f34734d51a4', '[\"*\"]', NULL, NULL, '2025-11-14 20:05:00', '2025-11-14 20:05:00'),
(13, 'App\\Models\\User', 1, 'api_token', '6fc1d29614ee78d8e5ac39c19cfe2d295617f376632888584fa7667b30b3c3b2', '[\"*\"]', '2025-11-14 20:45:48', NULL, '2025-11-14 20:33:08', '2025-11-14 20:45:48'),
(14, 'App\\Models\\User', 1, 'api_token', '8e72a92d5fde2b98aaf03d1d58f187e09d53914be8d734d0065e138220914c75', '[\"*\"]', '2025-11-14 20:46:00', NULL, '2025-11-14 20:46:00', '2025-11-14 20:46:00'),
(16, 'App\\Models\\User', 1, 'api_token', 'a2889023769b2f1897703ee15fb67f0ccf5e0b514b2dd8e7bfe00412665a58e5', '[\"*\"]', '2025-11-14 20:52:43', NULL, '2025-11-14 20:50:56', '2025-11-14 20:52:43'),
(17, 'App\\Models\\User', 1, 'api_token', '29cbe54034c9f22801a19ef377d12098f7ce7c2d86c234a2154f4cc46b56875f', '[\"*\"]', '2025-11-14 21:03:19', NULL, '2025-11-14 20:55:39', '2025-11-14 21:03:19'),
(18, 'App\\Models\\User', 1, 'api_token', '60482e406182f5087d2ca7a1b320135e2715d18151a41db92ec04e1180e56d63', '[\"*\"]', NULL, NULL, '2025-11-14 21:03:30', '2025-11-14 21:03:30'),
(25, 'App\\Models\\User', 1, 'api_token', '1f0584500139f8886285386e5e20dc3054ddc29bf0a8a9739d3be38a2c79c4a3', '[\"*\"]', '2025-11-15 00:50:19', NULL, '2025-11-15 00:25:56', '2025-11-15 00:50:19'),
(26, 'App\\Models\\User', 1, 'api_token', '6f4efca2f4079ea54b29b4de639d27ea0fcb089f3d4d9fdeacc2eea8fe240e88', '[\"*\"]', '2025-11-15 01:37:39', NULL, '2025-11-15 00:51:57', '2025-11-15 01:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT '2025-11-14',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `kode_transaksi`, `type`, `item_id`, `qty`, `keterangan`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 'TRX/2025/11/0001', 'in', 1, 50, 'Stok awal', '2025-11-14', '2025-11-14 05:01:47', '2025-11-14 05:01:47'),
(2, 'TRX/2025/11/0002', 'out', 1, 30, 'Dibeli', '2025-11-14', '2025-11-14 05:04:08', '2025-11-14 05:04:08'),
(3, 'TRX/2025/11/0003', 'in', 1, 50, 'coba', '2025-11-15', '2025-11-14 19:45:38', '2025-11-14 19:45:38'),
(4, 'TRX/2025/11/0004', 'out', 1, 25, 'coba', '2025-11-15', '2025-11-15 01:20:58', '2025-11-15 01:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@elitech.com', NULL, '$2y$12$U9L2bGI0efDFxPxSqiOfU.wFStA0Ei8yq6lP7jJrMyjEtQToMtl4m', NULL, '2025-11-14 04:09:00', '2025-11-14 04:09:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_kode_unique` (`kode`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_kode_transaksi_unique` (`kode_transaksi`),
  ADD KEY `transactions_item_id_foreign` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
