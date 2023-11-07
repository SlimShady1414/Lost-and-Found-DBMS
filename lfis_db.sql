-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2023 at 08:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `lfis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` bigint(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Phones', 1, '2023-05-01 10:32:44', NULL),
(2, 'Keys', 1, '2023-05-01 10:34:27', NULL),
(3, 'Watches', 1, '2023-05-01 10:35:58', NULL),
(4, 'Hoodies',1,'2023-05-01 10:35:58', NULL),
(5, 'Books',1,'2023-05-01 10:35:58', NULL),
(6, 'Bags',1,'2023-05-01 10:35:58', NULL),
(7, 'Jewellry',1,'2023-05-01 10:35:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_list`
--

CREATE TABLE `inquiry_list` (
  `id` bigint(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiry_list`
--

INSERT INTO `inquiry_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Person1', '09123546788', 'jdoe@mail.com', 'Sample message example', 1, '2023-05-01 14:11:19', '2023-05-01 14:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` bigint(30) NOT NULL,
  `category_id` bigint(30) NOT NULL,
  `fullname` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `contact` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `category_id`, `fullname`, `title`, `description`, `contact`, `image_path`, `status`, `created_at`, `updated`) VALUES
(1, 2, 'Person1', 'Found Keys at Park', 'These keys were found under the bench at the park.', '09123564789', 'uploads/items/1.png', 1, '2023-05-01 11:48:45', '2023-05-01 11:48:45'),
(3, 1, 'Person2', 'Found an Android Phone @ Parking Lot', 'Found this phone in the parking lot near a white pleasure scooter.', '09123654897', 'uploads/items/3.png?v=1682916949', 1, '2023-05-01 12:55:48', '2023-05-01 12:55:49'),
(5, 3, 'Person3', 'Found a Watch left @ Room 101', 'Found this watch in the 2nd bench near the window.', '09457778988', 'uploads/items/5.png?v=1682917427', 2, '2023-05-01 13:03:47', '2023-05-01 13:03:47'),
(6, 1, 'Person4', 'Found Something @ The Library', 'Found something in the 1st floor of the library near the DSA books shelf.', '09123564789', NULL, 2, '2023-05-01 13:34:29', '2023-05-01 14:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Lost and Found Information System'),
(6, 'short_name', 'PHP - LFIS'),
(11, 'logo', 'uploads/logo.png?v=1682908055'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1682908055'),
(17, 'phone', '9876543210'),
(19, 'email', 'info@simpleorganization.org'),
(20, 'address', '123 PESU , E-city 560100');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '$2y$10$uF5efz3yEGb6Z0U7T2aVZ.3cm.T5jV/ii6VrWnxA871tNUPwNooqe', 'uploads/avatars/1.png?v=1678760026', NULL, 1, '2021-01-20 14:02:37', '2023-04-26 16:01:02'),
(2,'PES Adminstrator','','Pesuadmin','pesuadmin','$2y$10$mPf7jmJI6M8YyEqdPoPooeNb7ApVe61QC8NYSXOxoqUQORoiGMo6u','uploads/avatars/1.png?v=1678760026',NULL,2,'2021-01-20 14:02:37', '2023-04-26 16:01:02');
--
-- Indexes for dumped tables
--
-- Trigger: Log views of items into item_views table
CREATE TABLE IF NOT EXISTS item_views (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    viewed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER log_item_view_trigger
AFTER INSERT ON item_list FOR EACH ROW
BEGIN
    INSERT INTO item_views (item_id) VALUES (NEW.id);
END;
//
DELIMITER ;

-- Function: Validate image path
DELIMITER //

CREATE FUNCTION ValidateImage(imagePath TEXT)
RETURNS TEXT
BEGIN
    IF imagePath IS NULL OR imagePath = '' THEN
        RETURN 'default_image.jpg'; -- Replace with your default image path
    ELSE
        RETURN imagePath; -- Add further validation if needed
    END IF;
END;
//
DELIMITER ;

-- Procedure: Fetch item details based on ID
DELIMITER //

CREATE PROCEDURE GetItemDetails(IN itemId INT)
BEGIN
    SELECT *, COALESCE((SELECT `name` FROM `category_list` WHERE `category_list`.`id` = `item_list`.`category_id`), 'N/A') AS `category`
    FROM `item_list`
    WHERE id = itemId;
END;
//
DELIMITER ;

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_list`
--
ALTER TABLE `item_list`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;
