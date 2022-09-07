-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2022 at 08:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrum`
--

-- --------------------------------------------------------

--
-- Table structure for table `dnevni_scrum`
--

CREATE TABLE `dnevni_scrum` (
  `dnevni_scrum_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dovrseni_zadatak`
--

CREATE TABLE `dovrseni_zadatak` (
  `dovrseni_zadatak_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dovršena_funkcionalnost`
--

CREATE TABLE `dovršena_funkcionalnost` (
  `dovršena_funkcionalnost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funkcionalnost_backlog`
--

CREATE TABLE `funkcionalnost_backlog` (
  `funkcionalnost_backlog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inkrement`
--

CREATE TABLE `inkrement` (
  `inkrement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `korisnik_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_ticketa`
--

CREATE TABLE `plan_ticketa` (
  `plan_ticketa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_zadatka`
--

CREATE TABLE `plan_zadatka` (
  `plan_zadatka_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projekt`
--

CREATE TABLE `projekt` (
  `projekt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projektni_tim`
--

CREATE TABLE `projektni_tim` (
  `projektni_tim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retrospektiva_sprinta`
--

CREATE TABLE `retrospektiva_sprinta` (
  `retrospektiva_sprinta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revizija_sprinta`
--

CREATE TABLE `revizija_sprinta` (
  `revizija_sprinta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `uloga_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zadatak`
--

CREATE TABLE `zadatak` (
  `zadatak_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zahtjev`
--

CREATE TABLE `zahtjev` (
  `zahtjev_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zahtjev`
--

INSERT INTO `zahtjev` (`zahtjev_id`, `user_id`) VALUES
(1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dnevni_scrum`
--
ALTER TABLE `dnevni_scrum`
  ADD PRIMARY KEY (`dnevni_scrum_id`);

--
-- Indexes for table `dovrseni_zadatak`
--
ALTER TABLE `dovrseni_zadatak`
  ADD PRIMARY KEY (`dovrseni_zadatak_id`);

--
-- Indexes for table `dovršena_funkcionalnost`
--
ALTER TABLE `dovršena_funkcionalnost`
  ADD PRIMARY KEY (`dovršena_funkcionalnost_id`);

--
-- Indexes for table `funkcionalnost_backlog`
--
ALTER TABLE `funkcionalnost_backlog`
  ADD PRIMARY KEY (`funkcionalnost_backlog_id`);

--
-- Indexes for table `inkrement`
--
ALTER TABLE `inkrement`
  ADD PRIMARY KEY (`inkrement_id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`korisnik_id`);

--
-- Indexes for table `plan_ticketa`
--
ALTER TABLE `plan_ticketa`
  ADD PRIMARY KEY (`plan_ticketa_id`);

--
-- Indexes for table `plan_zadatka`
--
ALTER TABLE `plan_zadatka`
  ADD PRIMARY KEY (`plan_zadatka_id`);

--
-- Indexes for table `projekt`
--
ALTER TABLE `projekt`
  ADD PRIMARY KEY (`projekt_id`);

--
-- Indexes for table `projektni_tim`
--
ALTER TABLE `projektni_tim`
  ADD PRIMARY KEY (`projektni_tim_id`);

--
-- Indexes for table `retrospektiva_sprinta`
--
ALTER TABLE `retrospektiva_sprinta`
  ADD PRIMARY KEY (`retrospektiva_sprinta_id`);

--
-- Indexes for table `revizija_sprinta`
--
ALTER TABLE `revizija_sprinta`
  ADD PRIMARY KEY (`revizija_sprinta_id`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`uloga_id`);

--
-- Indexes for table `zadatak`
--
ALTER TABLE `zadatak`
  ADD PRIMARY KEY (`zadatak_id`);

--
-- Indexes for table `zahtjev`
--
ALTER TABLE `zahtjev`
  ADD PRIMARY KEY (`zahtjev_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dnevni_scrum`
--
ALTER TABLE `dnevni_scrum`
  MODIFY `dnevni_scrum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dovrseni_zadatak`
--
ALTER TABLE `dovrseni_zadatak`
  MODIFY `dovrseni_zadatak_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dovršena_funkcionalnost`
--
ALTER TABLE `dovršena_funkcionalnost`
  MODIFY `dovršena_funkcionalnost_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funkcionalnost_backlog`
--
ALTER TABLE `funkcionalnost_backlog`
  MODIFY `funkcionalnost_backlog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inkrement`
--
ALTER TABLE `inkrement`
  MODIFY `inkrement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_ticketa`
--
ALTER TABLE `plan_ticketa`
  MODIFY `plan_ticketa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_zadatka`
--
ALTER TABLE `plan_zadatka`
  MODIFY `plan_zadatka_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projekt`
--
ALTER TABLE `projekt`
  MODIFY `projekt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projektni_tim`
--
ALTER TABLE `projektni_tim`
  MODIFY `projektni_tim_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retrospektiva_sprinta`
--
ALTER TABLE `retrospektiva_sprinta`
  MODIFY `retrospektiva_sprinta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revizija_sprinta`
--
ALTER TABLE `revizija_sprinta`
  MODIFY `revizija_sprinta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `uloga_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zadatak`
--
ALTER TABLE `zadatak`
  MODIFY `zadatak_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zahtjev`
--
ALTER TABLE `zahtjev`
  MODIFY `zahtjev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
