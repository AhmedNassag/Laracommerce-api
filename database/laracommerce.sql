-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 09:33 AM
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
-- Database: `laracommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankings`
--

CREATE TABLE `bankings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(75) NOT NULL,
  `alias` varchar(25) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bankings`
--

INSERT INTO `bankings` (`id`, `name`, `alias`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Pt. Bank Central Asia Tbk.', 'BCA', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(2, 'Pt. Bank Negara Indonesia (Persero)', 'BNI', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(3, 'Pt. Bank Rakyat Indonesia (Persero)', 'BRI', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(4, 'Pt. Bank Mandiri (Persero) Tbk.', 'Mandiri', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `slug` varchar(110) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Gadget', 'gadget', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(2, 'Furniture', 'furniture', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(3, 'Sneaker', 'sneaker', 1, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `postal_code` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_account_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `discount_amount` int(10) UNSIGNED NOT NULL,
  `expired` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `merchant_account_id`, `name`, `slug`, `discount_amount`, `expired`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assumenda Repellendus', 'assumenda-repellendus', 32288, '2024-05-13 14:05:00', '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(2, 1, 'Est Voluptatem', 'est-voluptatem', 135884, '2024-05-13 14:05:00', '2024-05-08 11:05:00', '2024-05-08 11:05:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finances`
--

CREATE TABLE `finances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('DEBIT','KREDIT') NOT NULL,
  `order_id` varchar(31) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `status` enum('PENDING','SUCCESS','ACCEPT','REJECT') NOT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finances`
--

INSERT INTO `finances` (`id`, `user_id`, `type`, `order_id`, `description`, `amount`, `status`, `balance`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'DEBIT', 'test-839', 'Nostrum iusto aut aliquid dolor. Animi consequatur enim et eum nostrum. Mollitia omnis impedit qui soluta.', 682733, 'SUCCESS', 2086667, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_accounts`
--

CREATE TABLE `merchant_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banking_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `bank_account_name` varchar(100) DEFAULT NULL,
  `bank_account_number` varchar(50) DEFAULT NULL,
  `bank_branch_name` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_accounts`
--

INSERT INTO `merchant_accounts` (`id`, `banking_id`, `user_id`, `name`, `slug`, `address`, `bank_account_name`, `bank_account_number`, `bank_branch_name`, `image`, `balance`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Zulfa Melani', 'zulfa-melani', 'Jln. Bata Putih No. 604, Kupang 79295, DIY', 'Karman Hasan Wibisono S.i.kom', '365366096415467', 'Administrasi Jakarta Pusat', NULL, 0, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

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
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2013_01_26_154524_create_provinces_table', 1),
(3, '2013_01_26_154536_create_cities_table', 1),
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2023_01_26_154211_create_categories_table', 1),
(9, '2023_01_26_155018_create_bankings_table', 1),
(10, '2023_01_26_155238_create_finances_table', 1),
(11, '2023_01_26_155902_create_merchant_accounts_table', 1),
(12, '2023_01_26_160445_create_products_table', 1),
(13, '2023_01_26_161218_create_product_images_table', 1),
(14, '2023_01_26_161352_create_coupons_table', 1),
(15, '2023_01_26_161731_create_orders_table', 1),
(16, '2023_01_26_162013_create_order_product_table', 1),
(17, '2023_01_30_190910_create_jobs_table', 1),
(18, '2023_02_13_031053_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(31) NOT NULL,
  `total_price` int(10) UNSIGNED NOT NULL,
  `coupons` varchar(50) DEFAULT NULL,
  `courier_services` varchar(200) NOT NULL,
  `status` enum('IN_CART','PENDING','SUCCESS','FAILED') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `total_price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_account_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `merchant_account_id`, `name`, `slug`, `description`, `price`, `weight`, `stock`, `sold`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Voluptatibus Quae', 'voluptatibus-quae', 'Voluptatum et temporibus quis et. Fugiat ut dolorem repellendus nulla. Maiores porro asperiores tempora at voluptate.\n\nQuo reprehenderit labore omnis adipisci. Veritatis voluptatem quidem consectetur ad dolor neque ut consectetur. Architecto suscipit necessitatibus voluptas sequi autem et. Totam quia soluta ut harum blanditiis.\n\nQui mollitia quidem sunt eius. Inventore iste id maxime natus est. Corporis iure ut rem a fugiat accusantium.', 26704, 614, 10, 1, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(2, 2, 1, 'Sunt Aliquid', 'sunt-aliquid', 'Quia doloribus quam eaque vitae dicta et sed recusandae. Consequatur eos perferendis modi aliquam reiciendis dolorum excepturi atque. Accusantium fugit dolorem in voluptatem ut sequi soluta. Dolor mollitia vel modi iusto doloribus.\n\nEst perferendis saepe iste veritatis officia placeat non. Quia in voluptatem aspernatur iure sed sunt non.\n\nEt cupiditate ex excepturi consectetur. Facilis odio tenetur provident. Dolorem quia non quia magnam voluptate quis exercitationem id. Et sunt explicabo ut est sit maiores.', 782240, 6741, 7, 2, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(3, 3, 1, 'Autem Odio', 'autem-odio', 'Sint et amet aut minima maxime. Numquam autem modi cum voluptate nam magnam fuga. In quae id expedita rerum vel veritatis.\n\nEt odio in mollitia qui. Similique tenetur ullam cupiditate culpa. Occaecati sed ducimus impedit perferendis eligendi qui. Maxime sapiente tempora totam optio aut eligendi qui.\n\nEnim enim veritatis velit itaque asperiores aut. Labore nihil tempore est explicabo deleniti unde culpa ex. A quia id voluptas mollitia quod. Fugit ut doloribus sint vitae.', 632487, 8549, 10, 3, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(4, 1, 1, 'Unde Sint', 'unde-sint', 'Dolorem saepe fugit suscipit temporibus quia omnis excepturi. Optio consequatur fugit assumenda sint porro rerum id. Ut provident exercitationem id non modi repellendus quisquam quae. Qui et cum sit vitae quod id.\n\nReprehenderit maxime sit ullam totam et voluptatibus est. Non dolorem ut velit explicabo aut ex. Ut velit maxime perferendis ut et dolorum.\n\nLaudantium voluptatem repellat consequatur cumque cupiditate quia. Doloremque doloribus dolorem sunt placeat quibusdam qui harum. Rem quis voluptates ipsum. Vel quod saepe dicta quis ipsam sed sunt.', 994074, 3493, 6, 5, '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(5, 2, 1, 'Facere Cum', 'facere-cum', 'Magnam dolorem dicta illo corrupti veniam error. Eveniet cupiditate labore pariatur temporibus quis voluptas.\n\nNostrum possimus dignissimos voluptas quod dolorem. Nulla sit amet voluptatem repellat. Autem consectetur recusandae aspernatur et.\n\nQuasi voluptatem sunt ullam animi at tempora iure. Cupiditate quaerat assumenda ut in harum et qui officia. Eos architecto ea veritatis accusamus. Et et voluptatibus voluptatum ut et.', 68370, 3085, 4, 3, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'soluta338.jpg', 'soluta338jpg', '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(2, 2, 'ipsa815.jpg', 'ipsa815jpg', '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(3, 3, 'nostrum218.jpg', 'nostrum218jpg', '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(4, 4, 'dolores683.jpg', 'dolores683jpg', '2024-05-08 11:05:00', '2024-05-08 11:05:00'),
(5, 5, 'sapiente641.jpg', 'sapiente641jpg', '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `username` varchar(35) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `role` varchar(15) NOT NULL,
  `balance` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `address` text DEFAULT NULL,
  `avatar` varchar(120) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `city_id`, `name`, `username`, `email`, `phone`, `nik`, `role`, `balance`, `status`, `address`, `avatar`, `password`, `email_verified_at`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Gasti Yolanda', 'gasti-yolanda', 'epalastri@example.com', '0895845073825', '3312385510970853', '[\"ADMIN\"]', NULL, 'ACTIVE', 'Jr. Elang No. 141, Bogor 44053, Kaltim', NULL, '$2y$10$YCLeHTwR9DVFnf6WpFXqn.ohzXrPBKj0FkkxOUV9NY5DUetTcfdyi', '2024-05-08 11:04:59', '7hhCKnNnky', NULL, NULL, NULL, '2024-05-08 11:04:59', '2024-05-08 11:04:59'),
(2, NULL, 'Clara Astuti', 'clara-astuti', 'jindra27@example.com', '0814332796155', '9203155001175098', '[\"STAFF\"]', NULL, 'ACTIVE', 'Jr. Cokroaminoto No. 922, Pontianak 27585, Gorontalo', NULL, '$2y$10$Vb.1v58Q71eiTxmOGr7eue8fwpfpaeFCr9xaFHc3jZM06E.4JxtzS', '2024-05-08 11:04:59', 'm7l1amjz00', NULL, NULL, NULL, '2024-05-08 11:04:59', '2024-05-08 11:04:59'),
(3, NULL, 'Lembah Maheswara', 'lembah-maheswara', 'elisa.laksmiwati@example.net', '0830793157069', '5171391810139557', '[\"MERCHANT\"]', NULL, 'ACTIVE', 'Psr. Imam Bonjol No. 410, Sibolga 24919, Bengkulu', NULL, '$2y$10$XTtnE.kAuSHec5PEpnkLI.fKkbDnIRKQFFVvOcmCEDTBAuPMS0yJG', '2024-05-08 11:04:59', 'VphDT5284R', NULL, NULL, NULL, '2024-05-08 11:05:00', '2024-05-08 11:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankings`
--
ALTER TABLE `bankings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bankings_name_unique` (`name`),
  ADD UNIQUE KEY `bankings_alias_unique` (`alias`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finances_type_index` (`type`),
  ADD KEY `finances_status_index` (`status`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `merchant_accounts`
--
ALTER TABLE `merchant_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchant_accounts_slug_unique` (`slug`),
  ADD UNIQUE KEY `merchant_accounts_bank_account_name_unique` (`bank_account_name`),
  ADD UNIQUE KEY `merchant_accounts_bank_account_number_unique` (`bank_account_number`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_invoice_number_unique` (`invoice_number`),
  ADD KEY `orders_status_index` (`status`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_images_slug_unique` (`slug`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bankings`
--
ALTER TABLE `bankings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finances`
--
ALTER TABLE `finances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_accounts`
--
ALTER TABLE `merchant_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
