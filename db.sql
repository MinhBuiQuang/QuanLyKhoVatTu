
create database QuanLyKho
USE [QuanLyKho]
GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
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
	@IDNhaCungCap int = NULL,
	@IDDonVi int,
	@IDViTri int = NULL,
	@IDLoaiHang int,
	@Image varchar(MAX) = NULL
AS
BEGIN
	INSERT INTO HangHoa(TenHangHoa, SoLuongTonKho, DonGia, GhiChu, IDNhaCungCap, IDDonVi, IDViTri, IDLoaiHang, IsDeleted, Image)
	VALUES(@TenHangHoa, 0, @DonGia, @GhiChu, @IDNhaCungCap, @IDDonVi, @IDViTri, @IDLoaiHang, 0, @Image)

	DECLARE @IDHangHoa int = SCOPE_IDENTITY()
	DECLARE @MaHangHoa nvarchar(10) 
	
	SET @MaHangHoa = 'MH' + REPLICATE('0', 8 - LEN(CONVERT(nvarchar, @IDHangHoa))) + CONVERT(nvarchar, @IDHangHoa)

	UPDATE HangHoa
	SET MaHangHoa = @MaHangHoa
	WHERE IDHangHoa = @IDHangHoa
END 

GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
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
		lh.IDLoaiHang, lh.TenLoai, ncc.IDNhaCungCap, ncc.TenNhaCungCap, hh.DonGia, hh.GhiChu, hh.IDParent, hh.Image, vt.IDViTri, vt.TenViTri
		FROM [HangHoa] hh	LEFT JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							LEFT JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
							LEFT JOIN ViTri vt ON vt.IDViTri = hh.IDViTri
							LEFT JOIN NhaCungCap ncc ON ncc.IDNhaCungCap = hh.IDNhaCungCap
		WHERE hh.IsDeleted = 0
	ELSE
		SELECT hh.IDHangHoa, hh.MaHangHoa, hh.TenHangHoa, hh.SoLuongTonKho, dv.IDDonVi, dv.TenDonVi, 
		lh.IDLoaiHang, lh.TenLoai, ncc.IDNhaCungCap, ncc.TenNhaCungCap, hh.DonGia, hh.GhiChu, hh.IDParent, hh.Image, vt.IDViTri, vt.TenViTri
		FROM [HangHoa] hh	LEFT JOIN DonViTinh dv ON dv.IDDonVi = hh.IDDonVi
							LEFT JOIN LoaiHang lh ON lh.IDLoaiHang = hh.IDLoaiHang
							LEFT JOIN ViTri vt ON vt.IDViTri = hh.IDViTri
							LEFT JOIN NhaCungCap ncc ON ncc.IDNhaCungCap = hh.IDNhaCungCap
		WHERE hh.IDHangHoa = @IDHangHoa AND hh.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_HangHoa_Update]
	@IDHangHoa int,
	@TenHangHoa nvarchar(50),
	@DonGia float,
	@GhiChu nvarchar(MAX),
	@IDNhaCungCap int = NULL,
	@IDDonVi int = NULL,
	@IDViTri int = NULL,
	@IDLoaiHang int = NULL,
	@Image varchar(MAX) = NULL
AS
BEGIN	
	UPDATE HangHoa
	SET TenHangHoa = @TenHangHoa,
		DonGia = @DonGia,
		GhiChu = @GhiChu,
		IDNhaCungCap = ISNULL(@IDNhaCungCap, IDNhaCungcap),
		IDDonVi = ISNULL(@IDDonVi, IDDonVi),
		IDViTri = ISNULL(@IDViTri, IDViTri),
		IDLoaiHang = ISNULL(@IDLoaiHang, IDLoaiHang),
		Image = @Image
	WHERE IDHangHoa = @IDHangHoa
END 

GO
/****** Object:  StoredProcedure [dbo].[sp_LichSuKho_NhapKho]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NhaCungCap_Delete]
	@IDNhaCungCap int
AS
BEGIN
	DELETE FROM NhaCungCap
	WHERE IDNhaCungCap = @IDNhaCungCap
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NhaCungCap_Insert]
	@TenNhaCungCap nvarchar(50),
	@SoDienThoai varchar(20),
	@GhiChu nvarchar(MAX)
AS
BEGIN
	INSERT INTO NhaCungCap (TenNhaCungCap, SoDienThoai, GhiChu)
	VALUES (@TenNhaCungCap, @SoDienThoai, @GhiChu)
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NhaCungCap_Select]
AS
BEGIN
	SELECT ncc.IDNhaCungCap, ncc.TenNhaCungCap, ncc.SoDienThoai, ncc.GhiChu
	FROM NhaCungCap ncc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_NhaCungCap_Update]
	@IDNhaCungCap int,
	@TenNhaCungCap nvarchar(50),
	@SoDienThoai varchar(20),
	@GhiChu nvarchar(MAX)
AS
BEGIN
	UPDATE NhaCungCap
	SET TenNhaCungCap = @TenNhaCungCap,
		SoDienThoai = @SoDienThoai,
		GhiChu = @GhiChu
	WHERE IDNhaCungCap = @IDNhaCungCap
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Delete]
	@IDUser int
AS
BEGIN
	UPDATE [User]
	SET IsDeleted = 1
	WHERE IDUser = @IDUser
END

GO
/****** Object:  StoredProcedure [dbo].[sp_User_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Insert]
	@Username varchar(50),
	@Password nvarchar(max),
	@Ho nvarchar(30) = NULL,
	@Ten nvarchar(20) = NULL,
	@SoDienThoai varchar(13) = NULL,
	@CMND varchar(15) = NULL,
	@NgaySinh date = NULL,
	@NgayVaoLam date = NULL,
	@QueQuan nvarchar(200) = NULL,
	@DiaChi nvarchar(200) = NULL,
	@IDQuyen int,
	@IsMale bit,
	@Avatar varchar(MAX) = NULL
AS
BEGIN
	INSERT INTO [User](Username, Password, Ho, Ten, SoDienThoai, CMND, NgaySinh, NgayVaoLam, QueQuan, DiaChi, IDQuyen, IsMale, Avatar, IsDeleted)
	VALUES(@Username, @Password, @Ho, @Ten, @SoDienThoai, @CMND, @NgaySinh, @NgayVaoLam, @QueQuan, @DiaChi, @IDQuyen, @IsMale, @Avatar, 0)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_User_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
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
		SELECT IDUser, Username, (Ho + ' ' + Ten) as Ten, SoDienThoai, CMND, QueQuan, DiaChi, Quyen.IDQuyen, Quyen.TenQuyen, IsMale, NgaySinh, NgayVaoLam, Avatar
		FROM [User]	INNER JOIN Quyen ON [User].IDQuyen = Quyen.IDQuyen
		WHERE IsDeleted = 0
	ELSE
		SELECT IDUser, Username, Ho, Ten, SoDienThoai, CMND, QueQuan, DiaChi, Quyen.IDQuyen, Quyen.TenQuyen, IsMale, NgaySinh, NgayVaoLam, Avatar
		FROM [User]	INNER JOIN Quyen ON [User].IDQuyen = Quyen.IDQuyen
		WHERE IDUser = @IDUser AND IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_User_Update]
	@IDUser int,
	@Password nvarchar(max) = NULL,
	@Ho nvarchar(30) = NULL,
	@Ten nvarchar(20) = NULL,
	@SoDienThoai varchar(13) = NULL,
	@CMND varchar(15) = NULL,
	@NgaySinh date = NULL,
	@NgayVaoLam date = NULL,
	@QueQuan nvarchar(200) = NULL,
	@DiaChi nvarchar(200) = NULL,
	@IDQuyen int = NULL,
	@IsMale bit = NULL,
	@Avatar varchar(MAX) = NULL
AS
BEGIN
	UPDATE [User]
	SET Password = ISNULL(@Password, Password),
		Ho = ISNULL(@Ho, Ho),
		Ten = ISNULL(@Ten, Ten),
		SoDienThoai = ISNULL(@SoDienThoai, SoDienThoai),
		CMND = ISNULL(@CMND, CMND),
		NgaySinh = ISNULL(@NgaySinh, NgaySinh),
		NgayVaoLam = ISNULL(@NgayVaoLam, NgayVaoLam),
		QueQuan = ISNULL(@QueQuan, QueQuan),
		DiaChi = ISNULL(@DiaChi, DiaChi),
		IDQuyen = ISNULL(@IDQuyen, IDQuyen),
		IsMale = ISNULL(@IsMale, IsMale),
		Avatar = ISNULL(@Avatar, Avatar)
	WHERE IDUser = @IDUser
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Delete]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ViTri_Delete]
	@IDViTri int
AS
BEGIN
	DELETE FROM ViTri
	WHERE IDViTri = @IDViTri
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Insert]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ViTri_Insert]
	@TenViTri nvarchar(40)
AS
BEGIN
	INSERT INTO ViTri(TenViTri) 
	VALUES(@TenViTri)
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Select]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ViTri_Select]
AS
BEGIN
	SELECT IDViTri, TenViTri
	FROM ViTri
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Update]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ViTri_Update]
	@IDViTri int,
	@TenViTri nvarchar(40)
AS
BEGIN
	UPDATE ViTri
	SET TenViTri = @TenViTri
	WHERE IDViTri = @IDViTri
END 
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[HangHoa]    Script Date: 2/10/2018 1:31:40 PM ******/
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
	[Image] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[IDHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [varchar](10) NULL,
	[TenKhachHang] [nvarchar](40) NULL,
	[TenCongTy] [nvarchar](40) NULL,
	[SoDienThoai] [varchar](15) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MaSoThue] [varchar](20) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LichSuKho]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[IDNhaSanXuat] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaSanXuat] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[IDNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2/10/2018 1:31:40 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/10/2018 1:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](40) NULL,
	[Password] [nvarchar](max) NULL,
	[Ho] [nvarchar](30) NULL,
	[Ten] [nvarchar](20) NULL,
	[SoDienThoai] [varchar](13) NULL,
	[CMND] [varchar](15) NULL,
	[NgaySinh] [date] NULL,
	[NgayVaoLam] [date] NULL,
	[QueQuan] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[IDQuyen] [int] NULL,
	[IsMale] [bit] NULL,
	[Avatar] [varchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ViTri]    Script Date: 2/10/2018 1:31:40 PM ******/
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
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (103, NULL, N'MH00000103', N'Dây oval ', 101, 5, NULL, 9, NULL, 500000, N'', N'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', 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (104, NULL, N'MH00000103-104', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (105, NULL, N'MH00000103-105', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (106, NULL, N'MH00000103-106', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (107, NULL, N'MH00000103-107', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (108, NULL, N'MH00000103-108', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (109, NULL, N'MH00000103-109', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (110, NULL, N'MH00000103-110', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (111, NULL, N'MH00000103-111', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (112, NULL, N'MH00000103-112', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (113, NULL, N'MH00000103-113', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (114, NULL, N'MH00000103-114', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (115, NULL, N'MH00000103-115', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (116, NULL, N'MH00000103-116', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (117, NULL, N'MH00000103-117', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (118, NULL, N'MH00000103-118', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (119, NULL, N'MH00000103-119', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (120, NULL, N'MH00000103-120', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (121, NULL, N'MH00000103-121', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (122, NULL, N'MH00000103-122', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (123, NULL, N'MH00000103-123', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (124, NULL, N'MH00000103-124', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (125, NULL, N'MH00000103-125', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (126, NULL, N'MH00000103-126', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (127, NULL, N'MH00000103-127', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (128, NULL, N'MH00000103-128', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (129, NULL, N'MH00000103-129', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (130, NULL, N'MH00000103-130', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (131, NULL, N'MH00000103-131', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (132, NULL, N'MH00000103-132', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (133, NULL, N'MH00000103-133', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (134, NULL, N'MH00000103-134', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (135, NULL, N'MH00000103-135', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (136, NULL, N'MH00000103-136', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (137, NULL, N'MH00000103-137', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (138, NULL, N'MH00000103-138', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (139, NULL, N'MH00000103-139', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (140, NULL, N'MH00000103-140', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (141, NULL, N'MH00000103-141', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (142, NULL, N'MH00000103-142', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (143, NULL, N'MH00000103-143', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (144, NULL, N'MH00000103-144', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (145, NULL, N'MH00000103-145', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (146, NULL, N'MH00000103-146', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (147, NULL, N'MH00000103-147', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (148, NULL, N'MH00000103-148', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (149, NULL, N'MH00000103-149', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (150, NULL, N'MH00000103-150', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (151, NULL, N'MH00000103-151', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (152, NULL, N'MH00000103-152', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (153, NULL, N'MH00000103-153', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (154, NULL, N'MH00000103-154', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (155, NULL, N'MH00000103-155', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (156, NULL, N'MH00000103-156', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (157, NULL, N'MH00000103-157', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (158, NULL, N'MH00000103-158', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (159, NULL, N'MH00000103-159', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (160, NULL, N'MH00000103-160', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (161, NULL, N'MH00000103-161', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (162, NULL, N'MH00000103-162', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (163, NULL, N'MH00000103-163', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (164, NULL, N'MH00000103-164', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (165, NULL, N'MH00000103-165', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (166, NULL, N'MH00000103-166', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (167, NULL, N'MH00000103-167', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (168, NULL, N'MH00000103-168', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (169, NULL, N'MH00000103-169', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (170, NULL, N'MH00000103-170', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (171, NULL, N'MH00000103-171', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (172, NULL, N'MH00000103-172', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (173, NULL, N'MH00000103-173', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (174, NULL, N'MH00000103-174', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (175, NULL, N'MH00000103-175', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (176, NULL, N'MH00000103-176', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (177, NULL, N'MH00000103-177', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (178, NULL, N'MH00000103-178', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (179, NULL, N'MH00000103-179', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (180, NULL, N'MH00000103-180', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (181, NULL, N'MH00000103-181', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (182, NULL, N'MH00000103-182', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (183, NULL, N'MH00000103-183', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (184, NULL, N'MH00000103-184', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (185, NULL, N'MH00000103-185', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (186, NULL, N'MH00000103-186', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (187, NULL, N'MH00000103-187', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (188, NULL, N'MH00000103-188', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (189, NULL, N'MH00000103-189', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (190, NULL, N'MH00000103-190', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (191, NULL, N'MH00000103-191', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (192, NULL, N'MH00000103-192', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (193, NULL, N'MH00000103-193', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (194, NULL, N'MH00000103-194', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (195, NULL, N'MH00000103-195', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (196, NULL, N'MH00000103-196', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (197, NULL, N'MH00000103-197', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (198, NULL, N'MH00000103-198', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (199, NULL, N'MH00000103-199', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (200, NULL, N'MH00000103-200', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (201, NULL, N'MH00000103-201', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
GO
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (202, NULL, N'MH00000103-202', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (203, NULL, N'MH00000103-203', N'Dây oval ', 300, 2, NULL, 9, 103, 10000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (204, NULL, N'MH00000204', N'ABN100A hãng LS', 300, 1, NULL, 6, NULL, 400000, N'', N'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RS6Zs6tNp2mzfVxHcUMrdjH5OvMWgvB42l0Soez+ur5WDqL15d+JeXC8WmlNQ7B/KcYXzydBBHLX2hmlB61RWC07RrWl4Bk3nncYFyPK8Khn1aR7tYzzDmIUadzn2RLVKN2ntiYOotgLbGn3UcLvIlno6RGilUHeDaftV9YqWoslfI2eiCiJzIDzz2N3viK4FEZKii/ZFuW43rLf1LfBY6B/IsToa4K+9Rzw2LgA641BE1RLHd8y4AtBNGoVVpm8Cf2WpXrb8jOeWuJYosacpqnjtVVL7ah2Npt5SxkUBytapZvxdbZX6SkSLbpF6OYLV0t6T9oxYOvTcQq4FOd4mR5mR8BiFVtXVuJ1J8IZPXFY1HI9rpwJu778yx9VAtgC9mOTiFVVbWML2E5L46wHI/wUZa8KgtZ8qzZ4fA9KDozwGn1nRD+Xprq+8HLVFggwPXMsFDeca1FOzGIxjFKtcQ1+KL1Xf4iluhXiWa9JYtsd3I32w1+ek2a6jdl/A/UWoaKdGbMZgAs6K3a2igoAsuu8+sQmddlXari6gKT0ja43XrLd2c88JRVZbVQd9wx5P8e7FvpKgOVchzLilZkUDQq67sLltPzj9inpU2b+VsPwTpspq9bHX7fuYFiiHeWy71nmGDrM7iqYT7hZDVq4xBXnZIbNue8Q+jlCvlv5DDLl/Rv5b+W/kJfyXL+lcv5V+W/kuLf0b+W//wAIlIatB2CdWyLR1Lld5VSpXWYlSjiByEG7nVsqVKld5USpX/4J4ANWMELb4hjAV/2LqlBnkPsojqj6ufB9XWbcVbjL+78xf8NXJ/yR4YJbsStldcGYiyP4BWmRl1Cg8BsvHQyoOgTPswGoZjEcCPLLCmJGKFL+V0ch0iKqnArrrxeZUp0u/ltObslnghea+zBjtL7Wlc6CcmX7wJsnoBevj//aAAwDAQACAAMAAAAQ88cMMMsMMMcssM8sccsMIMM8MMsc8MsMMMMM8c88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888w0888888888888888888888888888888888888888M88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888881w884548884088808888540845w8844w88418888oKs88oH8888R1888sW888lWU880P884hz88ssQ888srq88sqw8847d880+w8882d884fe8+oK888oEg884slow4+wHw4wZT80GPy080Cm0801+3zCJb08+Ra084p0wwpS/GZuI+p4EA94qMemqV4TkDLsPVRh76JJW8sdnY0dRNHYs0xgBXrVhWvS/wAA+Cli5hrOOkRaXYtvGED+YuB63k4AtoYxR1qt9Fy8ISSk+9G/XHf+iZbdPLNNUBKJchYLBPatEIzmDvGMzefJGvXKIKARLDrC9POMNANPDADNPHOOPJMJOPPCuBhXPOKPPIBBCPICvNPCNkKEjIFNFEcLGPENBEgGGANBTqRLDXGFBImFmGPlOZOqhXgWXBbOe+4cIuqweBzmpPKa3oHtILQv/wCahdTxTwBDBASjxByyiwhgyjDSDiDTDhxxhAjDyhBiCDhTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyCCADzyCCDz//EACgRAQACAQQBAwQCAwAAAAAAAAEAESEQIDFBUWFxgTBAkaHB0WCA4f/aAAgBAwEBPxD/AFzC9oXxKTYZ+kC8bavj6VO4bVl46tgA0lo8bDVaXiDxSWjZgq0494XNC4Ni+iRK9+4gGi8bGVJSB7wIaLwemzMmiB79xiii3YhraSsd4vMSDReNlleaHx6kx1tqGdlniVi9i1ErZwSnalbEzuz39Jh0DBeeav8AMR82h9K/s1doXKRioHdPccFvL4p/rYweUAd09yt2g36I6oqylTg1V4PP5hKLRb6NpU50q4ifEgPA9wEBQ3XSNbBC3VV5DzL41LfRtKgpQIBllsmyA7p7lhkjebpGk1AWsqY4AeMWDENVQ37my4zO3Hu3DCuOf0H8aArRAqmUQtxwlZWSHacOgqpFRa6xy8FX81/UVkC0IBkSzf2/m4t7P/W5gDjQHKOhcED4l9fFqfMTS2X+IAPhuX+sZr5zHVMXuOozlVA+GP8A1KfK3TBZdSw9RATij4AP4gluJQvWoS150pm8y4uKDzC2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', 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (205, NULL, N'MH00000103-205', N'Dây oval ', 79, 2, NULL, 9, 103, 7000, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (206, NULL, N'MH00000103-206', N'Dây oval ', 12, 2, NULL, 9, 205, 12, N'', NULL, 0)
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[LichSuKho] ON 

INSERT [dbo].[LichSuKho] ([IDLichSuKho], [ThoiGian], [SoLuong], [IDUser], [IDHangHoa], [IsXuat]) VALUES (1006, CAST(N'2018-02-10 09:48:17.807' AS DateTime), 100, 1, 103, 0)
INSERT [dbo].[LichSuKho] ([IDLichSuKho], [ThoiGian], [SoLuong], [IDUser], [IDHangHoa], [IsXuat]) VALUES (1007, CAST(N'2018-02-10 09:50:38.287' AS DateTime), 300, 1, 204, 0)
INSERT [dbo].[LichSuKho] ([IDLichSuKho], [ThoiGian], [SoLuong], [IDUser], [IDHangHoa], [IsXuat]) VALUES (1008, CAST(N'2018-02-10 09:54:37.290' AS DateTime), 1, 1, 103, 0)
INSERT [dbo].[LichSuKho] ([IDLichSuKho], [ThoiGian], [SoLuong], [IDUser], [IDHangHoa], [IsXuat]) VALUES (1009, CAST(N'2018-02-10 09:55:09.873' AS DateTime), 1, 1, 205, 0)
SET IDENTITY_INSERT [dbo].[LichSuKho] OFF
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

INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar], [IsDeleted]) VALUES (1, N'haoht', N'123456', N'Hoàng Trần', N'Hảo', N'0168343928', N'153876236', CAST(N'1995-03-05' AS Date), CAST(N'2017-03-05' AS Date), N'Phú Thọ', N'Tây Sơn, Hà Nội', 1, 1, NULL, NULL)
INSERT [dbo].[User] ([IDUser], [Username], [Password], [Ho], [Ten], [SoDienThoai], [CMND], [NgaySinh], [NgayVaoLam], [QueQuan], [DiaChi], [IDQuyen], [IsMale], [Avatar], [IsDeleted]) VALUES (2, N'minhbq', N'123456', N'Bùi Quang', N'Minh', N'0986485659', N'157938234', CAST(N'1997-08-23' AS Date), CAST(N'2017-04-05' AS Date), N'Bắc Giang', N'Bạch Mai, Hà Nội', 2, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E44DF59FEA]    Script Date: 2/10/2018 1:31:40 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E44DF59FEA] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E4BF588BD7]    Script Date: 2/10/2018 1:31:40 PM ******/
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
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD CHECK  (([SoLuongTonKho]>=(0)))
GO
