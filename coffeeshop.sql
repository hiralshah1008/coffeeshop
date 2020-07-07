-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 04:32 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` smallint(6) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `ingredient_status` enum('Y','N','D') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingredient_name`, `ingredient_status`, `created_at`, `modified_at`) VALUES
(1, 'Milk', 'Y', NULL, NULL),
(2, 'Water', 'Y', NULL, NULL),
(3, 'Coffee', 'Y', NULL, NULL),
(4, 'Cream', 'Y', NULL, NULL),
(5, 'Sugar', 'Y', NULL, NULL),
(6, 'Cheese', 'Y', NULL, NULL),
(7, 'Flour', 'Y', NULL, NULL),
(8, 'Chai', 'Y', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` smallint(6) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `shop_image` text NOT NULL,
  `shop_add1` varchar(100) NOT NULL,
  `shop_add2` varchar(100) DEFAULT NULL,
  `shop_city` varchar(100) NOT NULL,
  `shop_state` varchar(2) NOT NULL,
  `shop_zip` varchar(5) NOT NULL,
  `shop_hour` text NOT NULL,
  `shop_status` enum('O','TC','PC') NOT NULL COMMENT 'O => open, TC =< Temporarily Closed, PC => Permanently Closed',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'timestamp when shop is added',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'timestamp when shop is modified',
  `user_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `shop_name`, `shop_image`, `shop_add1`, `shop_add2`, `shop_city`, `shop_state`, `shop_zip`, `shop_hour`, `shop_status`, `created_at`, `modified_at`, `user_id`) VALUES
(1, 'Starbucks', 'shopimages/b1.jpg', '39370', 'Civic Center Dr H', 'Fremont', 'CA', '94538', '{\"time\":{\"monday\":[\"07:00AM\",\"05:00PM\"],\"tuesday\":[\"07:00AM\",\"05:00PM\"],\"wednesday\":[\"07:00AM\",\"05:00PM\"],\"thursday\":[\"07:00AM\",\"05:00PM\"],\"friday\":[\"07:00AM\",\"05:00PM\"],\"saturday\":[\"07:00AM\",\"05:00PM\"],\"sunday\":[\"07:00AM\",\"02:00PM\"]}}', 'O', '2020-07-04 16:47:42', NULL, NULL),
(2, 'Peet\'s Coffee', 'shopimages/3IlYmcWZHFWsizwA5GWK6fk4X1ZUjNrr6FlW7ySz.jpeg', '39370', 'Civic Center Dr H', 'Fremont', 'CA', '94538', '{\"time\":{\"monday\":[\"07:00AM\",\"05:00PM\"],\"tuesday\":[\"07:00AM\",\"05:00PM\"],\"wednesday\":[\"07:00AM\",\"05:00PM\"],\"thursday\":[\"07:00AM\",\"05:00PM\"],\"friday\":[\"07:00AM\",\"05:00PM\"],\"saturday\":[\"07:00AM\",\"05:00PM\"],\"sunday\":[\"07:00AM\",\"05:00PM\"]}}', 'O', '2020-07-04 16:47:42', NULL, NULL),
(5, 'SUJU\'s Coffee', 'shopimages/2GBOrW9IFXBbCysjsTnFFcJXo2OQ6CFpCp3iQXfU.jpeg', '39475 Gallaudet Drive', '', 'Fremont', 'CA', '94538', '{\"time\":{\"monday\":[\"05:00AM\",\"07:00PM\"],\"tuesday\":[\"12:00AM\",\"12:00AM\"],\"wednesday\":[\"12:00AM\",\"12:00AM\"],\"thursday\":[\"12:00AM\",\"12:00AM\"],\"friday\":[\"12:00AM\",\"12:00AM\"],\"saturday\":[\"12:00AM\",\"12:00AM\"],\"sunday\":[\"12:00AM\",\"12:00AM\"]}}', 'O', '2020-07-06 15:14:19', '2020-07-06 15:14:19', NULL),
(6, 'Coffee etc', 'shopimages/KC68mYbiTSNkXXciNgxXD6McRqBk60bKfDNVWAzf.jpeg', '94536 Main st', NULL, 'San Fransisco', 'CA', '94589', '{\"time\":{\"monday\":[\"12:00AM\",\"12:00AM\"],\"tuesday\":[\"08:00AM\",\"08:00PM\"],\"wednesday\":[\"12:00AM\",\"12:00AM\"],\"thursday\":[\"12:00AM\",\"12:00AM\"],\"friday\":[\"12:00AM\",\"12:00AM\"],\"saturday\":[\"12:00AM\",\"12:00AM\"],\"sunday\":[\"12:00AM\",\"12:00AM\"]}}', 'TC', '2020-07-07 06:31:35', '2020-07-07 06:31:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_food_category`
--

CREATE TABLE `shop_food_category` (
  `id` smallint(6) NOT NULL,
  `cat_name` varchar(30) NOT NULL,
  `cat_description` varchar(200) DEFAULT NULL,
  `cat_status` enum('Y','N','D') NOT NULL COMMENT 'Y- Active, N - Inactive, D- Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_food_category`
--

INSERT INTO `shop_food_category` (`id`, `cat_name`, `cat_description`, `cat_status`) VALUES
(1, 'Hot Coffee', '', 'Y'),
(2, 'Green Teas', '', 'Y'),
(3, 'Cold Coffee', '', 'Y'),
(4, 'Iced Tee', '', 'Y'),
(5, 'Bakery', '', 'Y'),
(6, 'Hot Breakfast', '', 'Y'),
(7, 'Snacks and Sweets', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `shop_menu`
--

CREATE TABLE `shop_menu` (
  `id` mediumint(9) NOT NULL,
  `cid` smallint(6) NOT NULL COMMENT 'reference to shop_food_category.id',
  `sid` smallint(6) NOT NULL COMMENT 'reference to shop.id',
  `item_ingredients` varchar(100) NOT NULL,
  `item_name` varchar(300) NOT NULL,
  `item_image` text NOT NULL,
  `item_price` float NOT NULL,
  `Item_desc` text NOT NULL,
  `item_status` enum('Y','N','D') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_menu`
--

INSERT INTO `shop_menu` (`id`, `cid`, `sid`, `item_ingredients`, `item_name`, `item_image`, `item_price`, `Item_desc`, `item_status`, `created_at`, `modified_at`) VALUES
(1, 1, 1, '1,2,3', 'Cafe Latte', 'itemimages/SvIyrRgmgQVxXOuuphUgM86k8QRNIWHJ7t4nrD3F.jpeg', 4.99, 'Refreshing Cafe Latte', 'Y', '2020-07-05 04:56:48', '2020-07-05 04:56:48'),
(2, 2, 1, '1,2', 'Chai Tea Latte', 'itemimages/qch61ishXOuficBy94KwJAFcbriLYIXA3nVbbLlL.jpeg', 3.99, 'Hot Chai Tea Latte', 'Y', '2020-07-05 05:04:17', '2020-07-05 05:04:17'),
(3, 2, 1, '1,2', 'Chai Tea Latte', 'itemimages/zgeVhDsjuktEqxAkNwlF0no4E1cEza27sN1m7fNm.jpeg', 2.99, 'Hot Chai Tea Latte', 'Y', '2020-07-05 05:06:26', '2020-07-05 05:06:26'),
(4, 3, 1, '1,8', 'Frappuccino', '', 2.99, 'Frappuccino is a trademarked brand of the Starbucks Corporation for a line of iced, blended coffee drinks.', 'Y', '2020-07-06 10:49:19', '2020-07-06 10:49:19'),
(5, 2, 1, '2,3', 'Green Tea Latte', 'itemimages/DNSktvEpzT0ngDAcZGjIw9VbdGOzKGmH7eq6CjVy.jpeg', 2.99, 'test', 'Y', '2020-07-06 11:26:26', '2020-07-06 11:26:26'),
(6, 5, 1, '4,7', 'Croissant', 'itemimages/hQhcPfsO1PFloVxi7LTTGU3RC9AjZKJDuzmpMaZv.jpeg', 1.99, 'A croissant is a buttery, flaky, viennoiserie pastry of Austrian origin, named for its historical crescent shape..', 'Y', '2020-07-06 13:29:20', '2020-07-06 13:29:20'),
(7, 7, 1, '5', 'Dark Chocolates', 'itemimages/QMeSAKHNjetwbBXENC5YCzNTbF4sTod6rHdJylQx.jpeg', 5.99, 'Energetic chocolate @ \\/ # 4#', 'Y', '2020-07-07 08:46:47', '2020-07-07 08:46:47'),
(8, 2, 1, '2,8', 'Chai Tea Latte', 'itemimages/JduwfLmHk738bPSl6CP5R5LjHvfEYd3d4XzXbomz.jpeg', 4.99, 'Refreshing Green Tea', 'Y', '2020-07-07 08:54:35', '2020-07-07 08:54:35'),
(9, 1, 6, '1,2,3', 'Cafe Latte', 'itemimages/mlb9UAM6FzyaGSDGipdLxnIXivt3tZ7hR4tDIbRj.jpeg', 3.49, 'Refreshing cafe latte', 'Y', '2020-07-07 08:56:41', '2020-07-07 08:56:41'),
(10, 7, 6, '1,7', 'Dark Chocolates', 'itemimages/YPs8NMX0WfgZTIPuNW2ISUD4MKLBm1itwc7QHkGI.jpeg', 5.99, 'Energetic Chocolate', 'Y', '2020-07-07 08:57:26', '2020-07-07 08:57:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_food_category`
--
ALTER TABLE `shop_food_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat_name` (`cat_name`);

--
-- Indexes for table `shop_menu`
--
ALTER TABLE `shop_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_food_category`
--
ALTER TABLE `shop_food_category`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_menu`
--
ALTER TABLE `shop_menu`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
