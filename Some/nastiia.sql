USE [master]
GO
/****** Object:  Database [DB]    Script Date: 5/31/2021 11:39:19 PM ******/
CREATE DATABASE [DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB] SET RECOVERY FULL 
GO
ALTER DATABASE [DB] SET  MULTI_USER 
GO
ALTER DATABASE [DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB', N'ON'
GO
ALTER DATABASE [DB] SET QUERY_STORE = OFF
GO
USE [DB]
GO
/****** Object:  Rule [Above_zero]    Script Date: 5/31/2021 11:39:20 PM ******/
CREATE RULE [dbo].[Above_zero] 
AS
@col >= 1
GO
/****** Object:  Rule [Non_negative]    Script Date: 5/31/2021 11:39:20 PM ******/
CREATE RULE [dbo].[Non_negative] 
AS
@col >= 0
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[base_id] [int] NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[address] [varchar](100) NOT NULL,
	[date] [datetime] NOT NULL,
	[parcel_number] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[provider_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [XPKDelivery] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_type]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [XPKOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_products]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_products](
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[number] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[number] [int] NOT NULL,
	[description] [text] NOT NULL,
	[category_id] [int] NOT NULL,
	[manufacturer_id] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[provider_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[name] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [XPKRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_]    Script Date: 5/31/2021 11:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[login] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (1, NULL, N'Houseplants')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (2, 1, N'Dracaena')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (3, 1, N'Cacti')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (4, 1, N'Ficus')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (5, 4, N'Ficus_benjamina')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (8, 3, N'Echinocactus_grusonii')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (9, 3, N'Euphorbia_obesa')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (10, 2, N'Dracaena_marginata')
INSERT [dbo].[Category] ([id], [base_id], [name]) VALUES (1004, NULL, N'')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Delivery] ([address], [date], [parcel_number], [type_id], [provider_id], [order_id]) VALUES (N'1111', CAST(N'2222-07-22T00:00:00.000' AS DateTime), 1, 1, 1, 2)
INSERT [dbo].[Delivery] ([address], [date], [parcel_number], [type_id], [provider_id], [order_id]) VALUES (N'33', CAST(N'2222-07-22T00:00:00.000' AS DateTime), 23, 1, 2, 4)
GO
SET IDENTITY_INSERT [dbo].[Delivery_type] ON 

INSERT [dbo].[Delivery_type] ([type_id], [name]) VALUES (1, N'post_office')
INSERT [dbo].[Delivery_type] ([type_id], [name]) VALUES (2, N'home_delivery')
SET IDENTITY_INSERT [dbo].[Delivery_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([id], [name], [country]) VALUES (1, N'Plantest', N'USA')
INSERT [dbo].[Manufacturer] ([id], [name], [country]) VALUES (2, N'RosliniVDomi', N'Ukraine')
INSERT [dbo].[Manufacturer] ([id], [name], [country]) VALUES (3, N'KvitkaShop', N'Polsha')
INSERT [dbo].[Manufacturer] ([id], [name], [country]) VALUES (4, N'HousePlants', N'USA')
INSERT [dbo].[Manufacturer] ([id], [name], [country]) VALUES (5, N'Flori', N'Moldova')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_] ON 

INSERT [dbo].[Order_] ([id], [date], [status_id], [user_id]) VALUES (2, CAST(N'2222-05-04T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Order_] ([id], [date], [status_id], [user_id]) VALUES (4, CAST(N'3333-04-03T00:00:00.000' AS DateTime), 1, 6)
SET IDENTITY_INSERT [dbo].[Order_] OFF
GO
INSERT [dbo].[Order_products] ([product_id], [order_id], [price], [number]) VALUES (1, 2, CAST(5040.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Order_products] ([product_id], [order_id], [price], [number]) VALUES (2, 2, CAST(260.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Order_products] ([product_id], [order_id], [price], [number]) VALUES (7, 4, CAST(740.50 AS Decimal(10, 2)), 1)
INSERT [dbo].[Order_products] ([product_id], [order_id], [price], [number]) VALUES (1004, 4, CAST(4920.00 AS Decimal(10, 2)), 2)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1, N'Carusel Dracaena Marginata', CAST(5040.00 AS Decimal(10, 2)), 22, N'A moderate temperature (18-22 ° C) is best suited for the plant. In winter, the mercury column of the thermometer in the room where the plant is grown should not go down less than 15-16 degrees Celsius', 10, 1)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (2, N'Dracena Margin bordered ', CAST(260.00 AS Decimal(10, 2)), 12, N'For dracaena, an average temperature (18-22 ° C) is suitable. In winter, the thermometer in the room should not fall below 15-16 ° ?', 10, 2)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (5, N'Dracaena white stripe', CAST(3560.50 AS Decimal(10, 2)), 8, N'The flower loves indirect light. It should be placed on a window on the east or west side. Moderate watering is best, because if there is an excess of moisture, the plant may begin to rot. In winter, water should be kept to a minimum. ', 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (6, N'Dracena Fragrans', CAST(2200.00 AS Decimal(10, 2)), 11, N'Spraying of foliage is necessary. At least once a week. In dry rooms - up to once a day.', 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (7, N'Prickly pear', CAST(740.50 AS Decimal(10, 2)), 12, N'Pronounced representative of the same genus. The average height is 20-30 cm, but the shape and size depend on the specific species. It is one of the most extensive and varied families. Red or white spines are of an unusual hooked shape.', 3, 5)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1002, N'Trichocereus', CAST(430.00 AS Decimal(10, 2)), 15, N'An adult plant is a tall one-meter column, which with age becomes not only taller, but also wider. Some varieties reach 1.5 m and more.', 3, 4)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1003, N'Echinocereus', CAST(122.60 AS Decimal(10, 2)), 6, N'It is a comb cactus that resembles a low spiked column. The average height of domestic varieties is 20-30 cm. The peculiarities of flowering depend on the specific subspecies', 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1004, N'Ficus Benjamina Monica', CAST(4920.00 AS Decimal(10, 2)), 2, N'The plant is overturned, first every year at the beginning of March, then once every three to four years, because the plant is very sensitive. Do not take large flowerpots right away, as it takes too long before the roots take up all the space, and the soil can turn sour. In order not to overload the plant once again, it is permissible to change the top layer 2-3 cm thick in the spring.', 5, 1)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1005, N'Ficus Benjamin Anastasia', CAST(2600.00 AS Decimal(10, 2)), 1, N'In summer, the air temperature in the room is desirable about 25 degrees. In winter, it should not rise above 16 degrees Celsius. The best temperature for ficus is 6-7 ° C. Beware of cold air currents.', 5, 2)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1006, N'Ficus_ginseng', CAST(7800.00 AS Decimal(10, 2)), 13, N'This species is often used as a bonsai, although wild representatives grow up to 25 meters. But if you want to have such a decorative flower, you will get a small plant up to half a meter in size.', 4, 4)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1008, N'Ficus Microcarpa', CAST(6990.30 AS Decimal(10, 2)), 4, N'In indoor conditions, the plant is a tree, the average height of which is about one and a half meters. It is distinguished by relatively thick air roots. As a rule, they do not reach the surface of the substrate and form unusual shapes. Thanks to the aerial roots, the tree feels more confident in the flowerpot. Its branches are adorned with glossy elliptical leaf plates. Ficus microcarpa blooms very impressively and unusually.', 4, 5)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1009, N'Echinocactus Grusonii Sunny', CAST(1750.00 AS Decimal(10, 2)), 7, N'Flowering time is summer. Flowers are single, up to 6 cm long, arranged in a wreath around the apex of the stem, with a short tomentose flower tube; corolla of bright yellow color [3] [4], consists of numerous relatively narrow petals.', 8, 2)
INSERT [dbo].[Product] ([id], [name], [price], [number], [description], [category_id], [manufacturer_id]) VALUES (1012, N'Echinocactus Grusonii Sunny', CAST(1700.00 AS Decimal(10, 2)), 2, N'Flowering time is summer. Flowers are single, up to 6 cm long, arranged in a wreath around the apex of the stem, with a short tomentose flower tube; corolla of bright yellow color [3] [4], consists of numerous relatively narrow petals.', 8, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([provider_id], [name]) VALUES (1, N'NovaPoshta')
INSERT [dbo].[Provider] ([provider_id], [name]) VALUES (2, N'UkrPoshta')
INSERT [dbo].[Provider] ([provider_id], [name]) VALUES (3, N'NashaPoshta')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([name], [id]) VALUES (N'Administrator', 1)
INSERT [dbo].[Role] ([name], [id]) VALUES (N'Unsigned', 2)
INSERT [dbo].[Role] ([name], [id]) VALUES (N'Customer', 3)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [name]) VALUES (1, N'Confirmed')
INSERT [dbo].[Status] ([id], [name]) VALUES (2, N'Not_confirmed')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User_] ON 

INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (2, N'Daria', N'Koval', N'dariakoval', N'dariakoval', 3)
INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (5, N'Katia', N'Panasova', N'katiapanasova', N'password2', 3)
INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (6, N'Mikhail', N'Zorin', N'mikhailzorin', N'password3', 3)
INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (7, N'Anastasiia', N'Chuiko', N'chuiko', N'chuiko', 1)
INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (9, N'NotNastya', N'NotChuiko', N'notchuiko', N'notchuiko', 2)
INSERT [dbo].[User_] ([id], [name], [surname], [login], [password], [role_id]) VALUES (1003, N'Lena', N'Zaharchuk', N'lenalena200', N'lenalena', 3)
SET IDENTITY_INSERT [dbo].[User_] OFF
GO
/****** Object:  Index [XPKCategory]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [XPKCategory] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKDelivery_type]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Delivery_type] ADD  CONSTRAINT [XPKDelivery_type] PRIMARY KEY NONCLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKManufacturer]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Manufacturer] ADD  CONSTRAINT [XPKManufacturer] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKOrder_products]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Order_products] ADD  CONSTRAINT [XPKOrder_products] PRIMARY KEY NONCLUSTERED 
(
	[product_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKProduct]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [XPKProduct] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKProvider]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [XPKProvider] PRIMARY KEY NONCLUSTERED 
(
	[provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKStatus]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [XPKStatus] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKUser]    Script Date: 5/31/2021 11:39:20 PM ******/
ALTER TABLE [dbo].[User_] ADD  CONSTRAINT [XPKUser] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([base_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [R_33] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [R_33]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([type_id])
REFERENCES [dbo].[Delivery_type] ([type_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [R_5]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([provider_id])
REFERENCES [dbo].[Provider] ([provider_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [R_6]
GO
ALTER TABLE [dbo].[Order_]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_] ([id])
GO
ALTER TABLE [dbo].[Order_] CHECK CONSTRAINT [R_26]
GO
ALTER TABLE [dbo].[Order_]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order_] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[Order_products]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order_products] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[Order_products]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order_products] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[Manufacturer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [R_13]
GO
ALTER TABLE [dbo].[User_]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User_] CHECK CONSTRAINT [R_28]
GO
USE [master]
GO
ALTER DATABASE [DB] SET  READ_WRITE 
GO
