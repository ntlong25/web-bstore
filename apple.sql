USE [master]
GO
/****** Object:  Database [Apple]    Script Date: 7/13/2021 3:34:38 PM ******/
CREATE DATABASE [Apple]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Apple', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Apple.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Apple_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Apple_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Apple] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Apple].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Apple] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Apple] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Apple] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Apple] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Apple] SET ARITHABORT OFF 
GO
ALTER DATABASE [Apple] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Apple] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Apple] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Apple] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Apple] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Apple] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Apple] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Apple] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Apple] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Apple] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Apple] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Apple] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Apple] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Apple] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Apple] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Apple] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Apple] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Apple] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Apple] SET  MULTI_USER 
GO
ALTER DATABASE [Apple] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Apple] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Apple] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Apple] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Apple] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Apple] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Apple] SET QUERY_STORE = OFF
GO
USE [Apple]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Email] [varchar](50) NOT NULL,
	[MaSP] [varchar](10) NULL,
	[SL] [smallint] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_DC]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DC](
	[Email] [varchar](50) NOT NULL,
	[DCID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CT_DC] PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[DCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTOrder]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTOrder](
	[MaDH] [varchar](10) NOT NULL,
	[MaSP] [varchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Description] [varchar](50) NULL,
	[SL] [smallint] NULL,
	[GiaBan] [float] NULL,
	[Tong] [float] NULL,
 CONSTRAINT [PK_CTOrder] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [varchar](10) NOT NULL,
	[TenDM] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DCID] [varchar](10) NOT NULL,
	[TenDC] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Giam] [float] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[SDT] [varchar](10) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](30) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[SDT] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLSP] [varchar](15) NOT NULL,
	[TenLSP] [nvarchar](50) NULL,
	[MaDM] [varchar](10) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[MaDH] [varchar](10) NOT NULL,
	[TongDH] [float] NULL,
	[TongSP] [float] NULL,
	[TongDC] [float] NULL,
	[TongShip] [float] NULL,
	[Email] [varchar](50) NULL,
	[DCID] [varchar](10) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateID] [varchar](10) NOT NULL,
	[RateImg] [varchar](50) NULL,
	[Text] [nvarchar](max) NULL,
	[Email] [varchar](50) NULL,
	[MaSP] [varchar](10) NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](10) NOT NULL,
	[MaLSP] [varchar](15) NULL,
	[TenSP] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[GiaKM] [float] NULL,
	[img] [varchar](max) NULL,
	[img2] [varchar](max) NULL,
	[img3] [varchar](max) NULL,
	[img4] [varchar](max) NULL,
	[SLTon] [smallint] NULL,
	[Description] [nvarchar](max) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[Views] [int] NULL,
	[LoaiHang] [smallint] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/13/2021 3:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Email] [varchar](50) NOT NULL,
	[PW] [varchar](20) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([Email], [MaSP], [SL]) VALUES (N'thaithuy24100@gmail.com', N'IMACBL', 2)
GO
INSERT [dbo].[CTOrder] ([MaDH], [MaSP], [TenSP], [Description], [SL], [GiaBan], [Tong]) VALUES (N'DH01', N'IMACBL', NULL, NULL, 1, 1599, 1599)
GO
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'AW', N'Apple Watch')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'IP', N'IPhone')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'IPAD', N'IPAD')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'MAC', N'MAC')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'PK', N'Phụ Kiện')
GO
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0328015681', N'Bùi Xuân Nguyên', N'Bùi Xuân ', N'Nguyên', N'4A/4 Nguyễn Văn Thương phường 25 quận Bình Thạnh', N'nguyenbui469@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0332731723', N'Huỳnh Thái Lữ', N'Huỳnh Thái ', N'Lữ', N'Xà Phiên - Long Mỹ', N'huynhlu.it@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0333430067', N'Trần Thị Bình Nhi', N'Trần Thị Bình ', N'Nhi', N'Huỳnh Tấn Phát Quận 7', N'nhitranlx22112000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0334052502', N'Nguyễn Thành Long', N'Nguyễn Thành ', N'Long', N'D6/22G khu phố 4 Tân Túc Bình Chánh', N'long20002000ht@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0334297565', N'Phan Nhật Nguyên', N'Phan Nhật ', N'Nguyên', N'36c/37 đường số 16,p.linh trung', N'phannguyen7565@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0342099286', N'Nguyễn Phước Hậu', N'Nguyễn Phước ', N'Hậu', N'5/21 Lê Văn Chí, Linh Trung, Thủ Đức, Tp HCM', N'hau021993@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0344156156', N'Đoàn Trung Kiên', N'Đoàn Trung ', N'Kiên', N'Ấp 3 Láng Biển, Tháp Mười', N'doantrungkien10082002@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0345638420', N'Nguyễn Đức Long', N'Nguyễn Đức ', N'Long', N'54/40 tổ 5 kp 10 phường Tân Chánh Hiệp Quận 12', N'longnguyen2431@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0346758600', N'Nguyễn Xuân Rin', N'Nguyễn Xuân ', N'Rin', N'175 quốc lộ 13', N'Springg1135@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0347981006', N'Đỗ Duy Hân', N'Đỗ Duy ', N'Hân', N'372/13 Nơ Trang Long Phường 13 Quận Bình Thanj', N'Nhunhu61200@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0353880152', N'Lê Văn Thắng', N'Lê Văn ', N'Thắng', N'Số 2 Đường 249A Phường Tân Phú', N'vanthang23032001@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0353955224', N'Phạm Đình Tú', N'Phạm Đình ', N'Tú', N'25/47 Võ Văn Hát, Long Trường, Quận 9', N'pdtu.hutech.d1@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0354499448', N'Vũ Tiến Lộc', N'Vũ Tiến ', N'Lộc', N'91 Đinh Tiên Hoàng', N'vutienlocd1nhvt@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0354827724', N'Huỳnh Trọng Hiếu', N'Huỳnh Trọng ', N'Hiếu', N'Đồng Thạnh, Hòa Tân Đông, Đông Hòa, Phú Yên', N'Huynhtronghieu1703@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0355001184', N'Đỗ Trọng Thưởng', N'Đỗ Trọng ', N'Thưởng', N'Số nhà 30 hẻm 218, ấp Hậu, xã Tân Thông Hội, huyện Củ Chi', N'dotrongthuong8@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0355025599', N'Nguyễn Phan Hoài Rin', N'Nguyễn Phan Hoài ', N'Rin', N'244/25A Dương Đình Hội', N'nguyenrin9a7@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0355751191', N'Tô Lâm Bằng Duy', N'Tô Lâm Bằng ', N'Duy', N'5/3 đường số 11, phường Bình Thọ, Thành phố Thủ Đức', N'tolbduy0044@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0358408713', N'Cao Tiến Hào', N'Cao Tiến ', N'Hào', N'51/1D đường 494, phường Tăng Nhơn Phú A,Tp Thủ Đức', N'caotienhao2000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0365241731', N'Đặng Trần Thiên Đạt', N'Đặng Trần Thiên ', N'Đạt', N'103 KP Bình Đường Tx Dĩ An,Bình Dương', N'thiendat1102000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0366804509', N'Nguyễn Thành Quang', N'Nguyễn Thành ', N'Quang', N'40/2 Lã Xuân Oai, Quận 9', N'Nguyenthanhquangqn346@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0369409479', N'Đỗ Thành Chinh', N'Đỗ Thành ', N'Chinh', N'Huyện Bình Chánh TpHcm', N'dothanhchinh2000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0374845661', N'Vũ Phan Quang Phú', N'Vũ Phan Quang ', N'Phú', N'35 Trần Tấn P. Tân Sơn Nhì, Quận Tân Phú, TPHCM', N'vuphanquangphu2322@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0376004863', N'Nguyễn Tuấn Kiệt', N'Nguyễn Tuấn ', N'Kiệt', N'481 ấp hoà bình xã Vĩnh thanh,nhơn trạch, Đồng nai', N'kietmap950@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0377944241', N'Hà Gia Đạt', N'Hà Gia ', N'Đạt', N'KP5 Hố Nai - Biên Hoà- Đồng NAI', N'hagiadat0988968570@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0378105127', N'Nguyễn Trung Bút', N'Nguyễn Trung ', N'Bút', N'Phước Hưng - Tuy Phước', N'trungbutnguyen1811@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0379601121', N'Nguyễn Văn Cương', N'Nguyễn Văn ', N'Cương', N'Hẻm 69, đường 11, Linh Xuân, Thủ Đức', N'thangminhcaoss@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0385893324', N'Nguyễn Huỳnh Thanh Tân', N'Nguyễn Huỳnh Thanh ', N'Tân', N'21F2 Dd6, Tân Hưng Thuận, Quận 12', N'nguyenhuynhthanhtan8818@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0385976084', N'Nguyễn Công Đạt', N'Nguyễn Công ', N'Đạt', N'159/8 ngô quyền, p6, q10', N'Congdat.hutech@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0396511606', N'Nguyễn Thị Ngọc Châu', N'Nguyễn Thị Ngọc ', N'Châu', N'426/2, Hòa Phú, Châu Thành, Long An', N'nguyenthingocchau12b2@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0397067907', N'Lê Anh Đức', N'Lê Anh ', N'Đức', N'29/8/11 đường số 15, khu phố 1, Hiệp Bình Chánh, Thủ Đức', N'Ducle6487@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0397309331', N'Lê Viết Hùng', N'Lê Viết ', N'Hùng', N'Đông hòa -Dĩ an -Bình Dương', N'pek.meo102@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0397472367', N'Huỳnh Thị Thùy Trang', N'Huỳnh Thị Thùy ', N'Trang', N'66C đường số 6 phường linh trung tp. Thủ Đức,', N'Trangthuy1282811@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0397808866', N'Lê huỳnh hoàng khang', N'Lê huỳnh hoàng ', N'khang', N'685/86 Xô viết nghệ tĩnh ,', N'Lehuynhhoangkhang.5101988@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0399832012', N'Trần Khánh Duy', N'Trần Khánh ', N'Duy', N'35/45/16/3 Cao lỗ, P4, Q8', N'khanhdyu18@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0523255474', N'Trần Việt Hoàng', N'Trần Việt ', N'Hoàng', N'Biên Hòa', N'hoangcf1134@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0582547177', N'Hồ Thị Thu Hợp', N'Hồ Thị Thu ', N'Hợp', N'52/08/20 đường Võ Thị Thừa Kp3 Phường An Phú Đông Quận 12', N'Hothithuhopla18@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0703237261', N'Hồ Trần GIa Khánh', N'Hồ Trần GIa ', N'Khánh', N'58/15 Đường 4 KP 3 P Tam Phú Tp Thủ Đức Tp HCM', N'Khanh22122000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0703730897', N'Bùi Nguyễn Yến Nhi', N'Bùi Nguyễn Yến ', N'Nhi', N'Biên Hòa, Đồng Nai', N'Yennhi260320@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0705488958', N'Phan văn tuấn', N'Phan văn ', N'tuấn', N'Ký túc xá khu B', N'Revo.vantuan@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0706166088', N'Đào Khánh Minh', N'Đào Khánh ', N'Minh', N'55/23 Đường B, P.Hiệp Bình Chánh,', N'minhdao933@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0707129413', N'Trần Phi Long', N'Trần Phi ', N'Long', N'2384/50/3, QL1A, phường Trung Mỹ Tây, Q12, TP.HCM', N'longt2202@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0708070016', N'Nguyễn Huỳnh Việt Tiến', N'Nguyễn Huỳnh Việt ', N'Tiến', N'An Lương, Mỹ Chánh, Phù Mỹ, Bình Định', N'Tienorochimaru8818@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0763077848', N'Ngô Trí Trường', N'Ngô Trí ', N'Trường', N'576/6 Hồ Học Lãm,Bình Tân,Tp.Hồ Chí Minh', N'ngotritruong.628@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0767868709', N'Nguyễn Thị Mỹ Hân', N'Nguyễn Thị Mỹ ', N'Hân', N'538/151/2 Đoàn Văn Bơ, phường 14, quận 4', N'nguyenthimyhan20102015@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0769713139', N'Trần Phan Minh Trường', N'Trần Phan Minh ', N'Trường', N'A1/8/7 ấp 1 xã Hưng Long huyện Bình Chánh', N'truongtran819@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0772154901', N'Nguyễn Hoàng Thanh Long', N'Nguyễn Hoàng Thanh ', N'Long', N'8/49/4 Đường Trường Học, KP. Đông Tân, P. Dĩ An', N'Thanhlong160100@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0783727238', N'Nguyễn Thanh Hùng', N'Nguyễn Thanh ', N'Hùng', N'TCH 32, Q.12', N'thanhhung041100@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0786208144', N'Trần Hiếu Chương', N'Trần Hiếu ', N'Chương', N'Nhơn Trạch', N'hieuchuong321@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0787502871', N'Phạm Trần Huy Bảo', N'Phạm Trần Huy ', N'Bảo', N'326/2 Cô Giang Phường 2 Quận Bình Thạnh', N'huybaoash@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0788833634', N'Nguyễn Hoàng Quân', N'Nguyễn Hoàng ', N'Quân', N'11/5A đường tân hòa 2 khu phố 6 quận 9', N'nquan146@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0789898100', N'Ngô Chí Quốc', N'Ngô Chí ', N'Quốc', N'20/20 đường 160, Tăng Nhơn Phú A , Quận 9', N'ngochiquoc140@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0794942910', N'Nguyễn Hoàng Long', N'Nguyễn Hoàng ', N'Long', N'432A/40/14 Dương Bá Trạc P1,Q8', N'nguyenhoanglong9a7@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0815552939', N'Dương Quốc Đạt', N'Dương Quốc ', N'Đạt', N'Khóm 3,Mang Thít', N'dqdat227@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0826913840', N'Nguyễn Phát Thành Tài', N'Nguyễn Phát Thành ', N'Tài', N'148/47 Quốc lộ 1A Phường 2 thành phố Tân An, Long An', N'nguyenphatthanhtai@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0826999900', N'Thái Thủy', N'Thái', N'Thủy', N'Quận 12', N'thaithuy24100@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0832450210', N'Khoa Vũ Hồng Ngọc', N'Khoa Vũ Hồng ', N'Ngọc', N'36 Trung Hành Đằng Lâm Hải An', N'hpngoc123@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0833431305', N'Nguyễn Hoàng Long', N'Nguyễn Hoàng ', N'Long', N'76/6 Lê Văn Phan', N'hoanglong123000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0836834345', N'Nguyễn Minh Nhựt', N'Nguyễn Minh ', N'Nhựt', N'62 tân hoà 2 phường hiệp phú thành phố thủ đức', N'nhut09112000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0839517098', N'Diệp Thanh Duy', N'Diệp Thanh ', N'Duy', N'675/15/2 Trần Xuân Soạn, quận 7', N'diepthanhduy377@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0865544784', N'Nguyễn Trung Hòa', N'Nguyễn Trung ', N'Hòa', N'64/3f, đường tân hiệp 14, ấp thới tây 2, xã tân hiệp, huyện hóc môn', N'hoant2019@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0866039411', N'Nguyễn Trọng Nhân', N'Nguyễn Trọng ', N'Nhân', N'KTX ĐHQG Tp HCM khu B, Đông Hòa, Dĩ An, Bình Dương', N'nguyennhan8521@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0866769624', N'Dương Minh Trường', N'Dương Minh ', N'Trường', N'Đường Số 3 Phường Trường Thọ Thủ Đức,thành phố hồ chí mình', N'Duongminhtruong2101@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0867099180', N'Lê Đức Minh Tùng', N'Lê Đức Minh ', N'Tùng', N'2586 Phạm Thế Hiển p7 q8', N'ldmtung2504@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0869054332', N'Nguyễn Phước Đại', N'Nguyễn Phước ', N'Đại', N'137 Linh Trung, Phường Linh Trung, Tp.Thủ Đức', N'npdphuocdai@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0869259527', N'Ngô Thị Thu Trang', N'Ngô Thị Thu ', N'Trang', N'Vinhomes Grand Park Q9, Toà S2.02', N'thutrangvt12c6@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0898410338', N'Nguyễn Văn Tấn', N'Nguyễn Văn ', N'Tấn', N'251 Bình Lợi,P.13,Q.Bình Thạnh', N'vantan18791@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0899337845', N'Nguyễn Duy Thái', N'Nguyễn Duy ', N'Thái', N'148/11b Tây Hòa, Phước Long A', N'nguyenduythai1982000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0901478030', N'Lê Nguyễn Ngọc Huy', N'Lê Nguyễn Ngọc ', N'Huy', N'129F/123/46A Bến Vân Đồn, Phường 8, Quận 4', N'lnnhuy1904@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0901850057', N'Trương Thanh Bình', N'Trương Thanh ', N'Bình', N'89 đuờng 11 Phường Tân Kiểng Quận 7', N'truongthanhbinh572000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0901906543', N'Lăng Hữu Phước', N'Lăng Hữu ', N'Phước', N'29/18 đường D2, phường 25, quận Bình Thạnh', N'ihatetoday37@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0902840333', N'Trần Nguyễn Minh Đan', N'Trần Nguyễn Minh ', N'Đan', N'50/3 Trương Hán Siêu P Đakao Q1', N'zzeroz0000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0903164316', N'Phạm Lê Thanh Nga', N'Phạm Lê Thanh ', N'Nga', N'272 Tân Hòa Đông phường Bình Trị Đông quận Bình Tân', N'Phmnga520@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0903992107', N'Nguyễn Hoàng Vũ', N'Nguyễn Hoàng ', N'Vũ', N'168 Tuệ Tĩnh, P12, Q11', N'gauvu107@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0906800811', N'Nguyễn Lê Hoàng Minh', N'Nguyễn Lê Hoàng ', N'Minh', N'4E KDC miếu nổi, P.3, Q. Bình Thạnh', N'minh150601@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0907253910', N'Huỳnh Quốc Hoà', N'Huỳnh Quốc ', N'Hoà', N'Kí túc xá đại học quốc gia khu b, phường đông hoà, tp dĩ an,', N'fchuynhhoa2000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0908496701', N'Vũ Thành Đạt', N'Vũ Thành ', N'Đạt', N'Ktx khu B đông hoà, dĩ an', N'datvu01225@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0915322673', N'Tống Quốc Bảo', N'Tống Quốc ', N'Bảo', N'82/38A Khu phố 2, phường Tân Phú, Quận 9', N'tongquocbao0605@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0916213041', N'Lê Quốc Đạt', N'Lê Quốc ', N'Đạt', N'số 62, đường 17, phường Hiệp Bình Chánh, Thủ Đức', N'lequocdat0910@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0918399443', N'Lê Nguyễn Thành Long', N'Lê Nguyễn Thành ', N'Long', N'179 Kp3, P.Tân Biên', N'us.thanhlong18@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0919813606', N'Nguyễn Hoàng Long', N'Nguyễn Hoàng ', N'Long', N'C8.04 chung cư ParcSpring đường Bình Trưng Đông quận 2', N'Hoanglong13606@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0923757682', N'Dương Quang Huy', N'Dương Quang ', N'Huy', N'356/5 tỉnh lộ 10 phường bình trị đông quận bình tân', N'huyd4202@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0926552637', N'Phạm Văn Điền', N'Phạm Văn ', N'Điền', N'177 Tăng Nhơn Phú, phường Tăng Nhơn Phú B, quận 9', N'drland0813@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0929314798', N'Lê Văn Quá', N'Lê Văn ', N'Quá', N'47/15 Nguyễn Tư Giản p.12 Q.Gò Vấp', N'csmboot.zing.vn@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0929688352', N'Nguyễn Ngô Thanh Sinh', N'Nguyễn Ngô Thanh ', N'Sinh', N'51 liên khu 5-11-12', N'ranklatatca@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0932007274', N'Châu Lê Đức Trí', N'Châu Lê Đức ', N'Trí', N'710/35/7 Hâu Giang P12 Q6', N'chauleductri1999@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0935564087', N'Nguyễn Thành Long', N'Nguyễn Thành ', N'Long', N'Tân Mai - Biên Hòa - Đồng Nai', N'longsteve.jobs@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0937172242', N'Nguyễn Đình Gia Huy', N'Nguyễn Đình Gia ', N'Huy', N'3/27, khu phố 6, phường Hố Nai, Biên Hòa', N'levinguyen1102@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0941266067', N'Nguyễn Quang Anh Tuấn', N'Nguyễn Quang Anh ', N'Tuấn', N'D22 an phú thuận an bình dương', N'anhtuan2704222@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0944698020', N'Nguyễn Vũ Huy', N'Nguyễn Vũ ', N'Huy', N'236/12/15 Điện Biên Phủ phường 17 Bình Thạnh', N'vuhuyk18@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0946922737', N'Hứa Vỹ Nhân', N'Hứa Vỹ ', N'Nhân', N'334 nguyễn văn nghi , quận gò vấp', N'nhanhua0@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0948502258', N'Nguyễn Tuấn Anh', N'Nguyễn Tuấn ', N'Anh', N'Xã Thạch Trung - TP. Hà Tĩnh', N'ntanh.hutech@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0961800734', N'Trương Trọng Nhân', N'Trương Trọng ', N'Nhân', N'5/11 ấp 4 xã Phú Xuân huyện Nhà Bè', N'hoangungdai@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0961865161', N'Lê Nguyễn Thiện Quang', N'Lê Nguyễn Thiện ', N'Quang', N'9/5 Bông Sao, Phường 5, Quận 8', N'thienquang8825@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0962492250', N'nguyễn ngọc thạch', N'nguyễn ngọc ', N'thạch', N'33e đường số 4, phường Trường Thọ, Quận Thủ Đức', N'ngthachpk@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0964689471', N'Trần Hoàng Minh', N'Trần Hoàng ', N'Minh', N'26 đường 34 linh đông, thủ đức , tp HCM', N'hoangminh200011@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0965438682', N'Nguyễn Văn Hà', N'Nguyễn Văn ', N'Hà', N'c12/1 tổ 10 ,phường tăng nhơn phú A,quận 9,TP hcm', N'nguyenvanha28062000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0967484823', N'Nguyễn Thương Anh', N'Nguyễn Thương ', N'Anh', N'Số 30 hẽm 175 đường số 2 đình phong phú, quận 9', N'nguyenthuonganh1911@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0971621634', N'Phạm Chí Nghị', N'Phạm Chí ', N'Nghị', N'Xã Thạnh Phước, Huyện Bình Đại', N'Phamchinghi11@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0971696023', N'Phan Thanh Nhựt', N'Phan Thanh ', N'Nhựt', N'Kí túc xá khu B DHQG TPHCM', N'Thanhnhutvn79@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0974441643', N'Phan Trần Hoàng Hiệp', N'Phan Trần Hoàng ', N'Hiệp', N'KTX KHU B, ĐHQG TPHCM, phường Linh Trung, quận Thủ Đức', N'pthh3110@gmail.com')
GO
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0975347731', N'Đỗ Duy Nhật Hoàng', N'Đỗ Duy Nhật ', N'Hoàng', N'334B xô viết nghệ tĩnh, phường 25, bình thạnh', N'nhathoang12102000@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0981560765', N'Đoàn Trọng Hiệp', N'Đoàn Trọng ', N'Hiệp', N'296, đường Tạo Lực 1, phường Phú Tân, thành phố Thủ Dầu Một, Bình Dương', N'vgtaxmwell@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0985913095', N'Nguyễn ngọc bảo trọng', N'Nguyễn ngọc bảo ', N'trọng', N'1010 ql1a, linh trung, thủ đức', N'Nnbaotrong@gmail.com')
INSERT [dbo].[KhachHang] ([SDT], [FullName], [LastName], [FirstName], [Address], [Email]) VALUES (N'0989504257', N'Lê Văn Hiếu', N'Lê Văn ', N'Hiếu', N'22a đường số 19, phường Hiệp Bình Chánh, quận Thủ Đức', N'hieulegend28@gmail.com')
GO
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'APC', N'AirPod Charge', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'APW', N'AirPod Wirless', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'AT', N'AirTag', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'AW6', N'Apple Watch S6', N'AW')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'AWSE', N'Apple Watch SE', N'AW')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IMAC', N'IMac', N'MAC')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IMACM', N'IMacMini', N'MAC')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IP11', N'IPhone11', N'IP')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IP12', N'IPhone12', N'IP')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IP12M', N'IPhone12Mini', N'IP')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IPADA', N'IPadAir', N'IPAD')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IPADG', N'IPadGen', N'IPAD')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IPADM', N'IPadMini', N'IPAD')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IPADP', N'IPadPro', N'IPAD')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'IPXR', N'IPhoneXr', N'IP')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'MBA', N'MacbookAir', N'MAC')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'MBP', N'MacbookPro', N'MAC')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'PKAW', N'Phụ Kiện Apple Watch', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'PKIPAD', N'Phụ Kiện  IPad', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'PKIPHONE', N'Phụ Kiện IPhone', N'PK')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP], [MaDM]) VALUES (N'PKMAC', N'Phụ Kiện Mac', N'PK')
GO
INSERT [dbo].[Order] ([MaDH], [TongDH], [TongSP], [TongDC], [TongShip], [Email], [DCID], [Address]) VALUES (N'DH01', 1599, 1599, NULL, NULL, N'thaithuy24100@gmail.com', NULL, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'APCC', N'APC', N'AirPod Charge Case', 249, NULL, N'\img\product\PhuKien\Airpod\AirPods\AirPods\airpods-charge-case-201910.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'APWC', N'APW', N'AirPod Wirless Case', 229, NULL, N'\img\product\PhuKien\Airpod\AirPods\AirPodsWireless\airpods-wireless-charge-case-201910.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATKR', N'AT', N'AirTag Leather Key Ring', 29, NULL, N'\img\product\PhuKien\airTag\apple-airtag-leather-key-ring.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATLN', N'AT', N'AirTag Loop Navy', 29, NULL, N'\img\product\PhuKien\airTag\apple-airtag-loop-xanh-navy.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATLO', N'AT', N'AirTag Loop Orange', 29, NULL, N'\img\product\PhuKien\airTag\apple-airtag-loop-mau-cam.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATLW', N'AT', N'AirTag Loop White', 29, NULL, N'\img\product\PhuKien\airTag\apple-airtag-loop-mau-trang.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATLY', N'AT', N'AirTag Loop Yellow', 29, NULL, N'\img\product\PhuKien\airTag\apple-airtag-loop-1.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'ATS', N'AT', N'AirTag Double Set', 59, NULL, N'\img\product\PhuKien\airTag\airtag-double-select-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWS6GL', N'AW6', N'Apple Watch S6 Golden', 499, NULL, N'\img\product\Watch\AW6\apple-watch-series-6-40mm-gps-vien-nhom-vang-day-cao-su-full-vat_3.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWS6Gr', N'AW6', N'Apple Watch S6 Grey', 499, NULL, N'\img\product\Watch\AW6\apple-watch-series-6-40mm-4g-vien-nhom-xam-day-cao-su-full-vat_3_1.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWS6S', N'AW6', N'Apple Watch S6 Silver', 499, NULL, N'\img\product\Watch\AW6\apple-watch-series-6-40mm-gps-vien-nhom-bac-day-cao-su-full-vat_3.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWSEGL', N'AWSE', N'Apple Watch SE Silver', 399, NULL, N'\img\product\Watch\AWSE\watch-se-44mm-_gps.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWSEGr', N'AWSE', N'Apple Watch SE Grey', 399, NULL, N'\img\product\Watch\AWSE\watch-se-40mm-_gps_xam.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'AWSES', N'AWSE', N'Apple Watch SE Golden', 399, NULL, N'\img\product\Watch\AWSE\watch-se-44mm-_gps_white.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IMACBL', N'IMAC', N'Imac BLUE', 1599, NULL, N'\img\product\MAC\iMac\imac-24-blue-selection-hero-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IMACG', N'IMAC', N'Imac GREEN', 1599, NULL, N'\img\product\MAC\iMac\imac-24-green-selection-hero-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IMACMH', N'IMACM', N'IMacMini HERO', 1599, NULL, N'\img\product\MAC\iMacMini\mac-mini-hero-202011.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IMACP', N'IMAC', N'Imac PINK', 1599, NULL, N'\img\product\MAC\iMac\imac-24-pink-selection-hero-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IMACS', N'IMAC', N'Imac SILVER', 1599, NULL, N'\img\product\MAC\iMac\imac-24-silver-selection-hero-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11B', N'IP11', N'Iphone 11 black', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-black-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11G', N'IP11', N'Iphone 11 green', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-green-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11P', N'IP11', N'Iphone 11 purle', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-purple-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11R', N'IP11', N'Iphone 11 red', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-red-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11W', N'IP11', N'Iphone 11 white', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-white-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP11Y', N'IP11', N'Iphone 11 yellow', 699, NULL, N'\img\product\IPHONE\iphone11\iphone11-yellow-select-2019.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12B', N'IP12', N'Iphone 12 black', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-black-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12BL', N'IP12', N'Iphone 12 blue', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-blue-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12G', N'IP12', N'Iphone 12 green', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-green-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MB', N'IP12', N'Iphone 12 mini black', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-black-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MBL', N'IP12M', N'Iphone 12 mini blue', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-blue-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MG', N'IP12M', N'Iphone 12 mini green', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-green-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MP', N'IP12M', N'Iphone 12 mini purle', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-purple-select-2021.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MR', N'IP12M', N'Iphone 12 mini red', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-red-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12MW', N'IP12M', N'Iphone 12 mini white', 959, NULL, N'\img\product\IPHONE\iphone12\iphone12mini\iphone-12-mini-white-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12P', N'IP12', N'Iphone 12 purle', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-purple-select-2021.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12R', N'IP12', N'Iphone 12 red', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-red-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IP12W', N'IP12', N'Iphone 12 white', 899, NULL, N'\img\product\IPHONE\iphone12\iphone12\iphone-12-white-select-2020.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADABL', N'IPADA', N'IPadAir blue', 759, NULL, N'\img\product\IPAD\ipadAir\ipad-air-select-wifi-blue-202009.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADAG', N'IPADA', N'IPadAir green', 759, NULL, N'\img\product\IPAD\ipadAir\ipad-air-select-wifi-green-202009.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADAGL', N'IPADA', N'IPadAir golden', 759, NULL, N'\img\product\IPAD\ipadAir\ipad-air-select-wifi-gold-202009.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADAS', N'IPADA', N'IPadAir silver', 759, NULL, N'\img\product\IPAD\ipadAir\ipad-air-select-wifi-silver-202009.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADASG', N'IPADA', N'IPadAir spacegray', 769, NULL, N'\img\product\IPAD\ipadAir\ipad-air-select-wifi-spacegray-202009.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADGGL', N'IPADG', N'IPadGen gold', 739, NULL, N'\img\product\IPAD\ipadGen\ipad-2020-hero-gold-wifi-select.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADGS', N'IPADG', N'IPadGen silver', 739, NULL, N'\img\product\IPAD\ipadGen\ipad-2020-hero-silver-wifi-select.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADGSP', N'IPADG', N'IPadGen space', 739, NULL, N'\img\product\IPAD\ipadGen\ipad-2020-hero-space-wifi-select.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADMG', N'IPADM', N'IPadMini GOLD', 639, NULL, N'\img\product\IPAD\ipadMini\ipad-mini-select-wifi-gold-201911.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADMS', N'IPADM', N'IPadMini SILVER', 639, NULL, N'\img\product\IPAD\ipadMini\ipad-mini-select-wifi-silver-201911.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADMSG', N'IPADM', N'IPadMini SPACEGRAY', 639, NULL, N'\img\product\IPAD\ipadMini\ipad-mini-select-wifi-spacegray-201911.png', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADPS', N'IPADP', N'IPadPro SILVER', 899, NULL, N'\img\product\IPAD\ipadPro\ipad-pro-12-select-cell-silver-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPADPSG', N'IPADP', N'IPadPro SPACEGRAY', 899, NULL, N'\img\product\IPAD\ipadPro\ipad-pro-12-select-cell-spacegray-202104.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRB', N'IPXR', N'Iphone XR black', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-black-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRBL', N'IPXR', N'Iphone XR blue', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-blue-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRC', N'IPXR', N'Iphone XR coral', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-coral-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRR', N'IPXR', N'Iphone XR red', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-red-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRW', N'IPXR', N'Iphone XR white', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-white-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'IPXRY', N'IPXR', N'Iphone XR yellow', 699, NULL, N'\img\product\IPHONE\iphoneXr\iphone-xr-yellow-select-201809.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'MBASG', N'MBA', N'MacbookAir SPACEGRAY', 1399, NULL, N'\img\product\MAC\MacbookAir\macbook-air-space-gray-select-201810.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'MBP16', N'MBP', N'MacbookPro 16TOUCH SPACE', 1699, NULL, N'\img\product\MAC\MacbookPro\mbp16touch-space-select-201911.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'MBPSG', N'MBP', N'MacbookPro SPACEGRAY', 1599, NULL, N'\img\product\MAC\MacbookPro\mbp-spacegray-select-202011.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWC', N'PKAW', N'Phụ Kiện Apple Watch CABLE', 69, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\cap-sac-apple-watch-2m.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGA', N'PKAW', N'Phụ Kiện Apple Watch GRID ATLANTIC', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-atlantic-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGC', N'PKAW', N'Phụ Kiện Apple Watch GRID CHARCOAL', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-charcoal-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGI', N'PKAW', N'Phụ Kiện Apple Watch GRID INVERNESS', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-inverness-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGO', N'PKAW', N'Phụ Kiện Apple Watch GRID ORANGE', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-electric-orange-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGP', N'PKAW', N'Phụ Kiện Apple Watch GRID PINK', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-pink-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGPI', N'PKAW', N'Phụ Kiện Apple Watch GRID PISTACHIO', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-pistachio-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKAWGPR', N'PKAW', N'Phụ Kiện Apple Watch GRID PRIDE', 59, NULL, N'\img\product\PhuKien\phuKienAppleWatchChinhHang\grid-braided-loop-pride-s6.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKIPADPE', N'PKIPAD', N'Bút Cảm Ứng Apple Pencil', 99, NULL, N'\img\product\PhuKien\phuKienIpadChinhHang\but-cam-ung-apple-pencil-2-chinh-hang-1.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKIPADSK', N'PKIPAD', N'Bàn phím Smart Keyboard IPADPro', 259, NULL, N'\img\product\PhuKien\phuKienIpadChinhHang\ban-phim-smart-keyboard-ipad-pro-12.9inch-chinh-hang.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKIPHONEA', N'PKIPHONE', N'Adapter iphone 20w type C', 79, NULL, N'\img\product\PhuKien\phuKienIphoneChinhHang\cap-chuyen-doi-apple-lightning-sang-3.5-mm-chinh-hang.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKIPHONECL', N'PKIPHONE', N'Cáp usb type C lightning 1m', 69, NULL, N'\img\product\PhuKien\phuKienIphoneChinhHang\cap-apple-usb-c-lightning-_1m.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKMACC', N'PKMAC', N'Apple Thunderbolt Cable 2m', 99, NULL, N'\img\product\PhuKien\phuKienMacChinhHang\cap-apple-thunderbolt-cable-2m-md861.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKMACH', N'PKMAC', N'Hyperdrive Slim Usb C Hub', 299, NULL, N'\img\product\PhuKien\phuKienMacChinhHang\cong-chuyen-hyperdrive-slim-usb-c-hub_4.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [DonGia], [GiaKM], [img], [img2], [img3], [img4], [SLTon], [Description], [MoreInfo], [Views], [LoaiHang]) VALUES (N'PKMACM', N'PKMAC', N'Wireless Magic Mouse', 199, NULL, N'\img\product\PhuKien\phuKienMacChinhHang\chuot-khong-day-apple-magic-mouse-2_2_3.jpg', NULL, NULL, NULL, 100, N'Đang Cập Nhật', N'Đang Cập Nhật', 0, 3)
GO
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'anhtuan2704222@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'caotienhao2000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'chauleductri1999@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Congdat.hutech@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'csmboot.zing.vn@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'datvu01225@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'diepthanhduy377@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'doantrungkien10082002@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'dothanhchinh2000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'dotrongthuong8@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'dqdat227@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'drland0813@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Ducle6487@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Duongminhtruong2101@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'fchuynhhoa2000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'gauvu107@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hagiadat0988968570@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hau021993@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hieuchuong321@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hieulegend28@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hoangcf1134@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hoanglong123000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Hoanglong13606@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hoangminh200011@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hoangungdai@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hoant2019@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Hothithuhopla18@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'hpngoc123@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'huybaoash@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'huyd4202@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'huynhlu.it@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Huynhtronghieu1703@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ihatetoday37@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Khanh22122000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'khanhdyu18@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'kietmap950@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ldmtung2504@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Lehuynhhoangkhang.5101988@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'lequocdat0910@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'levinguyen1102@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'lnnhuy1904@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'long20002000ht@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'longnguyen2431@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'longsteve.jobs@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'longt2202@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'minh150601@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'minhdao933@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ngochiquoc140@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ngotritruong.628@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ngthachpk@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenbui469@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenduythai1982000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenhoanglong9a7@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenhuynhthanhtan8818@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyennhan8521@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenphatthanhtai@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenrin9a7@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Nguyenthanhquangqn346@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenthimyhan20102015@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenthingocchau12b2@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenthuonganh1911@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nguyenvanha28062000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nhanhua0@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nhathoang12102000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nhitranlx22112000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Nhunhu61200@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nhut09112000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Nnbaotrong@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'npdphuocdai@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'nquan146@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ntanh.hutech@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'pdtu.hutech.d1@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'pek.meo102@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Phamchinghi11@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'phannguyen7565@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Phmnga520@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'pthh3110@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'ranklatatca@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Revo.vantuan@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Springg1135@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thaithuy24100@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thangminhcaoss@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thanhhung041100@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Thanhlong160100@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Thanhnhutvn79@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thiendat1102000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thienquang8825@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'thutrangvt12c6@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Tienorochimaru8818@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'tolbduy0044@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'tongquocbao0605@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Trangthuy1282811@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'trungbutnguyen1811@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'truongthanhbinh572000@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'truongtran819@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'us.thanhlong18@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vantan18791@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vanthang23032001@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vgtaxmwell@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vuhuyk18@gmail.com', N'123')
GO
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vuphanquangphu2322@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'vutienlocd1nhvt@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'Yennhi260320@gmail.com', N'123')
INSERT [dbo].[TaiKhoan] ([Email], [PW]) VALUES (N'zzeroz0000@gmail.com', N'123')
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [Relationship13] FOREIGN KEY([Email])
REFERENCES [dbo].[TaiKhoan] ([Email])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [Relationship13]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [Relationship16] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [Relationship16]
GO
ALTER TABLE [dbo].[CT_DC]  WITH CHECK ADD  CONSTRAINT [Relationship20] FOREIGN KEY([Email])
REFERENCES [dbo].[TaiKhoan] ([Email])
GO
ALTER TABLE [dbo].[CT_DC] CHECK CONSTRAINT [Relationship20]
GO
ALTER TABLE [dbo].[CT_DC]  WITH CHECK ADD  CONSTRAINT [Relationship21] FOREIGN KEY([DCID])
REFERENCES [dbo].[Discount] ([DCID])
GO
ALTER TABLE [dbo].[CT_DC] CHECK CONSTRAINT [Relationship21]
GO
ALTER TABLE [dbo].[CTOrder]  WITH CHECK ADD  CONSTRAINT [Relationship6] FOREIGN KEY([MaDH])
REFERENCES [dbo].[Order] ([MaDH])
GO
ALTER TABLE [dbo].[CTOrder] CHECK CONSTRAINT [Relationship6]
GO
ALTER TABLE [dbo].[CTOrder]  WITH CHECK ADD  CONSTRAINT [Relationship7] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTOrder] CHECK CONSTRAINT [Relationship7]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [Relationship11] FOREIGN KEY([Email])
REFERENCES [dbo].[TaiKhoan] ([Email])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [Relationship11]
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD  CONSTRAINT [Relationship4] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[LoaiSP] CHECK CONSTRAINT [Relationship4]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Relationship22] FOREIGN KEY([Email])
REFERENCES [dbo].[TaiKhoan] ([Email])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Relationship22]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Relationship25] FOREIGN KEY([DCID])
REFERENCES [dbo].[Discount] ([DCID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Relationship25]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [Relationship18] FOREIGN KEY([Email])
REFERENCES [dbo].[TaiKhoan] ([Email])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [Relationship18]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [Relationship19] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [Relationship19]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [Relationship5] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LoaiSP] ([MaLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [Relationship5]
GO
USE [master]
GO
ALTER DATABASE [Apple] SET  READ_WRITE 
GO
