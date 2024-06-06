-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 12:57 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Vlees', 'images/card-1.jpg'),
(2, 'Vegetarish', 'images/card-2.jpg'),
(3, 'Vis', 'images/card-3.png');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `fname`, `sname`, `address`, `city`, `zipcode`, `status`, `pizza_id`, `size_id`, `user_id`) VALUES
(5, 'Rami', 'Rami', 'Amsterdamstraat', 'Amsterdam', '1004AN', 'in progress', 1, 1, 7),
(6, 'Max', 'Max', 'Tinwerf', 'Den Haag', '2525RR', 'in progress', 6, 3, 4),
(7, 'aksdh', 'kjasgd', 'dhkasgd', 'dkhsgd', 'dkj', 'in progress', 12, 3, 4),
(8, 'Alaa', 'Alkatlabe', 'Hengelolaan', '\'s-gravenhage', '2544 GH', 'in progress', 8, 2, 4),
(9, 'a', 'a', 'a', 'a', 'a', 'in progress', 1, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `category_id`, `price`, `description`, `image`) VALUES
(1, 'Pepper Barbecue Chicken', 1, 12, 'Pepper Barbecue Chicken,Cheese', 'images/pizza-13.jpg'),
(2, 'Chicken Sausage', 1, 11, 'Chicken Sausage,Cheese..', 'images/pizza-14.jpg'),
(3, 'Chicken Golden Delight', 1, 13, 'Barbeque chicken...', 'images/pizza-15.jpg'),
(4, 'Non Veg Supreme', 1, 12, 'Supreme delight...', 'images/pizza-16.jpg'),
(5, 'Chicken Dominator', 1, 10.5, 'Barbecue Chicken,Peri-Peri Chicken...', 'images/pizza-17.jpg'),
(6, 'Margherita', 2, 11, 'Margherita...', 'images/pizza-1.jpg'),
(7, 'Double Cheese Margherita', 2, 13, 'Margherita with extra cheese...', 'images/pizza-2.jpg'),
(8, 'Farm House', 2, 10, 'veggies!crisp capsicum...', 'images/pizza-3.jpg'),
(9, 'Peppy Paneer', 2, 11, 'Chunky paneer,crisp capsicum...', 'images/pizza-4.jpg'),
(10, 'Deluxe Veggie', 2, 12, 'vegetariannThe onions, the capsicum..', 'images/pizza-5.jpg'),
(11, 'Veg Extravaganza', 2, 13, 'A pizza exotic black olives, crunchy onions..', 'images/pizza-6.jpg'),
(12, 'Tuna Treat pizza', 3, 12, 'Tomato sauce, mozzarella..', 'images/card-3.png');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `name`) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(4, 'max@gmail.com', '[]', '$2y$13$zIaJlAp0EQ3ZSSOQOkS0G.rl9XoJTnMfl2JfnNffoog9fpX1Ve8Pi', 'max'),
(5, 'sam@gmail.com', '[]', '$2y$13$Fhutly5rG1xxA9D44K5hSOle7Ole27FOHCrF1Ev2l1n6EiGJ9ztiC', 'Sam Mike'),
(6, 'raf@gmail.com', '[]', '$2y$13$PWkoEwU5rozRCKTqRpCyY.ovp4xolKz2HlAPggodGpB2soegqOSF.', 'raf'),
(7, 'Rami@gmail.com', '[]', '$2y$13$2tFiN1pySXBx3RFEg2jjB.czxjC/O0IR4bkcCpvjurLXVWunjCO0O', 'Rami'),
(8, 'Ronaldo@r.com', '[]', '$2y$13$PFrtK3/2qjgvz6OX5hg6FufXDNIWJS1VXH4LbWFezMTN3G33uFA62', 'Ronaldo'),
(11, 'Nouar@gl.com', '[]', '$2y$13$yixNHjDUTD2RZOfZeCIsu.oG5YgDfoYSZC5qqtAYMK5/m/kPCDO0u', 'Nouar'),
(12, 'Leo@gmail.com', '[]', '$2y$13$czEal1Z6C.MaLcZAx5cwLeqtNqwqelt49DCxoS0/PVfB8MqmKt7su', 'leo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398D41D1D42` (`pizza_id`),
  ADD KEY `IDX_F5299398498DA827` (`size_id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398498DA827` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F5299398D41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
