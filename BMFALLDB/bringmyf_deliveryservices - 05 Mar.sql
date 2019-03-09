-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2019 at 06:00 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bringmyf_deliveryservices`
--

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_phone_number` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_pincode` int(6) NOT NULL,
  `restaurant_alternate_phone_number` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restaurant_logo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_by` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `restaurant_name`, `restaurant_phone_number`, `restaurant_email`, `restaurant_address`, `restaurant_pincode`, `restaurant_alternate_phone_number`, `restaurant_logo`, `status`, `created_by`, `date_of_creation`) VALUES
(320325, 'sd', '1234567899', 'sdf@afa.co', 'asj', 123456, '1234567809', NULL, 'ACTIVE', 'RaunakSingh', '2016-12-21 19:42:34'),
(320326, 'Foodeterian', '8291506690', 'amit@foodeterian.com', 'BJB Nagar', 751014, '9990910041', '837rsz_imageedit_2_5633987728.png', 'ACTIVE', 'SarveshPathak', '2017-12-26 12:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_login_details`
--

CREATE TABLE `restaurant_login_details` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_login_details`
--

INSERT INTO `restaurant_login_details` (`restaurant_id`, `restaurant_username`, `restaurant_password`) VALUES
(320325, 'asddd', '344907e89b981caf221d05f597eb57a6af408f15f4dd7895bbd1b96a2938ec24a7dcf23acb94ece0b6d7b0640358bc56bdb448194b9305311aff038a834a079f'),
(320326, 'Foodeterian', 'fd9d94340dbd72c11b37ebb0d2a19b4d05e00fd78e4e2ce8923b9ea3a54e900df181cfb112a8a73228d1f3551680e2ad9701a4fcfb248fa7fa77b95180628bb2');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_orders`
--

CREATE TABLE `restaurant_orders` (
  `order_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `restaurant_order_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone_number` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `pickup_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_address` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `order_price` decimal(8,2) NOT NULL,
  `delivery_charge` decimal(8,2) NOT NULL,
  `order_status` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ORDER PLACED',
  `special_instructions` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_delivery_person` int(11) DEFAULT NULL,
  `estimated_delivery_time` int(11) DEFAULT NULL,
  `date_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_orders`
--

INSERT INTO `restaurant_orders` (`order_id`, `restaurant_id`, `restaurant_order_id`, `customer_name`, `customer_phone_number`, `pickup_address`, `delivery_address`, `order_price`, `delivery_charge`, `order_status`, `special_instructions`, `assigned_delivery_person`, `estimated_delivery_time`, `date_of_creation`) VALUES
(100000, 320325, NULL, 'Raunak', '7504832665', '', 'asdgf,asjkdmaskdk', '30.00', '0.00', 'ORDER ASSIGNED', NULL, 1, 30, '2016-12-22 18:12:34'),
(100001, 320325, NULL, 'Raunak', '7504873265', '', 'sdjdfhbsdh', '200.00', '20.00', 'ORDER DELIVERED', NULL, 3, -1, '2016-12-24 07:10:35'),
(100002, 320325, NULL, 'RSC', '8787878787', '', 'asdsadas', '120.00', '20.00', 'ORDER DELIVERED', NULL, 3, -1, '2016-12-24 12:01:41'),
(100003, 320325, NULL, 'RSC', '8787878787', '', 'asdsadasfsdfsdfgdfg', '150.00', '20.00', 'ORDER DELIVERED', NULL, 1, -1, '2016-12-24 13:12:57'),
(100004, 320325, NULL, 'asdasd', '1234445556', '', 'zdzasd', '1212.00', '12.00', 'ORDER PLACED', NULL, NULL, NULL, '2016-12-25 07:55:46'),
(100005, 320325, NULL, 'asdsa', '1234445666', '', 'szdad', '122.00', '2.00', 'ORDER PLACED', NULL, NULL, NULL, '2016-12-25 08:00:23'),
(100006, 320326, NULL, 'Sarvesh', '9439080490', '', 'Test Order Please Ignore.', '390.00', '0.00', 'ORDER DELIVERED', NULL, 3, -1, '2017-12-26 12:40:55'),
(100007, 320326, '324223', 'Sarvesh', '9439080490', 'Hotel Abhiruchi^Infocity^^Infocity^Bhubaneswar-751024', '506^Infocity Greens^Sai temple^Infocity^Bhubaneswar-751024', '369.00', '0.00', 'ORDER DELIVERED', 'Take tissue paper', 2, NULL, '2018-01-19 02:41:14'),
(100008, 320326, '02', 'Amit Kumar', '8291506690', '99 |North^Infocity Chowk^^KIIT^Bhubaneswar-751024', 'Kings Palace^KIIT Road^Odisha^KIIT^Bhubaneswar-751024', '250.00', '0.00', 'ORDER DELIVERED', 'Tomato Sauce Required', 7, NULL, '2018-01-23 13:09:33'),
(100009, 320326, '125635', 'Ramneet', '8093791617', 'Aangan^Lal Quila^^KIIT^Bhubaneswar-751024', '305^Adarsh Vihar^big bazar^KIIT^Bhubaneswar-751024', '250.00', '0.00', 'ORDER CANCELLED', 'bring thermocol', NULL, NULL, '2018-01-23 13:09:35'),
(100010, 320325, 'abcd', 'Sukumar Abhijeet', '7978915803', 'hulala^jingalala^huhahaha^Infocity^Bhubaneswar-751024', '32-217^free road^hdfc bank^Infocity^Bhubaneswar-751024', '0.00', '0.00', 'ORDER PLACED', '', NULL, NULL, '2018-01-31 15:41:36'),
(100011, 320325, '123', 'Sumkumar', '8434635752', '99 North^infocity^Juice Cneter^BJB Nagar^Bhubaneswar-751014', '101^* Vihar^Moon^BJB Nagar^Bhubaneswar-751014', '999999.99', '0.00', 'ORDER DELIVERED', '', 2, NULL, '2018-01-31 15:42:12'),
(100012, 320325, '123', 'Jyoti Panda', '9937880791', '99 North^Infocity^Juice Center^Saileshree Vihar^Bhubaneswar-751021', '101^Saileshree Vihar^Manisha Enclave^Saileshree Vihar^Bhubaneswar-751021', '999999.99', '0.00', 'ORDER CANCELLED', '', NULL, NULL, '2018-02-01 06:07:30'),
(100013, 320326, '125', 'pritish patnaik', '8249905553', 'O Kareems^Master Canteen^Opposite SBI Corner^BJB Nagar^Bhubaneswar-751014', 'C-5, BJB Nagar^BJB Nagar^Behind BJB Arts Block^BJB Nagar^Bhubaneswar-751014', '282.00', '0.00', 'ORDER DELIVERED', 'Order is ready', 7, NULL, '2018-02-04 07:24:31'),
(100014, 320326, '126', 'Chitaranjan Swain', '9437008588', 'O Kareem^Master canteen^Opposite Master canteen chowk^Badagada^Bhubaneswar-751018', 'Plot No-4460/6939,^Bragada Brit Colony^Jharanasai Near Santoshi Maa Temple^Badagada^Bhubaneswar-751018', '618.00', '0.00', 'ORDER DELIVERED', '', 7, NULL, '2018-02-04 07:50:38'),
(100015, 320326, '127', 'NILOPHER', '8984105589', 'Lal Qila^Patia Chwk^Ptia^KIIT^Bhubaneswar-751024', '1C- 322, Queens castle 4^KIIT University^Patia^KIIT^Bhubaneswar-751024', '0.00', '0.00', 'ORDER DELIVERED', '', 7, NULL, '2018-02-04 15:49:03'),
(100016, 320326, '001', 'Amit', '8249303366', 'Karim\'s^ChandrashekharPur^^Mancheshwar^Bhubaneswar-751017', 'E-15^Netaji Subhash Enclave^^Mancheshwar^Bhubaneswar-751017', '158.00', '0.00', 'ORDER DELIVERED', 'Cash Collection', 11, NULL, '2018-02-07 08:33:04'),
(100017, 320326, '002', 'Amit', '8327775131', 'Karim\'s^Damana^^Chandrashekharpur^Bhubaneswar-751024', 'Castle Paradise Appartment^Damana^^Chandrashekharpur^Bhubaneswar-751024', '189.00', '0.00', 'ORDER DELIVERED', 'Cash Collection', 11, NULL, '2018-02-07 09:21:24'),
(100018, 320326, '003', 'Amit', '9040412107', 'Karim\'s^Chandrashekharpur^Damana^KIIT^Bhubaneswar-751024', 'ICU- 5th Floor^KIMS^KIIT^KIIT^Bhubaneswar-751024', '251.00', '0.00', 'ORDER CANCELLED', 'Cash Collection', NULL, NULL, '2018-02-07 09:48:37'),
(100019, 320326, '007', 'AMIT', '7008856311', 'Karim,s^Chandrashekharpur^Damana^Patia^Bhubaneswar-751024', 'Flat No. 408, JN Tower^Patia^In front of KOEL Campus^Patia^Bhubaneswar-751024', '158.00', '0.00', 'ORDER DELIVERED', 'Please collect Cash', 11, NULL, '2018-02-08 07:27:54'),
(100020, 320326, '007', 'Amit', '8637280823', 'Karims^Chandrashekharpur^Damana^Chandrashekharpur^Bhubaneswar-751024', 'Flat No. S-1, Sudarshan Hills Appartment,^Railway Stadium, Chandrashekharpur^Behind OMFED Factory^Chandrashekharpur^Bhubaneswar-751024', '263.00', '0.00', 'ORDER CANCELLED', 'Please Collect Cash', 11, NULL, '2018-02-08 07:54:33'),
(100021, 320326, '008', 'Amit', '9555522281', 'Karims^Chandrashekharpur^Damana^Chandrashekharpur^Bhubaneswar-751024', 'Behind MAX Showroom^Damana^^Chandrashekharpur^Bhubaneswar-751024', '126.00', '0.00', 'ORDER CANCELLED', 'Please collect the cash, Customer will collect iself from MAX showroom backside', 11, NULL, '2018-02-08 08:20:35'),
(100022, 320326, '128', 'JYOSTNA DAS', '9938017643', 'O Kareems^Mastercanteen^Opposite Railway Station^BJB Nagar^Bhubaneswar-751014', 'C-5, BJB Nagar^Bhubaneswar^Behind BJB arts Block^BJB Nagar^Bhubaneswar-751014', '0.00', '0.00', 'ORDER DELIVERED', '', 7, NULL, '2018-02-11 07:39:56');

-- --------------------------------------------------------

--
-- Stand-in structure for view `restaurant_orders_view`
-- (See below for the actual view)
--
CREATE TABLE `restaurant_orders_view` (
`order_id` int(11)
,`restaurant_id` int(11)
,`restaurant_name` varchar(100)
,`restaurant_phone_number` varchar(13)
,`restaurant_order_id` varchar(20)
,`customer_name` varchar(60)
,`customer_phone_number` varchar(13)
,`pickup_address` varchar(300)
,`delivery_address` varchar(300)
,`order_price` decimal(8,2)
,`delivery_charge` decimal(8,2)
,`order_status` varchar(30)
,`special_instructions` varchar(100)
,`delivery_person_id` int(11)
,`delivery_person_name` varchar(60)
,`delivery_person_phone_number` varchar(13)
,`estimated_delivery_time` int(11)
,`date_of_creation` varchar(10)
,`order_date` timestamp
,`order_confirmed_time` timestamp
,`order_assigned_time` timestamp
,`order_picked_time` timestamp
,`order_delivered_time` timestamp
,`order_cancelled_time` timestamp
,`order_total_distance` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_order_stages`
--

CREATE TABLE `restaurant_order_stages` (
  `order_id` int(11) NOT NULL,
  `order_confirmed_time` timestamp NULL DEFAULT NULL,
  `order_assigned_time` timestamp NULL DEFAULT NULL,
  `order_picked_time` timestamp NULL DEFAULT NULL,
  `order_delivered_time` timestamp NULL DEFAULT NULL,
  `order_cancelled_time` timestamp NULL DEFAULT NULL,
  `order_total_distance` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_order_stages`
--

INSERT INTO `restaurant_order_stages` (`order_id`, `order_confirmed_time`, `order_assigned_time`, `order_picked_time`, `order_delivered_time`, `order_cancelled_time`, `order_total_distance`) VALUES
(100007, '2018-01-19 03:46:51', '2018-01-19 03:49:23', '2018-01-19 03:50:15', '2018-01-19 03:51:03', NULL, NULL),
(100008, '2018-01-23 13:11:16', '2018-01-23 13:11:47', '2018-01-23 13:12:06', '2018-01-23 13:12:31', NULL, NULL),
(100009, '2018-01-23 13:10:36', NULL, NULL, NULL, '2018-01-23 14:45:54', NULL),
(100010, NULL, NULL, NULL, NULL, NULL, NULL),
(100011, '2018-01-31 15:43:57', '2018-01-31 15:44:26', '2018-01-31 15:44:52', '2018-01-31 15:45:13', NULL, NULL),
(100012, NULL, NULL, NULL, NULL, '2018-02-01 14:11:07', NULL),
(100013, '2018-02-04 07:31:29', '2018-02-04 07:31:43', '2018-02-04 07:58:35', '2018-02-04 08:17:40', NULL, '4.90'),
(100014, '2018-02-04 07:50:58', '2018-02-04 07:51:10', '2018-02-04 07:58:51', '2018-02-04 08:41:01', NULL, '6.80'),
(100015, '2018-02-04 15:52:44', '2018-02-04 15:52:54', '2018-02-04 16:07:16', '2018-02-04 16:25:54', NULL, NULL),
(100016, '2018-02-07 08:43:34', '2018-02-07 08:43:51', '2018-02-07 09:23:05', '2018-02-07 10:26:39', NULL, NULL),
(100017, '2018-02-07 09:25:40', '2018-02-07 09:25:59', '2018-02-07 10:22:40', '2018-02-07 10:26:16', NULL, NULL),
(100018, NULL, NULL, NULL, NULL, '2018-02-07 10:22:08', NULL),
(100019, '2018-02-08 07:52:54', '2018-02-08 07:58:01', '2018-02-08 08:34:20', '2018-02-08 09:00:35', NULL, NULL),
(100020, '2018-02-08 08:00:35', '2018-02-08 08:00:46', NULL, NULL, '2018-02-08 09:00:49', NULL),
(100021, '2018-02-08 08:24:32', '2018-02-08 08:24:43', '2018-02-08 08:35:03', NULL, '2018-02-08 09:01:29', NULL),
(100022, '2018-02-11 07:45:18', '2018-02-11 07:55:06', '2018-02-11 09:16:27', '2018-02-11 09:30:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `restaurant_view`
-- (See below for the actual view)
--
CREATE TABLE `restaurant_view` (
`restaurant_id` int(11)
,`restaurant_name` varchar(100)
,`restaurant_phone_number` varchar(13)
,`restaurant_email` varchar(100)
,`restaurant_username` varchar(30)
,`restaurant_password` varchar(128)
,`restaurant_address` varchar(300)
,`restaurant_pincode` int(6)
,`restaurant_alternate_phone_number` varchar(13)
,`restaurant_logo` varchar(200)
,`status` varchar(10)
,`created_by` varchar(30)
,`date_of_creation` varchar(72)
);

-- --------------------------------------------------------

--
-- Structure for view `restaurant_orders_view`
--
DROP TABLE IF EXISTS `restaurant_orders_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restaurant_orders_view`  AS  select `o`.`order_id` AS `order_id`,`o`.`restaurant_id` AS `restaurant_id`,`r`.`restaurant_name` AS `restaurant_name`,`r`.`restaurant_phone_number` AS `restaurant_phone_number`,`o`.`restaurant_order_id` AS `restaurant_order_id`,`o`.`customer_name` AS `customer_name`,`o`.`customer_phone_number` AS `customer_phone_number`,`o`.`pickup_address` AS `pickup_address`,`o`.`delivery_address` AS `delivery_address`,`o`.`order_price` AS `order_price`,`o`.`delivery_charge` AS `delivery_charge`,`o`.`order_status` AS `order_status`,`o`.`special_instructions` AS `special_instructions`,`o`.`assigned_delivery_person` AS `delivery_person_id`,(select `e`.`employee_name` from `bringmyf_appdatabase`.`emv_employee` `e` where (`e`.`employee_id` = `o`.`assigned_delivery_person`)) AS `delivery_person_name`,(select `e`.`employee_phone` from `bringmyf_appdatabase`.`emv_employee` `e` where (`e`.`employee_id` = `o`.`assigned_delivery_person`)) AS `delivery_person_phone_number`,`o`.`estimated_delivery_time` AS `estimated_delivery_time`,date_format(`o`.`date_of_creation`,'%Y-%m-%d') AS `date_of_creation`,`o`.`date_of_creation` AS `order_date`,`os`.`order_confirmed_time` AS `order_confirmed_time`,`os`.`order_assigned_time` AS `order_assigned_time`,`os`.`order_picked_time` AS `order_picked_time`,`os`.`order_delivered_time` AS `order_delivered_time`,`os`.`order_cancelled_time` AS `order_cancelled_time`,`os`.`order_total_distance` AS `order_total_distance` from ((`restaurant_orders` `o` join `restaurant` `r` on((`o`.`restaurant_id` = `r`.`restaurant_id`))) left join `restaurant_order_stages` `os` on((`os`.`order_id` = `o`.`order_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `restaurant_view`
--
DROP TABLE IF EXISTS `restaurant_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restaurant_view`  AS  select `r`.`restaurant_id` AS `restaurant_id`,`r`.`restaurant_name` AS `restaurant_name`,`r`.`restaurant_phone_number` AS `restaurant_phone_number`,`r`.`restaurant_email` AS `restaurant_email`,`rr`.`restaurant_username` AS `restaurant_username`,`rr`.`restaurant_password` AS `restaurant_password`,`r`.`restaurant_address` AS `restaurant_address`,`r`.`restaurant_pincode` AS `restaurant_pincode`,`r`.`restaurant_alternate_phone_number` AS `restaurant_alternate_phone_number`,`r`.`restaurant_logo` AS `restaurant_logo`,`r`.`status` AS `status`,`r`.`created_by` AS `created_by`,date_format(`r`.`date_of_creation`,'%d-%M-%Y') AS `date_of_creation` from (`restaurant` `r` join `restaurant_login_details` `rr`) where (`r`.`restaurant_id` = `rr`.`restaurant_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD UNIQUE KEY `restaurant_email` (`restaurant_email`),
  ADD UNIQUE KEY `restaurant_phone_number` (`restaurant_phone_number`);

--
-- Indexes for table `restaurant_login_details`
--
ALTER TABLE `restaurant_login_details`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD UNIQUE KEY `restaurant_username` (`restaurant_username`);

--
-- Indexes for table `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `restaurant_order_stages`
--
ALTER TABLE `restaurant_order_stages`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320327;

--
-- AUTO_INCREMENT for table `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100023;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
