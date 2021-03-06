USE [Totnghiep]
GO
/****** Object:  Table [dbo].[Tin_tuc]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tin_tuc]') AND type in (N'U'))
DROP TABLE [dbo].[Tin_tuc]
GO
/****** Object:  Table [dbo].[Tai_khoang]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tai_khoang]') AND type in (N'U'))
DROP TABLE [dbo].[Tai_khoang]
GO
/****** Object:  Table [dbo].[San_pham]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[San_pham]') AND type in (N'U'))
DROP TABLE [dbo].[San_pham]
GO
/****** Object:  Table [dbo].[Loai_SP]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Loai_SP]') AND type in (N'U'))
DROP TABLE [dbo].[Loai_SP]
GO
/****** Object:  Table [dbo].[Hoa_don]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hoa_don]') AND type in (N'U'))
DROP TABLE [dbo].[Hoa_don]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 5/28/2020 8:48:36 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTHD]') AND type in (N'U'))
DROP TABLE [dbo].[CTHD]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[IdCTHD] [int] NOT NULL,
	[IdSP] [int] NULL,
	[IdHD] [int] NULL,
	[SLMH] [int] NULL,
	[Gia] [float] NULL,
	[SL] [int] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[IdCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoa_don]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoa_don](
	[STT] [int] NULL,
	[IdHD] [int] NULL,
	[SL] [int] NULL,
	[IdKH] [int] NULL,
	[NgayMua] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[Status] [int] NULL,
	[DiaChiNhan] [nvarchar](255) NULL,
	[PhoneNumber] [numeric](10, 0) NULL,
	[GhiChu] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai_SP]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai_SP](
	[IdLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
 CONSTRAINT [PK_Loai_SP] PRIMARY KEY CLUSTERED 
(
	[IdLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[San_pham]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[San_pham](
	[IdSP] [int] NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[NoiDung] [nvarchar](255) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[UrlImg] [nvarchar](255) NULL,
	[Gia] [float] NULL,
	[SL] [int] NULL,
	[LuotView] [int] NULL,
	[IdLoai] [int] NULL,
	[Rate] [int] NULL,
	[Comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_San_pham] PRIMARY KEY CLUSTERED 
(
	[IdSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tai_khoang]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tai_khoang](
	[IdKH] [int] NOT NULL,
	[TenKh] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [numeric](10, 0) NULL,
	[UserName] [varchar](255) NULL,
	[Pass] [varchar](255) NULL,
	[Status] [int] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Tai_khoang] PRIMARY KEY CLUSTERED 
(
	[IdKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tin_tuc]    Script Date: 5/28/2020 8:48:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tin_tuc](
	[IdTT] [int] NOT NULL,
	[TenTT] [nvarchar](255) NULL,
	[TieuDeTT] [nvarchar](255) NULL,
	[ImgTT] [nvarchar](255) NULL,
	[UrlImgTT] [nvarchar](255) NULL,
	[NoiDung] [nvarchar](255) NULL,
	[IdKH] [int] NULL,
	[Comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tin_tuc] PRIMARY KEY CLUSTERED 
(
	[IdTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
