USE [QuanLyKho]
GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Select]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_HangHoa_Select]
	@IDHangHoa int = NULL
AS
BEGIN
	IF(@IDHangHoa IS NULL)
		SELECT hh.IDHangHoa, hh.MaHangHoa, hh.IDLoaiHang, hh.TenHangHoa, hh.SoLuongTonKho, dv.IDDonVi, dv.DonVi, lh.IDLoaiHang, lh.TenLoai, hh.Hang
		FROM [HangHoa] hh	INNER JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							INNER JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
	ELSE
		SELECT hh.IDHangHoa, hh.MaHangHoa, hh.IDLoaiHang, hh.TenHangHoa, hh.SoLuongTonKho, dv.IDDonVi, dv.DonVi, lh.IDLoaiHang, lh.TenLoai, hh.Hang
		FROM [HangHoa] hh	INNER JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							INNER JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
		WHERE hh.IDHangHoa = @IDHangHoa
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Delete]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quyen_Delete]
	@IDQuyen int
AS
BEGIN
	DELETE QUYEN
	WHERE IDQuyen = @IDQuyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Insert]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quyen_Insert]
	@Quyen nvarchar(20)
AS
BEGIN
	INSERT INTO QUYEN(Quyen)
	VALUES(@Quyen)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_SelectAll]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quyen_SelectAll]
AS
BEGIN
	SELECT IDQuyen, Quyen
	FROM Quyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Update]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quyen_Update]
	@IDQuyen int,
	@Quyen nvarchar(20)
AS
BEGIN
	UPDATE QUYEN
	SET Quyen = @Quyen
	WHERE IDQuyen = @IDQuyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_User_Select]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Select]
	@IDUser int = NULL
AS
BEGIN
	IF(@IDUser IS NULL)
		SELECT IDUser, Username, (Ho + ' ' + Ten) as Ten, SoDienThoai, CMND, QueQuan, DiaChi, Quyen.IDQuyen, Quyen.TenQuyen, IsMale, NgaySinh, NgayVaoLam
		FROM [User]	INNER JOIN Quyen ON [User].IDQuyen = Quyen.IDQuyen
	ELSE
		SELECT IDUser, Username, Ho, Ten, SoDienThoai, CMND, QueQuan, DiaChi, Quyen.IDQuyen, Quyen.TenQuyen, IsMale, NgaySinh, NgayVaoLam, Avatar
		FROM [User]	INNER JOIN Quyen ON [User].IDQuyen = Quyen.IDQuyen
		WHERE IDUser = @IDUser
END

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[IDChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[IDHoaDon] [int] NULL,
	[IDHangHoa] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[IDChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[IDDonVi] [int] IDENTITY(1,1) NOT NULL,
	[DonVi] [nvarchar](10) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[IDDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[IDHangHoa] [int] IDENTITY(1,1) NOT NULL,
	[IDNhaCungCap] [int] NULL,
	[MaHangHoa] [nvarchar](10) NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[SoLuongTonKho] [int] NULL,
	[IDDonVi] [int] NULL,
	[IDViTri] [int] NULL,
	[IDLoaiHang] [int] NULL,
	[Hang] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[IDHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [varchar](20) NULL,
	[GiaTien] [float] NULL,
	[ThoiGian] [datetime] NULL,
	[IDUser] [int] NULL,
	[IDKhachHang] [int] NULL,
	[IsDebt] [bit] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [varchar](10) NULL,
	[Ho] [nvarchar](20) NULL,
	[Ten] [nvarchar](20) NULL,
	[SoDienThoai] [varchar](10) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[IsMale] [bit] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LichSuKho]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuKho](
	[IDLichSuKho] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[SoLuong] [int] NULL,
	[IDUser] [int] NULL,
	[IDHangHoa] [int] NULL,
	[IsXuat] [bit] NULL,
 CONSTRAINT [PK_LichSuKho] PRIMARY KEY CLUSTERED 
(
	[IDLichSuKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[IDLoaiHang] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [varchar](10) NULL,
	[TenLoai] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[IDLoaiHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[MaNhaCungCap] [varchar](10) NULL,
	[TenNhaCungCap] [nvarchar](30) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](40) NULL,
	[Password] [varchar](max) NULL,
	[Ho] [nvarchar](20) NULL,
	[Ten] [nvarchar](40) NULL,
	[SoDienThoai] [varchar](13) NULL,
	[CMND] [varchar](15) NULL,
	[NgaySinh] [date] NULL,
	[NgayVaoLam] [date] NULL,
	[QueQuan] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[IDQuyen] [int] NULL,
	[IsMale] [bit] NULL,
	[Avatar] [varchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ViTri]    Script Date: 2/4/2018 1:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViTri](
	[IDViTri] [int] IDENTITY(1,1) NOT NULL,
	[TenViTri] [nvarchar](40) NULL,
 CONSTRAINT [PK_ViTri] PRIMARY KEY CLUSTERED 
(
	[IDViTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DonViTinh] ON 

INSERT [dbo].[DonViTinh] ([IDDonVi], [DonVi]) VALUES (1, N'Cái')
INSERT [dbo].[DonViTinh] ([IDDonVi], [DonVi]) VALUES (2, N'mét')
INSERT [dbo].[DonViTinh] ([IDDonVi], [DonVi]) VALUES (3, N'kg')
INSERT [dbo].[DonViTinh] ([IDDonVi], [DonVi]) VALUES (4, N'bộ')
SET IDENTITY_INSERT [dbo].[DonViTinh] OFF
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (1, NULL, N'MH00001', N'Đầu cốt đồng SC 6', 50, 1, NULL, 10, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (2, NULL, N'MH00002', N'Đầu cốt đồng dài 6, 10, 16', 100, 1, NULL, 10, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (3, NULL, N'MH00003', N'Đầu cốt đồng nhôm AM', 100, 1, NULL, 10, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (4, NULL, N'MH00004', N'Ống nối nhôm', 100, 1, NULL, 10, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (5, NULL, N'MH00005', N'Ống nối đồng', 100, 1, NULL, 10, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (6, NULL, N'MH00006', N'Cầu chì át - hãng TQ', 500, 1, NULL, 5, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (7, NULL, N'MH00007', N'Ống chì cho cầu chì át - hãng TQ', 500, 1, NULL, 5, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (8, NULL, N'MH00008', N'sứ OA', 400, 1, NULL, 5, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (9, NULL, N'MH00009', N'sứ kẹp thanh', 200, 1, NULL, 5, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (10, NULL, N'MH00010', N'Máy cắt', 50, 1, NULL, 6, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (11, NULL, N'MH00011', N'ABN100A hãng LS', 50, 1, NULL, 6, NULL, NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (12, NULL, N'MH00012', N'MCB 10A, 15A, 20A', 50, 1, NULL, 6, N'Himel', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (13, NULL, N'MH00013', N'Dây oval (VTCFK) 2 x 1,5', 100, 2, NULL, 9, N'Cadisun', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (14, NULL, N'MH00014', N'Dây oval (VTCFK) 2 x 2,5', 100, 2, NULL, 9, N'Cadisun', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (15, NULL, N'MH00015', N'Dây oval (VTCFK) 2 x 4', 100, 2, NULL, 9, N'Cadisun', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (16, NULL, N'MH00016', N'Dây oval (VTCFK) 2 x 1,5', 100, 2, NULL, 9, N'Ngọc Khánh', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (17, NULL, N'MH00017', N'Dây oval (VTCFK) 2 x 2,5', 100, 2, NULL, 9, N'Ngọc Khánh', NULL)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [Hang], [DonGia]) VALUES (18, NULL, N'MH00018', N'Dây oval (VTCFK) 2 x 4', 100, 2, NULL, 9, N'Ngọc Khánh', NULL)
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (1, N'L000001', N'Cầu dao, cầu chì, sứ xuyên', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (2, N'L000002', N'Vỏ tủ điện các loại: ngoài trời, trong nhà, âm tường', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (3, N'L000003', N'thang, máng cáp', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (4, N'L000004', N'cầu dao phụ tải', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (5, N'L000005', N'phụ kiện tủ điện', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (6, N'L000006', N'thiết bị đóng cắt tự động', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (7, N'L000007', N'chuyển mạch, đèn báo, nút ấn', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (8, N'L000008', N'phụ kiện đường dây', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (9, N'L000009', N'dây, cáp điện', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (10, N'L000010', N'Đầu cốt các loại', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (11, N'L000011', N'thiết bị an toàn lao động', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (12, N'L000012', N'thiết bị đo lường', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (13, N'L000013', N'sứ, ti sứ, kẹp thanh cái', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (14, N'L000014', N'chống sét van', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (15, N'L000015', N'ống chì', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (16, N'L000016', N'tụ bù - bộ điều khiển tụ bù', NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu]) VALUES (17, N'L000017', N'kim chống sét và phụ kiện', NULL)
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Người quản lý')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar]) VALUES (1, N'haoht', N'123456', N'Hoàng Trần', N'Hảo', N'0168343928', N'153876236', CAST(N'1995-03-05' AS Date), CAST(N'2017-03-05' AS Date), N'Phú Thọ', N'Tây Sơn, Hà Nội', 1, 1, NULL)
INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar]) VALUES (2, N'minhbq', N'123456', N'Bùi Quang', N'Minh', N'0986485659', N'157938234', CAST(N'1997-08-23' AS Date), CAST(N'2017-04-05' AS Date), N'Bắc Giang', N'Bạch Mai, Hà Nội', 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E44DF59FEA]    Script Date: 2/4/2018 1:26:43 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E44DF59FEA] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E4BF588BD7]    Script Date: 2/4/2018 1:26:43 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E4BF588BD7] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HangHoa] FOREIGN KEY([IDHangHoa])
REFERENCES [dbo].[HangHoa] ([IDHangHoa])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[HoaDon] ([IDHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_DonViTinh] FOREIGN KEY([IDDonVi])
REFERENCES [dbo].[DonViTinh] ([IDDonVi])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_DonViTinh]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHang] FOREIGN KEY([IDLoaiHang])
REFERENCES [dbo].[LoaiHang] ([IDLoaiHang])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHang]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([IDNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([IDNhaCungCap])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_ViTri] FOREIGN KEY([IDViTri])
REFERENCES [dbo].[ViTri] ([IDViTri])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_ViTri]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_User]
GO
ALTER TABLE [dbo].[LichSuKho]  WITH CHECK ADD  CONSTRAINT [FK_LichSuKho_HangHoa] FOREIGN KEY([IDHangHoa])
REFERENCES [dbo].[HangHoa] ([IDHangHoa])
GO
ALTER TABLE [dbo].[LichSuKho] CHECK CONSTRAINT [FK_LichSuKho_HangHoa]
GO
ALTER TABLE [dbo].[LichSuKho]  WITH CHECK ADD  CONSTRAINT [FK_LichSuKho_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[LichSuKho] CHECK CONSTRAINT [FK_LichSuKho_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Quyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[Quyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Quyen]
GO
