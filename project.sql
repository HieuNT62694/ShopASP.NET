USE [master]
GO
/****** Object:  Database [project2]    Script Date: 7/17/2018 8:29:59 PM ******/
CREATE DATABASE [project2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'project2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [project2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project2] SET ARITHABORT OFF 
GO
ALTER DATABASE [project2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [project2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project2] SET  MULTI_USER 
GO
ALTER DATABASE [project2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [project2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [project2]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[id_bill] [int] NOT NULL,
	[id_food] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[id_bill] ASC,
	[id_food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bills]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_customer] [int] NOT NULL,
	[date_order] [date] NOT NULL,
	[total] [float] NOT NULL,
	[deposit] [float] NOT NULL,
	[unpaid] [float] NOT NULL,
	[payment_method] [nvarchar](100) NOT NULL,
	[note] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customers]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NULL DEFAULT (NULL),
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[note] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[food_type]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[image] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_food_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[foods]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_type] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[summary] [nvarchar](200) NOT NULL,
	[detail] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[promotion_price] [float] NOT NULL,
	[promotion] [nvarchar](200) NOT NULL DEFAULT (N'nước ngọt, khăn lạnh'),
	[image] [nvarchar](100) NOT NULL,
	[update_at] [date] NOT NULL,
	[unit] [nvarchar](50) NOT NULL DEFAULT (N'đĩa'),
	[today] [int] NOT NULL DEFAULT (N'0'),
 CONSTRAINT [PK_foods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[promotion_price] [float] NOT NULL DEFAULT (N'0'),
	[detail] [text] NOT NULL,
	[image] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu_detail]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu_detail](
	[id_menu] [int] NOT NULL,
	[id_food] [int] NOT NULL,
	[quantity] [int] NOT NULL DEFAULT (N'1N'),
 CONSTRAINT [PK_menu_detail] PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC,
	[id_food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role_resource]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role_resource](
	[role] [varchar](50) NOT NULL,
	[resource] [varchar](100) NOT NULL,
	[allow] [varchar](200) NOT NULL,
 CONSTRAINT [PK_role_resource] PRIMARY KEY CLUSTERED 
(
	[role] ASC,
	[resource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/17/2018 8:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[birthdate] [date] NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[role] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (1, 1, 2, 1194000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (2, 55, 1, 150000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (2, 58, 1, 180000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (3, 2, 2, 1194000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (3, 55, 1, 150000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (3, 58, 1, 180000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (4, 3, 3, 25000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (4, 46, 1, 220000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (5, 58, 3, 12000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (6, 57, 1, 190000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (6, 59, 1, 80000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (7, 57, 1, 190000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (7, 61, 1, 25000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (8, 31, 1, 650000)
INSERT [dbo].[bill_detail] ([id_bill], [id_food], [quantity], [price]) VALUES (8, 58, 1, 12000)
SET IDENTITY_INSERT [dbo].[bills] ON 

INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (1, 1, CAST(N'2014-01-13' AS Date), 2718000, 1000000, 1718000, N'tiền mặt', N'')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (2, 2, CAST(N'2014-01-13' AS Date), 2718000, 1000000, 1718000, N'tiền mặt', N'')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (3, 3, CAST(N'2014-05-20' AS Date), 295000, 0, 0, N'tiền mặt', N'')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (4, 4, CAST(N'2014-05-20' AS Date), 410000, 0, 0, N'tiền mặt', N'')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (5, 11, CAST(N'2018-07-17' AS Date), 36000, 36000, 0, N'Tiền Mặt', N'asa')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (6, 12, CAST(N'2018-07-17' AS Date), 190000, 190000, 0, N'Tiền Mặt', N'adsas')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (7, 13, CAST(N'2018-07-17' AS Date), 25000, 25000, 0, N'Tiền Mặt', N'adfasd')
INSERT [dbo].[bills] ([id], [id_customer], [date_order], [total], [deposit], [unpaid], [payment_method], [note]) VALUES (8, 14, CAST(N'2018-07-17' AS Date), 662000, 662000, 0, N'Tiền Mặt', N'dasdas')
SET IDENTITY_INSERT [dbo].[bills] OFF
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (1, N'Nguyễn Thị Thảo', N'nữ', N'thao@gmail.com', N'đường 27', N'0123456799', N'Sinh Nhật')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (2, N'Trần Thu Trang', N'nữ', N'trang@yahoo.com', N'đường 27', N'0123456799', N'Đám cưới')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (3, N'Đỗ Lâm Thiên', N'nam', N'thien@mail.com', N'357 Lê Hồng Phong, Q.10', N'8331056', N'')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (4, N'Khuất Thùy Phương', N'nữ', N'kpt@edu.vn', N'Nguyễn Oanh', N'0123456789', N'Vui lòng gửi hàng đúng ngày')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (5, N'Mai Thu Thảo', N'nữ', N'thao@gmail.com', N'Nguyễn Văn Cừ', N'0235698758', N'')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (6, N'Ngọc Hương 03', N'nữ', N'huognguyenak@gmail.com', N'Tân Bình', N'', N'')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (7, N'Ngọc Hương', N'nữ', N'huognguyenak96@gmail.com', N'Quận 1', N'', N'')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (8, N'hiếu', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'hoàn')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (9, N'hiếu', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'sa')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (10, N'hiếu', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'sadda')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (11, N'hieunguyen', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'asa')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (12, N'hieunguyen', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'adsas')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (13, N'hoàn', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'adfasd')
INSERT [dbo].[customers] ([id], [name], [gender], [email], [address], [phone], [note]) VALUES (14, N'hải', NULL, N'hieuntse62694@gmail.com', N'136/8 nguyễn tư giản', N'0966643044', N'dasdas')
SET IDENTITY_INSERT [dbo].[customers] OFF
SET IDENTITY_INSERT [dbo].[food_type] ON 

INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (1, N'Món Canh Bổ Dưỡng', N'Mùi thơm của cá quyện với vị ngọt của hoa thiên lý sẽ mang đến cho cả nhà một tô canh ngọt ngào và bổ dưỡng. Bạn có muốn biết thêm nhiều công thức món canh ngon hấp dẫn khác của người Việt Nam?', N'caloc-bongly.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (2, N'Bún, mì, miến, phở', N'Bánh canh, Bánh đa cua, Bún bò Huế, Bún bung', N'bun_mi_mien_pho.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (3, N'Cơm', N'Cơm bình dân với nhiều món ăn đa dạng, phong phú. Thông thường thực đơn sẽ bao gồm một dĩa cơm và một phần thức ăn theo lựa chọn, một bát canh.', N'com.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (4, N'Món ăn thường nhật', N'Sử dụng rất đa dạng các loại rau, củ, quả phối trộn với muối theo một tỉ lệ nhất định theo kinh nghiệm của người ẩm thực không quá mặn cũng không quá nhạt.', N'page2-img5.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (5, N'Xôi', N'Là một món ăn ngon, bổ, phổ thông, và rất được ưa chuộng như một đồ thờ cúng ngày lễ, tết, giỗ chạp, hoặc đi kèm với lợn sữa quay trên mâm đồ lễ ăn hỏi. Sử dụng thịt gấc để tạo màu sắc đỏ tươi tắn và hương vị thơm ngon cho món xôi.', N'xoi_ga10.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (6, N'Cháo, súp, canh', N'Gồm một nồi nước dùng đang sôi, các món ăn sống được để xung quanh và người ăn gắp đồ ăn sống bỏ vào nồi nước dùng, đợi chín tới và ăn nóng', N'chao_sup_canh.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (7, N'Món cuốn', N'Món ăn ngon, nổi tiếng của người Việt và được chế biến từ thịt, trứng, rau củ quả băm nhỏ trộn đều, gói trong bánh đa nem và rán giòn', N'mon_cuon.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (8, N'Bánh mặn', N'à loại bánh duy nhất có lịch sử lâu đời trong ẩm thực truyền thống Việt Nam còn được sử sách nhắc lại, bánh chưng có vị trí đặc biệt trong tâm thức của cộng đồng người Việt', N'banh_man.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (9, N'Xào', N'Một số loại lá được đốt lên lấy tro để ngâm cùng với gạo nếp tạo ra màu nâu vàng như màu hổ phách cũng như hương vị đặc trưng của bánh. Phổ biến nhất vẫn là cách gói bánh thuôn dài. Bánh ăn chấm đường hoặc mật ong,mật mía.', N'xao.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (10, N'Nước giải khát', N'Các loại nước giải khát', N'nuoc_giai_khat.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (11, N'Salát', N'Đây là một món ăn được nhiều người Việt Nam thích ăn. Có 2 nguyên liệu tạo nên hương vị đặc trưng cho món sa lát Nga. Đó là Sause Mayonnaise (có thể mua ở các siêu thị) và Jambon (mua ở các cửa hàng bán thực phẩm chín), còn các nguyên liệu khác là rau quả củ rất sẵn ', N'salat.jpg')
INSERT [dbo].[food_type] ([id], [name], [description], [image]) VALUES (12, N'Bào ngư', N'Đây là một món ăn ngon và bổ dưỡng,chế biến món ăn tốn khá nhiều thời gian cho khâu sơ chế và khâu nấu nướng,dưới đây là cách chế biến món bào ngư sốt dầu hào. ', N'bao_ngu.jpg')
SET IDENTITY_INSERT [dbo].[food_type] OFF
SET IDENTITY_INSERT [dbo].[foods] ON 

INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (1, 2, N'Bánh canh', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Được làm từ bột gạo, bột mì, hoặc bột sắn hoặc bột gạo pha bột sắn cán thành tấm và cắt ra thành sợi to và ngắn với nước dùng được nấu từ tôm, cá, giò heo... thêm gia vị tùy theo từng loại', 25000, 0, N'nước ngọt, khăn lạnh', N'Banh-Canh-Thit.jpg', CAST(N'2013-12-28' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (2, 10, N'Nước giải khác các loại', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Chèn thập cẩm, chè đâu xanh, trà sữa trân châu,... được chế biến từ chính các đầu bếp của nhà hàng chúng tôi.', 45000, 0, N'nước ngọt, khăn lạnh', N'nuoc_giai_khat_cac_loai.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (3, 2, N'Súp Gà Ngô non', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cách làm:\r\n\r\n\r\nĐun nước dùng sôi, cho thịt gà vào, nêm muối tiêu, đun sôi nhỏ lửa 10 phút. Nếu bạn sợ gà quá nhừ thì có thể vớt thịt gà ra.', 25000, 0, N'nước ngọt, khăn lạnh', N'sup_ngo_non.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (4, 1, N'Salát cà chua dưa chuột', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...Cách làm: dưa chuột cà chua, dứa, gọt vỏ, rửa sạch, thái lát mỏng. Bày xen kẽ các nguyên liệu trên theo hình tròn hoặc hình dẻ quạt.Tỏi, ớt đập dập, băm nhỏ, cho vào tô với một chút dấm đường và một chút muối. Quậy đều hỗn hợp trên, nếm thử thấy có vị chua, ngọt vừa ăn là được. Dội hỗn hợp trên vào đĩa nguyên liệu đã được trình bày.', 25000, 0, N'nước ngọt, khăn lạnh', N'salat_ca_chua_dua_chuot.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (5, 1, N'Nộm gà xé phay', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Nguyên liệu:\r\n250g thịt ức gà\r\n½ củ hành tây to (hoặc 1 củ nhỏ)\r\n½ củ cà rốt\r\n1 chút lạc rang\r\nRau mùi, húng\r\nNước mắm, chanh, đường', 80000, 0, N'nước ngọt, khăn lạnh', N'nom_ga_xe_phay.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (6, 2, N'Nem Phù đổng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Gọi một đĩa nem ốc mà phải đợi đến 15 phút. Nem được gói từ trước, đến khi khách gọi nhà hàng mới mang vào rán. Trong lúc đợi có thể gọi bún ốc, Gọi một đĩa nem ốc mà phải đợi đến 15 phút. Nem được gói từ trước, đến khi khách gọi nhà hàng mới mang vào rán. Trong lúc đợi có thể gọi bún ốc, ', 80000, 0, N'nước ngọt, khăn lạnh', N'nem-oc-phu-dong.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (7, 1, N'Tôm sú chiên trà', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Tôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên tràTôm sú chiên trà', 650000, 0, N'nước ngọt, khăn lạnh', N'tomsu-nuocdua.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (8, 2, N'Gà quay', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Xu hướng ẩm thực của nhà hàng Anh Em khá đa dạng, tuy nhiên, nổi bật nhất vẫn là những món quay với hương vị mới như gà quay sầu riêng, gà quay bọc xôi...Xu hướng ẩm thực của nhà hàng Anh Em khá đa dạng, tuy nhiên, nổi bật nhất vẫn là những món quay với hương vị mới như gà quay sầu riêng, gà quay bọc xôi...', 25000, 0, N'nước ngọt, khăn lạnh', N'ImageHandler.ashx.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (9, 1, N'Mực xào thập cẩm', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Mực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩm', 180000, 5, N'nước ngọt, khăn lạnh', N'muc_xao_tham_cap.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (10, 1, N'Mực xào thập cẩm', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Mực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩmMực xào thập cẩm', 180000, 5, N'nước ngọt, khăn lạnh', N'muc_xao_tham_cap.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (11, 1, N'Cải làn xào tỏi', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏiCải làn xào tỏi', 70000, 0, N'nước ngọt, khăn lạnh', N'cai_lan_xao_toi.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (12, 3, N'Canh chua ngao', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Canh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngaoCanh chua ngao', 90000, 0, N'nước ngọt, khăn lạnh', N'canh ngao.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (13, 2, N'Cơm tám', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'com_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpgcom_tam.jpg', 25000, 0, N'nước ngọt, khăn lạnh', N'com_tam.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (14, 1, N'Xôi Hoàng Phố', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Xôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng PhốXôi Hoàng Phố', 60000, 0, N'nước ngọt, khăn lạnh', N'xoi_hoang_pho.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (15, 2, N'Khăn lạnh', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Khăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnhKhăn lạnh', 2000, 0, N'nước ngọt, khăn lạnh', N'khen_lanh.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (16, 2, N'Dưa Vàng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Dưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa VàngDưa Vàng', 60000, 0, N'nước ngọt, khăn lạnh', N'dua_vang.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (17, 2, N'Nộm gà hoa chuối', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Nộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuốiNộm gà hoa chuối', 80000, 0, N'nước ngọt, khăn lạnh', N'nom_ga_hoa_chuoi.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (18, 3, N'Tôm sú nướng ngũ vị', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Tôm sú nướng ngũ vịTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị\r\nTôm sú nướng ngũ vị', 650000, 0, N'nước ngọt, khăn lạnh', N'tom_su_nuong_ngu_vi.jpg', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (19, 3, N'Gà nướng Phù Đổng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Gà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù ĐổngGà nướng Phù Đổng', 280000, 0, N'nước ngọt, khăn lạnh', N'ga_nuong_phu_dong.JPG', CAST(N'2013-12-29' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (20, 2, N'Bò xốt tiêu đen', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Bò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đenBò xốt tiêu đen', 150000, 0, N'nước ngọt, khăn lạnh', N'bo_sot_tieu_den.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (21, 2, N'Cá Điêu hồng chiên xù', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xùCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù\r\nCá Điêu hồng chiên xù', 2400000, 0, N'nước ngọt, khăn lạnh', N'ca_dieu_hong_chien_xu.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (22, 2, N'Ngô chiên', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Ngô chiênNgô chiênNgô chiênNgô chiênNgô chiên\r\nNgô chiênNgô chiên\r\nNgô chiên', 60000, 0, N'nước ngọt, khăn lạnh', N'ngochien.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (23, 2, N'Ngọn susu xào tỏi', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Ngọn susu xào tỏi Ngọn susu xào tỏi Ngọn susu xào tỏi\r\nNgọn susu xào tỏi Ngọn susu xào tỏi Ngọn susu xào tỏi', 45000, 0, N'nước ngọt, khăn lạnh', N'susu_xao_toi.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (24, 2, N'Canh bóng mọc thập cẩm', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Canh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm\r\nCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm\r\nCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩmCanh bóng mọc thập cẩm', 60000, 0, N'nước ngọt, khăn lạnh', N'canh_bong_moc_thap_cam.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (25, 2, N'Cơm tám', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám \r\nCơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám \r\nCơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám Cơm tám ', 30000, 0, N'nước ngọt, khăn lạnh', N'com_tam_ga.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (26, 2, N'Xôi vò hạt sen', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Xôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen\r\nXôi vò hạt sen', 60000, 0, N'nước ngọt, khăn lạnh', N'xoi_vo_hat_sen.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (27, 2, N'Gỏi mướp đắng ruốc', N'Nguyên liệu\n\nMướp đắng: 2 quả, ruốc thịt heo: 50g, đá bào: 500g, nilon bọc đồ ăn, hoa cà rốt trang trí.', N'Cách chế biến\n\nMướp đắng rửa sạch, để ráo. Bổ đôi quả theo chiều dọc, sau đó xát thành từng lát mỏng 0,8 mm theo chiều ngang quả mướp. Đá cây bào mỏng, cho vào đĩa sâu lòng, bọc nilon mỏng kín mặt đĩa, xếp mướp đắng lên trên, trình bày cho đẹp mắt. Để khoảng 30 phút cho mướp mát lạnh. Nếu đã tan hết thì thay lượt đá khác với cách làm tương tự. Sau đó rắc ruốc thịt heo xé tơi lên trên.', 50000, 0, N'nước ngọt, khăn lạnh', N'goi muop dang ruoc.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (28, 2, N'Dưa hấu', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Dưa hấu Dưa hấuDưa hấu Dưa hấuDưa hấu Dưa hấuDưa hấu Dưa hấu\r\nDưa hấu Dưa hấuDưa hấu Dưa hấu', 50000, 0, N'nước ngọt, khăn lạnh', N'dua_hau.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (29, 2, N'Súp ngô cua', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua Súp ngô cua', 30000, 0, N'nước ngọt, khăn lạnh', N'sup_ngo_cua.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (30, 2, N'Salad Phù Đổng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng Salad Phù Đổng', 120000, 0, N'nước ngọt, khăn lạnh', N'salat.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (31, 2, N'Tôm sú rang muối tiêu', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Tôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu\r\nTôm sú rang muối tiêu', 650000, 0, N'nước ngọt, khăn lạnh', N'tom_su_rang_muoi.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (32, 2, N'Gà nướng Phù Đổng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Gà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng\r\nGà nướng Phù Đổng', 280000, 0, N'nước ngọt, khăn lạnh', N'ga_nuong_pd.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (33, 2, N'Cua bấy chiên bơ', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ\r\nCua bấy chiên bơ', 70000, 0, N'nước ngọt, khăn lạnh', N'cua_bay_chien_bo.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (34, 2, N'Bò lúc lắc khoai tây', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Bò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây\r\nBò lúc lắc khoai tây', 150000, 0, N'nước ngọt, khăn lạnh', N'bo_luc_lac_khoai_tay.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (35, 2, N'Hoa lơ xanh xào tỏi', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Hoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi\r\nHoa lơ xanh xào tỏi', 70000, 0, N'nước ngọt, khăn lạnh', N'bong_cai_xanh.png', CAST(N'2013-12-30' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (36, 2, N'Canh mọc tôm cua', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Canh mọc tôm cua\r\nCanh mọc tôm cuaCanh mọc tôm cua', 32000, 0, N'nước ngọt, khăn lạnh', N'canh_moc_tom_cua.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (37, 2, N'Cơm chiên Hạnh Phúc', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc\r\nCơm chiên Hạnh Phúc', 60000, 0, N'nước ngọt, khăn lạnh', N'com_hanh_phuc.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (38, 2, N'Bánh trưng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Bánh trưng Bánh trưng\r\nBánh trưng Bánh trưng Bánh trưng\r\nBánh trưng Bánh trưng\r\nBánh trưng Bánh trưng Bánh trưng', 60000, 0, N'nước ngọt, khăn lạnh', N'banh_chung.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (39, 2, N'Kem Caramen', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Kem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen\r\nKem Caramen Kem Caramen Kem Caramen', 12000, 0, N'nước ngọt, khăn lạnh', N'kem-caramen.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (40, 2, N'Súp Hải sản', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Súp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản', 50000, 0, N'nước ngọt, khăn lạnh', N'sup_hai_san.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (41, 2, N'Súp Hải sản', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Súp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản\r\nSúp Hải sản Súp Hải sản Súp Hải sản', 50000, 0, N'nước ngọt, khăn lạnh', N'sup_hai_san.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (42, 2, N'Salad Cá Ngừ', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Salad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ\r\nSalad Cá Ngừ Salad Cá Ngừ', 98000, 0, N'nước ngọt, khăn lạnh', N'salad_ca_ngu.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (43, 2, N'Tôm sú hấp nước dừa', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Tôm sú hấp nước dừa\r\nTôm sú hấp nước dừa\r\nTôm sú hấp nước dừa\r\nTôm sú hấp nước dừa', 650000, 0, N'nước ngọt, khăn lạnh', N'tom_su_hap_nuoc_dua.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (44, 2, N'Gà hấp lá chanh', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Gà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh\r\nGà hấp lá chanh', 320000, 0, N'nước ngọt, khăn lạnh', N'ga_hap_la_canh.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (45, 2, N'Cá tầm nướng', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng\r\nCá tầm nướng Cá tầm nướng', 320000, 0, N'nước ngọt, khăn lạnh', N'ca_tam_nuong.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (46, 2, N'Bò Úc bít tết', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Bò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết', 220000, 0, N'nước ngọt, khăn lạnh', N'bo_uc_bit_tet.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (47, 2, N'Bò Úc bít tết', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Bò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết\r\nBò Úc bít tết Bò Úc bít tết Bò Úc bít tết', 220000, 0, N'nước ngọt, khăn lạnh', N'bo_uc_bit_tet.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (48, 4, N'Rau cải chíp xào thịt hộp', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp\r\nRau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp Rau cải chíp xào thịt hộp', 80000, 0, N'nước ngọt, khăn lạnh', N'rau_cai_chip_vao_thit_hop.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (49, 5, N'Canh gà nấm tươi', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Canh gà nấm tươi Canh gà nấm tươi Canh gà nấm tươi\r\nCanh gà nấm tươi Canh gà nấm tươi Canh gà nấm tươi', 70000, 0, N'nước ngọt, khăn lạnh', N'canh_ga_nam_tuoi.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (50, 6, N'Cơm rang Hải sản', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Cơm rang Hải sản Cơm rang Hải sản Cơm rang Hải sản\r\nCơm rang Hải sản Cơm rang Hải sản Cơm rang Hải sản', 80000, 0, N'nước ngọt, khăn lạnh', N'com_rang_hai_san.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (51, 6, N'Xôi lạp sườn', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Xôi lạp sườn Xôi lạp sườn Xôi lạp sườn\r\nXôi lạp sườn Xôi lạp sườn Xôi lạp sườn\r\nXôi lạp sườn Xôi lạp sườn Xôi lạp sườn', 60000, 0, N'nước ngọt, khăn lạnh', N'xoi_lap_suon.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (52, 6, N'Hoa quả thập cẩm', N'Nguyên liệu: 3 quả dưa chuột, 3 quả cà chua, 1/2 quả dứa, xà lách xoăn, hành tây, tỏi, đường, dấm, ớt...', N'Hoa quả thập cẩm Hoa quả thập cẩm Hoa quả thập cẩm\r\nHoa quả thập cẩm Hoa quả thập cẩm Hoa quả thập cẩm', 65000, 0, N'nước ngọt, khăn lạnh', N'hoa_qua_thap_cam.jpg', CAST(N'2013-12-30' AS Date), N'đĩa', 0)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (53, 4, N'Salat Tôm trái thơm', N'Tôm để làm salad nên chọn tôm tươi, thích nhất vẫn là loại tôm đang bơi lội tung tăng khi ra chợ', N'Nguyên liệu:\r\n\r\n* Nước trộn:\r\n\r\n- 80ml dấm gạo\r\n\r\n- 60ml xì dầu\r\n\r\n- 2 tbs mật ong\r\n\r\n- 1 tsp dầu vừng\r\n\r\n- 1 – 2 tsp gừng băm nhỏ\r\n\r\n- 4, 5 tép tỏi, băm nhỏ', 150000, 0, N'nước uống, khen lạnh', N'salad_tom_thai_thom.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (54, 4, N'Bào Ngư xào song nấm', N'Dùng nóng với cơm và chấm kèm nước tương. ', N'Nguyên liệu- 1 hộp bầu ngư - 10 tai nấm đông cô - 1 hủ hay 1 hộp măng tây - củ hành,- muối ,tiêu, bột bouillons de volaille ( hoặc bột ngọt ),- 1 muỗng súp dầu mè,- 1 muỗng súp dầu hào.- Dầu ăn- 1 muổng súp bột maïzenna - Chút ngò , hành lá ', 300000, 0, N'nước uống, khen lạnh', N'nam bao ngu xao toi.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (55, 4, N'Bào Ngư sốt dầu hào nguyên con', N'Đây là một món ăn ngon và bổ dưỡng,chế biến món ăn tốn khá nhiều thời gian cho khâu sơ chế và khâu nấu nướng,dưới đây là cách chế biến món bào ngư sốt dầu hào. ', N'Nguyên liệu:\r\n\r\n    Bào ngư 4 con\r\n    gà mái 1 con\r\n    thịt nạc 300g\r\n    sò điệp khô 3 con\r\n    Hành lá 1 tép\r\n    Nước dùng gà\r\n    jambon Kim Hoa 50g\r\n    dầu hào\r\n    dầu mè\r\n    bột năng\r\n    một miếng phên tre nếu không có thì dùng mấy chiếc xiên bằng tre', 250000, 0, N'nước uống, khen lạnh', N'bao_ngu_sot_dau_hao.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (56, 4, N'Bào Ngư om cải xanh', N'Nguyên liệu: 500g bào ngư Úc 300g rau cải xanh Nước xương gà, hành khô, gừng, mắm, muối, mì chính. ', N'YÊU CẦU THÀNH PHẨM:\r\n\r\nThơm ngon , nước trong mà vẫn ngọt đặc trưng. Có thể cho thêm nấm hương để tăng thêm độ hấp dẫn. Trang trí thêm hoa cà rốt cho bắt mắt.\r\n\r\nMón này dùng làm món khai vị (thay súp). ', 180000, 0, N'nước uống, khen lạnh', N'bao_ngu_om_cai_xanh.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (57, 4, N'Bào Ngư sốt nấm', N'Bắc nồi lên bếp, cho mỡ gà vào thắng lấy nước. ', N'Nguyên liệu:\r\n- 500g nấm hương\r\n- 2 chai nước bào ngư\r\n- 100g bông cải xanh\r\n- 300g nước dùng gà\r\n- 50g dầu hàu\r\n- 150g mỡ gà\r\n- 5g muối\r\n- 50g gừng, hành tây', 190000, 0, N'nước uống, khen lạnh', N'bao_ngu_sot_nam.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (58, 4, N'Gỏi mướp đắng ruốc', N'Mướp đắng ướp đá ruốc không chỉ là món ăn đơn giản, ngon miệng mà còn rất tốt cho sức khỏe. ', N'Nguyên liệu\r\n\r\nMướp đắng: 2 quả, ruốc thịt heo: 50g, đá bào: 500g, nilon bọc đồ ăn, hoa cà rốt trang trí.', 12000, 0, N'nước uống, khen lạnh', N'goi-kho-qua-muop-dang.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (59, 4, N'Nộm bò rau muống', N'Món này ăn rau muống giòn cực như ăn rau sống ý. Mùa hè ăn thế này thấy mát mát và mát mắt nữa vì đủ màu, xanh, đỏ, nâu, trắng. Thịt bò cũng chua chua ngọt ngọt. ', N'Nguyên liệu:\r\n\r\nRau muống: sơ mới ½ mớ\r\nGiá đỗ: 1 ít thôi\r\nCà rốt: thái mỏng dài bằng giá đỗ.\r\nThịt thăn bò, dứa ½ quả\r\nLạc rang giã dập\r\nMuối, cốt chanh, đường, ớt xay.', 80000, 0, N'nước uống, khen lạnh', N'nom_bo_rau_muong.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (60, 4, N'Nộm gà hoa chuối', N'Nộm gà hoa chuối làm không quá cầu kỳ nhưng để để món ăn có được nhiều hương vị phong phú, bạn cần chuẩn bị nhiều loại nguyên liệu khác nhau. ', N'Nguyên liệu: Thịt gà (lườn): 150 g, cà rốt bào sợi: một củ, hoa chuối: 300 g, chanh: một quả, đường: 3 thìa canh, giấm: 3 thìa canh, muối: 2 thìa cà phê, mắm: 2 thìa canh, lá chanh: 5 lá, hành tây: một củ, rau răm, tỏi, ớt, lạc, hành, tiêu, rau mùi, thơm, xà lách, cà chua.', 50000, 0, N'nước uống, khen lạnh', N'nom_ga_rau_chuoi.jpg', CAST(N'2013-12-31' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (61, 6, N'Xôi gà', N'Nộm gà hoa chuối làm không quá cầu kỳ nhưng để để món ăn có được nhiều hương vị phong phú, bạn cần chuẩn bị nhiều loại nguyên liệu khác nhau. ', N'Nguyên liệu: Thịt gà (lườn): 150 g, cà rốt bào sợi: một củ, hoa chuối: 300 g, chanh: một quả, đường: 3 thìa canh, giấm: 3 thìa canh, muối: 2 thìa cà phê, mắm: 2 thìa canh, lá chanh: 5 lá, hành tây: một củ, rau răm, tỏi, ớt, lạc, hành, tiêu, rau mùi, thơm, xà lách, cà chua.', 25000, 0, N'nước ngọt, khăn lạnh', N'xoi_ga.jpg', CAST(N'2014-01-03' AS Date), N'đĩa', 1)
INSERT [dbo].[foods] ([id], [id_type], [name], [summary], [detail], [price], [promotion_price], [promotion], [image], [update_at], [unit], [today]) VALUES (62, 1, N'ốc bươu kho gừng ', N'Món ốc đậm đà thấm vị, thịt giòn ngọt, thơm và ấm vị gừng. Mùa mưa đang đến, ngồi bên mâm cơm gia đình với món Ốc bươu kho gừng thơm lừng sẽ giúp không khí cả gia đình bạn ấm cúng lắm đó.', N'Để chế biến món ăn này, chúng ta cần các nguyên liệu sau đây:\r\n- Ốc bươu bỏ phần ốc bùn phía dưới, xát thịt ốc với ít muối và ít giấm rửa sạch nhớt, để ráo. Ướp với 1m bột ngọt AJI-NO-MOTO®, 1M nước mắm, 1m giấm gạo lên men LISA, 2M hành tỏi băm, gừng sợi và ớt hiểm.\r\n- Gừng thái chỉ. Ớt hiểm đập dập.\r\nCách chế biến\r\n- Dùng tộ đất cho 1M dầu, 1M đường thắng caramel, thêm 1M dầu điều, cho ốc bươu vào xào săn, kho nhỏ lửa đến khi ốc vừa chín, nước kho cạn sệt.\r\nThưởng thức\r\n- Bày ra đĩ', 50000, 0, N'0', N'oc-buou-kho-gung.jpg', CAST(N'2014-04-21' AS Date), N'món', 1)
SET IDENTITY_INSERT [dbo].[foods] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (1, N'Thực đơn 1', 1194000, 0, N'Súp Gà Ngô non, N?m gà xé phay, Tôm sú chiên trà, M?c xào th?p c?m, C?i làn xào t?i', N'thuc_don_1.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (2, N'Thực đơn 2', 1327000, 0, N'C?i làn xào t?i, Com tám, Xôi Hoàng Ph?, Dua Vàng, N?m gà hoa chu?i', N'thuc_don_2.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (3, N'Thực đơn 3', 170600, 0, N'Tôm sú nu?ng ngu v?, Gà nu?ng Phù Ð?ng, Bò x?t tiêu den, Cá Ðiêu h?ng chiên xù.', N'thuc_don_3.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (4, N'Thực đơn 4', 2185000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_4.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (5, N'Thực đơn 5', 2180000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_5.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (6, N'Thực đơn 6', 2690000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_6.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (7, N'Thực đơn 7', 2890000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_7.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (8, N'Thực đơn 8', 1980000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_8.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (9, N'Thực đơn 9', 1780000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_9.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (10, N'Thực đơn 10', 1780000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_10.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (11, N'Thực đơn 11', 1890000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_11.jpg')
INSERT [dbo].[menu] ([id], [name], [price], [promotion_price], [detail], [image]) VALUES (12, N'Thực đơn 12', 1890000, 0, N'Các món an theo th?c don dã ch?n, ch? bi?n ngon, d?p, d?y d?n, ph?c v? nóng<br>\nKhuy?n mãi: khan l?nh, món tráng mi?ng', N'thuc_don_12.jpg')
SET IDENTITY_INSERT [dbo].[menu] OFF
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (1, 3, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (1, 7, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (1, 8, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (1, 9, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (1, 17, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 11, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 13, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 14, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 15, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 16, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (2, 17, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 18, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 19, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 20, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 21, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 22, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (3, 30, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 17, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 23, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 24, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 25, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 26, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (4, 27, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 18, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 28, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 29, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 31, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 32, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (5, 33, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 18, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 34, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 35, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 36, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 37, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (6, 38, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 39, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 40, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 41, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 42, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 43, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (7, 44, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 45, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 46, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 47, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 48, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 49, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (8, 50, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 51, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 52, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 53, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 54, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 55, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (9, 56, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 1, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 58, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 59, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 60, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 61, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (10, 62, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 22, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 24, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 26, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 28, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 30, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (11, 32, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 2, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 8, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 16, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 22, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 32, 1)
INSERT [dbo].[menu_detail] ([id_menu], [id_food], [quantity]) VALUES (12, 48, 1)
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'editor', N'mon_an_trong_ngay', N'index')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'editor', N'tin_tuc', N'index,them,cap-nhat,xoa')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'guest', N'mon_an', N'index')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'guest', N'mon_an_trong_ngay', N'index')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'staff', N'khach_hang', N'index,them,xoa,cap-nhat,chi-tiet')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'staff', N'mon_an', N'index,them,xoa,cap-nhat')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'staff', N'mon_an_trong_ngay', N'index')
INSERT [dbo].[role_resource] ([role], [resource], [allow]) VALUES (N'staff', N'thuc_don', N'index,them-thuc-don,chi-tiet,them-mon,xoa,cap-nhat')
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [fullname], [birthdate], [gender], [address], [email], [phone], [role]) VALUES (1, N'hoahong', N'$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', N'Trần Thị Hoa', CAST(N'1995-01-01' AS Date), N'nam', N'Lê Hồng Phong', N'hoa@gmail.com', N'123456789', N'staff')
INSERT [dbo].[users] ([id], [username], [password], [fullname], [birthdate], [gender], [address], [email], [phone], [role]) VALUES (2, N'thuhong', N'$2y$10$d3DIfnUu7gS4nEQT8XhbwO3NVio61M/ic4EB28YNecTVZH9OkwHry', N'Nguyễn Thu Hồng Hồng', CAST(N'1994-01-01' AS Date), N'nữ', N'Trần Hưng Đạo', N'thu@yahoo.com', N'123456789', N'admin')
INSERT [dbo].[users] ([id], [username], [password], [fullname], [birthdate], [gender], [address], [email], [phone], [role]) VALUES (3, N'hoang', N'$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', N'duong ngoc hoang', CAST(N'1977-09-08' AS Date), N'nam', N'Đường 27, Sơn kỳ, Tân Phú', N'hoang@gmail.com', N'34567890', N'editor')
INSERT [dbo].[users] ([id], [username], [password], [fullname], [birthdate], [gender], [address], [email], [phone], [role]) VALUES (4, N'huonghuong', N'$2y$10$R6ZXeWJRsVkaM/cfCR28Weao/FqyCcQVFdkfIk1cXBrFL1UE81YSK', N'Hương Hương', CAST(N'2017-09-14' AS Date), N'nữ', N'Lê Thị Riêng', N'huongnguyenak96@gmail.com', N'11111111111', N'admin')
INSERT [dbo].[users] ([id], [username], [password], [fullname], [birthdate], [gender], [address], [email], [phone], [role]) VALUES (5, N'hieu', N'202cb962ac59075b964b07152d234b70', N'Trung Hiếu', CAST(N'2017-09-14' AS Date), N'nam', N'Nguyễn Tư Giản', N'hieuntse62694@gmail.com', N'0966643044', N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bills] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bills] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bills]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_foods] FOREIGN KEY([id_food])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_foods]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FK_bills_customers] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FK_bills_customers]
GO
ALTER TABLE [dbo].[foods]  WITH CHECK ADD  CONSTRAINT [FK_foods_food_type] FOREIGN KEY([id_type])
REFERENCES [dbo].[food_type] ([id])
GO
ALTER TABLE [dbo].[foods] CHECK CONSTRAINT [FK_foods_food_type]
GO
ALTER TABLE [dbo].[menu_detail]  WITH CHECK ADD  CONSTRAINT [FK_menu_detail_foods] FOREIGN KEY([id_food])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[menu_detail] CHECK CONSTRAINT [FK_menu_detail_foods]
GO
ALTER TABLE [dbo].[menu_detail]  WITH CHECK ADD  CONSTRAINT [FK_menu_detail_menu] FOREIGN KEY([id_menu])
REFERENCES [dbo].[menu] ([id])
GO
ALTER TABLE [dbo].[menu_detail] CHECK CONSTRAINT [FK_menu_detail_menu]
GO
USE [master]
GO
ALTER DATABASE [project2] SET  READ_WRITE 
GO
