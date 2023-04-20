-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 20 Apr 2023 pada 08.10
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apieai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `harga` double NOT NULL,
  `deskripsi` varchar(191) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `title`, `harga`, `deskripsi`, `qty`, `timestamp`) VALUES
('37bccaa7-98ab-4db3-b8a7-2944ba21690a', 'Brownco', 300000, 'tas cokelat merona', 30, '2023-04-20 04:22:06.701'),
('48da80bd-52f6-435d-aa18-121b24ed2b4f', 'Montana', 300000, 'tas hitam merona sekali', 30, '2023-04-19 16:17:56.730');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `timestamp` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `timestamp`) VALUES
('1', 'junedganteng', '$2b$10$kMYpk4HRsWflYF03NGO9DOt0FskmPpRboZ4aUpQ92rwmM.Dv6vzA.', '2023-04-19 15:44:58.404'),
('9f05c601-6dbc-4c77-9b72-84629ce668a5', 'asepjuned', '$2b$10$O2y7aqB3zYrsUM19IB2ztu7D8vS7Qj.JmKxcizNTMm2q1Om4PPT8K', '2023-04-19 16:04:24.047');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('79f32653-4206-4388-bcc3-75635a8f91f6', '847df0c1be787bb95b6b6515f81f9405fe656de1383edc5fea6a0f575f5cda26', '2023-04-19 16:02:28.693', '20230419160227_init', NULL, NULL, '2023-04-19 16:02:27.057', 1),
('b5b8c350-af54-420e-b9f0-f3d89b2172fc', 'e200418d97bc8ba4b984155f842e453da194aea73ff58727cc910d2637467f45', '2023-04-19 15:23:51.310', '20230419152350_init', NULL, NULL, '2023-04-19 15:23:50.539', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_username_key` (`username`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
