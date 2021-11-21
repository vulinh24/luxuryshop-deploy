-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 08:42 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luxuryshop1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `description`, `name`, `url`, `url_img`) VALUES
(3, 2, '2021-11-13 16:10:39.000000', NULL, NULL, 'Thiết kế sang trọng sẽ mang đến cho bạn trải nghiệm tốt nhất!', 'Sản phẩm hoàn hiện tới từng chi tiết', '#', 'main_banner.jpg'),
(7, 2, '2021-11-16 09:59:06.000000', NULL, NULL, 'Thiết kế đột phá trong trải nghiệm người dùng!', 'Bộ sưu tập mới Elegance', '#', 'banner1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blogs`
--

CREATE TABLE `tbl_blogs` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_blogs`
--

INSERT INTO `tbl_blogs` (`id`, `description`, `image`, `title`) VALUES
(1, 'Phong cách thiết kế hiện đại là sự đoạn tuyệt với phong cách thiết kế cổ điển. Ở phong cách này cách thiết kế và bố trí nội thất được lược bỏ những chi tiết rườm rà và phi đối xứng.', 'pk-hien-dai.jpg', 'Phong cách thiết kế nội thất hiện đại'),
(2, 'Đây là một trong các phong cách thiết kế nội thất được ưa chuộng nhất hiện nay. Điểm nổi bật của phong cách này chính là sự đơn giản, tinh tế và không kém phần sang trọng, hiện đại. Ở phong cách này, chúng ta có thể thấy những chi tiết phụ được tiết chế.', 'pk-toi-gian-1.jpg', 'Phong cách thiết kế nội thất tối giản (Minimalist)'),
(3, 'Qua bao nhiêu năm, dù dòng chảy thời gian có làm thay đổi tất cả mọi thứ nhưng sức hút của phong cách thiết kế nội thất cổ điển vẫn chưa hề có dấu hiệu giảm nhiệt. Cổ điển là phong cách trái ngược hoàn toàn với phong cách hiện đại.', 'pk-co-dien.jpg', 'Phong cách thiết kế cổ điển'),
(4, 'Nói tới những phong cách thiết kế nội thất thịnh hành nhất trên thế giới thì không thể bỏ qua phong cách Retro. Vào những năm 50 – 70 của TK trước, phong cách thiết kế nội thất Retro đã “làm mưa làm gió” trong ngành thiết kế. Tới thời điểm hiện tại, sức hút của phong cách này vẫn vẹn nguyên như ngày nào khi chúng xuất hiện ở rất nhiều gia đình, khu giải trí, khách sạn, quán café,…', 'pk-phong-cach-retro.jpg', 'Phong cách thiết kế nội thất Retro'),
(5, 'Cái tên tiếp theo trong danh sách các phong cách thiết kế nội thất HOT nhất hiện nay chính là Scandinavian. Phong cách này thể hiện sự sang trọng, tinh tế.', 'pk-bac-au.jpg', 'Phong cách thiết kế Scandinavian (Bắc Âu)'),
(6, 'Phong cách Hitech chủ yếu sử dụng các thiết bị, đồ dùng, vật liệu hiện đại, các ứng dụng công nghệ tiên tiến trong không gian kiến trúc, nội thất. Không chỉ mang đến vẻ đẹp hiện đại, tiện nghi, phong cách Hitech còn góp phần nâng cao chất lượng sống của con người.', 'pk-hitech.jpg', 'Ấn tượng cùng phong cách thiết kế Hi-Tech'),
(7, 'Phong cách thiết kế nội thất đương đại tập trung vào không gian sử dụng. Rất dễ nhận thấy rằng các thành phần kiến trúc của phong cách này rất đơn giản, chủ yếu là các mảng tường, khối thay vì chi tiết cầu kỳ, rườm rà. Vật liệu được sử dụng phổ biến trong phong cách nội thất đương đại là gỗ, ốp da hoặc vải.', 'pk-duong-dai-1.jpg', 'Phong cách thiết kế nội thất đương đại'),
(8, 'Trong thiết kế nội thất, phong cách Vintage chính là sự pha trộn của những thiết bị hiện đại như máy tính, đồ gia dụng, đèn trang trí,… kết hợp cùng với những món đồ đã cũ kỹ như bàn ghế tróc sơn, những khung ảnh, chùm đèn cổ.', 'pk-phong-cach-vintage.jpg', 'Phong cách thiết kế nội thất Vintage'),
(9, 'Trong phong cách thiết kế nội thất luxury, tất cả các đồ nội thất đều được chọn lựa từ những thứ cao cấp nhất. Không phô trương, hào nhoáng quá mức ở bề ngoài, mà vẻ đẹp của phong cách luxury còn được thể hiện ở những giá trị cốt lõi bên trong.', 'phong-khach-luxury.jpg', 'Sang trọng với phong cách thiết kế nội thất Luxury');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorys`
--

CREATE TABLE `tbl_categorys` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `seo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_categorys`
--

INSERT INTO `tbl_categorys` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `description`, `name`, `seo`) VALUES
(1, NULL, NULL, 2, '2021-11-15 16:41:23.000000', 'các loại bàn ghế sofa', 'Sofa', 'sofa-1636969283335'),
(2, NULL, NULL, 2, '2021-11-13 08:54:01.000000', 'bàn học, bàn làm việc, bàn ăn', 'Bàn', 'ban-1636768441482'),
(3, NULL, NULL, 2, '2021-11-13 08:54:05.000000', 'ghế ăn, ghế thư giãn', 'Ghế', 'ghe-1636768445250'),
(4, NULL, NULL, 2, '2021-11-13 08:54:09.000000', 'tủ quần áo, tủ đồ dùng,..', 'Tủ Kệ', 'tu-ke-1636768449190'),
(5, NULL, NULL, 2, '2021-11-13 08:54:13.000000', 'các loại giường', 'Giường Ngủ', 'giuong-ngu-1636768453221'),
(6, NULL, NULL, 2, '2021-11-13 08:54:17.000000', 'tượng trang trí', 'Tượng Trang Trí', 'tuong-trang-tri-1636768457107'),
(7, NULL, NULL, 2, '2021-11-13 08:54:20.000000', 'tranh treo tường', 'Tranh Ảnh', 'tranh-anh-1636768460458'),
(8, NULL, NULL, 2, '2021-11-13 08:54:23.000000', 'đèn học, đèn phòng khách,..', 'Đèn Trang Trí', 'en-trang-tri-1636768463735'),
(9, NULL, NULL, 2, '2021-11-13 08:54:26.000000', 'các loại lọ trang trí', 'Lọ Trang Trí', 'lo-trang-tri-1636768466914'),
(10, NULL, NULL, 2, '2021-11-13 08:54:30.000000', 'thảm chân, thảm giường,..', 'Thảm', 'tham-1636768470238');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collections`
--

CREATE TABLE `tbl_collections` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `seo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_collections`
--

INSERT INTO `tbl_collections` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `description`, `name`, `seo`) VALUES
(1, NULL, '2021-11-01 13:56:39.000000', NULL, NULL, 'bộ sưu tập phòng khách', 'Bộ Sưu Tập Phòng Khách', 'bo_suu_tap_phong_khach'),
(2, NULL, '2021-11-01 13:56:39.000000', NULL, NULL, 'bộ sưu tập phòng ăn', 'Bộ Sưu Tập Phòng Ăn', 'bo_suu_tap_phong_an'),
(3, NULL, '2021-11-01 13:56:39.000000', NULL, NULL, 'bộ sưu tập phòng ngủ', 'Bộ Sưu Tập Phòng Ngủ', 'bo_suu_tap_phong_ngu'),
(4, NULL, '2021-11-01 13:56:39.000000', NULL, NULL, 'bộ sưu tập trang trí và gia dụng', 'Trang Trí Và Gia Dụng', 'trang_tri_va_gia_dung');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_discount`
--

CREATE TABLE `tbl_discount` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `discount` float NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_discount`
--

INSERT INTO `tbl_discount` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `discount`, `name`) VALUES
(1, NULL, NULL, NULL, NULL, 0.1, 'HAPPYLIFE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorite_products`
--

CREATE TABLE `tbl_favorite_products` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mail_register`
--

CREATE TABLE `tbl_mail_register` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `detail_description` longtext DEFAULT NULL,
  `ishot` bit(1) DEFAULT NULL,
  `isnew` bit(1) DEFAULT NULL,
  `issale` bit(1) DEFAULT NULL,
  `price` float NOT NULL,
  `price_old` float NOT NULL,
  `rate` int(11) DEFAULT 5,
  `seo` varchar(100) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `detail_description`, `ishot`, `isnew`, `issale`, `price`, `price_old`, `rate`, `seo`, `short_description`, `title`, `category_id`, `collection_id`) VALUES
(1, NULL, NULL, NULL, '2021-11-17 10:24:03.000000', '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">THIẾT KẾ SANG TRỌNG</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Italia Impressive có 2 loại kích thước là sofa 3 chỗ và sofa góc. Toàn bộ bề mặt là da thật top-grain cao cấp. Lưng và tay sofa được may ghép da hình quả trám độc đáo. Khung gỗ chắc chắn, nệm ngồi bọc mút tạo cảm giác êm ái với&nbsp;độ đàn hồi vừa phải. Kiểu dáng phù hợp với phòng khách sang trọng.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">NHẬP KHẨU TRỰC TIẾP TỪ Ý</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">IPD là nhà cung cấp trực tiếp Sofa da Ý của Nhà Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với ý tưởng mang đến thị trường nước ngoài các sản phẩm da phổ biến và có nhiều yêu cầu cao trong sản xuất tại Ý. IDP đạt chứng nhận 100% Original Italian Quality với nguyên vật&nbsp;liệu cao cấp&nbsp;của Ý, thiết kế của Ý, sản xuất tại Ý; điều mà không phải thương hiệu nào cũng đạt được vì phần lớn sofa Ý sản xuất tại xưởng của các nước đang phát triển.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">DỊCH VỤ CHU ĐÁO</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Đã từ lâu, dịch vụ tại Nội Thất Nhà Đẹp vẫn luôn được các khách hàng khen ngợi và đánh giá rất cao. Nhà Đẹp luôn phục vụ khách chu đáo, nhiệt tình từ lúc trước, trong và sau khi mua hàng. Dù bạn mua hoặc không mua sản phẩm thì tất cả các nhân viên của Nhà Đẹp vẫn luôn phục vụ nhiệt tình và tận tâm nhất.</p>', b'1', b'0', b'0', 59870000, 65425000, 5, 'sofa-da-cascadia-1637119443359', '', 'Sofa da Cascadia', 1, 1),
(2, NULL, NULL, NULL, '2021-11-17 10:24:12.000000', '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">THIẾT KẾ SANG TRỌNG</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Italia Impressive có 2 loại kích thước là sofa 3 chỗ và sofa góc. Toàn bộ bề mặt là da thật top-grain cao cấp. Lưng và tay sofa được may ghép da hình quả trám độc đáo. Khung gỗ chắc chắn, nệm ngồi bọc mút tạo cảm giác êm ái với&nbsp;độ đàn hồi vừa phải. Kiểu dáng phù hợp với phòng khách sang trọng.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">NHẬP KHẨU TRỰC TIẾP TỪ Ý</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">IPD là nhà cung cấp trực tiếp Sofa da Ý của Nhà Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với ý tưởng mang đến thị trường nước ngoài các sản phẩm da phổ biến và có nhiều yêu cầu cao trong sản xuất tại Ý. IDP đạt chứng nhận 100% Original Italian Quality với nguyên vật&nbsp;liệu cao cấp&nbsp;của Ý, thiết kế của Ý, sản xuất tại Ý; điều mà không phải thương hiệu nào cũng đạt được vì phần lớn sofa Ý sản xuất tại xưởng của các nước đang phát triển.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">DỊCH VỤ CHU ĐÁO</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Đã từ lâu, dịch vụ tại Nội Thất Nhà Đẹp vẫn luôn được các khách hàng khen ngợi và đánh giá rất cao. Nhà Đẹp luôn phục vụ khách chu đáo, nhiệt tình từ lúc trước, trong và sau khi mua hàng. Dù bạn mua hoặc không mua sản phẩm thì tất cả các nhân viên của Nhà Đẹp vẫn luôn phục vụ nhiệt tình và tận tâm nhất.</p>', b'1', b'0', b'0', 74390000, 79945000, 5, 'sofa-da-elise-1637119452491', '', 'Sofa da Elise', 1, 1),
(3, NULL, NULL, NULL, '2021-11-17 10:24:20.000000', '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">THIẾT KẾ SANG TRỌNG</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Italia Impressive có 2 loại kích thước là sofa 3 chỗ và sofa góc. Toàn bộ bề mặt là da thật top-grain cao cấp. Lưng và tay sofa được may ghép da hình quả trám độc đáo. Khung gỗ chắc chắn, nệm ngồi bọc mút tạo cảm giác êm ái với&nbsp;độ đàn hồi vừa phải. Kiểu dáng phù hợp với phòng khách sang trọng.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">NHẬP KHẨU TRỰC TIẾP TỪ Ý</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">IPD là nhà cung cấp trực tiếp Sofa da Ý của Nhà Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với ý tưởng mang đến thị trường nước ngoài các sản phẩm da phổ biến và có nhiều yêu cầu cao trong sản xuất tại Ý. IDP đạt chứng nhận 100% Original Italian Quality với nguyên vật&nbsp;liệu cao cấp&nbsp;của Ý, thiết kế của Ý, sản xuất tại Ý; điều mà không phải thương hiệu nào cũng đạt được vì phần lớn sofa Ý sản xuất tại xưởng của các nước đang phát triển.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">DỊCH VỤ CHU ĐÁO</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Đã từ lâu, dịch vụ tại Nội Thất Nhà Đẹp vẫn luôn được các khách hàng khen ngợi và đánh giá rất cao. Nhà Đẹp luôn phục vụ khách chu đáo, nhiệt tình từ lúc trước, trong và sau khi mua hàng. Dù bạn mua hoặc không mua sản phẩm thì tất cả các nhân viên của Nhà Đẹp vẫn luôn phục vụ nhiệt tình và tận tâm nhất.</p>', b'1', b'0', b'0', 76920000, 82475000, 5, 'sofa-da-waldo-1637119460333', '', 'Sofa da Waldo', 1, 1),
(4, NULL, NULL, NULL, '2021-11-17 10:24:27.000000', '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">THIẾT KẾ SANG TRỌNG</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Italia Impressive có 2 loại kích thước là sofa 3 chỗ và sofa góc. Toàn bộ bề mặt là da thật top-grain cao cấp. Lưng và tay sofa được may ghép da hình quả trám độc đáo. Khung gỗ chắc chắn, nệm ngồi bọc mút tạo cảm giác êm ái với&nbsp;độ đàn hồi vừa phải. Kiểu dáng phù hợp với phòng khách sang trọng.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">NHẬP KHẨU TRỰC TIẾP TỪ Ý</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">IPD là nhà cung cấp trực tiếp Sofa da Ý của Nhà Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với ý tưởng mang đến thị trường nước ngoài các sản phẩm da phổ biến và có nhiều yêu cầu cao trong sản xuất tại Ý. IDP đạt chứng nhận 100% Original Italian Quality với nguyên vật&nbsp;liệu cao cấp&nbsp;của Ý, thiết kế của Ý, sản xuất tại Ý; điều mà không phải thương hiệu nào cũng đạt được vì phần lớn sofa Ý sản xuất tại xưởng của các nước đang phát triển.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">DỊCH VỤ CHU ĐÁO</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Đã từ lâu, dịch vụ tại Nội Thất Nhà Đẹp vẫn luôn được các khách hàng khen ngợi và đánh giá rất cao. Nhà Đẹp luôn phục vụ khách chu đáo, nhiệt tình từ lúc trước, trong và sau khi mua hàng. Dù bạn mua hoặc không mua sản phẩm thì tất cả các nhân viên của Nhà Đẹp vẫn luôn phục vụ nhiệt tình và tận tâm nhất.</p>', b'1', b'0', b'0', 69930000, 75485000, 5, 'sofa-da-italia-impressive-1637119467265', '', 'Sofa da Italia Impressive', 1, 1),
(5, NULL, NULL, NULL, '2021-11-13 09:30:18.000000', 'Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.', b'0', b'0', b'1', 101200000, 106755000, 5, 'sofa-da-italia-impressive-2-1636770618908', '', 'Sofa da Italia Impressive 2', 1, 1),
(6, NULL, NULL, NULL, '2021-11-17 10:24:35.000000', '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">THIẾT KẾ SANG TRỌNG</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Sofa da Italia Impressive có 2 loại kích thước là sofa 3 chỗ và sofa góc. Toàn bộ bề mặt là da thật top-grain cao cấp. Lưng và tay sofa được may ghép da hình quả trám độc đáo. Khung gỗ chắc chắn, nệm ngồi bọc mút tạo cảm giác êm ái với&nbsp;độ đàn hồi vừa phải. Kiểu dáng phù hợp với phòng khách sang trọng.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">NHẬP KHẨU TRỰC TIẾP TỪ Ý</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">IPD là nhà cung cấp trực tiếp Sofa da Ý của Nhà Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với ý tưởng mang đến thị trường nước ngoài các sản phẩm da phổ biến và có nhiều yêu cầu cao trong sản xuất tại Ý. IDP đạt chứng nhận 100% Original Italian Quality với nguyên vật&nbsp;liệu cao cấp&nbsp;của Ý, thiết kế của Ý, sản xuất tại Ý; điều mà không phải thương hiệu nào cũng đạt được vì phần lớn sofa Ý sản xuất tại xưởng của các nước đang phát triển.</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\"><span style=\"font-weight: 700;\">DỊCH VỤ CHU ĐÁO</span></p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px; text-align: justify;\">Đã từ lâu, dịch vụ tại Nội Thất Nhà Đẹp vẫn luôn được các khách hàng khen ngợi và đánh giá rất cao. Nhà Đẹp luôn phục vụ khách chu đáo, nhiệt tình từ lúc trước, trong và sau khi mua hàng. Dù bạn mua hoặc không mua sản phẩm thì tất cả các nhân viên của Nhà Đẹp vẫn luôn phục vụ nhiệt tình và tận tâm nhất.</p>', b'0', b'1', b'0', 112330000, 117885000, 5, 'sofa-da-italia-charlize-1637119475562', '', 'Sofa da Italia Charlize', 1, 1),
(7, NULL, NULL, NULL, '2021-11-13 09:30:26.000000', 'Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.', b'0', b'1', b'0', 147220000, 152775000, 5, 'sofa-da-italia-elestial-1636770626558', '', 'Sofa da Italia Elestial', 1, 1),
(8, NULL, NULL, NULL, '2021-11-13 09:30:30.000000', 'Sofa da Ý là một trong những dòng sản phẩm luôn được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng không kém phần thoải mái, dễ chịu và tiện nghi mà chúng mang lại. Sofa da Ý luôn mang lại nét lịch lãm cùng phong cách khác biệt cho chủ nhân.', b'1', b'0', b'0', 166600000, 172155000, 5, 'sofa-da-italia-zoe-3-cho-1636770630133', '', 'Sofa da Italia Zoe 3 chỗ', 1, 1),
(9, NULL, NULL, NULL, '2021-11-13 09:30:33.000000', 'Dòng sản phẩm Sofa bọc vải của Nội Thất Nhà Đẹp được đặt sản xuất theo yêu cầu, tiêu chuẩn riêng của Nhà Đẹp, nhằm có được những sản phẩm chất lượng cao, đáp ứng được nhu cầu và thị hiếu của khách hàng. Khi khách hàng đến với Nội thất Nhà Đẹp, khách hàng hoàn toàn có thể yên tâm để lựa chọn những bộ Sofa vải của Nhà Đẹp vì những lý do sau: Khung của Sofa được làm bằng gỗ thịt chắc chắn, tuổi của gỗ là trên 10 năm. Hoàn toàn không sử dụng gỗ tạp, gỗ non như những sản phẩm gia công, hàng chợ, hàng sản xuất nhỏ lẻ đơn chiếc tại các công ty hoặc xưởng gỗ nhỏ. Phần vải bọc Sofa được thiết kế để khách hàng có thể dễ dàng tháo ra để giặt vệ sinh. Hiện nay trên thị trường không có nhiều công ty làm được theo yêu cầu như vậy. Trong quá trình sử dụng, nếu khách quá bận rộn và không có thời gian để vệ sinh bộ Sofa của mình, Quý khách hoàn toàn có thể liên hệ với Nhà Đẹp để được hỗ trợ với mức phí rất thấp.', b'1', b'0', b'0', 20770000, 26325000, 5, 'sofa-vai-libby-4-cho-1636770633713', '', 'Sofa vải Libby 4 chỗ', 1, 1),
(10, NULL, NULL, NULL, '2021-11-13 09:30:37.000000', 'Dòng sản phẩm Sofa bọc vải của Nội Thất Nhà Đẹp được đặt sản xuất theo yêu cầu, tiêu chuẩn riêng của Nhà Đẹp, nhằm có được những sản phẩm chất lượng cao, đáp ứng được nhu cầu và thị hiếu của khách hàng. Khi khách hàng đến với Nội thất Nhà Đẹp, khách hàng hoàn toàn có thể yên tâm để lựa chọn những bộ Sofa vải của Nhà Đẹp vì những lý do sau: Khung của Sofa được làm bằng gỗ thịt chắc chắn, tuổi của gỗ là trên 10 năm. Hoàn toàn không sử dụng gỗ tạp, gỗ non như những sản phẩm gia công, hàng chợ, hàng sản xuất nhỏ lẻ đơn chiếc tại các công ty hoặc xưởng gỗ nhỏ. Phần vải bọc Sofa được thiết kế để khách hàng có thể dễ dàng tháo ra để giặt vệ sinh. Hiện nay trên thị trường không có nhiều công ty làm được theo yêu cầu như vậy. Trong quá trình sử dụng, nếu khách quá bận rộn và không có thời gian để vệ sinh bộ Sofa của mình, Quý khách hoàn toàn có thể liên hệ với Nhà Đẹp để được hỗ trợ với mức phí rất thấp.', b'1', b'0', b'0', 13800000, 19355000, 5, 'sofa-vai-libby-1636770637956', '', 'Sofa vải Libby', 1, 1),
(11, NULL, NULL, NULL, '2021-11-13 09:30:43.000000', 'Dòng sản phẩm Sofa bọc vải của Nội Thất Nhà Đẹp được đặt sản xuất theo yêu cầu, tiêu chuẩn riêng của Nhà Đẹp, nhằm có được những sản phẩm chất lượng cao, đáp ứng được nhu cầu và thị hiếu của khách hàng. Khi khách hàng đến với Nội thất Nhà Đẹp, khách hàng hoàn toàn có thể yên tâm để lựa chọn những bộ Sofa vải của Nhà Đẹp vì những lý do sau: Khung của Sofa được làm bằng gỗ thịt chắc chắn, tuổi của gỗ là trên 10 năm. Hoàn toàn không sử dụng gỗ tạp, gỗ non như những sản phẩm gia công, hàng chợ, hàng sản xuất nhỏ lẻ đơn chiếc tại các công ty hoặc xưởng gỗ nhỏ. Phần vải bọc Sofa được thiết kế để khách hàng có thể dễ dàng tháo ra để giặt vệ sinh. Hiện nay trên thị trường không có nhiều công ty làm được theo yêu cầu như vậy. Trong quá trình sử dụng, nếu khách quá bận rộn và không có thời gian để vệ sinh bộ Sofa của mình, Quý khách hoàn toàn có thể liên hệ với Nhà Đẹp để được hỗ trợ với mức phí rất thấp.', b'0', b'1', b'0', 34600000, 40155000, 5, 'sofa-vai-alassa-1636770643234', '', 'Sofa vải Alassa', 1, 1),
(12, NULL, NULL, NULL, '2021-11-13 09:30:50.000000', 'Dòng sản phẩm Sofa bọc vải của Nội Thất Nhà Đẹp được đặt sản xuất theo yêu cầu, tiêu chuẩn riêng của Nhà Đẹp, nhằm có được những sản phẩm chất lượng cao, đáp ứng được nhu cầu và thị hiếu của khách hàng. Khi khách hàng đến với Nội thất Nhà Đẹp, khách hàng hoàn toàn có thể yên tâm để lựa chọn những bộ Sofa vải của Nhà Đẹp vì những lý do sau: Khung của Sofa được làm bằng gỗ thịt chắc chắn, tuổi của gỗ là trên 10 năm. Hoàn toàn không sử dụng gỗ tạp, gỗ non như những sản phẩm gia công, hàng chợ, hàng sản xuất nhỏ lẻ đơn chiếc tại các công ty hoặc xưởng gỗ nhỏ. Phần vải bọc Sofa được thiết kế để khách hàng có thể dễ dàng tháo ra để giặt vệ sinh. Hiện nay trên thị trường không có nhiều công ty làm được theo yêu cầu như vậy. Trong quá trình sử dụng, nếu khách quá bận rộn và không có thời gian để vệ sinh bộ Sofa của mình, Quý khách hoàn toàn có thể liên hệ với Nhà Đẹp để được hỗ trợ với mức phí rất thấp.', b'0', b'1', b'0', 17870000, 23425000, 5, 'sofa-vai-merin-1636770650592', '', 'Sofa vải Merin', 1, 1),
(13, NULL, NULL, NULL, '2021-11-13 09:30:57.000000', 'Dòng sản phẩm Sofa bọc vải của Nội Thất Nhà Đẹp được đặt sản xuất theo yêu cầu, tiêu chuẩn riêng của Nhà Đẹp, nhằm có được những sản phẩm chất lượng cao, đáp ứng được nhu cầu và thị hiếu của khách hàng. Khi khách hàng đến với Nội thất Nhà Đẹp, khách hàng hoàn toàn có thể yên tâm để lựa chọn những bộ Sofa vải của Nhà Đẹp vì những lý do sau: Khung của Sofa được làm bằng gỗ thịt chắc chắn, tuổi của gỗ là trên 10 năm. Hoàn toàn không sử dụng gỗ tạp, gỗ non như những sản phẩm gia công, hàng chợ, hàng sản xuất nhỏ lẻ đơn chiếc tại các công ty hoặc xưởng gỗ nhỏ. Phần vải bọc Sofa được thiết kế để khách hàng có thể dễ dàng tháo ra để giặt vệ sinh. Hiện nay trên thị trường không có nhiều công ty làm được theo yêu cầu như vậy. Trong quá trình sử dụng, nếu khách quá bận rộn và không có thời gian để vệ sinh bộ Sofa của mình, Quý khách hoàn toàn có thể liên hệ với Nhà Đẹp để được hỗ trợ với mức phí rất thấp.', b'0', b'0', b'1', 29300000, 34855000, 5, 'sofa-vai-peka-1636770657803', '', 'Sofa vải Peka', 1, 1),
(14, NULL, NULL, NULL, '2021-11-13 09:31:04.000000', 'Dòng sản phẩm bàn trà cao cấp với mặt bàn bằng đá. Vân đá hài hòa, màu sắc trang nhã, kiểu dáng khung độc đáo, phù hợp với các không gian phòng khách cao cấp, sang trọng, thể hiện gu thẩm mỹ tinh tế của gia chủ.', b'0', b'0', b'1', 24900000, 30455000, 5, 'ban-tra-mat-a-veron-1636770664015', '', 'Bàn trà mặt đá Veron', 2, 1),
(15, NULL, NULL, NULL, '2021-11-13 09:31:11.000000', 'Dòng sản phẩm bàn trà cao cấp với mặt bàn bằng đá. Vân đá hài hòa, màu sắc trang nhã, kiểu dáng khung độc đáo, phù hợp với các không gian phòng khách cao cấp, sang trọng, thể hiện gu thẩm mỹ tinh tế của gia chủ.', b'1', b'0', b'0', 21290000, 26845000, 5, 'ban-tra-mat-a-trivia-1636770671070', '', 'Bàn trà mặt đá Trivia', 2, 1),
(16, NULL, NULL, NULL, '2021-11-13 09:31:17.000000', 'Dòng sản phẩm bàn trà cao cấp với mặt bàn bằng đá. Vân đá hài hòa, màu sắc trang nhã, kiểu dáng khung độc đáo, phù hợp với các không gian phòng khách cao cấp, sang trọng, thể hiện gu thẩm mỹ tinh tế của gia chủ.', b'1', b'0', b'0', 11900000, 17455000, 5, 'ban-tra-clara-1636770677543', '', 'Bàn trà Clara', 2, 1),
(17, NULL, NULL, NULL, '2021-11-13 09:31:23.000000', 'Dòng sản phẩm bàn trà cao cấp với mặt bàn bằng đá. Vân đá hài hòa, màu sắc trang nhã, kiểu dáng khung độc đáo, phù hợp với các không gian phòng khách cao cấp, sang trọng, thể hiện gu thẩm mỹ tinh tế của gia chủ.', b'1', b'0', b'0', 15990000, 21545000, 5, 'ban-an-mo-rong-stratos-1636770683923', '', 'Bàn ăn mở rộng Stratos', 2, 2),
(18, NULL, NULL, NULL, '2021-11-13 09:31:32.000000', 'Dòng sản phẩm bàn trà cao cấp với mặt bàn bằng đá. Vân đá hài hòa, màu sắc trang nhã, kiểu dáng khung độc đáo, phù hợp với các không gian phòng khách cao cấp, sang trọng, thể hiện gu thẩm mỹ tinh tế của gia chủ.', b'1', b'0', b'0', 12390000, 17945000, 5, 'ban-an-mo-rong-senda-1636770692022', '', 'Bàn ăn mở rộng Senda', 2, 2),
(19, NULL, NULL, NULL, '2021-11-13 09:31:39.000000', 'Dòng sản phẩm ghế chất lượng cao', b'0', b'1', b'0', 11300000, 16855000, 5, 'ghe-thu-gian-nicky-1636770699220', '', 'Ghế thư giãn Nicky', 3, 1),
(20, NULL, NULL, NULL, '2021-11-13 09:31:46.000000', 'Dòng sản phẩm ghế chất lượng cao', b'0', b'1', b'0', 8700000, 14255000, 5, 'ghe-luoi-1636770706166', '', 'Ghế lười', 3, 1),
(21, NULL, NULL, NULL, '2021-11-13 09:31:53.000000', 'Dòng sản phẩm ghế chất lượng cao', b'0', b'0', b'1', 9400000, 14955000, 5, 'sofa-on-anna-1636770713608', '', 'Sofa đơn Anna', 3, 1),
(22, NULL, NULL, NULL, '2021-11-13 09:31:59.000000', 'Dòng sản phẩm ghế chất lượng cao', b'0', b'1', b'0', 1450000, 7005000, 5, 'ghe-an-boc-pu-1636770719532', '', 'Ghế ăn bọc PU', 3, 2),
(23, NULL, NULL, NULL, '2021-11-13 09:32:05.000000', 'Dòng sản phẩm ghế chất lượng cao', b'0', b'0', b'1', 2300000, 7855000, 5, 'ghe-an-boc-pu-pre-1636770725510', '', 'Ghế ăn bọc PU pre', 3, 2),
(24, NULL, '2021-11-17 10:01:36.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Sau những giờ làm việc, học tập trong suốt một ngày dài, bữa cơm gia đình là nơi tập hợp đầy đủ các thành viên. Chính vì vậy, phòng ăn là phần cực kỳ quan trong trọng trong cấu trúc nội thất của mỗi căn nhà. Bên cạnh một chiếc bàn ăn đẹp, trang nhã, người gia chủ cũng luôn quan tâm tới ghế ăn vì đây chính là người bạn đồng hành trong suốt bữa ăn của cả gia đình. Tuy nhiên, để lựa chọn được một chiếc ghế ăn tốt không phải dễ bởi trên thị trường có quá nhiều sự lựa chọn. Ghế gỗ hay ghế kim loại, ghế nhựa? Ghế có bọc vải hay giả da? Mua ghế này thì có đồng bộ với bàn kia hay không? Nếu vẫn còn thắc mắc thì hãy để Nhà Đẹp cùng bạn tìm ra chiếc ghế ăn hoàn hảo mà bạn vẫn hằng kiếm tìm nhé! Bởi Nhà Đẹp là nơi mà bạn có thể thấy những chiếc ghế ăn mang những đặc tính sau:</p><ol style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><li><span style=\"font-weight: 700;\">Mẫu mã đa dạng, phong phú:</span></li></ol><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Dù bạn có theo đuổi bất kỳ phong cách nội thất nào cho phòng ăn của mình thì Nhà Đẹp cũng luôn sẵn sàng hỗ trợ bạn tìm ra chiếc ghế ăn phù hợp nhất. Bởi tại nơi đây, bạn có thể dễ dàng bắt gặp các mẫu ghế ăn với đa dạng về chất liệu, mẫu mã cũng như kích thước.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Nếu bạn theo đuổi phong cách sang trọng, cổ điển, những chiếc ghế ăn gỗ sẽ là sự lựa chọn tuyệt vời. Còn sự lựa chọn của bạn là phong cách trẻ trung hiện đại thì những chiếc ghế ăn bọc giả da chắc chắn sẽ làm bạn hài lòng…</p><ol start=\"2\" style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><li><span style=\"font-weight: 700;\">Bền, đẹp, tiện lợi</span></li></ol><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Ghế ăn do Nhà Đẹp cung cấp luôn mang lại cho quý khách hàng những trải nghiệm tuyệt vời bởi đây là những sản phẩm được chọn lọc kỹ càng bởi các chuyên gia nội thất của Nhà Đẹp với những tiêu chuẩn khắt khe nhất nhằm đáp ứng đầy đủ 3 tiêu chí: bền, đẹp và tiện lợi.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Các sản phẩm ghế ăn Nhà Đẹp cho dù làm bằng bất kỳ chất liệu gì luôn phải đáp ứng tất cả các chỉ tiêu thông số kỹ thông thuật về độ chịu lực, khả năng chống ẩm mốc, khả năng chống mọt… Ngoài ra với thiết kế bề ngoài trang nhã, màu sắc được chọn lựa kỹ càng nhằm phù hợp với không gian phòng ăn, ghế ăn do Nhà Đẹp cung cấp là sản phẩm không chỉ “tốt gỗ” mà còn tốt cả “nước sơn”.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Tính tiện lợi của sản phẩm cũng là 1 yếu tố được các chuyên gia Nhà Đẹp cân nhắc khi gửi chọn lựa các mẫu mã sản phẩm ghế ăn tới quý khách hàng. Các yếu tố như độ nặng, khả năng xếp chồng, diện tích mặt ghế được chọn lựa rất kỹ để mỗi sản phẩm ghế ăn do Nhà Đẹp cung cấp đều khiến khách hàng cảm thấy hài lòng khi sử dụng.</p>', b'0', b'1', b'0', 1590000, 1431000, 5, 'ghe-an-go-gina-1637118096874', '', 'Ghế ăn gỗ Gina', 3, 2),
(25, NULL, '2021-11-17 10:04:31.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><em>Xu hướng nội thất hiện đại ngày càng chú ý hơn đến nhu cầu của cá nhân. Chính vì thế, những không gian mang đậm các tính chất riêng tư như phòng ngủ ngày càng được chú ý. Một trong các cấu thành quan trọng bậc nhất của nội thất phòng ngủ chính là những chiếc giường ngủ</em></p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Dù muốn hay không muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản thân khi ở nhà là ở trong phòng ngủ, ít nhất cũng là thời gian ban đêm khi ngủ. Vậy nên có cho mình một không gian để nghỉ ngơi thư giãn hoàn hảo tại phòng ngủ sau một ngày dài lao động, học tập cần rất nhiều sự đầu tư trong việc tìm và chọn sản phẩm phù hợp với bản thân. Đặc biệt là với giường ngủ. Có thể coi giường ngủ chính là trái tim của nội thất phòng ngủ khi nó không chỉ vật dụng chiếm nhiều diện tích nhất trong phòng ngủ mà còn là thứ bạn sử dụng thường xuyên bậc nhất. Và nếu bạn đang còn cân nhắc, đắn đo không biết nên chọn giường ngủ như nào thì hãy tới với Luxury shop</p>', b'0', b'0', b'1', 10070000, 7552000, 5, 'giuong-ngu-1-8x2m-1637118271031', '', 'Giường ngủ 1.8x2m', 5, 3),
(26, NULL, '2021-11-17 10:05:59.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Đa dạng về phong cách</span>. Dù bạn theo đuổi bất kỳ phong cách nội thất nào, Nhà Đẹp cũng có thể chọn lựa sản phẩm giường ngủ phù hợp với bạn. Cho dù là phong cách hiện đại, trẻ trung, phong cách cổ điển, sang trọng hay phong cách đơn giản, phóng khoáng, Nhà Đẹp luôn có những mẫu giường ngủ đáp ứng được nhu cầu của bạn</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Bền và đẹp.&nbsp;</span>Các sản phẩm giường ngủ tại Nhà Đẹp đều được sản xuất dựa trên các tiêu chuẩn kỹ thuật ngặt nghèo với phần khung được làm từ gỗ tự nhiên và các bề mặt là gỗ công nghiệp cao cấp. Các sản phẩm giường ngủ này đáp ứng được các yêu cầu cao trong việc chống mọt, cong vênh. Bên cạnh đó, kiểu dáng cũng như màu sắc của sản phẩm giường ngủ của Nhà Đẹp được chọn lựa một cách kỹ càng đem lại tính thẩm mỹ cao cho sản phẩm</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Phù hợp với nhu cầu người dùng.&nbsp;</span>Các sản phẩm giường ngủ tại Nhà Đẹp được chú ý hết sức kỹ lưỡng để phù hợp với nhu cầu người dùng. Độ cao hợp lý cùng thiết kế cấu trúc hệ thống chân và dát giường vững chắc giúp người sử dụng có được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Bảo hành dài lâu.&nbsp;</span>Là đơn vị đi đầu trong lĩnh vực bán lẻ nội thất gia dụng tại thị trường phía Bắc, Nhà Đẹp luôn cung cấp cho khách hàng những sản phẩm và dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất khác tại đây, giường ngủ của Nhà Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu mãi uy tín. Các sản phẩm giường ngủ đều được bảo hành tới 2 năm. Bên cạnh đó, tất cả các khách hàng khi đến với Nhà Đẹp đều được tư vấn nhiệt tình, được phục vụ tận tình, chu đáo. Và cho dù bạn có sử dụng sản phẩm của Nhà Đẹp hay không, chúng tôi vẫn luôn sẵn sàng cung cấp cho bạn mọi thông tin cần thiết để bạn có thể lựa chọn và đưa ra được những quyết định đúng đắn nhất.</p>', b'0', b'0', b'0', 13500000, 9990000, 5, 'giuong-ngu-adora-1-6x2m-1637118359128', '', 'Giường ngủ Adora 1.6x2m', 5, 3),
(27, NULL, '2021-11-17 10:07:34.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: 700;\">Đa dạng về phong cách</span>. Dù bạn theo đuổi bất kỳ phong cách nội thất nào, Nhà Đẹp cũng có thể chọn lựa sản phẩm bàn trang điểm phù hợp với bạn. Cho dù là phong cách hiện đại, trẻ trung, phong cách cổ điển, sang trọng hay phong cách đơn giản, phóng khoáng, Nhà Đẹp luôn có những mẫu bàn trang điểm đáp ứng được nhu cầu của bạn</span></p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: 700;\">Bền và đẹp.&nbsp;</span>Các sản phẩm bàn trang điểm tại Nhà Đẹp đều được sản xuất dựa trên các tiêu chuẩn kỹ thuật ngặt nghèo, đáp ứng được các yêu cầu cao trong việc chống mọt, cong vênh. Bên cạnh đó, kiểu dáng cũng như màu sắc của sản phẩm bàn trang điểm của Nhà Đẹp được chọn lựa một cách kỹ càng đem lại tính thẩm mỹ cao cho sản phẩm.</span></p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: 700;\">Phù hợp với nhu cầu người dùng.&nbsp;</span>Các sản phẩm bàn trang điểm tại Nhà Đẹp được chú ý hết sức kỹ lưỡng để phù hợp với nhu cầu người dùng. Độ cao phù hợp cùng thiết kế cấu trúc hệ thống chân gương và các ngăn kệ hợp lý giúp người sử dụng có được những trải nghiệm tốt nhất khi sử dụng sản phẩm</span></p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-weight: 700;\">Bảo hành dài lâu.&nbsp;</span>Là đơn vị đi đầu trong lĩnh vực bán lẻ nội thất gia dụng tại thị trường phía Bắc, Nhà Đẹp luôn cung cấp cho khách hàng những sản phẩm và dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất khác tại đây, bàn trang điểm của Nhà Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu mãi uy tín. Các sản phẩm bàn trang điểm đều được bảo hành tới 2 năm. Bên cạnh đó, tất cả các khách hàng khi đến với Nhà Đẹp đều được tư vấn nhiệt tình, được phục vụ tận tình, chu đáo. Và cho dù bạn có sử dụng sản phẩm của Nhà Đẹp hay không, chúng tôi vẫn luôn sẵn sàng cung cấp cho bạn mọi thông tin cần thiết để bạn có thể lựa chọn và đưa ra được những quyết định đúng đắn nhất.</span></p>', b'0', b'1', b'0', 7200000, 6000000, 5, 'ban-phan-thomas-nho-1637118454996', '', 'Bàn phấn Thomas nhỏ', 4, 3),
(28, NULL, '2021-11-17 10:08:51.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px;\"><span style=\"font-weight: 700;\">Đa dạng về phong cách</span>. Dù bạn theo đuổi bất kỳ phong cách nội thất nào, Nhà Đẹp cũng có thể chọn lựa sản phẩm tủ áo phù hợp với bạn. Cho dù là phong cách hiện đại, trẻ trung, phong cách cổ điển, sang trọng hay phong cách đơn giản, phóng khoáng, Nhà Đẹp luôn có những mẫu tủ áo đáp ứng được nhu cầu của bạn</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px;\"><span style=\"font-weight: 700;\">Bền và đẹp.&nbsp;</span>Các sản phẩm tủ áo tại Nhà Đẹp đều được sản xuất dựa trên các tiêu chuẩn kỹ thuật ngặt nghèo với phần khung được làm từ gỗ tự nhiên và các bề mặt là gỗ công nghiệp cao cấp. Các sản phẩm giường ngủ này đáp ứng được các yêu cầu cao trong việc chống mối mọt, cong vênh. Bên cạnh đó, kiểu dáng cũng như màu sắc của sản phẩm tủ áo của Nhà Đẹp được chọn lựa một cách kỹ càng đem lại tính thẩm mỹ cao cho sản phẩm</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px;\"><span style=\"font-weight: 700;\">Phù hợp với nhu cầu người dùng.&nbsp;</span>Các sản phẩm tủ áo tại Nhà Đẹp được chú ý hết sức kỹ lưỡng để phù hợp với nhu cầu người dùng. Cách phân chia các ngăn tủ cũng như vị trí của gương và hộc tủ phụ hợp lý giúp người sử dụng có được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p><p style=\"margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, serif; font-size: 16px;\"><span style=\"font-weight: 700;\">Bảo hành dài lâu.&nbsp;</span>Là đơn vị đi đầu trong lĩnh vực bán lẻ nội thất gia dụng tại thị trường phía Bắc, Nhà Đẹp luôn cung cấp cho khách hàng những sản phẩm và dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất khác tại đây, tủ áo của Nhà Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu mãi uy tín. Các sản phẩm tủ áo đều được bảo hành tới 2 năm. Bên cạnh đó, tất cả các khách hàng khi đến với Nhà Đẹp đều được tư vấn nhiệt tình, được phục vụ tận tình, chu đáo. Và cho dù bạn có sử dụng sản phẩm của Nhà Đẹp hay không, chúng tôi vẫn luôn sẵn sàng cung cấp cho bạn mọi thông tin cần thiết để bạn có thể lựa chọn và đưa ra được những quyết định đúng đắn nhất.</p>', b'1', b'0', b'0', 21200000, 19300000, 5, 'tu-ao-jimmy-5-canh-1637118531027', '', 'Tủ áo Jimmy 5 cánh', 4, 3),
(29, NULL, '2021-11-17 10:11:01.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Đa dạng về phong cách</span>. Dù bạn theo đuổi bất kỳ phong cách nội thất nào, Nhà Đẹp cũng có thể chọn lựa sản phẩm giường ngủ phù hợp với bạn. Cho dù là phong cách hiện đại, trẻ trung, phong cách cổ điển, sang trọng hay phong cách đơn giản, phóng khoáng, Nhà Đẹp luôn có những mẫu giường ngủ đáp ứng được nhu cầu của bạn</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Bền và đẹp.&nbsp;</span>Các sản phẩm giường ngủ tại Nhà Đẹp đều được sản xuất dựa trên các tiêu chuẩn kỹ thuật ngặt nghèo với phần khung được làm từ gỗ tự nhiên và các bề mặt là gỗ công nghiệp cao cấp. Các sản phẩm giường ngủ này đáp ứng được các yêu cầu cao trong việc chống mối mọt, cong vênh. Bên cạnh đó, kiểu dáng cũng như màu sắc của sản phẩm giường ngủ của Nhà Đẹp được chọn lựa một cách kỹ càng đem lại tính thẩm mỹ cao cho sản phẩm</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Phù hợp với nhu cầu người dùng.&nbsp;</span>Các sản phẩm giường ngủ tại Nhà Đẹp được chú ý hết sức kỹ lưỡng để phù hợp với nhu cầu người dùng. Độ cao hợp lý cùng thiết kế cấu trúc hệ thống chân và dát giường vững chắc giúp người sử dụng có được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Bảo hành dài lâu.&nbsp;</span>Là đơn vị đi đầu trong lĩnh vực bán lẻ nội thất gia dụng tại thị trường phía Bắc, Nhà Đẹp luôn cung cấp cho khách hàng những sản phẩm và dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất khác tại đây, giường ngủ của Nhà Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu mãi uy tín. Các sản phẩm giường ngủ đều được bảo hành tới 2 năm. Bên cạnh đó, tất cả các khách hàng khi đến với Nhà Đẹp đều được tư vấn nhiệt tình, được phục vụ tận tình, chu đáo. Và cho dù bạn có sử dụng sản phẩm của Nhà Đẹp hay không, chúng tôi vẫn luôn sẵn sàng cung cấp cho bạn mọi thông tin cần thiết để bạn có thể lựa chọn và đưa ra được những quyết định đúng đắn nhất.</p>', b'0', b'1', b'0', 16200000, 14700000, 5, 'giuong-ngu-tara-chan-go-1637118661197', '', 'Giường ngủ Tara chân gỗ', 5, 3),
(30, NULL, '2021-11-17 10:12:56.000000', NULL, NULL, '<p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\"><span style=\"font-weight: 700;\">Được thiết kế bởi các chuyên gia thiết kế hàng đầu người Ý và Thụy Sỹ</span>, TONI là kết quả của việc nghiên cứu kỹ lưỡng tính cách, hành vi vận động cũng như cấu trúc cơ thể trẻ em châu Á nhằm tạo ra những sản phẩm tốt nhất cho phòng ngủ của bé. Gồm nhiều sản phẩm nhỏ như: giường đơn, giường đôi, giường tầng, tủ quần áo (cánh mở và cánh lùa), bàn học, tủ đầu giường…, TONI&nbsp;<span style=\"font-weight: 700;\">đáp ứng được trọn vẹn những yêu cầu của các bậc phụ huynh</span>&nbsp;trong việc tạo dựng cho con không gian phòng ngủ tiện lợi.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Các sản phẩm TONI được sản xuất với nguyên liệu chính là&nbsp;<span style=\"font-weight: 700;\">gỗ công nghiệp có tỷ trọng cao và đạt tiêu chuẩn E1 của châu Âu trên dây chuyền của CHLB Đức</span>. Lớp bao phủ bề mặt sản phẩm là&nbsp;<span style=\"font-weight: 700;\">Eco-film có độ dày 0,6~0,8mm</span>. (Đây là đặc tính chỉ có duy nhất ở dòng sản phẩm TONI của Nhà Đẹp trên thị trường Việt Nam). Tất cả các chi tiết, bộ phận của sản phẩm đều được làm rất chắc chắn, an toàn. Với những tiêu chuẩn kỹ thuật khắt khe như vậy, dòng sản phẩm TONI của Nhà Đẹp là dòng sản phẩm nội thất phòng ngủ trẻ em&nbsp;<span style=\"font-weight: 700;\">hoàn toàn không có các chất độc hại, khả năng chống chịu ẩm mốc cao, hoàn toàn không có hiện tượng cong vênh hay nứt vỡ qua thời gian sử dụng và bền màu tới 10 năm</span>.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Dòng sản phẩm nội thất phòng ngủ trẻ em TONI cũng rất&nbsp;<span style=\"font-weight: 700;\">đa dạng về mẫu mã</span>. Bên cạnh những kiểu dáng cơ bản thường gặp, TONI còn có rất nhiều các mẫu nội thất thông minh giúp trẻ tăng khả năng tư duy và sáng tạo. Ngoài ra, màu sắc cũng như các họa tiết của dòng sản phẩm nội thất phòng ngủ TONI cũng rất đa dạng và phong phú.</p><p style=\"margin-bottom: 10px; font-size: 16px; color: rgb(70, 70, 70); font-family: Roboto; text-align: justify;\">Chắc chắn với dòng sản phẩm TONI của nội thất Nhà Đẹp, các bậc phụ huynh sẽ không ngừng hài lòng khi con em mình được sống trong một không gian an toàn nhưng cũng đầy hấp dẫn và thú vị với bé.</p>', b'0', b'1', b'0', 21200000, 19300000, 5, 'giuong-tang-erica-mau-hong-1637118776784', '', 'Giường tầng Erica (màu hồng)', 5, 3),
(31, NULL, '2021-11-17 10:14:36.000000', NULL, NULL, '', b'0', b'1', b'0', 6000000, 5500000, 5, 'bo-tuong-nghe-si-1637118876930', '', 'Bộ tượng nghệ sĩ', 6, 4),
(32, NULL, '2021-11-17 10:15:38.000000', NULL, NULL, '', b'0', b'1', b'0', 7200000, 6000000, 5, 'oi-thien-nga-o-ruou-1637118938211', '', 'Đôi thiên nga đỡ rượu', 6, 4),
(33, NULL, '2021-11-17 10:16:52.000000', NULL, NULL, '', b'0', b'1', b'0', 1100000, 890000, 5, 'tranh-hoa-a006-1637119012327', '', 'Tranh hoa A006', 7, 4),
(34, NULL, '2021-11-17 10:17:49.000000', NULL, NULL, '', b'0', b'1', b'0', 330000, 230000, 5, 'khung-anh-1637119069202', '', 'Khung ảnh', 7, 4),
(35, NULL, '2021-11-17 10:19:05.000000', NULL, NULL, '', b'0', b'1', b'0', 1590000, 1300000, 5, 'en-treo-trang-tri-1637119145381', '', 'Đèn treo trang trí', 8, 4),
(36, NULL, '2021-11-17 10:20:27.000000', NULL, NULL, '', b'0', b'0', b'1', 2400000, 2300000, 5, 'en-treo-trang-tri-1637119227788', '', 'Đèn treo trang trí', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_images`
--

CREATE TABLE `tbl_products_images` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_products_images`
--

INSERT INTO `tbl_products_images` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `path`, `title`, `product_id`) VALUES
(1, NULL, NULL, NULL, NULL, 'DSC7754.jpg', '', 1),
(2, NULL, NULL, NULL, NULL, 'sofada.jpg', '', 1),
(3, NULL, NULL, NULL, NULL, 'DSC7777.jpg', '', 1),
(4, NULL, NULL, NULL, NULL, '82603935-sofa-da-elise-nau.jpg', '', 2),
(5, NULL, NULL, NULL, NULL, '82603944-sofa-da-waldo-xam-goc-trai-2.jpg', '', 3),
(6, NULL, NULL, NULL, NULL, '82603944-sofa-da-waldo-xam-goc-trai.jpg', '', 3),
(7, NULL, NULL, NULL, NULL, 'sofa-da-italia-impressive-3-cho-72608054.jpg', '', 4),
(8, NULL, NULL, NULL, NULL, 'sofa-da-italia-impressive-goc-phai-72608050-2.jpg', '', 5),
(9, NULL, NULL, NULL, NULL, 'sofa-da-italia-impressive-goc-phai-72608050.jpg', '', 5),
(10, NULL, NULL, NULL, NULL, 'sofa-da-italia-charlize-goc-trai-72608047-4.jpg', '', 6),
(11, NULL, NULL, NULL, NULL, 'sofa-da-italia-charlize-goc-trai-72608047-2.jpg', '', 6),
(12, NULL, NULL, NULL, NULL, 'sofa-da-italia-elestial-goc-phai-72608046-4.jpg', '', 7),
(13, NULL, NULL, NULL, NULL, 'sofa-da-italia-elestial-goc-phai-72608046-2.jpg', '', 7),
(14, NULL, NULL, NULL, NULL, 'sofa-da-italia-zoe-3-cho-nau-do-72611010-2.jpg', '', 8),
(15, NULL, NULL, NULL, NULL, 'sofa-da-italia-zoe-3-cho-nau-do-72611010.jpg', '', 8),
(16, NULL, NULL, NULL, NULL, 'DSC05453.jpg', '', 9),
(17, NULL, NULL, NULL, NULL, '_DSC1485.png', '', 10),
(18, NULL, NULL, NULL, NULL, '_DSC1488.png', '', 10),
(19, NULL, NULL, NULL, NULL, 'DSC05487.jpg', '', 11),
(20, NULL, NULL, NULL, NULL, 'DSC05485.jpg', '', 11),
(21, NULL, NULL, NULL, NULL, '12.jpg', '', 12),
(22, NULL, NULL, NULL, NULL, '13.jpg', '', 12),
(23, NULL, NULL, NULL, NULL, '5.jpg', '', 13),
(24, NULL, NULL, NULL, NULL, '6.jpg', '', 13),
(25, NULL, NULL, NULL, NULL, 'ban-tra-veron-81144002-2.jpg', '', 14),
(26, NULL, NULL, NULL, NULL, 'ban-tra-veron-81144002.jpg', '', 14),
(27, NULL, NULL, NULL, NULL, 'ban-tra-trivia-81144029-2.jpg', '', 15),
(28, NULL, NULL, NULL, NULL, 'ban-tra-trivia-81144029.jpg', '', 15),
(29, NULL, NULL, NULL, NULL, 'ban-tra-clara-81140001-2.jpg', '', 16),
(30, NULL, NULL, NULL, NULL, 'ban-tra-clara-81140001.jpg', '', 16),
(31, NULL, NULL, NULL, NULL, 'FB_Post_BST_BanAnThongMinh-03.jpg', '', 17),
(32, NULL, NULL, NULL, NULL, 'FB_Post_BST_BanAnThongMinh-01.jpg', '', 18),
(33, NULL, NULL, NULL, NULL, 'ghe-thu-gian-nicky-kem-don-82636057.jpg', '', 19),
(34, NULL, NULL, NULL, NULL, 'ghe-luoi-50BB-82642002.jpg', '', 20),
(35, NULL, NULL, NULL, NULL, '3.jpg', '', 21),
(36, NULL, NULL, NULL, NULL, '_DSC1144.jpg', '', 22),
(37, NULL, NULL, NULL, NULL, '_DSC1146.jpg', '', 22),
(38, NULL, NULL, NULL, NULL, 'ghe-an-boc-pu-72104072.jpg', '', 23),
(39, NULL, '2021-11-17 10:01:36.000000', NULL, NULL, 'ghe-an-go-gina-72109004.jpg', NULL, 24),
(40, NULL, '2021-11-17 10:04:31.000000', NULL, NULL, 'H19A003YN.png', NULL, 25),
(41, NULL, '2021-11-17 10:05:59.000000', NULL, NULL, 'giuong-ngu-adora.jpg', NULL, 26),
(42, NULL, '2021-11-17 10:05:59.000000', NULL, NULL, 'SAA061-set.jpg', NULL, 26),
(43, NULL, '2021-11-17 10:07:35.000000', NULL, NULL, 'ban-phan-thomas-nho.jpg', NULL, 27),
(44, NULL, '2021-11-17 10:08:51.000000', NULL, NULL, 'tu-ao-jimmy-84852002.jpg', NULL, 28),
(45, NULL, '2021-11-17 10:08:51.000000', NULL, NULL, 'tu-ao-jimmy-84852002-2.jpg', NULL, 28),
(46, NULL, '2021-11-17 10:11:01.000000', NULL, NULL, 'giuong-ngu-tara-chan-go-83216008.jpg', NULL, 29),
(47, NULL, '2021-11-17 10:12:56.000000', NULL, NULL, 'giuong-tang-erica-hong.jpg', NULL, 30),
(48, NULL, '2021-11-17 10:12:56.000000', NULL, NULL, 'giuong-tang-erica-hong-1.jpg', NULL, 30),
(49, NULL, '2021-11-17 10:14:36.000000', NULL, NULL, 'bo-tuong-nghe-si-83999268.jpg', NULL, 31),
(50, NULL, '2021-11-17 10:15:38.000000', NULL, NULL, 'doi-thien-nga-do-ruou-83999270-2.jpg', NULL, 32),
(51, NULL, '2021-11-17 10:16:52.000000', NULL, NULL, 'tranh-hoa-83999065-3.jpg', NULL, 33),
(52, NULL, '2021-11-17 10:17:49.000000', NULL, NULL, 'khung-anh-83999186.jpg', NULL, 34),
(53, NULL, '2021-11-17 10:19:05.000000', NULL, NULL, 'den-treo-trang-tri-83999620-2.jpg', NULL, 35),
(54, NULL, '2021-11-17 10:19:05.000000', NULL, NULL, 'den-treo-trang-tri-83999620-3.jpg', NULL, 35),
(55, NULL, '2021-11-17 10:20:27.000000', NULL, NULL, 'den-treo-trang-tri-83999618.jpg', NULL, 36),
(56, NULL, '2021-11-17 10:20:27.000000', NULL, NULL, 'den-treo-trang-tri-83999618-4.jpg', NULL, 36);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_detail`
--

CREATE TABLE `tbl_product_detail` (
  `id` int(11) NOT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `insurance` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_detail`
--

INSERT INTO `tbl_product_detail` (`id`, `dimension`, `insurance`, `material`, `origin`, `product_id`) VALUES
(1, '270x107x72', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật full-grain 100%, khung gỗ, chân kim loại mạ crom', 'Khác', 1),
(2, '280x182x94', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật full-grain 100%, khung gỗ, chân kim loại mạ crom', 'Khác', 2),
(3, '290x183x95', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật full-grain 100%, khung gỗ, chân kim loại mạ crom', 'Khác', 3),
(4, '217x107x68 - 217x107x82', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật top grain 100%, khung gỗ', 'Khác', 4),
(5, '300x148x88', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật top grain 100%, khung gỗ', 'Italia', 5),
(6, '290x204x100', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật top grain 100%, khung gỗ, chân inox', 'Italia', 6),
(7, '284x230x90', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật top grain 100%, khung gỗ, chân crom', 'Italia', 7),
(8, '240x102x67 - 240x102x97', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Da thật 100%, khung gỗ, chân kim loại', 'Italia', 8),
(9, '268x86x81', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Khác', 9),
(10, '266x89x83', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Mỹ', 10),
(11, ' 280x166x91', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Úc', 11),
(12, '212x148x70', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Mỹ', 12),
(13, '265x150x84', 'Bảo hành 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn phí 6 tháng/lần', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Châu Âu', 13),
(14, '100x100x42', 'Bảo hành 1 năm', 'Mặt đá, khung inox', 'Châu Âu', 14),
(15, '130x70x41', 'Bảo hành 1 năm', 'Mặt đá, khung inox', 'Châu Âu', 15),
(16, '120x120x38', 'Bảo hành 1 năm', 'Mặt kính cường lực, chân là gỗ óc chó', 'Mỹ', 16),
(17, '120x80x76 - 180x80x76', 'Bảo hành 1 năm', ' Mặt gốm vân đá', 'Mỹ', 17),
(18, '120x80x76 - 170x80x76', 'Bảo hành 1 năm', ' Mặt gốm vân đá', 'Mỹ', 18),
(19, '76x80x82 - 46x54x40', 'Bảo hành 1 năm', 'Khung kim loại, bọc vải', 'Châu Âu', 19),
(20, '120x160x95', 'Bảo hành 1 năm', '', 'Châu Âu', 20),
(21, '259x148x70', 'Bảo hành 1 năm', 'Khung gỗ, nhồi đệm kết hợp lò xo, bọc vải, chân kim loại', 'Châu Âu', 21),
(22, '62x48x93.5', 'Bảo hành 1 năm', 'Khung kim loại, bọc PU', 'Châu Âu', 22),
(23, '69x56x90', 'Bảo hành 1 năm', 'Khung kim loại, bọc PU', 'Châu Âu', 23),
(24, '53x54x78', 'Bảo hành 1 năm', 'Khung ghế là gỗ công nghiệp, mặt ghế bọc vải, chân gỗ thịt', 'khác', 24),
(25, '213x186x87', 'Bảo hành 2 năm', 'Gỗ công nghiệp, phủ melamin', 'khác', 25),
(26, '223x173x105', 'Bảo hành 2 năm', 'Gỗ công nghiệp, phủ melamin', 'khác', 26),
(27, '124x50x75', 'Bảo hành 2 năm', 'Gỗ công nghiệp, phủ melamin', 'khác', 27),
(28, ' 200x56x217', 'Bảo hành 2 năm', 'Gỗ công nghiệp, phủ melamin', 'khác', 28),
(29, '213x186x87', 'Bảo hành 2 năm', 'Gỗ công nghiệp cao cấp phủ veneer', 'khác', 29),
(30, '223x173x105', 'Bảo hành 2 năm', 'Gỗ công nghiệp phủ Eco-film', 'khác', 30),
(31, '50x10x28', 'Bảo hành 1 năm', 'Composite', 'khác', 31),
(32, '53x54x78', 'Bảo hành 1 năm', 'Composite', 'khác', 32),
(33, '53x54x78', 'Bảo hành 1 năm', '', 'khác', 33),
(34, '53x54x78', 'Bảo hành 1 năm', '', '', 34),
(35, '53x54x78', 'Bảo hành 1 năm', 'Thủy tinh', 'khác', 35),
(36, '90x26x180', 'Bảo hành 1 năm', 'Thủy tinh', 'khác', 36);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rate_product`
--

CREATE TABLE `tbl_rate_product` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `description`, `name`) VALUES
(1, NULL, '2021-11-01 09:37:52.000000', NULL, NULL, 'quản trị viên', 'ROLE_ADMIN'),
(2, NULL, '2021-11-01 09:37:52.000000', NULL, NULL, NULL, 'ROLE_MEMBER'),
(3, NULL, '2021-11-01 09:37:52.000000', NULL, NULL, NULL, 'ROLE_GUEST'),
(4, NULL, NULL, NULL, NULL, 'admin khách', 'ROLE_TESTADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledorder_products`
--

CREATE TABLE `tbl_saledorder_products` (
  `id` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saleorder`
--

CREATE TABLE `tbl_saleorder` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_note` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `isCancel` bit(1) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `total_received` float NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tagsearch`
--

CREATE TABLE `tbl_tagsearch` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tagsearch`
--

INSERT INTO `tbl_tagsearch` (`id`, `description`, `name`) VALUES
(1, NULL, 'sofa'),
(2, NULL, 'ghế'),
(3, NULL, 'bàn ăn'),
(5, NULL, 'trang trí'),
(6, NULL, 'phòng khách');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `address`, `email`, `enabled`, `name`, `password`, `phone`, `username`) VALUES
(1, NULL, '2021-11-17 14:17:11.000000', NULL, NULL, NULL, 'vulinhzh@gmail.com', b'1', 'Anh Linh', '$2a$10$z/iUSca4HMgavwwmsJlg/OBINLZGKgGRew7bLS2iBFjO/7LnSbAOO', NULL, 'admin'),
(2, NULL, '2021-11-17 14:17:34.000000', NULL, NULL, NULL, 'admin@gmail.com', b'1', 'admin', '$2a$10$cbbl4RmrjV597DIu7AzCMeR6MxzyZF7of9vTvheGajaVAMfhv9R3m', NULL, 'admin_tester'),
(3, NULL, '2021-11-17 14:17:49.000000', NULL, NULL, NULL, 'vulinhzh@gmail.com', b'1', 'Anh Linh', '$2a$10$51spEqLGpynpdl9NTdf/kuSbT/K3EHO4dit5PfknauJf/SgM0Z7vq', NULL, 'linh');

--
-- Triggers `tbl_users`
--
DELIMITER $$
CREATE TRIGGER `add_role` AFTER INSERT ON `tbl_users` FOR EACH ROW INSERT INTO tbl_user_role
VALUES (new.id,2)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_role`
--

CREATE TABLE `tbl_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_role`
--

INSERT INTO `tbl_user_role` (`role_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `FKi9o62vfqp2gg8nk3p68wkiw8j` (`user_id`);

--
-- Indexes for table `tbl_categorys`
--
ALTER TABLE `tbl_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_collections`
--
ALTER TABLE `tbl_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_discount`
--
ALTER TABLE `tbl_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_favorite_products`
--
ALTER TABLE `tbl_favorite_products`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `FKgckw4x3av7avbie0ehpcpqnnm` (`user_id`);

--
-- Indexes for table `tbl_mail_register`
--
ALTER TABLE `tbl_mail_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs48eyewaihty5qbemlxqa27x4` (`category_id`),
  ADD KEY `FKeycgbvdy2b1j7f2k809rghvgm` (`collection_id`);

--
-- Indexes for table `tbl_products_images`
--
ALTER TABLE `tbl_products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjac7pn534bktj4tvkxqvydglf` (`product_id`);

--
-- Indexes for table `tbl_product_detail`
--
ALTER TABLE `tbl_product_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1curd4ewvw1x0ug4l518jqoje` (`product_id`);

--
-- Indexes for table `tbl_rate_product`
--
ALTER TABLE `tbl_rate_product`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `FKlmtku5ks230ppwxj9g355h1bk` (`user_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_saledorder_products`
--
ALTER TABLE `tbl_saledorder_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wrs84fapdk67t6tw13l4rb56` (`order_id`);

--
-- Indexes for table `tbl_saleorder`
--
ALTER TABLE `tbl_saleorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbiu8ui4krw8j3gtn97w3rdq7v` (`user_id`);

--
-- Indexes for table `tbl_tagsearch`
--
ALTER TABLE `tbl_tagsearch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `FKh7imm8nbep6on4forodjm6l2u` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_categorys`
--
ALTER TABLE `tbl_categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_collections`
--
ALTER TABLE `tbl_collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_discount`
--
ALTER TABLE `tbl_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_mail_register`
--
ALTER TABLE `tbl_mail_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_products_images`
--
ALTER TABLE `tbl_products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `tbl_product_detail`
--
ALTER TABLE `tbl_product_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_saledorder_products`
--
ALTER TABLE `tbl_saledorder_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saleorder`
--
ALTER TABLE `tbl_saleorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tagsearch`
--
ALTER TABLE `tbl_tagsearch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `FKi9o62vfqp2gg8nk3p68wkiw8j` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`),
  ADD CONSTRAINT `FKm8yjhy167e7fp8b4yk7ey1m5p` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`);

--
-- Constraints for table `tbl_favorite_products`
--
ALTER TABLE `tbl_favorite_products`
  ADD CONSTRAINT `FK8vayb7mt2qoj7varetfhtqop4` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`),
  ADD CONSTRAINT `FKgckw4x3av7avbie0ehpcpqnnm` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD CONSTRAINT `FKeycgbvdy2b1j7f2k809rghvgm` FOREIGN KEY (`collection_id`) REFERENCES `tbl_collections` (`id`),
  ADD CONSTRAINT `FKs48eyewaihty5qbemlxqa27x4` FOREIGN KEY (`category_id`) REFERENCES `tbl_categorys` (`id`);

--
-- Constraints for table `tbl_products_images`
--
ALTER TABLE `tbl_products_images`
  ADD CONSTRAINT `FKjac7pn534bktj4tvkxqvydglf` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`);

--
-- Constraints for table `tbl_product_detail`
--
ALTER TABLE `tbl_product_detail`
  ADD CONSTRAINT `FK1curd4ewvw1x0ug4l518jqoje` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`);

--
-- Constraints for table `tbl_rate_product`
--
ALTER TABLE `tbl_rate_product`
  ADD CONSTRAINT `FK52wjv3sypeh9bfkwxsra231mb` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`),
  ADD CONSTRAINT `FKlmtku5ks230ppwxj9g355h1bk` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_saledorder_products`
--
ALTER TABLE `tbl_saledorder_products`
  ADD CONSTRAINT `FK9wrs84fapdk67t6tw13l4rb56` FOREIGN KEY (`order_id`) REFERENCES `tbl_saleorder` (`id`);

--
-- Constraints for table `tbl_saleorder`
--
ALTER TABLE `tbl_saleorder`
  ADD CONSTRAINT `FKbiu8ui4krw8j3gtn97w3rdq7v` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD CONSTRAINT `FK6ms0gxqvjxkgul0vim4h7rsme` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  ADD CONSTRAINT `FKh7imm8nbep6on4forodjm6l2u` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
