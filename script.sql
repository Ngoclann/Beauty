USE [master]
GO
/****** Object:  Database [Beauty]    Script Date: 7/28/2020 3:59:21 PM ******/
CREATE DATABASE [Beauty]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Beauty', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Beauty.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Beauty_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Beauty_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Beauty] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Beauty].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Beauty] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Beauty] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Beauty] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Beauty] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Beauty] SET ARITHABORT OFF 
GO
ALTER DATABASE [Beauty] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Beauty] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Beauty] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Beauty] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Beauty] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Beauty] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Beauty] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Beauty] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Beauty] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Beauty] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Beauty] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Beauty] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Beauty] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Beauty] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Beauty] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Beauty] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Beauty] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Beauty] SET RECOVERY FULL 
GO
ALTER DATABASE [Beauty] SET  MULTI_USER 
GO
ALTER DATABASE [Beauty] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Beauty] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Beauty] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Beauty] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Beauty] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Beauty', N'ON'
GO
ALTER DATABASE [Beauty] SET QUERY_STORE = OFF
GO
USE [Beauty]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[bid] [nvarchar](3) NOT NULL,
	[bname] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[cusAccount] [varchar](20) NOT NULL,
	[pid] [nvarchar](6) NOT NULL,
	[quantity] [int] NOT NULL,
	[totalMoney] [float] NULL,
	[dateOrder] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [nvarchar](6) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[typeid] [nvarchar](3) NOT NULL,
	[brand] [nvarchar](20) NOT NULL,
	[image] [nvarchar](100) NULL,
	[price] [float] NOT NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[tid] [nvarchar](3) NOT NULL,
	[tname] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/28/2020 3:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admins] ([username], [password]) VALUES (N'didi', N'didi')
INSERT [dbo].[Admins] ([username], [password]) VALUES (N'lan', N'123456')
INSERT [dbo].[Brands] ([bid], [bname]) VALUES (N'bio', N'Bioderma')
INSERT [dbo].[Brands] ([bid], [bname]) VALUES (N'inn', N'innisfree')
INSERT [dbo].[Brands] ([bid], [bname]) VALUES (N'lar', N'La Roche-Posay')
INSERT [dbo].[Brands] ([bid], [bname]) VALUES (N'pau', N'Paula s Choice')
INSERT [dbo].[Brands] ([bid], [bname]) VALUES (N'vic', N'Vichy')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (1, N'Ngoclann', N'hai001', 1, 19, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (2, N'Ngoclann', N'hai003', 1, 29, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (3, N'Ngoclann', N'hai005', 1, 15, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (4, N'Ngoclann', N'hai009', 1, 19, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (5, N'Ngoclann', N'hai001', 1, 19, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (6, N'Ngoclann', N'hai009', 2, 38, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (7, N'Ngoclann', N'hai005', 1, 15, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (8, N'Ngoclann', N'hai003', 1, 29, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (9, N'Ngoclann', N'mas006', 1, 37, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (10, N'Ngoclann', N'moi005', 1, 40, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Orders] ([orderId], [cusAccount], [pid], [quantity], [totalMoney], [dateOrder]) VALUES (11, N'Ngoclann', N'moi012', 1, 42, CAST(N'2020-07-21' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai001', N'My Hair Recipe Repairing Hair Sleeping Pack 100ml', N'hai', N'innisfree', N'product/hai/hai1.jpg', 19, 13)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai002', N'Dercos Technique Anti-dandruff Sensitive Shampoo 200ml', N'hai', N'Vichy', N'product/hai/hai2.jpg', 25, 7)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai003', N'Smooth Finish Conditioner', N'hai', N'Paula s Choice', N'product/hai/hai3.jpg', 29, 15)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai004', N'Dercos Technique Energising Shampoo 200ml', N'hai', N'Vichy', N'product/hai/hai4.jpg', 25, 2)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai005', N'My Hair Recipe Moisturizing Shampoo [for Dry Hair] 330ml', N'hai', N'innisfree', N'product/hai/hai5.jpg', 15, 45)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai006', N'My Hair Recipe Refreshing Shampoo [for Oily Scalp] 330ml', N'hai', N'innisfree', N'product/hai/hai6.jpg', 15, 49)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai007', N'Camellia Essential Hair Oil Serum 100ml', N'hai', N'innisfree', N'product/hai/hai7.jpg', 15, 29)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai008', N'Green Tea Fresh Conditioner 200ml', N'hai', N'innisfree', N'product/hai/hai8.jpg', 14, 6)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'hai009', N'My Hair Recipe Curl Up Hair Mist [for Permed & Curly Hair] 150ml', N'hai', N'innisfree', N'product/hai/hai9.jpg', 19, 23)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak001', N'Vivid Cotton Ink 4g', N'mak', N'innisfree', N'product/mak/mak1.jpg', 15, 103)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak002', N'Green Tea Lip Balm 3.6 g', N'mak', N'innisfree', N'product/mak/mak2.jpg', 13, 8)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak003', N'On-The-Go Shielding Powder Spf 30', N'mak', N'Paula s Choice', N'product/mak/mak3.jpg', 40, 9)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak004', N'HELLO 2020 Disney Collection – Pore Blur Powder 11g (Mickey Mouse) Limited Edition', N'mak', N'innisfree', N'product/mak/mak4.jpg', 24, 71)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak005', N'My Concealer Wide Cover 7g', N'mak', N'innisfree', N'product/mak/mak5.jpg', 16, 40)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mak006', N'Auto Eyebrow Pencil 0.3g', N'mak', N'innisfree', N'product/mak/mak6.jpg', 6, 55)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas001', N'Second Skin Mask (moisturizing) 20G x 2pcs', N'mas', N'innisfree', N'product/mas/mas1.jpg', 14, 57)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas002', N'Radiance Renewal Mask', N'mas', N'Paula s Choice', N'product/mas/mas2.jpg', 58, 30)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas003', N'Special Care Mask [Hand] 20ml x 3 pcs', N'mas', N'innisfree', N'product/mas/mas3.jpg', 12, 18)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas004', N'Super Hydrate Overnight Mask', N'mas', N'Paula s Choice', N'product/mas/mas4.jpg', 50, 68)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas005', N'Special Care Mask Foot 20ml x 3pcs', N'mas', N'innisfree', N'product/mas/mas5.jpg', 12, 46)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'mas006', N'Skin Recovery Hydrating Treatment Mask', N'mas', N'Paula s Choice', N'product/mas/mas6.jpg', 37, 22)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi001', N'Hydraphase Moisturiser Intense Light 50ml [Dry Skin]', N'moi', N'La Roche-Posay', N'product/moi/moi1.jpg', 45, 4)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi002', N'Aqualia Thermal Rehydrating Gel Cream', N'moi', N'Vichy', N'product/moi/moi2.jpg', 48, 15)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi003', N'Hydrabio H2O Moisturising Non-Rinse Makeup Removing Micellar Water', N'moi', N'Bioderma', N'product/moi/moi3.jpg', 45, 40)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi004', N'Probiotic Nutrient Moisturizer', N'moi', N'Paula s Choice', N'product/moi/moi4.jpg', 67, 29)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi005', N'Skin Balancing Invisible Finish Moisture Gel', N'moi', N'Paula s Choice', N'product/moi/moi5.jpg', 40, 33)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi006', N'Resist Barrier Repair Moisturizer', N'moi', N'Paula s Choice', N'product/moi/moi6.jpg', 44, 2)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi007', N'Aqualia Thermal Dynamic Hydration Emulsion 50ml', N'moi', N'Vichy', N'product/moi/moi7.jpg', 48, 3)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi008', N'Redermic C Face Moisturiser 40ml [Anti-aging]', N'moi', N'La Roche-Posay', N'product/moi/moi8.jpg', 90, 10)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi009', N'Toleriane Moisturiser Ultra Night 40ml [Allergic-Prone Skin]', N'moi', N'La Roche-Posay', N'product/moi/moi9.jpg', 43, 38)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi010', N'Hydralight Moisture Infusing Lotion', N'moi', N'Paula s Choice', N'product/moi/moi10.jpg', 45, 21)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi011', N'Moisture Boost Hydrating Treatment Cream', N'moi', N'Paula s Choice', N'product/moi/moi11.jpg', 40, 28)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'moi012', N'Earth Sourced Antioxidant-Enriched Natural Moisturizer', N'moi', N'Paula s Choice', N'product/moi/moi12.jpg', 42, 16)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun001', N'Intensive Triple Care Sunscreen 50ml', N'sun', N'innisfree', N'product/sun/sun1.jpg', 22, 42)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun002', N'Anthelios Shaka Fluid SPF 50+ Waterproof Sunscreen 50ml', N'sun', N'La Roche-Posay', N'product/sun/sun2.jpg', 47, 28)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun003', N'Capital Soleil Mattifying Dry Touch Sunscreen SPF 50+ (50ml)', N'sun', N'Vichy', N'product/sun/sun3.jpg', 39, 11)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun004', N'Photoderm Aquafluid Suncare for Face SPF 50+ (Sensitive Skin) 40ml', N'sun', N'Bioderma', N'product/sun/sun4.jpg', 40, 5)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun005', N'Resist Super-Light Daily Wrinkle Defense SPF 30', N'sun', N'Paula s Choice', N'product/sun/sun5.jpg', 44, 9)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun006', N'Anthelios Dermo-Pediatrics Water Resistant Sunscreen SPF50+ 250ml', N'sun', N'La Roche-Posay', N'product/sun/sun6.jpg', 50, 3)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun007', N'UV Protect Skin Defense Daily Care Antishine Cream, 40ml', N'sun', N'Vichy', N'product/sun/sun7.jpg', 36, 19)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'sun008', N'Defense Essential Glow Moisturizer Spf 30', N'sun', N'Paula s Choice', N'product/sun/sun8.jpg', 15, 47)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'ton001', N'Normaderm Purifying Pore-tightening Toner, 200ml', N'ton', N'Vichy', N'product/ton/ton1.jpg', 32, 4)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'ton002', N'Resist Weightless Advanced Repairing Toner', N'ton', N'Paula s Choice', N'product/ton/ton2.jpg', 39, 65)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'ton003', N'Perfect 9 Repair Skin EX 200ml', N'ton', N'innisfree', N'product/ton/ton3.jpg', 55, 15)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'ton004', N'Physiological Soothing Toner 200ml [Sensitive Skin]', N'ton', N'La Roche-Posay', N'product/ton/ton4.jpg', 30, 1)
INSERT [dbo].[Products] ([pid], [pname], [typeid], [brand], [image], [price], [stock]) VALUES (N'ton005', N'Sebium Hydrating and Mattifying Toner (Oily to Acne-Prone Skin) 200ml', N'ton', N'Bioderma', N'product/ton/ton5.jpg', 34, 7)
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'hai', N'Hair Care')
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'mak', N'Makeup')
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'mas', N'Mask')
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'moi', N'Moisturizer')
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'sun', N'Sun Care')
INSERT [dbo].[ProductType] ([tid], [tname]) VALUES (N'ton', N'Toner')
INSERT [dbo].[Users] ([username], [password], [email]) VALUES (N'Ngoclann', N'Violin2', N'junebride09.02@gmail.com')
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cusAccount])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brand])
REFERENCES [dbo].[Brands] ([bname])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([typeid])
REFERENCES [dbo].[ProductType] ([tid])
GO
USE [master]
GO
ALTER DATABASE [Beauty] SET  READ_WRITE 
GO
