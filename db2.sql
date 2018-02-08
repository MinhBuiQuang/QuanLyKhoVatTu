USE [QuanLyKho]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietHangHoa_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ChiTietHangHoa_Select]
AS
BEGIN
		SELECT ct.IDChiTietHangHoa, ct.IDHangHoa, ct.SoLuongTonKho, ct.DonGia, ct.GhiChu
		FROM ChiTietHangHoa ct INNER JOIN DonViTinh dv ON ct.IDDonVi = dv.IDDonVi
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Delete]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DonViTinh_Delete]
	@IDDonVi int
AS
BEGIN
	DELETE DonViTinh
	WHERE IDDonVi = @IDDonVi
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Insert]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DonViTinh_Insert]
	@DonVi nvarchar(10)
AS
BEGIN
	INSERT INTO DonViTinh(DonVi)
	VALUES(@DonVi)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DonViTinh_Select]
AS
BEGIN
	SELECT dv.IDDonVi, dv.TenDonVi
	FROM DonViTinh dv
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Update]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DonViTinh_Update]
	@IDDonVi int,
	@DonVi nvarchar(10)
AS
BEGIN
	UPDATE DonViTinh
	SET DonVi = @DonVi
	WHERE IDDonVi = @IDDonVi
END

GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Insert]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_HangHoa_Insert]
	@TenHangHoa nvarchar(50),
	@DonGia float,
	@GhiChu nvarchar(MAX),
	@IDNhaCungCap int,
	@IDDonVi int,
	@IDViTri int,
	@IDLoaiHang int
AS
BEGIN
	INSERT INTO HangHoa(TenHangHoa, SoLuongTonKho, DonGia, GhiChu, IDNhaCungCap, IDDonVi, IDViTri, IDLoaiHang, IsDeleted)
	VALUES(@TenHangHoa, 0, @DonGia, @GhiChu, @IDNhaCungCap, @IDDonVi, @IDViTri, @IDLoaiHang, 0)

	DECLARE @IDHangHoa int = SCOPE_IDENTITY()
	DECLARE @MaHangHoa nvarchar(10) 
	
	SET @MaHangHoa = 'MH' + REPLICATE('0', 8 - LEN(CONVERT(nvarchar, @IDHangHoa))) + CONVERT(nvarchar, @IDHangHoa)

	UPDATE HangHoa
	SET MaHangHoa = @MaHangHoa
	WHERE IDHangHoa = @IDHangHoa
END 

GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
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
		SELECT hh.IDHangHoa, hh.MaHangHoa, hh.TenHangHoa, hh.SoLuongTonKho, dv.IDDonVi, dv.TenDonVi, 
		lh.IDLoaiHang, lh.TenLoai, ncc.IDNhaCungCap, ncc.TenNhaCungCap, hh.DonGia, hh.GhiChu, hh.IDParent
		FROM [HangHoa] hh	LEFT JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							LEFT JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
							LEFT JOIN ViTri vt ON vt.IDViTri = hh.IDViTri
							LEFT JOIN NhaCungCap ncc ON ncc.IDNhaCungCap = hh.IDNhaCungCap
		WHERE hh.IsDeleted = 0
	ELSE
		SELECT hh.IDHangHoa, hh.MaHangHoa, hh.TenHangHoa, hh.SoLuongTonKho, dv.IDDonVi, dv.TenDonVi, 
		lh.IDLoaiHang, lh.TenLoai, ncc.IDNhaCungCap, ncc.TenNhaCungCap, hh.DonGia, hh.GhiChu, hh.IDParent
		FROM [HangHoa] hh	LEFT JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							LEFT JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
							LEFT JOIN ViTri vt ON vt.IDViTri = hh.IDViTri
							LEFT JOIN NhaCungCap ncc ON ncc.IDNhaCungCap = hh.IDNhaCungCap
		WHERE hh.IDHangHoa = @IDHangHoa AND hh.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LichSuKho_NhapKho]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LichSuKho_NhapKho]
	@ThoiGian DateTime,
	@SoLuong float,
	@IDUser int,
	@IDHangHoa int,
	@HaveSub bit = 0,
	@DonGiaSub float = NULL,
	@SoLuongSub float = NUll,
	@IDDonViSub int = NULL
AS
BEGIN
	INSERT INTO LichSuKho(ThoiGian, SoLuong, IDUser, IDHangHoa, IsXuat)
	VALUES(@ThoiGian, @SoLuong, @IDUser, @IDHangHoa, 0)

	IF @HaveSub = 1
	BEGIN
		DECLARE @i float = 0
		DECLARE @TenHangHoa nvarchar(50) = (SELECT TenHangHoa FROM HangHoa WHERE IDHangHoa = @IDHangHoa)
		DECLARE @MaHangHoa nvarchar(10) = (SELECT MaHangHoa FROM HangHoa WHERE IDHangHoa = @IDHangHoa)
		DECLARE @IDNhaCungCap int = (SELECT IDNhaCungCap FROM HangHoa WHERE IDHangHoa = @IDHangHoa)
		DECLARE @IDViTri int = (SELECT IDViTri FROM HangHoa WHERE IDHangHoa = @IDHangHoa)
		DECLARE @IDLoaiHang int = (SELECT IDLoaiHang FROM HangHoa WHERE IDHangHoa = @IDHangHoa)
		WHILE @i < @SoLuong
		BEGIN
			INSERT INTO HangHoa(TenHangHoa, SoLuongTonKho, DonGia, GhiChu, IDNhaCungCap, IDDonVi, IDViTri, IDLoaiHang, IDParent, IsDeleted)
			VALUES(@TenHangHoa, @SoLuongSub, @DonGiaSub, '', @IDNhaCungCap, @IDDonViSub, @IDViTri, @IDLoaiHang, @IDHangHoa, 0)
			DECLARE @IDHangHoaSub int = SCOPE_IDENTITY()

			UPDATE HangHoa
			SET MaHangHoa = @MaHangHoa + '-' + CONVERT(NVARCHAR(10),@IDHangHoaSub)
			WHERE IDHangHoa = @IDHangHoaSub
			SET @i = @i + 1
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Delete]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoaiHang_Delete]
	@IDLoaiHang int
AS
BEGIN
	UPDATE LoaiHang
	SET IsDelete = 1
	WHERE IDLoaiHang = @IDLoaiHang
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Insert]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoaiHang_Insert]
	@TenLoai nvarchar(250),
	@GhiChu nvarchar(MAX)
AS
BEGIN
	INSERT INTO LoaiHang(TenLoai, GhiChu, IsDelete)
	VALUES(@TenLoai, @GhiChu, 0)
	
	DECLARE @IDLoaiHang int
	DECLARE @MaLoai varchar(15)
	SET @IDLoaiHang = SCOPE_IDENTITY()
	SET @MaLoai = 'LH' + REPLICATE('0', 6 - LEN(CONVERT(nvarchar, @IDLoaiHang))) + CONVERT(nvarchar, @IDLoaiHang)

	UPDATE LoaiHang
	SET MaLoai = @MaLoai
	WHERE IDLoaiHang = @IDLoaiHang
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoaiHang_Select]
AS
BEGIN
	SELECT lh.IDLoaiHang, lh.MaLoai, lh.TenLoai, lh.GhiChu
	FROM LoaiHang lh
END

GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Update]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoaiHang_Update]
	@IDLoaiHang int,
	@TenLoai nvarchar(250) = NULL,
	@GhiChu nvarchar(MAX) = NULL
AS
BEGIN
	UPDATE LoaiHang
	SET TenLoai = ISNULL(TenLoai, @TenLoai),
		GhiChu = ISNULL(GhiChu, @GhiChu)
	WHERE IDLoaiHang = @IDLoaiHang
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Delete]    Script Date: 2/9/2018 4:11:08 AM ******/
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
	UPDATE QUYEN
	SET IsDelete = 1
	WHERE IDQuyen = @IDQuyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Insert]    Script Date: 2/9/2018 4:11:08 AM ******/
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
	@TenQuyen nvarchar(20)
AS
BEGIN
	INSERT INTO QUYEN(TenQuyen)
	VALUES(@TenQuyen)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Quyen_Select]
AS
BEGIN
	SELECT IDQuyen, TenQuyen
	FROM Quyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Update]    Script Date: 2/9/2018 4:11:08 AM ******/
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
	@TenQuyen nvarchar(20)
AS
BEGIN
	UPDATE QUYEN
	SET TenQuyen = @TenQuyen
	WHERE IDQuyen = @IDQuyen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_User_Select]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[IDDonVi] [int] IDENTITY(1,1) NOT NULL,
	[TenDonVi] [nvarchar](10) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[IDDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[IDHangHoa] [int] IDENTITY(1,1) NOT NULL,
	[IDNhaCungCap] [int] NULL,
	[MaHangHoa] [nvarchar](20) NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[SoLuongTonKho] [float] NULL,
	[IDDonVi] [int] NULL,
	[IDViTri] [int] NULL,
	[IDLoaiHang] [int] NULL,
	[IDParent] [int] NULL,
	[DonGia] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[IDHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [varchar](20) NULL,
	[ThoiGian] [datetime] NULL,
	[IDUser] [int] NULL,
	[IDKhachHang] [int] NULL,
	[IsDebt] [bit] NULL,
	[TienKhachTra] [float] NULL,
	[TienTraLai] [float] NULL,
	[TongTien] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[LichSuKho]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 2/9/2018 4:11:08 AM ******/
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
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[IDLoaiHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[Quyen]    Script Date: 2/9/2018 4:11:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/9/2018 4:11:08 AM ******/
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
/****** Object:  Table [dbo].[ViTri]    Script Date: 2/9/2018 4:11:08 AM ******/
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

INSERT [dbo].[DonViTinh] ([IDDonVi], [TenDonVi]) VALUES (1, N'Cái')
INSERT [dbo].[DonViTinh] ([IDDonVi], [TenDonVi]) VALUES (2, N'mét')
INSERT [dbo].[DonViTinh] ([IDDonVi], [TenDonVi]) VALUES (3, N'kg')
INSERT [dbo].[DonViTinh] ([IDDonVi], [TenDonVi]) VALUES (5, N'Cuộn')
SET IDENTITY_INSERT [dbo].[DonViTinh] OFF
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (1, N'L000001', N'Cầu dao, cầu chì, sứ xuyên', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (2, N'L000002', N'Vỏ tủ điện các loại: ngoài trời, trong nhà, âm tường', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (3, N'L000003', N'thang, máng cáp', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (4, N'L000004', N'cầu dao phụ tải', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (5, N'L000005', N'phụ kiện tủ điện', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (6, N'L000006', N'thiết bị đóng cắt tự động', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (7, N'L000007', N'chuyển mạch, đèn báo, nút ấn', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (8, N'L000008', N'phụ kiện đường dây', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (9, N'L000009', N'dây, cáp điện', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (10, N'L000010', N'Đầu cốt các loại', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (11, N'L000011', N'thiết bị an toàn lao động', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (12, N'L000012', N'thiết bị đo lường', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (13, N'L000013', N'sứ, ti sứ, kẹp thanh cái', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (14, N'L000014', N'chống sét van', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (15, N'L000015', N'ống chì', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (16, N'L000016', N'tụ bù - bộ điều khiển tụ bù', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (17, N'L000017', N'kim chống sét và phụ kiện', NULL, NULL)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (18, N'LH000018', N'loai hang hoa test', N'12312', 0)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (19, N'LH000019', N'loai hang hoa test', N'12312', 0)
INSERT [dbo].[LoaiHang] ([IDLoaiHang], [MaLoai], [TenLoai], [GhiChu], [IsDelete]) VALUES (20, N'LH000020', N'hang hoa tét 2', N'12312', 0)
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen], [IsDelete]) VALUES (1, N'Người quản lý', NULL)
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen], [IsDelete]) VALUES (2, N'Nhân viên', NULL)
SET IDENTITY_INSERT [dbo].[Quyen] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar]) VALUES (1, N'haoht', N'123456', N'Hoàng Trần', N'Hảo', N'0168343928', N'153876236', CAST(N'1995-03-05' AS Date), CAST(N'2017-03-05' AS Date), N'Phú Thọ', N'Tây Sơn, Hà Nội', 1, 1, NULL)
INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar]) VALUES (2, N'minhbq', N'123456', N'Bùi Quang', N'Minh', N'0986485659', N'157938234', CAST(N'1997-08-23' AS Date), CAST(N'2017-04-05' AS Date), N'Bắc Giang', N'Bạch Mai, Hà Nội', 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E44DF59FEA]    Script Date: 2/9/2018 4:11:08 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E44DF59FEA] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E4BF588BD7]    Script Date: 2/9/2018 4:11:08 AM ******/
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
