-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2015 at 04:35 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_surcas2010dev_eithar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id_admin` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `admin_level` int(11) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(65) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `name`, `admin_level`, `email`, `create_date`, `phone`, `password`) VALUES
(1, 'Ghak', 1, 'ghak@gmail.com', '2015-04-17 08:38:01', '93839229', '$2y$10$27Su31ETJrWheeuZX39eGuD3n.ogl4mXTwqFVftwIvs87H4Cme3w.'),
(2, 'amani', 2, 'amani_ahmed303@hotmail.com', '2015-04-19 05:52:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_level`
--

CREATE TABLE IF NOT EXISTS `admin_level` (
`id_admin_level` int(11) NOT NULL,
  `level_title` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_level`
--

INSERT INTO `admin_level` (`id_admin_level`, `level_title`) VALUES
(1, 'root'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
`id_item` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` mediumtext NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_creator` int(11) NOT NULL,
  `location_State` int(11) NOT NULL,
  `identefire` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `name`, `type`, `description`, `create_date`, `note`, `quantity`, `user_creator`, `location_State`, `identefire`) VALUES
(1, 'كنبة صالة', 5, 'تم شراء كنبة جديدة وهي في حالة جيدة فقد قمت بتنجيدها قبل شهر', '2015-04-17 09:44:58', 'يمكن استلامها'' في اي وقت في ايام الاسبوع', 3, 1, 1, 36045),
(2, 'تلفزيون', 6, 'تلفزيون بلازما ', '2015-04-17 09:46:04', 'يمكن إستلامها في أي يوم بعد الساعة 10 ليلا', 1, 1, 1, 4578),
(3, 'ثلاجة', 6, 'نوع : ثلاجةالسعة باللتر/بالقدم : 29.4 Cu.Ft.اللون : فضيفولت : 220V - 60Hzعرض رقمي : نعم', '2015-04-17 20:59:54', 'يمكن إستلامها في أي وقت خلال أيام الإسبوع ما عدا السبت والثلاثاء', 1, 1, 1, 1515);

-- --------------------------------------------------------

--
-- Table structure for table `item_archive`
--

CREATE TABLE IF NOT EXISTS `item_archive` (
`id_item_archive` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `location_lang` varchar(45) NOT NULL,
  `location_lat` varchar(45) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` mediumtext NOT NULL,
  `quantity` int(11) NOT NULL,
  `image_url` varchar(45) NOT NULL,
  `user_creator` int(11) NOT NULL,
  `taker_request` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_image`
--

CREATE TABLE IF NOT EXISTS `item_image` (
`id_item_image` int(11) NOT NULL,
  `image_name` mediumtext,
  `image_path` mediumtext,
  `item_identefire` int(11) DEFAULT NULL,
  `image_index` int(11) NOT NULL DEFAULT '0' COMMENT '0 if image present on details page 1 if its also in home page, every item must have one image with 1 value index'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_image`
--

INSERT INTO `item_image` (`id_item_image`, `image_name`, `image_path`, `item_identefire`, `image_index`) VALUES
(1, 'cheap-Sofa-Beds-toronto1.jpg', 'http://sofabedstoronto.com/wp-content/uploads/', 36045, 0),
(2, 'image.jpg', 'http://www.ctvnews.ca/polopoly_fs/1.1504528.1382239041!/httpImage/image.jpg_gen/derivatives/landscape_960/', 36045, 1),
(3, 'web-image-studio_128x128.png', 'http://www.coffeecup.com/images/icons/applications/', 4578, 1),
(4, 'ksa', 'ksa', 4578, 0),
(5, '9972404_L_1.jpg', 'http://cdn.extrastores.com/ImagesSections/product/294/', 1515, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_request`
--

CREATE TABLE IF NOT EXISTS `item_request` (
`id_item_request` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_request` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `request_statuse` int(2) DEFAULT '0' COMMENT '1 is accepted 0 is not',
  `add_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
`id_item_type` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_creator` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id_item_type`, `title`, `create_date`, `admin_creator`) VALUES
(1, 'الالآت الموسيقيه ', '2015-04-19 13:18:03', 2),
(2, 'الاجهزة و العاب الفيديو ', '2015-04-19 13:18:03', 2),
(3, 'أفلام و موسيقى', '2015-04-19 13:21:23', 2),
(4, 'أجهزة منزلية', '2015-04-19 13:21:23', 2),
(5, 'مستلزمات السياره', '2015-04-17 08:40:12', 1),
(6, 'مستلزمات رياضيه', '2015-04-17 08:40:12', 1),
(7, 'الحديقة', '2015-04-19 13:21:59', 2),
(8, 'الاثاث و المصنوعات ', '2015-04-19 13:21:59', 2),
(9, 'تذاكر و قسائم ', '2015-04-19 13:22:32', 2),
(10, 'حيوانات اليفه', '2015-04-19 13:22:32', 2),
(11, 'دراجات و قوارب', '2015-04-19 13:23:00', 2),
(12, 'كاميرات و ادوات تصوير', '2015-04-19 13:23:00', 2),
(13, 'كتب ', '2015-04-19 13:23:42', 2),
(14, 'كومبيوتر و إلكترونيات', '2015-04-19 13:23:42', 2),
(15, 'مجوهرات و ساعات', '2015-04-19 13:24:29', 2),
(16, 'ملابس و اكسسوارات', '2015-04-19 13:24:29', 2),
(17, 'أحذية ', '2015-04-19 13:25:01', 2),
(18, 'حقائب', '2015-04-19 13:25:01', 2),
(19, 'مستلزمات اطفال ', '2015-04-19 13:25:46', 2),
(20, 'مستلزمات شخصيه', '2015-04-19 13:25:46', 2),
(21, 'آخرى', '2015-04-19 13:26:07', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oman_regoins`
--

CREATE TABLE IF NOT EXISTS `oman_regoins` (
`id_oman_regoins` int(11) NOT NULL,
  `regoin_name` varchar(45) DEFAULT NULL,
  `location_lng` float(10,6) NOT NULL,
  `location_lat` float(10,6) NOT NULL,
  `admin_creator` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oman_regoins`
--

INSERT INTO `oman_regoins` (`id_oman_regoins`, `regoin_name`, `location_lng`, `location_lat`, `admin_creator`) VALUES
(1, 'الداخلية', 21.831560, 57.162899, 1),
(2, 'مسقط', 23.610001, 58.540001, 1),
(3, 'مسندم', 26.094809, 56.378922, 2),
(4, 'شمال الباطنه ', 24.181135, 56.813934, 2),
(5, 'جنوب الباطنة', 23.495426, 57.568871, 2),
(6, 'البريمي', 24.275789, 55.821663, 2),
(7, 'الظاهرة ', 22.646761, 56.161900, 2),
(8, 'شمال الشرقية ', 22.045441, 58.669991, 2),
(9, 'جنوب الشرقية ', 21.043587, 59.016571, 2),
(10, 'الوسطى', 21.472845, 57.386471, 2),
(11, 'ظفار', 18.323799, 54.178150, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oman_states`
--

CREATE TABLE IF NOT EXISTS `oman_states` (
`id_oman_states` int(11) NOT NULL,
  `state_name` varchar(65) NOT NULL,
  `region` int(11) NOT NULL,
  `admin_creator` int(11) NOT NULL,
  `location_lat` float(10,6) NOT NULL,
  `location_lng` float(10,6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oman_states`
--

INSERT INTO `oman_states` (`id_oman_states`, `state_name`, `region`, `admin_creator`, `location_lat`, `location_lng`) VALUES
(1, 'نزوى', 1, 1, 22.933359, 57.530602),
(2, 'سمائل', 1, 1, 23.297405, 57.988354),
(3, 'إزكي', 1, 1, 22.990870, 57.878120),
(4, 'منح', 1, 1, 22.759901, 57.593662),
(5, 'آدم', 1, 1, 22.744986, 57.611404),
(6, 'بهلا', 1, 1, 22.967121, 57.295387),
(7, 'الحمراء', 1, 1, 23.100836, 57.293747),
(8, 'بدبد', 1, 1, 23.407063, 58.123596),
(9, 'مسقط', 2, 1, 23.600651, 58.526665),
(10, 'بوشر', 2, 1, 23.563147, 58.419266),
(11, 'مطرح', 2, 1, 23.612101, 58.558029),
(12, 'قريات', 2, 1, 23.126591, 58.933624),
(13, 'العامرات ', 2, 1, 23.585415, 58.523392),
(14, 'السيب', 2, 1, 23.630640, 58.157845),
(15, 'خصب', 3, 1, 26.177013, 56.245296),
(16, 'بخاء', 3, 1, 26.140022, 56.151348),
(17, 'دباء', 3, 1, 25.711737, 56.349529),
(18, 'مدحاء', 3, 1, 25.288725, 56.335423),
(19, 'السويق', 4, 1, 23.831270, 87.438736),
(20, 'صحار', 4, 1, 24.339907, 56.712204),
(21, 'شناص', 4, 1, 24.733175, 56.461308),
(22, 'لوى', 4, 1, 24.507675, 56.594856),
(23, 'صحم', 4, 1, 24.163609, 56.870598),
(24, 'الخابورة', 4, 1, 23.961327, 57.982250),
(25, 'الرستاق', 5, 1, 23.440414, 57.431446),
(26, 'المصنعة', 5, 1, 23.752945, 57.629314),
(27, 'العوابي', 5, 1, 23.311508, 57.534946),
(28, 'نخل', 5, 1, 23.397303, 57.827148),
(29, 'وادي المعاول', 5, 1, 23.403807, 57.819843),
(30, 'بركاء', 5, 1, 23.690594, 57.887424),
(31, 'البريمي', 6, 1, 24.274790, 55.821667),
(32, 'السنينة', 6, 1, 24.297382, 55.888268),
(33, 'محضة', 6, 1, 24.403873, 55.969585),
(34, 'عبري', 7, 1, 23.216175, 56.475048),
(35, 'ضنك', 7, 1, 23.216175, 56.475048),
(36, 'ينقل', 7, 1, 23.592611, 56.555820),
(37, 'المضيبي', 8, 1, 22.573101, 58.121101),
(38, 'ابراء', 8, 1, 23.613878, 58.467438),
(39, 'القابل', 8, 1, 22.570446, 58.686653),
(40, 'بدية', 8, 1, 22.443623, 58.800793),
(41, 'وادي بني خالد', 8, 1, 22.587145, 59.098591),
(42, 'دماءو الطايين', 8, 1, 23.038309, 58.515717),
(43, 'صور', 9, 1, 22.560682, 59.516205),
(44, 'الكامل والوافي', 9, 1, 22.210917, 59.208839),
(45, 'جعلان بني بو علي', 9, 1, 22.009239, 59.341366),
(46, 'جعلان بني بو حسن', 9, 1, 22.078197, 59.278835),
(47, 'مصيرة', 9, 1, 20.429152, 58.792534),
(48, 'الدقم', 10, 1, 19.643534, 57.674110),
(49, 'هيماء', 10, 1, 19.960316, 56.283665),
(50, 'محوت', 10, 1, 0.000000, 0.000000),
(51, 'الجازر', 10, 1, 0.000000, 0.000000),
(52, 'صلالة', 11, 1, 17.056368, 54.112427),
(53, 'طاقة', 11, 1, 17.053614, 54.391281),
(54, 'مرباط', 11, 1, 16.990076, 54.700523),
(55, 'سدح', 11, 1, 17.052744, 55.068348),
(56, 'جزر الحلانيات', 11, 1, 17.511623, 56.067635),
(57, 'ضلكوت', 11, 1, 16.704832, 53.197304),
(58, 'رخيوت', 11, 1, 16.748188, 53.423702),
(59, 'ثمريت', 11, 1, 17.644159, 54.025131),
(60, 'المزيونة', 11, 1, 17.837654, 52.658939);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(65) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `user_type` int(11) NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `about` mediumtext
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `phone`, `address`, `user_type`, `create_date`, `about`) VALUES
(1, 'Nader', 'nader@gmail.com', '$2y$10$KKUTymAgQUM35VzHtP475uMSsotLr1A0KVCLmE/ZqdKyObGiwV.5i', '96182738', 'Oman - Izke', 1, '2015-04-17 08:44:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
`id_user_type` int(11) NOT NULL,
  `type_title` varchar(45) NOT NULL,
  `admin_creator` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `type_title`, `admin_creator`) VALUES
(1, 'person', 1),
(2, 'organization', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id_admin`,`admin_level`), ADD KEY `admin_level_key_idx` (`admin_level`);

--
-- Indexes for table `admin_level`
--
ALTER TABLE `admin_level`
 ADD PRIMARY KEY (`id_admin_level`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
 ADD PRIMARY KEY (`id_item`,`type`,`user_creator`,`location_State`), ADD UNIQUE KEY `identefire_UNIQUE` (`identefire`), ADD KEY `item_type_key_idx` (`type`), ADD KEY `item_creator_key_idx` (`user_creator`), ADD KEY `item_state_key_idx` (`location_State`);

--
-- Indexes for table `item_archive`
--
ALTER TABLE `item_archive`
 ADD PRIMARY KEY (`id_item_archive`,`type`,`user_creator`,`taker_request`), ADD KEY `item_type_idx` (`type`), ADD KEY `user_creator_archive_key_idx` (`user_creator`), ADD KEY `user_taker_key_idx` (`taker_request`);

--
-- Indexes for table `item_image`
--
ALTER TABLE `item_image`
 ADD PRIMARY KEY (`id_item_image`);

--
-- Indexes for table `item_request`
--
ALTER TABLE `item_request`
 ADD PRIMARY KEY (`id_item_request`,`user_request`,`item`), ADD KEY `item_creator_key_idx` (`user_request`), ADD KEY `item_request_key_idx` (`item`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
 ADD PRIMARY KEY (`id_item_type`,`admin_creator`), ADD KEY `admin_creator_key_idx` (`admin_creator`);

--
-- Indexes for table `oman_regoins`
--
ALTER TABLE `oman_regoins`
 ADD PRIMARY KEY (`id_oman_regoins`,`admin_creator`), ADD KEY `admin_creator_region_idx` (`admin_creator`);

--
-- Indexes for table `oman_states`
--
ALTER TABLE `oman_states`
 ADD PRIMARY KEY (`id_oman_states`,`admin_creator`,`region`), ADD KEY `admin_creator_idx` (`admin_creator`), ADD KEY `ragoin_of_state_key_idx` (`region`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`,`user_type`), ADD UNIQUE KEY `email_UNIQUE` (`email`), ADD KEY `user_type_key_idx` (`user_type`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
 ADD PRIMARY KEY (`id_user_type`,`admin_creator`), ADD KEY `admin_creator_of_type_key_idx` (`admin_creator`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin_level`
--
ALTER TABLE `admin_level`
MODIFY `id_admin_level` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `item_archive`
--
ALTER TABLE `item_archive`
MODIFY `id_item_archive` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_image`
--
ALTER TABLE `item_image`
MODIFY `id_item_image` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_request`
--
ALTER TABLE `item_request`
MODIFY `id_item_request` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
MODIFY `id_item_type` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `oman_regoins`
--
ALTER TABLE `oman_regoins`
MODIFY `id_oman_regoins` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oman_states`
--
ALTER TABLE `oman_states`
MODIFY `id_oman_states` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
ADD CONSTRAINT `admin_level_key` FOREIGN KEY (`admin_level`) REFERENCES `admin_level` (`id_admin_level`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
ADD CONSTRAINT `item_creator_key` FOREIGN KEY (`user_creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `item_state_key` FOREIGN KEY (`location_State`) REFERENCES `oman_states` (`id_oman_states`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `item_type_key` FOREIGN KEY (`type`) REFERENCES `item_type` (`id_item_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_archive`
--
ALTER TABLE `item_archive`
ADD CONSTRAINT `item_type` FOREIGN KEY (`type`) REFERENCES `item_type` (`id_item_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `user_creator_archive_key` FOREIGN KEY (`user_creator`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `user_taker_key` FOREIGN KEY (`taker_request`) REFERENCES `item_request` (`id_item_request`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_request`
--
ALTER TABLE `item_request`
ADD CONSTRAINT `item_request_key` FOREIGN KEY (`item`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `user_request_item_key` FOREIGN KEY (`user_request`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_type`
--
ALTER TABLE `item_type`
ADD CONSTRAINT `admin_creator_key` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oman_regoins`
--
ALTER TABLE `oman_regoins`
ADD CONSTRAINT `admin_creator_region` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `oman_states`
--
ALTER TABLE `oman_states`
ADD CONSTRAINT `admin_creator_state_key` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `ragoin_of_state_key` FOREIGN KEY (`region`) REFERENCES `oman_regoins` (`id_oman_regoins`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_type_key` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_type`
--
ALTER TABLE `user_type`
ADD CONSTRAINT `admin_creator_of_type_key` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
