-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 28, 2023 lúc 11:16 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `estore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(225) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `description`, `image`, `status`, `slug`) VALUES
(1, 'XIAOMI', 'thuong hieu xiaomi', '1692007197Xiaomi_Logo_2021.png', 1, 'xiaomi'),
(2, 'SAMSUNG', 'Thương hiệu samsung', '1692001368Logo_samsung.jpg', 1, 'samsung'),
(3, 'APPLE', 'thuong hieu apple', '1692007722apple-logo.jpg', 1, 'apple'),
(4, 'MSI', 'thuong hieu MSI', '1692703990msi.png', 1, 'MSI'),
(5, 'DELL', 'thuong hieu dell', '1692704105dell-logo.png', 1, 'dell'),
(6, 'ASUS', 'thuong hieu asus', '1692704131logo-asus.jpg', 1, 'asus'),
(7, 'HP', 'thuong hieu hp', '1692704153logo-hp.png', 1, 'hp'),
(11, 'OPPO', 'thuong hieu oppo', '1694089244OPPO_LOGO_2019.png', 1, 'oppo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(225) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `image`, `slug`) VALUES
(1, 'MACBOOK AIR', 'Laptop Apple MacBook Air', 1, '1692089797macbook-air-m1.jpg', 'macbook-air'),
(2, 'PHONE', 'PHONE', 1, '1692694073iPhone-14-Pro-Max.jpg', 'phone'),
(3, 'LAPTOP', 'laptop', 1, '1692694326Laptop-HP.jpg', 'laptop'),
(4, 'PC', 'pc', 1, '1692694274PC.jpg', 'pc'),
(5, 'HEADPHONES', 'headphone', 1, '1692704624tainghe.png', 'headphones'),
(6, 'SMARTWACTH', 'smartwacth', 1, '1692704785Smartwacth.jpg', 'smartwacth');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `token` varchar(10) NOT NULL,
  `date_created` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `token`, `date_created`) VALUES
(3, 'Thang', 'demoemail8088@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0123457689', 'Bac Giang', '8028', '2023-09-15 15:21:40'),
(4, 'nam', 'nam123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0966677788', 'Nam Dinh', '190', '2023-09-15 15:24:17'),
(5, 'hoang', 'hoangvp@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0398676484', 'VInh PHuc', '7577', '2023-09-15 15:25:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `status`, `ship_id`) VALUES
(3, '2667', 1, 6),
(4, '9881', 1, 7),
(5, '881', 3, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_code` varchar(10) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_code`, `product_id`, `quantity`) VALUES
(1, '5094', 5, 1),
(2, '9881', 5, 2),
(3, '881', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `status`, `category_id`, `brand_id`, `slug`, `quantity`, `price`) VALUES
(1, 'IPHONE14 PROMAX', 'Apple iPhone 14 Pro Max 512GB', '1694087191iPhone-14-Pro-Max.jpg', 1, 2, 3, 'iphone14-promax', 10, '24000000'),
(2, 'XIAOMI 13 5g', 'Xiaomi 13 5G', '1694088965xiaomi-13-thumb.jpg', 1, 2, 1, 'xiaomi-13-5g', 6, '18000000'),
(3, 'SAMSUNG GALAXY S23 ULTRA', 'samsung galasy s23 ultra 5G 512GB', '1694089122samsung-galaxy-s23-ultra-5g-1.jpg', 1, 2, 2, 'samsung-galaxy-s23-ultra', 10, '23000000'),
(4, 'OPPO Reno10 Pro+ 5G', 'Điện thoại OPPO Reno10 Pro+ 5G', '1694089353oppo-reno10-pro-plus.jpg', 1, 2, 11, 'oppo-reno10-pro-5g', 15, '19990000'),
(5, 'Tai nghe  Xiaomi  Buds 4 Lite', 'Tai nghe Bluetooth TWS Xiaomi Redmi Buds 4 Lite', '1694090067tai-nghe-bluetooth-tws-xiaomi-redmi-.jpg', 1, 5, 1, 'tai-nghe-xiaomi-buds-4-lite', 5, '690000'),
(6, 'Mi Basic Xiaomi HSEJ03JY', 'Tai nghe nhét tai Mi Basic Xiaomi HSEJ03JY chính hãng | Giá tốt', '1694090156tai-nghe-in-ear-xiaomi-1.jpg', 1, 5, 1, 'mi-basic-xiaomi-hsej03jy', 15, '120000'),
(7, 'Apple AirPods 2', 'Tai nghe Apple AirPods 2', '1694090260airport2.jpg', 1, 5, 3, 'apple-airpods-2', 10, '2700000'),
(8, 'AIRPODS 3', 'AirPods (thế hệ thứ 3) với Hộp Sạc MagSafe', '1694090353airport3.jpg', 1, 5, 3, 'airpods-3', 15, '4700000'),
(9, 'Dell Vostro 5410', 'Dell Vostro 5410, Core i5-11300H, RAM 8GB, SSD 512GB', '1694090447img_laptop-dell.jpg', 1, 3, 5, 'dell-vostro-5410', 6, '23000000'),
(10, 'Dell Gaming G15 5515', 'Trên tay Dell Gaming G15 5515: Thiết kế đậm chất gaming, màn hình 120 Hz mượt mà cùng cấu hình mạnh với AMD Ryzen 7', '1694090581dell-gaming-g15.jpg', 1, 3, 5, 'dell-gaming-g15-5515', 5, '30000000'),
(11, 'MACBOOK AIR M1', 'Laptop Apple MacBook Air M1 2020', '1694090659macbook-air-m1-2020.jpg', 1, 1, 3, 'macbook-air-m1', 8, '18000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `phone`, `address`, `email`, `method`) VALUES
(1, 'Giáp Văn Thắng', '0398250662', '235 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', 'giapthang88@gmail.com', 'cod'),
(2, 'vanthang', '0923456364', 'lang giang bac giang', 'giapthang@gmail.com', 'cod'),
(3, 'nam', '0973287748', 'lang giang bac giang', 'nam@gmail.com', 'cod'),
(4, 'hoang', '0385999333', '234 hoang quoc viet, ha noi', 'hoang@gmail.com', 'cod'),
(5, 'mai', '0398287439', '234 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', 'ngocmai@gmail.com', 'cod'),
(6, 'mai', '0398287439', '234 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', 'ngocmai@gmail.com', 'cod'),
(7, 'Giáp Văn Thắng', '0398250662', 'Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội', 'giapthang88@gmail.com', 'cod'),
(8, 'nam', '1234567', 'hanoi', 'nam@gmail.com', 'cod'),
(9, 'hai', '0981734987', 'haiphong', 'hai@gmail.com', 'cod');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
