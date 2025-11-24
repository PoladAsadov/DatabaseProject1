-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 24, 2025 at 04:52 AM
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
-- Database: `streetartreportingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `art_category`
--

CREATE TABLE `art_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `art_category`
--

INSERT INTO `art_category` (`category_id`, `category_name`, `description`) VALUES
(1, 'Graffiti', 'Traditional graffiti-style artwork, usually text or tags.'),
(2, 'Mural', 'Large-scale painted artwork on walls or buildings.'),
(3, 'Stencil', 'Artwork created using stencils and spray paint.'),
(4, 'Sticker', 'Sticker-based street art on public surfaces.'),
(5, 'Installation', '3D or mixed-media street art installation.');

-- --------------------------------------------------------

--
-- Table structure for table `art_rating`
--

CREATE TABLE `art_rating` (
  `rating_id` bigint(20) UNSIGNED NOT NULL,
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `user_uno` bigint(10) UNSIGNED NOT NULL,
  `rating` tinyint(1) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `art_rating`
--

INSERT INTO `art_rating` (`rating_id`, `street_art_uno`, `user_uno`, `rating`, `comment`, `created`) VALUES
(1, 1, 3, 5, 'Amazing colors!', '2025-11-24 03:29:21'),
(2, 2, 1, 4, 'Good mural but needs touch-up.', '2025-11-24 03:29:21'),
(3, 3, 3, 2, 'Too small.', '2025-11-24 03:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `art_review`
--

CREATE TABLE `art_review` (
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `evaluator_uno` bigint(10) UNSIGNED NOT NULL,
  `review_text` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `art_review`
--

INSERT INTO `art_review` (`review_id`, `street_art_uno`, `evaluator_uno`, `review_text`, `created`) VALUES
(1, 1, 2, 'Artwork approved. Meets quality requirements.', '2025-11-24 02:58:56'),
(2, 2, 2, 'Stencil slightly misaligned. Needs minor fixes.', '2025-11-24 02:58:56'),
(3, 3, 2, 'Missing owner permission. Rejected.', '2025-11-24 02:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `registrar`
--

CREATE TABLE `registrar` (
  `uno` bigint(20) UNSIGNED NOT NULL,
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `registrar_number` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registrar_date` date NOT NULL,
  `registrar_status` tinyint(1) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `street_art`
--

CREATE TABLE `street_art` (
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `author` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `message` char(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `street_art`
--

INSERT INTO `street_art` (`street_art_uno`, `author`, `category`, `category_id`, `message`, `description`, `location`, `date`, `time`, `lat`, `lng`, `created`) VALUES
(1, 'johnA', 'Graffiti', 1, 'Cool street art', 'Bright colors and stencil work', 'Vilnius Old Town', '2025-01-10', '12:30', '54.6872', '25.2797', '2025-11-24 02:57:28'),
(2, 'johnA', 'Mural', 2, 'Wall painting', 'Large mural on building', 'Vilnius Naujamiestis', '2025-02-15', '15:45', '54.6785', '25.2724', '2025-11-24 02:57:28'),
(3, 'mikeU', 'Tag', 4, 'Simple tag', 'Small signature tag', 'Vilnius Antakalnis', '2025-03-20', '18:20', '54.7100', '25.3160', '2025-11-24 02:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `street_art_damage`
--

CREATE TABLE `street_art_damage` (
  `uno` bigint(15) UNSIGNED NOT NULL,
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `explanation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticker_status` tinyint(1) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `street_art_photo`
--

CREATE TABLE `street_art_photo` (
  `uno` bigint(20) UNSIGNED NOT NULL,
  `street_art_uno` bigint(20) UNSIGNED NOT NULL,
  `photo_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_size` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_type` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_data` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uno` bigint(10) UNSIGNED NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `username` varchar(25) NOT NULL,
  `usertype` tinyint(1) UNSIGNED NOT NULL,
  `password` varchar(64) NOT NULL,
  `adulthood` tinyint(1) UNSIGNED NOT NULL,
  `termsofservice` tinyint(1) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uno`, `fname`, `lname`, `username`, `usertype`, `password`, `adulthood`, `termsofservice`, `created`) VALUES
(1, 'John', 'Artist', 'johnA', 1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 1, '2025-11-24 02:56:23'),
(2, 'Sara', 'Evaluator', 'saraE', 2, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 1, 1, '2025-11-24 02:56:23'),
(3, 'Mike', 'User', 'mikeU', 0, 'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', 1, 1, '2025-11-24 02:56:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `art_category`
--
ALTER TABLE `art_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `uniq_category_name` (`category_name`);

--
-- Indexes for table `art_rating`
--
ALTER TABLE `art_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `street_art_uno` (`street_art_uno`),
  ADD KEY `user_uno` (`user_uno`);

--
-- Indexes for table `art_review`
--
ALTER TABLE `art_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `street_art_uno` (`street_art_uno`),
  ADD KEY `evaluator_uno` (`evaluator_uno`);

--
-- Indexes for table `registrar`
--
ALTER TABLE `registrar`
  ADD PRIMARY KEY (`uno`),
  ADD UNIQUE KEY `uno` (`uno`),
  ADD KEY `street_art_uno` (`street_art_uno`);

--
-- Indexes for table `street_art`
--
ALTER TABLE `street_art`
  ADD PRIMARY KEY (`street_art_uno`),
  ADD UNIQUE KEY `street_art_uno` (`street_art_uno`),
  ADD KEY `fk_street_art_category` (`category_id`);

--
-- Indexes for table `street_art_damage`
--
ALTER TABLE `street_art_damage`
  ADD PRIMARY KEY (`uno`),
  ADD UNIQUE KEY `uno` (`uno`),
  ADD KEY `street_art_uno` (`street_art_uno`);

--
-- Indexes for table `street_art_photo`
--
ALTER TABLE `street_art_photo`
  ADD PRIMARY KEY (`uno`),
  ADD UNIQUE KEY `uno` (`uno`),
  ADD KEY `street_art_uno` (`street_art_uno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uno`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `art_category`
--
ALTER TABLE `art_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `art_rating`
--
ALTER TABLE `art_rating`
  MODIFY `rating_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `art_review`
--
ALTER TABLE `art_review`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registrar`
--
ALTER TABLE `registrar`
  MODIFY `uno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `street_art_damage`
--
ALTER TABLE `street_art_damage`
  MODIFY `uno` bigint(15) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `street_art_photo`
--
ALTER TABLE `street_art_photo`
  MODIFY `uno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uno` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `art_rating`
--
ALTER TABLE `art_rating`
  ADD CONSTRAINT `fk_rating_street_art` FOREIGN KEY (`street_art_uno`) REFERENCES `street_art` (`street_art_uno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_uno`) REFERENCES `user` (`uno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `art_review`
--
ALTER TABLE `art_review`
  ADD CONSTRAINT `fk_review_street_art` FOREIGN KEY (`street_art_uno`) REFERENCES `street_art` (`street_art_uno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`evaluator_uno`) REFERENCES `user` (`uno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registrar`
--
ALTER TABLE `registrar`
  ADD CONSTRAINT `registrar_ibfk_1` FOREIGN KEY (`street_art_uno`) REFERENCES `street_art` (`street_art_uno`);

--
-- Constraints for table `street_art`
--
ALTER TABLE `street_art`
  ADD CONSTRAINT `fk_street_art_category` FOREIGN KEY (`category_id`) REFERENCES `art_category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `street_art_damage`
--
ALTER TABLE `street_art_damage`
  ADD CONSTRAINT `street_art_damage_ibfk_1` FOREIGN KEY (`street_art_uno`) REFERENCES `street_art` (`street_art_uno`);

--
-- Constraints for table `street_art_photo`
--
ALTER TABLE `street_art_photo`
  ADD CONSTRAINT `street_art_photo_ibfk_1` FOREIGN KEY (`street_art_uno`) REFERENCES `street_art` (`street_art_uno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
