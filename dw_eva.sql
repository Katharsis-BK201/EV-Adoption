-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 03:54 AM
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
-- Database: `dw_eva`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_eligibility`
--

CREATE TABLE `dim_eligibility` (
  `eligibility_id` int(11) NOT NULL,
  `cafv_eligibility` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_location`
--

CREATE TABLE `dim_location` (
  `location_id` int(11) NOT NULL,
  `county` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_make`
--

CREATE TABLE `dim_make` (
  `make_id` int(11) NOT NULL,
  `make` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_model`
--

CREATE TABLE `dim_model` (
  `model_id` int(11) NOT NULL,
  `make_id` int(11) NOT NULL,
  `year_model_id` int(11) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `ev_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_time`
--

CREATE TABLE `dim_time` (
  `date_id` int(11) NOT NULL,
  `model_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_utility`
--

CREATE TABLE `dim_utility` (
  `utility_id` int(11) NOT NULL,
  `electric_utility` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_ev_adoption_area`
--

CREATE TABLE `fact_ev_adoption_area` (
  `location_id` int(11) NOT NULL,
  `utility_id` int(11) NOT NULL,
  `eligibility_id` int(11) NOT NULL,
  `vehicle_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_ev_count`
--

CREATE TABLE `fact_ev_count` (
  `model_id` int(11) NOT NULL,
  `ev_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_ev_performance`
--

CREATE TABLE `fact_ev_performance` (
  `model_id` int(11) NOT NULL,
  `eligibity_id` int(11) NOT NULL,
  `utility_id` int(11) NOT NULL,
  `range_ave` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_ev_type_distribution`
--

CREATE TABLE `fact_ev_type_distribution` (
  `dim_model` int(11) NOT NULL,
  `distribution_count` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_eligibility`
--
ALTER TABLE `dim_eligibility`
  ADD PRIMARY KEY (`eligibility_id`);

--
-- Indexes for table `dim_location`
--
ALTER TABLE `dim_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `dim_make`
--
ALTER TABLE `dim_make`
  ADD PRIMARY KEY (`make_id`);

--
-- Indexes for table `dim_model`
--
ALTER TABLE `dim_model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_make_id_idx` (`make_id`),
  ADD KEY `fk_year_model_id_idx` (`year_model_id`);

--
-- Indexes for table `dim_time`
--
ALTER TABLE `dim_time`
  ADD PRIMARY KEY (`date_id`);

--
-- Indexes for table `dim_utility`
--
ALTER TABLE `dim_utility`
  ADD PRIMARY KEY (`utility_id`);

--
-- Indexes for table `fact_ev_adoption_area`
--
ALTER TABLE `fact_ev_adoption_area`
  ADD KEY `fk1_location_id_idx` (`location_id`),
  ADD KEY `fk1_utility_id_idx` (`utility_id`),
  ADD KEY `fk1_eligibility_id_idx` (`eligibility_id`);

--
-- Indexes for table `fact_ev_count`
--
ALTER TABLE `fact_ev_count`
  ADD KEY `fk3_model_id_idx` (`model_id`);

--
-- Indexes for table `fact_ev_performance`
--
ALTER TABLE `fact_ev_performance`
  ADD KEY `fk2_model_id_idx` (`model_id`),
  ADD KEY `fk2_eligibility_id_idx` (`eligibity_id`),
  ADD KEY `fk2_utility_id_idx` (`utility_id`);

--
-- Indexes for table `fact_ev_type_distribution`
--
ALTER TABLE `fact_ev_type_distribution`
  ADD KEY `fk4_dim_model_idx` (`dim_model`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_eligibility`
--
ALTER TABLE `dim_eligibility`
  MODIFY `eligibility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dim_location`
--
ALTER TABLE `dim_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1204;

--
-- AUTO_INCREMENT for table `dim_make`
--
ALTER TABLE `dim_make`
  MODIFY `make_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `dim_model`
--
ALTER TABLE `dim_model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `dim_time`
--
ALTER TABLE `dim_time`
  MODIFY `date_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dim_utility`
--
ALTER TABLE `dim_utility`
  MODIFY `utility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dim_model`
--
ALTER TABLE `dim_model`
  ADD CONSTRAINT `fk_make_id` FOREIGN KEY (`make_id`) REFERENCES `dim_make` (`make_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_year_model_id` FOREIGN KEY (`year_model_id`) REFERENCES `dim_time` (`date_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fact_ev_adoption_area`
--
ALTER TABLE `fact_ev_adoption_area`
  ADD CONSTRAINT `fk1_eligibility_id` FOREIGN KEY (`eligibility_id`) REFERENCES `dim_eligibility` (`eligibility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_location_id` FOREIGN KEY (`location_id`) REFERENCES `dim_location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_utility_id` FOREIGN KEY (`utility_id`) REFERENCES `dim_utility` (`utility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fact_ev_count`
--
ALTER TABLE `fact_ev_count`
  ADD CONSTRAINT `fk3_model_id` FOREIGN KEY (`model_id`) REFERENCES `dim_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fact_ev_performance`
--
ALTER TABLE `fact_ev_performance`
  ADD CONSTRAINT `fk2_eligibility_id` FOREIGN KEY (`eligibity_id`) REFERENCES `dim_eligibility` (`eligibility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_model_id` FOREIGN KEY (`model_id`) REFERENCES `dim_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_utility_id` FOREIGN KEY (`utility_id`) REFERENCES `dim_utility` (`utility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fact_ev_type_distribution`
--
ALTER TABLE `fact_ev_type_distribution`
  ADD CONSTRAINT `fk4_dim_model` FOREIGN KEY (`dim_model`) REFERENCES `dim_model` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
