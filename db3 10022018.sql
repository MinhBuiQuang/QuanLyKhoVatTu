USE [QuanLyKho]
GO
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DonViTinh_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_HangHoa_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LichSuKho_NhapKho]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_LoaiHang_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_NhaCungCap_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Quyen_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_User_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Delete]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Insert]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Select]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViTri_Update]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[HangHoa]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[LichSuKho]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[Quyen]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/10/2018 1:35:18 AM ******/
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
/****** Object:  Table [dbo].[ViTri]    Script Date: 2/10/2018 1:35:18 AM ******/
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

INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (1, NULL, N'MH00000001', N'Dây oval (VTCFK)', 98, 5, NULL, 9, NULL, 500000, N'Ghi chú', N'', 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (2, NULL, N'MH00000001-2', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (3, NULL, N'MH00000001-3', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (5, NULL, N'MH00000001-5', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (6, NULL, N'MH00000001-6', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (7, NULL, N'MH00000001-7', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (9, NULL, N'MH00000001-9', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (10, NULL, N'MH00000001-10', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (11, NULL, N'MH00000001-11', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (12, NULL, N'MH00000001-12', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (13, NULL, N'MH00000001-13', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (14, NULL, N'MH00000001-14', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (15, NULL, N'MH00000001-15', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (16, NULL, N'MH00000001-16', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (17, NULL, N'MH00000001-17', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (18, NULL, N'MH00000001-18', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (19, NULL, N'MH00000001-19', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (20, NULL, N'MH00000001-20', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (21, NULL, N'MH00000001-21', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (22, NULL, N'MH00000001-22', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (23, NULL, N'MH00000001-23', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (24, NULL, N'MH00000001-24', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (25, NULL, N'MH00000001-25', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (26, NULL, N'MH00000001-26', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (27, NULL, N'MH00000001-27', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (28, NULL, N'MH00000001-28', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (29, NULL, N'MH00000001-29', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (30, NULL, N'MH00000001-30', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (31, NULL, N'MH00000001-31', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (32, NULL, N'MH00000001-32', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (33, NULL, N'MH00000001-33', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (34, NULL, N'MH00000001-34', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (35, NULL, N'MH00000001-35', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (36, NULL, N'MH00000001-36', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (37, NULL, N'MH00000001-37', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (38, NULL, N'MH00000001-38', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (39, NULL, N'MH00000001-39', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (40, NULL, N'MH00000001-40', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (41, NULL, N'MH00000001-41', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (42, NULL, N'MH00000001-42', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (43, NULL, N'MH00000001-43', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (44, NULL, N'MH00000001-44', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (45, NULL, N'MH00000001-45', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (46, NULL, N'MH00000001-46', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (47, NULL, N'MH00000001-47', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (48, NULL, N'MH00000001-48', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (49, NULL, N'MH00000001-49', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (50, NULL, N'MH00000001-50', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (51, NULL, N'MH00000001-51', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (52, NULL, N'MH00000001-52', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (53, NULL, N'MH00000001-53', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (54, NULL, N'MH00000001-54', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (55, NULL, N'MH00000001-55', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (56, NULL, N'MH00000001-56', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (57, NULL, N'MH00000001-57', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (58, NULL, N'MH00000001-58', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (59, NULL, N'MH00000001-59', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (60, NULL, N'MH00000001-60', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (61, NULL, N'MH00000001-61', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (62, NULL, N'MH00000001-62', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (63, NULL, N'MH00000001-63', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (64, NULL, N'MH00000001-64', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (65, NULL, N'MH00000001-65', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (66, NULL, N'MH00000001-66', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (67, NULL, N'MH00000001-67', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (68, NULL, N'MH00000001-68', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (69, NULL, N'MH00000001-69', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (70, NULL, N'MH00000001-70', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (71, NULL, N'MH00000001-71', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (72, NULL, N'MH00000001-72', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (73, NULL, N'MH00000001-73', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (74, NULL, N'MH00000001-74', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (75, NULL, N'MH00000001-75', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (76, NULL, N'MH00000001-76', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (77, NULL, N'MH00000001-77', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (78, NULL, N'MH00000001-78', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (79, NULL, N'MH00000001-79', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (80, NULL, N'MH00000001-80', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (81, NULL, N'MH00000001-81', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (82, NULL, N'MH00000001-82', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (83, NULL, N'MH00000001-83', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (84, NULL, N'MH00000001-84', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (85, NULL, N'MH00000001-85', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (86, NULL, N'MH00000001-86', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (87, NULL, N'MH00000001-87', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (88, NULL, N'MH00000001-88', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (89, NULL, N'MH00000001-89', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (90, NULL, N'MH00000001-90', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (91, NULL, N'MH00000001-91', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (92, NULL, N'MH00000001-92', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (93, NULL, N'MH00000001-93', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (94, NULL, N'MH00000001-94', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (95, NULL, N'MH00000001-95', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (96, NULL, N'MH00000001-96', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (97, NULL, N'MH00000001-97', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (98, NULL, N'MH00000001-98', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (99, NULL, N'MH00000001-99', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (100, NULL, N'MH00000001-100', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (101, NULL, N'MH00000001-101', N'Dây oval (VTCFK)', 200, 2, NULL, 9, 1, 4500, N'', NULL, 0)
GO
INSERT [dbo].[HangHoa] ([IDHangHoa], [IDNhaCungCap], [MaHangHoa], [TenHangHoa], [SoLuongTonKho], [IDDonVi], [IDViTri], [IDLoaiHang], [IDParent], [DonGia], [GhiChu], [Image], [IsDeleted]) VALUES (102, NULL, N'MH00000102', N'Cầu chì át', 0, 1, NULL, 1, NULL, 10000, N'', N'/9j/4AAQSkZJRgABAQEAAAAAAAD/4gIcSUNDX1BST0ZJTEUAAQEAAAIMbGNtcwIQAABtbnRyUkdCIFhZWiAH3AABABkAAwApADlhY3NwQVBQTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLWxjbXMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAApkZXNjAAAA/AAAAF5jcHJ0AAABXAAAAAt3dHB0AAABaAAAABRia3B0AAABfAAAABRyWFlaAAABkAAAABRnWFlaAAABpAAAABRiWFlaAAABuAAAABRyVFJDAAABzAAAAEBnVFJDAAABzAAAAEBiVFJDAAABzAAAAEBkZXNjAAAAAAAAAANjMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ZXh0AAAAAEZCAABYWVogAAAAAAAA9tYAAQAAAADTLVhZWiAAAAAAAAADFgAAAzMAAAKkWFlaIAAAAAAAAG+iAAA49QAAA5BYWVogAAAAAAAAYpkAALeFAAAY2lhZWiAAAAAAAAAkoAAAD4QAALbPY3VydgAAAAAAAAAaAAAAywHJA2MFkghrC/YQPxVRGzQh8SmQMhg7kkYFUXdd7WtwegWJsZp8rGm/fdPD6TD////bAEMAAgICAgICAwICAwQDAwMEBgQEBAQGCAYGBgYGCAkICAgICAgJCQkJCQkJCQsLCwsLCw0NDQ0NDg4ODg4ODg4ODv/bAEMBAgICBAMEBgMDBg8KCAoPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PD//CABEIAWgB4AMBIgACEQEDEQH/xAAdAAABBAMBAQAAAAAAAAAAAAABAAIGBwQFCAMJ/8QAGwEAAgIDAQAAAAAAAAAAAAAAAAEEBQIDBgf/2gAMAwEAAhADEAAAAeFnNdi3FpYiUJIloJEGkgSSQ0QmEFAgkkkSDUSDSkMEoASGkigaUgJDker2ua8WPYmGODAHAEUkAlAEUMFIQKTYcChJJiJCMV7XrIFESRIIpNAkg1FAxyQkHIGkoGlwYHJJglNNDnAxEgCUhpRY0PAL0ag9CALzaQZNBSEkgCSBJEQKQy0oRTSMoIEkQRIDwc1+OQcHNIoiCRYWkiaHIEi1jmuQIOAOaiIJIECBlFoikgKIBJEAmuGHhwi0gGtITAIBIFsItQUUIJIZCQIhAUkIooyKDgxnB6aRIknAEUWgHAAHAEihIpAgUCCewBFADixoJQ1OAIEgCCNpRaXoEhrXobWuAmteBtTgCBSYTkmxPIeZ9GtMJTQJQByQAlBjua9MlrgRBDJueBdR8z0VGe17ZFBc0N632/UqEffD0URl3lmGFE5t9bXbH56y+l9vZ1/Ky6y8d2nk9vRsBrp1V+Nl5UWdUYsrPyyqNXBDtjiTphM8lT3tI1Fk6T2stsmLAPfeSOpnQXJmeXpIbs5huNmiH7WbZdpCgmNO9ZH3QzD9/auuNJiSHWac6m5d7k4k73kMYFdRzqKQighpzSHg4Oxac0tAoouC+qzsvzn0D29tZqK2wlZ8JjYwIhqbznlnW8pbLrt1jA5UnVH3Hy19NpFFJhb0ftE5xRttX5134mztYfnxxvOZ6687duiIzGwpdfzDueU4Vt3jZ3z6ucWdbfEX0Exew12047sKpsm5r6d4Lt/TY6Xwqt0430Usy2q8VbfAsIVExDorVVdrz6+9MCBYUdYMg1kSVpOWuqqWvannZr2+k8CQUkkk2UkjxIKZIQkRn45dTyTy9PLPUPXrjlu6e74yyly7ddnUzfA2Gu3xafrajZXzPXxmxLpvLbG5l2PSC3QaJ0l1cjxZnX+/h00vaGOx/d1VolWDO63svLV5YcX56eV22bVVs686YsuDzGPJkbfSo7KrkvL856MpryCzbbUbPrrFrfa3Nr2VRIYJAKW2l0aumfpcsbjoutoE2vNSofzXR7+FTPyyx4NWy1vsHliSGWBLXAkCHiQ7FhJrRnEGt+BPv1zH+ZelVjq7awrWPDehqgmNnW9eJLtfPvn91BpL7o+iUKmHzkm1972/yzrOf6X6CaLdenU8XXdiVtZUeVTXF3e/FVJ0fVl08/8AQVzz9V8a9y8UUl907eVC33d0dbb7WZceRNOZOm+fd+mqu2OGu6NW6OVD0FGt0SPWJVdf6ZHQ0Q5t7F157CrLUreVEpjpaKy+JP8AHlzr/mGun4Ws2uv8+7flKsOk+bfVfM2pK3qUnNbQcBeQTUyghO6G546y5+/lTk/gu9x8HaYezLWj3jVpD+hKxsn0Py6t7IhOur7Kx+QOwRvj8GW90k6vs3aHZcV2Fbdt6cb9MRJnvxD1lyTX2V+9I8Q2NLiXTxNZ9ZwZ3QHQ3C0inQuk8fmPVYbe7aXrTQ7o8V7KpWIx9/ZtY6W1rCq4qy+2YXHm84dP8I2tXWfYeg3WLf8AL1to4HXVP0dzUfMYnXWdjnYYXC9REeLO9+I+64zRJDs+OSQYS0peLUAJamZvY3L/AFDx3XZvv45fH9b5LMydeeohNnxuVH6olPPEo9I8/tL513Pz1Esumbl5mhVVK7TgPM25kx9VvpxvKK1hEItnGFXk/wBxqpGiwoVItrKh6jdeGXJ0P8nZrx8dhG8HZhv9hrmTI1tbioorMhuqPoAQ5/M3p0Xqqm21rdzh0FjXPStWUraR+7fDgDwuK/oWjmXHzXR5uFk+HL3WLzB09UXRU/Mgez03zNIJhLSzGSAEtKVtX1Vtp+f97sM/C2XOXeR6j10bG+2FGturRR6YZNzB00hj00wwhO5smXmihNpeudJiV9uJb6Y6dNvdx42VTpsys3cPqt2P17FuktMCtKO1nYaeqbv+fM0hy/pJvuHOgyFdLo9mWdRt/P0ZYRsfBzohVzveKVXDqW8t3Qixqa0oTzv2PRpFMy3ZR+HP2OyrGU4b5H4v8YUrwjci85OPCLN/ofYfIgHN262pwFjIIHP89ijpeX6nceZelbPY4OfUzMn0Sj5+EPmok69RJofXkuJ0DtOarmzj2Vt8HKtqfYsi+qwPWRQTR0dvZmPGoOa9b5aLS2VFP5TUG9XQ4vPHT2PcxOStz0hqrGsry6odeNLa2z6U1UsLT3BvuW7ku6mIcFdhcLa5u02kS2N5Etm0KKsmgv8AoazOWNwtN4xeeVxV5aryl0N57oW+TvFSfDw9MbblzxUHSnN3p3mvmQbmlY4JmIghOlsStOLLvbZ63aeaeh7HYa/NgyM4ecIDZVHpKx7PnfXGxfXpuZkssgG/r7W1LW5c31bYd/1vGtPUZ2RWUxqSsuPesNHGOuoNi7RZNtVyaSwjZxLC77r41lUKTYuHevMsORZMki8r5+zpWiez+Rel57xsqp9jbReyYzSfTFJacnQf6Y0vtjcb7jozWrOoZRYm8gyoxcet3dHM30G0boUHd4e3MTZHMfa6Wb0Ws457a5B7Tk9C0jsuMSLAxCC8TfdEdN0t1LdnrtnwfbZuZh5UTayuJrpbBU7DLqifV8vTQtDWWVVBcyYbvDOv5LZ9i0tzX136/J5G+hVJ2tRPVVmn1ebgdVyb8vC9Gt1mx33jzJLlxf30yek4bWUwrLGZXvS1o8pea7yxMSNNoqJ9i1N1PL1HZVZ5Vjp7Asvla+qvbRMQ6+pONYaKazv0pdtK7O54Ju1c/XFSVlTeGsFRPYcznt476Ykn0H25+vut73Xzq17fSPM3sIDDIOS2XUfPHRHM9K90rlVHb1/h2ltsCpatncb2z8CQVr72Ee1smsLYq9mL52PkU8FknfikzeR7A9cXUlOdFVV0keodNeEP6bma7G2xpMTDemZY+zsSY6ZGHcysHlOtk8qkG1rFQuqz9dC6ke+g0MuPYlPbmeyazn66d/oNmuzpRXNlVuqF7HGrjRMnUsrbK05etKX7yXf8pd3lWTXonknhEmgdzusB3rE38gecljPqnkwc1bdOIQXjad115YfG9ncvjtoxE0b3JxNSttRxDYw+ZaaH3xJJbUNuT3wiHC0Eq2tJ3Zsscv10WjjdvdNaY8cyw3mshWwn7o7qrHfPrqoj13Mlw6ByL/z8XVM9lmxpb3y3uK6ok2fq1GLXn671OTWG+xlca1itdfpudDjZk3mdP5dfOvvOozTV+qdRqLvuNVhZsJ8I8uX1AJFY0/lvc3YQpg2mJmV0zL9sZ8SRTdW39QXfeeNBbb0eL6+WazouUazO4PvLdiEF2+gtKARfwz26KOSnV3OuL3HW/q6i0Iy/Qw+dwLeo3Km2t2x3Fxqjt8jWeWjnRPTLT5EfQ5ODp5UGb59Y5mvbdGHWvpAsLg1NZy+NnJLZiVgUS2sUkMYjuFV7ZUNucau0c/j/AEtVHH7Bm/Rr9t7yGLJdl7XYUtjAI1aegm4V1kyYT4fhJtfva2ftMvHzamxPsnaM/RNWGzG5Y6y5m6jlNGWrqORxJlDrjxys7XbxvFdxo8jfZBlEvaXLfhFsCeYkvVAtLbOLYQ6h8r/EuDRmR0PsXjzQ3qDBz10FuZ7gxJccxc/U69uu1uRo98fKxPB71+mxiuRG32RM6X2VLM6JkfMIqN3Tei561+ZekXqbwtNNgaOvsOdqmzID4SdVn7SnW6M7+yefPSHuvHU1Trt+Np41UtmR7Z2NKoxvD2o701ZXaKR2GLt7xq7CxyumptRg2VcWpWNbj7HXHLGVZEOMaRMvCLnHLc+0dfs1yjF0ARlLFdu15/rqEnIVHxg5Rs4MduuZ40XGWMs2EEDUnyIe5OaCFkxk2RECOUZUMLUmx9CsMpANCtee+OgGzDaN1bR5eP4eIZLcYDyjiIeQ3yDXqvFwnnzAerWoHv8AH1R7lhWXoWlCCazwKWeBRaBcE04NTHppScmObITQeWoRc1zCgknNCYXNSacEJwaQRTAeWOB7WobmhgODQDfJ/mmgkmkQxJJBBAJIgEUB9mvTegky5iD0aEjySOeKCTHBwECiCBQOakCRQJJwAhMc1FIJyYi1JktcIEJiRCSIQynMAAkGMewfmz08wQITRCAgoEkgBDgDh6A5wdiyHIYQIEFB4hxzxaXkGJ6BqeBND0AD0wB6QxPAEOeHkvUAxPcJg9QPyHsg8neiF5FzmeR9GgxezB+Y9El5efswfg32aPyT0hi9ADE9A1OIeZe4PP3BxZSQyWuEgnDaQ4fm5LLElIC5IRKQOCQk1IZckIJIaSQB6QByQMSTRCSEUmFJAUkgJJhCSfmEheTEkwkk0khpJNPakNOSAOSQikCKQJJAEkj/xAAxEAABBQACAQIGAQMEAgMAAAADAAECBAUGERIQEwcUFRYhMCAiMUAXIyRQJWAzQXD/2gAIAQEAAQUC/wDYn/7pk67/AP25/wDr+v8AI6XTrp08JR/wBQkUh+IwX2haTcNsL7LO6+yiL7JmvsmSbhDpuCpuAxdN8PYOo/DgbpvhsFf6aAX+m1dN8Oa6/wBPabL7Bosn4JQZfZFBfZWcy+zsxfaGWvtHKX2lkr7TyE3FMdfa2Om4tipuLYq+2MRNxrETcaw03G8RR45iqHHcZlHj+MyfEyF9IzIqWdRZSp1GUq1dewFly2p8xmfvwQe/psyb17XfoyioqCEyaC9tONXblKhCW37zk07o1W0K9xWdEYijyuUW1PjnJ4NK1YqHpR09okuJ8ghH37NWyGzavFhxvkxGLgcmrtWue4X0aKjBDGoDXipMiM607kqzD9xwuykysBjYEUUhE/dxIXZUyZ12u1IwhtLXoRUb9kyduQwHnaI7zDQWUYJorcvxys/j/H4mjAcBt12uZgfK0eHZI61BHsArQ52SheqcS+X+jrnggWFgZwM/OR7dSquZGBDQj+U0VGCGNDGmgpN0uRTLVtHLqRe1YtkVe3YmSvYuvc8ZRi65XX9jZ/dxcPt5qKYQItfmeQMXlFxB4RbIq/BsILgxsusowjBOzO28F8DfHNlXIhy7TLm7/wBNNmaqud6ujUsn0b9lsD85K56K4RGz95hYFnkubGXJuSvCza1j61P801zcGiXRapfeYmZ4lv59V472WquzjmkMbO3gpspqSl/Z2UkROuaVvOt+7KD7GcuKZwNrRDWr129bJxVAW+dZVZWviWy2+TWNpsm/pSpjhy1Nocopqry+hOXMyMSjly885HyqFo2jh5xKXHHZ8hOzI4IWA8V/Od0y5cAUoZr90F0y36wjZeLjbGnGhxLGoRbPos1jAybUS8e0sZ8nbDqMRXd3Mqkfd8022BBtV7TT/uROy3K/zWP+2sKVixGLRZcDsArNZ5Zi1o3PiTViuP6RNXPVsPzFWxUBLfasD3sThVashiGGPpfx8/ShyLG0sUfH5eeStLVq5UD8/wAiMeKzaeSt7VJkVZfEt1w8rGzVyyP/AAsj85q5FyM2GSvy+xvqnVHTryeMI6XOqNImTzTO0prlWVMa+o6PKyZfGcvMG0YxaYQlbR4ln2nN87lmKEkSwYnteDSVsEq1n9nHRe7relnN0ITjx/ydsigOHw6sPPN9OXVDVtjiOCPLpLW3aORGfxLExMXk9HZ9NKlG/T4zLvNXNg+5l52ZVtZnBJ+eGuXj88jGrgLk8Bf/AMMuUN3n4f5yl8RR/wDH+HAYyurVqFvUY/D7OmWrxTEqqMWjG4KJ6vG6UK2et7k4cdVviN2TP0K+lX0KAdGsD3aNmbKTLltb2Nf9nERd2PR0/pwE3s6Hpu0IG32bppzYcNs1rV1wZVAMBhbN2Y9vH/749Nn9OTQ8srAb/j/DqflirkcfLJ4+3/G+Hz95K5M3/ieP/nKXP4eVH4fWWraHpY2MutI/McoLWfiICCnza1qlqMzVFZ4tmXTC4rhjVWjUpenOYfLHeTEi65nWedP9nFQ+FH0dlL048b5Xk3pvMwT+nJOJ3a1yB9Sa45xa180tK62fS4YaJIrah55WM3jr/Dl/+At6PnkYbeN/4dv3lrkLd5HG37y1zeHlnUqxB8ew9YWrUW3xmvqxs/DrYadP4caM5bmLnccFiWo281X9KtnRJzLKgic8oxU/iEBb/JZ7KqDkOm61wPYzf2Y4fYzvR2UmTxT919oM/cEuQi93KwNcdwPp03oc4awuY8qe2XgOiGgpb+LFXeS45K2eSP3Tm7T8TvS+I9Zlc+IIrNfjRY2uQQ0r3Dbf+pVlWviAS4DK50egm+JMlp82DqA+HsYmwdCho8Nt5PM6F6ALtOy3lFXuRZlJuQ7Jtm3xbXsYdyE4kjZrBtC1fh17hP8AT/caQ+BvTrYzVBaKl6aVb5O/+oA3KYcWjFvTpeHa9tbMPajiF97LVkTWK9u7dzdfI+IQniLlGQWMuTY0Vo89oVm0+Uae0fG444Z62DO6T7e5IRR4VdIsfigMw9rKp3w1eHcftDbhmFBZ1LJpyuWcpl9u4LzjxzCdNjYUq/2txX3m4RxuSo59XOryhGcdf4e0bEz8Y5lWeWZy91Hi/Kbyx+M0sZb2Q2oHK5Zfwy1OU5NscL1IiNpZ9ePKOVgkHjQSmtKXpzCt7Wl+rCD7unFMmZNFNFeK2KsrGZxXkdCGbb5pl1ld+JEke8bY0ruTQvPPiqbiluaFxXNA8IUsqVG4C9POsFNVDq3bIPm7/wBbGDkBK4KW0TZbGuy4vW40atcoces1rOvxg2iZ+PWX1RcY0/aoZmjaDS45cBMeBd+mwydIW/CjyMFaNrffc2982XZnuW2vV9ixf020TT0p7FJ43aNPREfjBgFkDk4F7fJiqtxmyUgRDrjTp1zCv7ud+riwuzxTKKZk3rf40I5Y8SgzgxsIQ2NSrznofNCCa+9kNbUsoODelXPkQtFp5Aash49L3w0a1aEbQVG5XQ7NebWdmAlq/ESdaT/ELkRXqc02JPncknYYNz3FGcZfwdOpt2iADJ2zaILVrIr2DyzCPAmboArRneBqPtHlWjcFEz2we+nTp1q1/ms39XGg+FKKiosm9DFGAX1YZEfb8ZaALBbbY1w1IWINy1celXHCvFkwVESl0NCI6hMaulYNWNlu/mmZ42oDNySJhZ9mDjdpoRfzVOSD523ZC+fue80CynAVuE/R06vbGZQhd+ItJnfmmtYln6hbaHVgZiZdlkQJoIlStJnya3zP0u5VbN+Z9l/R39NOv8rf/RH8vlj9ulFQUfUkIlHQzrMHHmUoDizKLKHSGyjFNFGLCvCVksJjJEsHuzDK0UdkBbLAI1szu/z02rlM49PihSK9n2aU2k7IVt4KpdZ3zSEk+X7w4MeJ50rDvMpGHHR2CEhp6h9K1E3SHYkqZ5qpbswelumig3Kt2Nyp7KnTaSdni7p06f05fX9u/wDorQ8zhj4wioqKb17VrYoU0fmkVW3tS5LPjAqFSru06WhBpaFyrO0aVl7c5QrBueK+YiWE9AQVZ1R+X1IxlCDlQ8uyRfStgK+pXRp6PHLz2eEUfCvwp1khjlUr+pCmH74OxMXmcJyJr1rEdSrP5co5hI0lCarWWiql6DprEequl7c61qBs+hY96qaLWBejp39OW13Ln/oxhe7eioKKimUpMyt6Ya0NDeJ0ayQztJVzTih6NkarcitDWfykzPUu19cDS8Ss0SRLCdYtm7KTWdJ1M7ydjuoWJMg6BxqhyW1XkGxlcgDrY9jIJQ0jVJ2KHnKt0uYDI4IE7USyi+XuWKkqevV0o7XFPm2t4FsDkCULxNKKFeeChq9Knv1AS+tb229SHy4I/wCwL+6dpJ06dXwfNUf0caF2aKgoqK7ZWbPm5zTsOecpETIc+kOTJ3ZU5yeVK+PFo4xbFljWmBC7beT2rs7Epk7Xaiososou7KlbmAtSwLaypxcRMG37NmYnCS5THoh0c02bZZDdUrUoSxdrpj0A3h3R1wEnQ4+dfbeJNQ4rjMwMfKC8ZURIemKLbOnNxUG8Rs7r8TYoJxZM606/yt/+fHBeFWKiopkR/wAWI+Y6Uh2K17PsAm7O3rEvS+YVG2f3K2XbvnGNowvFec9aw8pzdOmUX6USJppiqJFxnS+XeZons1pOxdFosZ5+KuVaeqLRxyZ5CCLXcE/zSsPB8rSeCtVautX1cs+fL3ZrOo3tCFjO0RA6nB3NCsFrUr96s7p5x79x+zzf2fTldfwvfyg3cssft0oqKb0uk9ofnXsK9gxtL5DbpsQF2TzzLRFDj98iFxO3JVuKV4KtQrAUZDinl/t2Zfi07ysE9WddrzTTXmmvSCPNg/y2aBzXLpHlYn/UvdkxnJXtC0OPnqwmBmlXuThLPtNJZdt2WtGDKzx1mtDjXDXYxIRr2w2x73GAbAoQJmWh2HJEZoJpox278l2uUB9zO/lVj5Frx9sc7UBvEd86lSv+crF6splherOSYnhflBB1ZKWt4z+pST6BU10rrNpwJW8M92GHN6vgG0bEPwevKVkonZ3j/DtdrzVClO4SMWZYFB4rdp+3LtmQ1Oar6Mgyt0M3Wjfwb1ZCNYqzyt14Pb3IXgh/+GwSVUtazGaLP5e0C2uVU4XalI34ieTo9uFeIDzm8JLtXBfM1HZ+/wCOOPztyaTxx8qE1GzcBL6lqynp1BTqiBCu+gJprtnUVNpPOhj+5AdXPAzhgUhXj0wvJEgQLyN7wrQvzeqz8mDT1GuY1ys8gOy9p08Xb1pZJDuMURxo57RfPh+b3hMB4vBd/wBJpKU1C1Mb1NJyI1SjbX0T23pUBwdpN1t+LU61nwleM0g1j9xmfyHGywp/VbMoj85yC3Sg6aS7WuBq+j/Hjov92KzI+FQ87vkGWgxtonhnzJ0rRkWcvIdvp8irFxORmYluMFmvGUbJJeVcs+/GJh22+WJ70Jo1T3I2qDTeJtSsi3SSRH809Q80PHOR6uUACBSMZV6gayDN/crS8Y3jf03Cu0oGgZjTRJppPJ4H9iIL04oOg6joP19R6jf1J25wP/VIzuMB+m1ND2KcA9oddDF0oMo+vKAdWf44YmHWh+UJmiL6fVYdakBj8lJ41jTR37ebLGofOXp+UWsWvFy24953i9C1LxUbTxTaXTaVz3GgeXc78oO14B04apU+fF19LdNldKOfXioiqjXm7ryGNq8vclCXjG4R3VplYeYpNodrzGVefgu3d4z6TWWioX+ms3rcnhcgonC7taF4Pp1RQmUtswYKEE0UzKPryEXu538G/vnw8Kg5eMyT96LguSQAOKG3oxuGI6J+XeH5zAxp1iEORyeMVZJ1HDuMXLsn6eRe05HZWzf7Ay+Sk/4c7jeN2TKN+abRIqVyE170/djYjCJNtlWiU86Y/Fnf+mw6st+LMEUfSlF2XunivmbC8jzQQydDF+HEi12dErfn2VASFBCbpQXS6TN62RMeu/4/gCLzKKPUVDRNWkXd0BPLQPaJNlKKmPtONBsFqSjsVyDPaq9EJCaz7sqBHv17DOWKIcTIk5HQw+LTb8Ej2pDddkimsyZB0PaeejZJPox5Vaqqh6Qfw03/AAZGR4IolMKkFe0oCQhIY17f4IJECpBTCUBocUyb+Lf30gPXv+uGH3r8W/EiG787LJvm/F2t+Q4neTwUoJxIsPz7Lr2JJq7umqO6elJNTdCpdKFfpezJTrkUqdiTPTP38oRPVkmrKFbpAroA4sq7RTTipEZFIyK7IrspszojMpMmUXZQJBQsDZfNhU7ldTt1lK5WXztVNfrM8dOovqtRl9YqL61UX1uqvrYF9cCm2RyWtYa1f9eMCH4F6ebeKj7S7B13VXdJTfLaLTylEuL0O3x2Dj0eIRh9e4tFC5bxiKbl/E2Q+ZcVjGxzrikYT57mMO3z+kSM+dDlF+TWuxcismHZ07I3e7Z9sMrhYTumHNr1t1DXuxjDausm39Bl9w6Klu6Tp9XQmrNu+J5vdTkPOcve7lCfl1JRhKT/ANn7TflSlGLPLpeTu/a79GXkvzJ4eLJzpyL3ZR/iCyUDtqWV9Rtr6hbUtC2vqF1NctOvdJJiTmycpV701Eyaf57Zdr3mQ7gmac60nkSoomos0dOHjC64j2NBjsPUYYh6ntDFe9p56fm8tGUlLU8m+pE6a5GK+eZNe6ed+RCNokgmtyZPdL5fMkXzJe/fmveIveIvfKvdIvcmvcmvOS85LzkvOS8pLykmd/1duvN15Ovyu3Xa/K7ddrv9vf7X/e3/AHjf923+E3+L1/6g372/X/f1/v8A57fr6XS6/h16dLpdenTuul16dLpdLpl0uvTpdMum9GZdLpdLr8rpdJ2XS6XS6XS6XS6XS6XS6/w29ev+x//EADwRAAEDAwIDBQUDCwUAAAAAAAEAAgMEBRESIRMxQRAUIjJRBhUgQmEjUoEkMDNDUGJxkaGx8EBgcsHx/9oACAEDAQE/Af8AduOzCwtK0FEY/MWe2MnaXyr3JT+i9zU/3V7mg+6jaIB8qfbYR8qlpYm9EIovRQ0cTvlUdthPyqSjpY/OAoYKSTyAKRtHGdLgF3Smxq0hB9HnG39EKOHo1d1j+6nxRjonafRRMB6JtFpYJHDmhG30XtFThkgkb1/MWiLRA1PeG81Lc4Y+blL7QxjyhO9oSTs1NPEbkKuaQVTDXIGlVtQ57yDyCtVI6L7UnmFcnl078q2UYYBPnmq21vlkMjDzVxBipmRZVBSCd+klUY0t0p71Uz4TH6iomKOL6pkelX6DXBn0+NgycKGPQwNV2ZM+XSzOFJQSMZxHJgGRqUdoiGThSXZkHhj3Trzr8zFRGKVwMfP0VazErx9VSipIDo84VzH5Q/8AiqajleBIxXZx7w9TnVRRk+pVNA+V2iPmmzvo4dL+Z5JjqioPhKdNPAdM3JU8QcOLHy/snXmNmzBlUt+jJw8YQlDhqap4eIwt9U9uklp+K2R652NQRomE5Ku1MOE4NHTsuNUeAzT8yt1CJyS7kFNYGacYwo3mNwc3orlvM5x6qx4dEAfqrqPt3f50Vk3iH4q7j8od+H9gjvQj/krOftx+P9leR4mH6Kmq5mN4cKdS1U/6TP4qeKSmg4ZPMqh4WvNRyVVJSub9kN/8+qsFYWuMR5dl6g4VQ4fF7PR5m1eib2VjMtT26SQjA6WmEjfl/wDVRVzqY5CqvaB8jdLVQ0hmdk8ld4HOm1MbsrK10bCHjG6uVBJJLrYrXC6BmmT1/wClcbe+aXiMTaJ3dTATvlUFvkima93JS6JxwHnfomtnpHago7jK84azdVcLpoOG7zBRBoeOLyUdLSndu/4qjpos5hwmjGy9qafdsw+L2cj8LnpvZPu0qtt8vGdobsrbA+Brmv64VRZWOOdP8k2ysHy/zKihazYqRzTujK0KWrCNaAjXD1RqweqfU55ORGd9Sp6iVvhyo5XO5qIBVVrZL4iELGM8z/JUFDw8bYAQV+g4lM76fFZY9EDUOx7wOafHGdwFnT5Wp0p6lPqAE+dxGQpap3VGfPNUdCxzeK/dSFodjSo2wyDBaqm1dY06lfzCCp2k8gqZpXEbH51DLG/yOTNY3CjlJOHBBSxh7Sw9VKzQ4tPwDdUzNLA1DscwHdTVEcWxKdKHN1BTVLTtnChpC92Sdl3PiNyEbexw8QXuQat3qjiEEfC5qooWTeUo26eLyqnEgHjCfE1ji9x3U9DrlBaNlcBwmtbHyUVQoJA4YKnt7X+JmxVBUSbtd0UEusdt/g4dS767/BQx65WtTUE52ncq4XRzR4FxS45KppjjAKZJrOl+6poOFI5rOSY7hZcqy4k8k2YkqKVwRxJz5qmlJyx6gbkGMq6U7mP4gUEpCJLm7DKZboqn9EcH0TbRUM8pUdLUDmVHSuYNgpbp3V5jxlQ+0AJxI1QzNlGphXtXB5Jfw+Cxx6pdXomoFSx6xsqihfjS4J1vf0CioJ+jVS2ubm84UVGI1dZcDSFK7dMdhMnTZ1BKHOwFTNyQpoBIMFVdrdGctVPLp2cqqH9bHzVJWamhxXe5Duqm6va0+HdSTEuLn80JMq0M0QhX2Di0zvpv8FhZgOeparTsoqzUcJziBlMq3ZUlxbEMypvtKwu0sYnPL/E4qKJwOoOyrhCXDKmgRjKzhQtfKdLAqCh4Qx1T6oxzjTyTSHDIU0g5FSUbJd2qOm0+F/JTBjBojULBJHlGn1t3V4thBDmKhthJ1SKA4GE8agWlTxcN5YenbamaYQiC8khQNOsZU8myfM6PxKpqnTu1PVkh1y6j0XCy3Cp4zE7fkpS0qSgD92p1pcUyxg+ZUttawbKZzY2kBMiy7Um1Ji/gpKpr/KVHJpTKkfOp5YAM4TKkdCu9sbuSpZe8P1dFHDhMQKv0PDqCfXsA3woG6WBqaNOwTR8yk3VZTGRuAU6meDjCtDjBLl42XHaeRU1QMYC1nG6fUOYdlHdD8ybdWafqjc3ybM27GhSBSw+iDHjqooTzKZEpaTKFJhQswmoLK9po86JOyDd4CD1qHquIAnVIUlV+6jU/uFd9x+rXfTnyKOvI+X+qNx9QjWgnBKNVH1KZUxplwYF70YjdWDonXpnNOujfRe8h6Jt1x0QvJHROvrvuo3tx6L32/wBF78k9EL1KUbxJ6qsrjMNJ7AcboVb+pXfHeq7y71XeCuKUJsLvCc/K1LVnms9UUXLUmylvJd4ctZ5LiFaytRWsrUVlaisrP+kx+3Mfssr/xAA5EQABAwMCBAIHBgUFAAAAAAABAAIDBAUREiETMUFRIjIGEBQgQlJhFSMwM4GxFmBxkaEkU8HR8P/aAAgBAgEBPwH+a8+7lagtQ/Bvd1kp3BkJTvSGp+ZfxDVfMv4hqvmX8QVXzpl9qj8ahuNQ/wCJSVVR8ykrqvPhcpbjWs3LioKmvm8jipn3CMZc4qIXCQag8rjVurTrKNPcMZ1H/Klrqlh0ueV9oT/7hTKmZ3NxUevq5VUzmjOU6VxaH5Qmd3XovVl8Rid0/AvUuuoco6V8nlChsUz1F6Ln4ym+jUQCq6fgPVvc0qTAaSqSBrGAhV0rZvBjkre0NibhVk+smLsqWuZEwRu6KjxJO56q6jhNBAV7GXAplK53RUtGVJHpClqdO2FJXDGNKmqBIdhhejdRw6gN7++92BlTSa3l3dW0xMjy5Mq2OdoCfnBwpbm/ZvdOtftI+8CZZGM8hVTBJF5uSpHZiap+BuHc1bz9yxTTxgljgra0cBqhGmreB2U0rYxqen07aqXLeQTmQwjBC4UU28fNVTXZ4buabYNYzIqv0YOMxleyOjcWSbKmm4UgeOiY7UA4e9c5NED3fT1MuMoGAVbKgl4Lj19VHBmVwcPKqyq4QwFFfCXeEp7RI3BVBtEAry4xlzmnt/0rd+UP1V7yCSPord+SP1/dDas/RXL8o/p+6t/x/wBVPTxuPEkTZqeLyf4Ub2TT6gOQVVxNOIeagZO13jO3/vor9RCVmoc01WOo4tMw+96RS6YNPf1McqF/iwmOyAUJRFUFjviVVSiYKnsscbtRVVPoGBzVtka2PS4q9FrwdPZW6rYI91d3CUOc3t/yrfWNbHgp0/8AqBMBthVtU2SNzWqPVE7iNTjDUt0lPpGMHieqeUQy6+hUmdP3fNOnmHm2/RVtU5rSX5ON1q1HK9EqjIfCfe9JpPE1icVrVFPiRqpKtgjbqcq17ZCHDkMqmv4xgux/XdOvzTyf/YKsr5ZQeGNu6p3VDBoHRETyDS52ypqJ7RgFGhc7ZxTbfjkm0JTKYhNbjop2MO+FK7T5Qp3y69Y5qhvoA0k4/Zfa4xnLf7q63RrgWtOSUF6PT8Opb9fevkmudyf6o4Hv8TQoqmoZhr3YCme135kmeaEjOTGppdyaEMN+7cU5jGxOkB5BNvVYzl+ypb3PM0MOxUEHh55VRDIDqY9QXMs8Mybcoshrtso8lVPaNiVURnojDNJ+Wp+NHtNGi+B+2MKenYG643IKGUxvEg6KN+pocPcJxuqt+t7nKT1RVDmAtaorfUVG+E63OjOl6gtzwMgZVRUiIaQPEsuByml79gmUGRktT6QD6KkrJYRh24Ru0J84VdWQv2jKEEtSzQwbKlq3U1OY5D4grJ96575T4lJEquEg5CgrXDwybhXejjZiWLqnNwggFYJ+JTN+m3uV0miJzlKnqCnMhwFbbOxu7lwwBgKeEdQpaRrfEzZXCXjQhz+YVJGX+FUVsDeYRiAUkTTzTotG7FPG07tVweWkEKw1jHx8Hqp4A4YKMXCfnOE66zU+0rMjuEb7AfO0hTXekPIFVlw43TZGM8PjOQn7qNwduF6KzeeL9fcvkmmHT3UqcFR5Z4sKmuEZ3a5CuZ1KkuMA8zlWXqDGGDKqqx87gFaIAo2ohOiRiVRBoGoq5buAUILDqZzVDehJ4JeaqIeIMtTJMfdSck94jcY5FUTAu5KKJkrgHHZXWn2DWck6mwoY9IVjm4dS367e5fn5LWJsWfKnw6fMqTAOgclJQsKq4ooG6nL22MnAYnS78k9+eitlSFFOOSDh6pXtjGp6uVxB3Kp4eLE6STmU1qZTBw3TJpqXluFLXxSjJ5qVxldqKkpsjUFpIGpWzM8boz0X2Zjd6qYxnZMOhwcFDJraHjr67q/VMUHNb5kXB3JUsHVTOYxhc9OY6qfqVTRcFgKEJcNlDA4uwhSvYfAo65zNpAm3dgT798qqbm568Uhy5GfDNKpqcShR0pZzTodXNVFta/kEy0vzgHCbRaRpwvYi7YBQwimZpHNTVGVIcohWSbXAB29TlO7U4uTqck5UMHD5qE4VXEZm6Qqalc04LVW0PGh0jmo6Qt2IUVNvkotGdkKZr+adbW9kbWdR2T6COPd+6qpsnAQOVRPwoplqap5wBsn1G6grF7SqiTKej6vR1/mZ6p9mFFmCt+yaCVHCe6jhxzK4Y+ZcEH40YRjzqSmB+L/CbRjoUIMclw3dApGP5KqpJX8k6zSlR2STuorNI3ZR0Lh1Xsp7p9vz1RtAPxKO0juha29061MPVGzxo2iMJtqZ2VHRCE6vURnYo0bOyFG3svZm9kKYLhBGIFezIMwtKAxyWlaVpWlPhDvMvZWLhBCIBaAtAXDHZaQtIWFhYWPx8/jH+Xv/xABMEAABAwEEBQUOAwUGBQUAAAABAAIDEQQSITETIkFRYRAycYGRBRQgIzAzNEJSkqGxwdFicuEkQ1OCohVAY5Pw8XOAssLSBkRgw9P/2gAIAQEABj8C/wCdbWFOn+4Njbm4gDrQ70tBrt0g+y9IZ2FekM7CvSW9i9Jb2L0oe6vS/wClel/0r0z+lemH3f1Xpp9z9V6c73P1Xpz/AHP1Xpz/AHB916a/3B91jbH+6vS5OwL0qXsC9Il+C8/L8F52X4LzkvaufL2rnS9v6LOX3v0X7z3llJ7y5jveXmne8vM/Er0f4leijtP3Xoje0/deiM+P3Xoca9Ch91egwe4F6FZ/cC1bHAP5GrCzQ+4FhBH7oXmme6F5tvYtO0a0Dq/ynP8AuEQ2M1z1f3C/a5Wx1yG09AzVLHY7RNxpdVZu5szG76j9EdCdZvOY7Bw6l3tCx08/sM2dJV4RRWdv4sSrwlhk4UXendOLQSbHeqfsi3uUwNjH71/0V9lrY93s0H2XeXdKPRSnI+qVoO5UGnIwvnm/qrzpoY+FP91eaYbRwpRGy2hhhtDM2H6eRqE1sVL7k0y84ip5ZIHZSNLU+J2bHFvZ5eef2QG+FWR7W9JVGyXz+AXlSzWKd/TqozHudRg3uP2ThTRyx4PjOY8GS10vPwZG3e85L+1u637RaJsdb/WSusAaNw5G22w0a7A8KPqKdqFtlF6ebEuPJpLRI2Nu9xotLZZWSuDMbuy6f1TBZ6cfpyQwYaQjHhrC79VE2JtC5oJ5B3zKyOuV4qLujY3tddkZUt45+QZbGy3mtZ6OXObXHNtNvSrY2GS0YNikYCcQw84dKJsz5JIWThjHVxIeMieBUI7oSyMY2MtcRq+NB29SfFNI7QhzmMfxdiK9So7E8krgKNmDZB1jy+k2yPJ5L8zwxu8q7YrPLOeig+KqIo7M3jj81+325x4Mw+VFekjMzt7yvE2Zg6lRgDehUORTbWzzd65J+U5IHZ4Hc2P1XWgk9TcFCG5XByGOGQtYC0ADi2qDLS4lpcMxuUFNx+fJGLJeL7mrd6cUdNHNc21Ka+yQvfEclRtkkDvyhQO7osdHelBx2nioP+G35ckneQe43m1u7ro+qZH3WdJDBWpLsUC3EbFSedjXezmewLOT/Lcg0WpjXbn6nzQcMQdo8lZbaBzCYndeI8vZ49zPnyTWq3DSCJzmsbsAarsEbWDgPAfaJsGRipoKq6Gku/GQ37n4L9nYwdRd87vyRbMypdQVNNnQFDBDYpZpGtpU6o+6vMsULfzXv0V609zmPb+Aub8wUIra2SxSH+MNX3slY5m4htqZj+ZWd3+GOTT2iEPfxUrWWdjXBpIICipvPK+FwweKJ1f4n0HJZ5C0VvEV+IVn/wCGOWYuaCWgEdqNhDzDY4nEVGBIrtKFIhI7e5UFnj90K7LZmdWCNo/9Pzm4MTZ34tPV9k6F7dBao/OQn5jeOTQul0knsRC8fgvF2G0kdAH1Xj4Z4eLmYfCqvWeRrxw8C1RAVLRpW9LP0r5aOFub3AINGQ5LTNaZGxtvPxd+ZV0pf0CnzoiLMxv81XH4YfFNtUpBcTsFOjkmg9thA6VorQKsmFeui7x7k2Vklo2kioahau6fj7Qd+xXImhg3DlLbREKn1gu9oXGSw6QSBvs3fZ+ygO6o+PI19pva9aXeCc0NcainOCbdyvGnI20Rsa+riDe2ACq1WsH8pRkbk5wd2jkgO6f/ALXKz/k5BqMMdwEk12mid3Os0bKy6pOOFUyzxDBvxKL3GjWipJVyFl8b34V6hitE+kbu0cjO7Xc/UtEJrUf6yO1MsVga6zWenj3ZOJ2jgAgGRNe7aSqNAHQqSsa7pC01lrZptjmLvfuq3U9WYZdaBcTsqcyegpul51MVddk7VPQVLZ3ZxvLezysP4Ku7OVw7nz3IZDeLSciVetc7nnh+qIEdTTM4owOzb9DTlj7254lcxnbUfNNneKzS614547evk8eb0lK3Bu3k7AqNZHd6HH44fJBrNV5yxqDySWcjWpVnSrvsyOHIDxcz3mn7KW1PB0jLwGO4JvAj5cjjud8xRWlz2NLmXxXbkupvy5GHdKPkVZ+g/Pka7fEf6XBOkOYr8BySWSJ1wyUBPCqM9rkMjnZrxcCDW5DBSxOycwhNmpR8+v1chiYA6Roq8u5ra5dJO5Uma0t4tp8ihaLOekJ1mmAxyT+5VoPNqYid27q5XSbJ2iT6H4jys83stDe3wp7KfbcKdOPLBeHnbjv+0/BUCdIfVBd2IWR78Xm+88Tj8Bkrgia7i8VKs7rFqCYGrRsLcaoE58luY3IWl1Oj/Q5HO9h7T2m79VbrN7B+/wBl2ckn5m/Nd0Yd1fiEf5fryPO57P8AqAUXCvI0/wCHIPktE/DSZfzYfPlLJrSwOHqjE9iq0SP6rn/VREQsjHS4uPYB9ULBfLWS4G425h2kqEDLRt+XJJNar0hkffINKV7FhZh/roR72juV5I7dHzmXX/QoPbk4VHJDah+6fdPQ7/byrpdsj/l4RHt3HfQ8tgtxyjmuO68foeTHFN7o9yxeuZdG4rRt7nv0n5sPuv7U7sc/1WfTkltRzaKMG95yVoDTeyx6CQeS1DdHf93H6LujZ94Lvj+qkj9n7nktP5R8wu6sHD7o9Dfm7km6WH+oIcHu5I/zOH9JVj7vWcEuskj45qfwy7PqTXtcDIBrffkc6JxgkdndwqvFvEnHNDvl4a3s+6hEQDpGt0rndYA7cVC9prdF3s5GutF/WyuiqwbJ/Ndb/wBywjH+YPstRsXXeP2RZmX0bgKADcOtQsfzmxtB7OS1Qt9aM9ox8rAz8Fe3HwrJMPXa5n1TJB6zQeSU7Y6PHUcfhVCyyO8dHq9NPry5cjp7Q8RxtxLnLQWeoa3CNu0V9Y8Ts3KSz212iIq117ZU1FV6bC78hvfJTQNfI8yRubhG7aOICcGnCVlDT8qlskw1HEuYXZOacc9lFhDF/muP/wBaks5ETWyChoHn6BWl8YNySMnHpCdZw13e7sYn0qKHYehfuv8AKP8A+idZprtx+d2Mg/8AWnsAowuqA4Xh8CDVY6H/AC3/APkhDNcAbV2o11cqbVLDI28zSuaQciCF35Yb8nc9zqgjOKuw8Pmhpzdd7TcR1jMKtnnjk/K4LnBOAkE8o/dx49pyHWjHH4x8rhW5l+FreAX9kd09Wg7RvHQg9hvNOIIRhnbeaU6XufLSvqlUoOlSWzuk/CMc3/b7qexaNpcwkxvOdN3gT2b2HmnRs8myMes4BBo2CnhWa0/wp29hVndubd7MOSWA/vGOZ2hX7OCdMGu0fHLDjghDbcSMNbVf9ir2kc3+WvyXnnHoYURZ21PtSH6CpQjgvSv9XDAflb9Su/e6WvNmGZ04niha7HJoLQBQneqPtNB+c/RftFrae0/Nd9aR00gFBUUAqrltiEjRt3JtogbI+OQVbrbFU2WvS5yENhjbDJKzSXcb13rU9ltt12gYJJGObXVO1XO9YL+d3b2LCyQHajHoLMYRnlTtTbMbJHpXtL2tq7Fo258V6CPed902y2OIRRNyaEWPaHNdgQckbT3IlNimzu+p9wqXGWpoyNWu+eKunud/S37oNtdIY/xOFPdatNXTWj+IdnQg+I3LTDjG/wCi7y7ptuEeq7mniNyDzJoq78R2hVjtER/nCvTWmJv81T2DFd7wea52Obzsw3KXug/LEV3k+ALRsmZ8Rh5OL8Ot2eHOyMVddvDqQbaHluNagF3VhUrUa9/F9I2/HH+lUs2jZ+Rpee11B8FA+zxm+11a9JqThgETNHre03Ar9mtT2dOPyote24dB+6abbaC68aCpDQStFGxkTBEZDTnaqcyMPa5tDR4pg7IqTutaZqMbfrFTVZd37apwayOKRs0cd4iopLkaVPzTLEK6K+Yngt/DW8NXKvFNl0tqvusrpaUp41pwblt3Jkto0rIDdOrzLtzWadfDH8JUXc65dtDbgLb2wPqcRwWmhaGtFpfQ3j5hzKU95dz7XK2GR8Fn0EtSag15zcMdytloje1kkgiELuDa32u4GqFqrGI9PptIK6Wly7c3URs000bWMsT7Ix7K3jVwcCR81bhHZ2WZkskOoQ6NrwwG9dvNq3sXc2edsUr7LC6F9XHVq6rXNNMadSbYXQNbLp4jNOyU1mAdrHYRghK0yNsjXN0bmEECMNpccC6ufAoP01sEveUkrhpL1Zw7UbtzGxMilrHAblBdNxwLdbEMIrXe4K0xm4A2CN1nD/Xc51HdidE6KPvcWsWSorfqWg13bVZ2sj0VlfFK4VNS+6aVpsU9ke2OKOHHWJvltOcNlKpj4XiRr3iOowAr0q5aWCRuw/Yo/wBlWyjhjcccR2fZUuX+OqVd0Tm8RdatL3Slw2gGpPWmwwtutbkPAZOP3L8eg+Tlm9kU8gZ7HKbO93OAyV62Wvjqj7pswAkDua6R1a/ROs0dGmNt9wY3AJk0IfG2OaO9uLXYbEL10s76dZiwNywqHVTILRHOKRSRzOrdBPqkKztrHDJC43Xtza08Bqk70yV5OrG+Og2h60kd4u0bY6nczJG097x6V2b7uJqjoomMGdGgBYgrIqociIm1ptKMdia2Vw2+qsJI4xwYhprWPcCF+aMniKLEA/lPh0KBMbSQ6+MPW39KNsihDJSCLw454ZJ0875X1a9oaXarb+BorNFNI2aOzvrRzaVaBQA5qKFl6S5E9rRE+7dkJwOzAJ+kFGSXGGSlbxY2tB071K661r9DpGXMbuNKO4pljkd40jPYTRMs4dec+uWOXg2mHewkdWPky/2neE6eU0YwVJVxjXxOdGXxOkbg6iiZZo9KXxiXHDA/62qxywG7zo3OArQOCisj7lI9I3W3HI4KGed190bA00FL2FMd6MUceofVJJGHSsBSvLxWsFuT5FjkqJj5MiaFTaLaNm5V9U5cmaq1yAvYICRX4D1FUdqnwDJa52sARb3Ps7pvxPwCwZDEOiq/aLQwdDVqTtPUqto7oVHMIT2OibrmrqClaLvptQaudTi4U6U51m0d6OG5G5uDjjjXjRONocTratRQgeBirRZ/YeaeRAUTeFeTHwHRuycKKA21zXd6gtjDeO09SjjMTZNFzS/Ejw7zs9gQkfjfV9hV2UVG9GO9gUYi+jggLpfuITmuicNoqFoLQ0PZ0hOl7mC804mF30V2eF8XBw+vKE3R5q/MC0cVJIwUbXBGI9SqU+Qm7CwVonTSnD1W7hy4IFrirs2Ko5XyNJFv2heJP8pV0ihHhMtA/fMx6Rh5FreKDdw8h46THc3FUskHW9Yyshb+EIGe2yHs+y8Xa5Pgr1mtDZODwgy2Q3a5HYetFwNDsBUd/YqA0RDkb8l7g37q+I42H2nYn4rCY07AvPM6ytSRh61fbGXAewarQTm+NrJhX4Fftdl73cfXhy7Fp7PanaI5PzH6KsdtaepSCJ16a8Gl+4cF3xapSB81+zxEN/E76IadjA48UxwqBiHbcD0KeyD94w3HbCnRSC65poRyhUKwKwKe+fm3TVMec8uxO9tgqDw8Jk4/cvx6HeRYOPhYqvYiK0rsCx5M1VriqErFyMMwBqpbPWpieWrQvxa5ObNgGGnSjjcYEWw4fiVXGp5M1g8oVNQtHamDSbDtVa34TzX/AHVWYtPOaciOKj7o9yiRZnupNH/DP2T2E0EufTsKjd/CdRw6eTBCjjRCKfUPtBd8N1zskZn1o6h/l+yo8EcuavTNMnBNiskfe1lCbDW85PfIdYtyWGKy8Cez+2w06dnkXSbh4RqaNC76dzTUMHQjXwgAjbrU6lBqjeprfaP/AHD7wV/bsTppncStzBkPDD2OonxS4uupzPZNFoX+bn1HDpTozm0osI1qXenh9lo3DV9UrHkFEGOy2haSy0r7JxCMNts4B+Cxia09H2osD8/uq4H3l4oMFPw/dULi7oV2zxBvFd611pXD4KpVStcIuGLeWeD2XmnQcR8PIF/tHwS3eE+PeCF/Zsx0U8TjcvZHgjfYR4X7JDpX/BMtHdmS/TKIZIDJo2I0yC0AyGJ8iQ44EKZ7cr5TSN6D9r21KqtBaRRxGq4ox2gEN9WT7qkgwOR2HkCFSqPaHORe2roa0rtb0rNGWN4YxppeO9Bt3S8WYqjwWnijNKbrQtLkPVHBALOvQqZKm88rLQMpmfFvhgKIcK+CH8VrG67er7aF29quRSOLB6rxULxtjidxGCws13rXMAXjDTq+6vS635v0V1ooBwoFSMJx4IlSHj5EhhzQc7N+KjZxxTjuwVEI2HBq0FraCE59gpNZziYnf6wXiaseM4359W9XXoUKGKbaCAWP1JAmviP7M7nb2psFnF1jcgFVhy2LXaOgoOskugkZk31CjZbUy5KzA1QdmFjgsHIR7RnyiUDzT69Rw8MBNZ7IorgxcdyidS64YuaP0QwcGGpd1q9KA9iLNpHYUWOzCwJXOVyt7pWCzWa78thLg7mMV0tN3dVeLY1DRNuhwIRT2jM4hU8hed5sZlUC0zxrvwb0IWmLmOwd0ou3IvO1YKlVWgbJvCqPHM2Hb2rGrelDSNvdCFmjYWiuJKaHbkY9hxbyauAfiFULvtg8dBjhtbtXi3dSxCrXW2BXnHlmg9thCofCZ+b5KjBWu9GaX9e1ObFZbzL7gMKUAy2J0UdlbeZQkdP+qp0xaA9ox4olpz2LSN53JgmvQltLqV9VufWjGWDpOKDQ1pFc01jRda3LkvDYrqvDJy0seDm4hXSdBaRsORWvHUbwsfBD5hdYhGwUA2Jslo5x5rPutJ2J0b8inM8CrSrpzXM0Tu0di1G1H4Psg51ajfyMeedfw6ORsgzY7kLHZEI0acCrsYucdqvPNT4M8ey9UdePhGQ7ByM44qQWeS7Tm5bv/JNZaCA2+McMdX7p/wCIgcmCqFrptqlbniz7qrSjpRnuRmBwdkqBZrGlVdrmrue8K8zWCwwKusffbucvHWVpPQtWG6sGLXN1XiLzt5WqKN3lVGs/2j9FlghyEhavWOXBYc4rFZ8hdg0DM0RNcBksURyENdryao+vkIpx+8bQ9XhX/aVEG5UCMendjTEZ4OvfNCbTOeRk09f3UTPafXs/38BocaMZrOXiyKbldfQdCN2rlDT1mVWePIKFB4V4HFaVmHtLxzQTvVWuLfitWRvWudH2qrpY2qrnuPwVWNFe3kvSOA6VUZch5L8ZoVSbDisHLUWPJnyZ6nso6TVVQ8LF47VquvncFpZOobvIX9sTq9R8KMcK9qadxTXxazOCq1103yaVwoqucQ2tS96Aj83HgOPgatHvfi4jJZ0HBUbmsFEyuMdWla3KelYcnBZrNc5VeNfeiHGqvvN0cVcszbx9o5LSSm8TynwecVn8Fi5ax8vLAfXYR1qngNaNpTW7uRxZeaK4XdqoMeNFcmvE0rjl4N6I04bFdl8UeGK1H1PIczG/nBVDh1rMLnBXAMPAwWCxaq6P4q8xoZ8VWVxd08gw8E/3aeH2XmnR4DdzBeVSnXMhwQN0nWGzZRcbvxV4Mxqa9GxOMopuHhdPJkslksVgFkuaVVsbiK0yVLhXNKx5a+VzHauc3tXnGdq84ztXnGrzgXPXPXPXP+C5x7Fm7sXrLmvXMKvxNI61JMMa0x6qeBaJSdc0aBw2qgIujJc4LF6xdj0LnnsWL3V6FqmQnjRY6UnqVHxPvbDpGhOFogeTTC7IM0P2UF3+JL9l6BAOJe4r0KyMG43j9Fqw2UfyOP0RMzYC7/DgP1V2z2Zrn+1oG/dHRw0dnhE0JmgiffBvOcWNFeoJrRE/jlj8FfdZ5KY7QBj1J0NngcdavPyV6ZmO6+tJRlKV5yviNgDtrirt1hVQwdi0eqBWtKLC52LBzR1Kml+C8+V6QfkmiWZ1X5YoXpnY8VdEjnK6S6p2K6a1QO/JXQqHwKlfRdOZ5ar6cmsqNWKqzDwfFmi84V50rzrl5x3asZD2rEntWJPvLA16+TILWYuHLg1oVJGNHEKsk19vs5LxdAPxD9Vrirvw4ItkF5aRrsN3BC6bqEWDsKIR7kXF1/8ANir2SF/WA9UhUDLv5Vd2cQqAFc1VDclpXippRHR4V3LVag/a3JE7XZrowW5V5M/BzWazWaz/ALlny4f8vGP94x/+B//EACgQAAIBAgUEAwEBAQEAAAAAAAABESExEEFRYXGBkaHwILHB0eHxMP/aAAgBAQABPyH5IuJYqMY+USUNx4UwWEEL4oQx/wDgvlBlOFq4RgvisILYbkHHxnIj4rf52IGsUJCdvilYwSP57Y5mZv8AFYR8EQRL0+EECIGLBXwjyRhFRfCFBQgQhQP5rk4SsHT4ZiwXzggjFbDEPB4NaFB1xYjrg0RjCZGFcGLbB1GsI/8AHP4cYL4R8EsKmWHHwt8YIXUjUphGL+FZp8ksGP4xQW5mR8FJXGaixyLnGKK4QLCmY6Y0HoQW+E/C98FVkpMWNlUnFMqVH8JwrjJbGcFT40Jrgi2CwRHygoxJtDZM4oeESIvhfC6FQjDZkEYIHQgdPjBGuNMYxj4LBYL45kNY7EkfCJ+SMIeZFcIwjCBKhMFzwPCC4oi/whkskbT7G0xlDeCCJp8YWGXxWEn2jtIHU+iIV0bMTHURghMVT1C/3pVr3hNkDXp+iXVt75Kg+1CifGH8BD/EMACBQITmbwv9Hf8ArbjKFwd0EeYH6J9EdfG/hrdl/BLo29IhzOgLR9uC49nQSc/qNRcsQbySvd94NSgrI98Nb9H/AEzq5kIKdQE1C9vY+qX8ixj10ElD76Cdl+mhkkviJRSZ4VbHZcY0QXFgzYoLFYIlasnQf0gEELfEQ4w8mQlw1QO0FhJuK8RV0QtybsJ5bfgQbaGeGEc3JHUMTFuOZbIX2JU8qpfoa+iaoWmp8ogKdSSsqxW7kbFOqpndLRyOKNUygfh9jrBkLu6VsxnealSVq8RX6E5W9NiD0VYyeGvoaiEnMrVsxCVRzwtTAcMBH6C/YW5rCEcU2hETkToqFwmHVFBlw5aCJLkCFcqRWuEfDgkn1WR81YlggGdA8IK0EOeDO+g0kuTVJ5ciIisvIc0Cru3mr+p6m8XQUxJA3Iz2qfrE7IV2JbLLQrQIKYsiENEaalZimk6SumG2hO0iBjzvW/kgyMlRCdATnmSIb5TId0lDs0hfTB9Ki8leSO7xEnXSisOy7EEa0WFIiAyHKhYXwQRPXC1iaMGIhFvzMxK4pe2RIeN2cX0u1SuAeSomDL1iTmVULKN9GTKyCQf4KxEO2K7NaOBx3QnyiIFUsUyOfgsEZYQhUhVTwqLDJ+kpMPrNf1H2IFoZq2+n0L0565DeggYhtfL7FcE0VL6GJMohrZk9K4515cL6IyHLVQuUKQhA7SC7ktUI+IIGprNaSgZ0u29Rt7l5kqVYyds/QQOUm6dypp5ROkeyRPpNRNerIonX1M3+wp/54F15tfkVa6LsVlZ/WIGxHBtGJTpV1IOOoo+LcsbrMlJVlG3uD+0Yo6vWqg+hiYa7eKQ9lVCqJ9RwREJUWojsJ6MQUWGVQptorrmoyuRSPgzL5ZGUMLfNX6ImqANwinMyzbMylhGDQ3KLGi1lVj9pTLw6ZkpXGPd2QQvglSQmmiVXdtijT3fJFou1NhuiNJWKEVd+cQKUIEqh7JPdAyZKSRyoRo4i+yjB2aySbnlRUsRuotVSmuqHLakriSBqrSYgs2XndFeSsm+obSMk8xpHYaJJ6pEE10mTW1BbE/DZXYrqXQrkRZK4oku+d0/skaFaf4DpUM1/BpJcu9XgxrNepy1f+OZVI6QGkyfexdRsWwZvwmFqJNU+4nRRXnLXKuiVVkK54FPIpCKjqT3fBthH/hWPRerLRBC6FkPwCuRLhbNj1Iq1C+pQros27BAaQ5Liw60S8sKSS17hTyWz41ibnlMjWO0qhdW5rshNnQ1ZspbhC8ncmCCqIz1iBT116ktIb6qSZ0XqNlnYbBa7K2bZl2VyWiEnmqNRx/iHVYVv6E1ISonNj98f20W1kUiyxok2Z3J5/Ds3g4FWyTlliKTsURYNepDwRV55jfIkU4oCSV2yGS4nODVIcOYFeZ5p9yUmuwhpsfkt69hCXdJVg7bzWd2IWGzlTx/ZIkVZJBDi7TGRNy1FR17oldOK+yPBqVmXLQuHcnix5o2mmVNGxD8FwPPVA8MhLGCnxqC0nop5EZEswXRZiITH60C/uRKLHSbKeo4yjXljfWFmmiEscPXPQQVvL0D+mG+zZKNSp5nkmXPb1mE21bFIaZNPZogR0bMx5LbvYrbSez/RFCpfl4vkLwRQap1PYCggoxld4RmWnSheiZFpgn6p+6f0biK8sJv+on9F6VWXQ/uCX8kNKNqmsDnXTBU4q3QgYG1m3/BGUJgtkZpwtKCrrUo1W/uDpd6b0SFXRIpV5D0vl3Z5sjqmU2GbVp/q0Y/2S1PJiNs+AtH+WxrDB6NQrc/0Mefm3hJIKtj3b/BGWFUNKZJWRT9Fcan6iPR18QQpEJUUCgJTxawkdKjZJpk+KCZQKWv1HdyWN3tqAmlRqAMlPIrDOj8dTheMEjqTxqfNpykEAnu/MFS7JrDJF3fuL8IlojzJdT+/6B4WpfOFMbfcfgkUDJs9E/AgQ3DcN3hVHaH7E8xswz8CQtaHqR6G3V7NCl4SOOGEwcJhJTPIqCeHeafgWIqNJw27ctjF0U6frF1oM8lB2zFkSrMz9LPnyH3IeM4a/FCW1z2oX6Q4MsJBpE5UTI6/2FhStkG0U7AhpNQkHRksXoTNViqhOJ0GlU0qjn0kNrbpZSSukWk3mrwj67RBe99pIXbvPzQRvZd1ErIl6CH2oVhGldMXQuRLXT/ZG/RYEF07Bxw1fWCXte5f+CkQTfULqieg4LNadn4eFQiTO0bVxmObQZNDd5RqtKwawIyVpzBNSK0dniMEowmtG7IojL4X2Lv+fyYitrNWTfSgyUqYpA5Satt5mUB0nukFhsq9NpK80HlfB648/FIkO8G9NxEYU44akffF/gRbCjqsM1m9MLyhFvXO38M11xjqk7YIaTKQkS5lGaIuT2mTcX6BRnJaE5dRbcaJbtNkTYCmqyuh5IOmzcVSSvAu+5wE5ogm2ZxMMX3PooJcoJiuKI+co93eRYo9xjnTE4mWjT7m0fZNypwnNG3jsLEzLgfRFDRwZB2n7Jq6RDZzhU1mKWQRTUSNfxHd6E05CyVBVb9Hya3IcDcfo137iMxgKmT7Ty4THZZ6m0U1XkdRjXJFLpqlMzycCL6NwTRmPH/UNjI0/wCDheVwOoBetf0mKzXKJlwrtWItDCmJ1lsO2F75jmdluSvg/izbFPC8v3lljVSdCwRdAw3Iej1XZZmj9j/BJZDedZC3INRxSuhsCBb4qDZt/kL24Syd5CCfSc0hPfLRS+9Kjethu2V1GLVxmOD6mf0GI4atpKrTFSbH1AZlmhkdmJCWB0rLgiHttNR8Gqok+Ipw26SLm1FT/gaKv2ekecS6nfKR84y5tYSJpzXSwr+i4mtViPrihFaLO9iRMpZKJ8ap9RsjdpOyk0iMJoNor7DlRrU3d6uW3yLfBDyyeTTuiVNMxz2jwyQpbh+KFUf31HDpqID5SPUQwpZLlzcsyM6dWzH1lisvIKatVKHSmyL9ihGuL/TI/ICuoeQ8CtWxnStYrkrq27ieXFJbNy+w2NdDuMTKnflfmN7i3IF8a1s7BRFmS2x6secXBWrz9CYzQgjaUulQ09hc9uc11clpVwjBtoH7UtziCR4QmP6GVcgdAyS/oG0SC0Y8WmpZt9RmZ5lbdMpdFVQ9ZFAhfPtUoq6MjdyKiS7yKaJVLYo3CnM2zCrDiRVU6R0Ol3XoO9QvjUVihROq5OdC6XJQWmbZ05juuzAFRokiqiKxvUpCR2aYJcayEmadch0OOSXDkHYWgs7tRk1rPeHcNZnoS09m7HjbKETFDyEoEVKalW/6VX3MIl6a0hoIVkTAzbRjRLvCGO6pkiQIOqlasjopaBLMSkNcpRkOLO18lpQu06Mh2011xCaiYxQa6r7d9NslkGPorMDVoWuaSxNaalKprbT0zJoNSkI3LeShnqzOXBUoGCUZTtXJpIy/6a/epZmNBneULyCZy25WQRQShGFpRYzFp8H7LjIZlhOhT4Txkr1/4ZcKiIESJTFYavWbq9VEND5IVWVRpXctlwZJm2cFRuwl2gnJiawoTasSQrs2pfM0Z1WQ0mZbqYNVXtNIGagig7dTaqpMDQsXRMk4hlRoQnnkcoqe0UIKMttmVR1CCaFNRMg51lXEpfSzeEIWQ4nKII41GTuMtUnwig9JxhH9s4exT+5HdCz/AOIvPTKjHouWkLVR6Mgj4CKCVoyeNIatpKR/VxoqxKlDzcud3AyoUGBaKJqtW0hGfS1Iawje8LgtSIJkn1kin4MOrQfYqhO2GaaO5pM40NZhihpwyzBqbTsQgUdWs86F8RGrkW35x/kPB4xhzjMKr9QugmZAlgVSRVcaYSFJpZJSS2oemQ1BM+VT4pkozbQVQxzTu0WihH0e1LLbKbshZDiCVIRlI2VUejLABzSSoTOIYpoyVjMTkhCihGhKXsjJj4GIl9RLRVUJ8l08h1vMqUUZHNqR3zedq38CJOajZCVVOBugIzCG8dhbMnOpUTjiZTfJ6l8EILzHqz9EUes7x3KgLkmbyxQmwegidNWLCe6o3YqDARVDNKmImpWSfUis455UUwRiSN8lq2R/YNWJougLOa3kqGMQnVNJWaKe2/CaFB4U0N38E3RpGVH7YbBCwlgseX3T3QkSSmc2SvOyFQTWJJRTHNG8EjJFQksPwM0jqMleSTKYLZHk2yE+iqKMmTXtxJCsKxmJ4I/aUyJeSWMKIrLiok2yp1KzHpj9SsZVExkk2VyTGtJ6ENByVQys2MlEwPjlJSGy3/CcTLJdpaj4dbWUDEoTlUp27EpxHsjqyByc5Mt82kvK9NyZdf1hj+1cJ4lGCRdjJbeq0DpcWKxUkB3YUqpAsMYIEGh0JzFqyE7aWm8FHWb34hITxoz5E7kd4gFmE+W/DoQf8oUFej6JJRJGKWSWiZDKGzsPqAnaqK7GaMdOn7hx9Lhfk8FozonwGXTeTCo6fUPOQJS33IpENpCey4GpIzQ11V+CjoyIO/n1CLjOwRkVF6sl8JHVU2q220SM0LRv+iaH9eypN+IJtK04hBeZKhPhNoKsuzTGQ5ZZMhuKkXpNhYoEZ8EHlMyUsz0gysJad0FIuuiXTJHjpP8AhrCe6XcarXGBxHwltUUu1RdBDRhYUy0IqjOWpvYk6awmlu6jCGiwcJERDNNxQn6kBV1XuYuuSXnCt4GLJUaboe/M0XhoSMu7p1GbFqv0G1nWYzRNljYeT3hMDmSQ7YUaK9mV6P0PrcSEVBX6ZCD/AFJrffXkZNqNKSvcuSXv6PV4ICQqNmiXkKxDbV4HxKh1DhZiAbozT917EhLuo+zNDMmMjNIlPicwzG8xlZQu+ZFzZjV22UuJxLQnSonb2CHMrDRKY4xIansivkkcnGD0uLf4T5/2NIwmCBOR7NRvoMEyfoSE6c8KBdEkInSsCifRhzWJ2k3KegyLZ5FOdcY7T7mXuToQhWOLGEtmMhJaUw1tZBGvlc62h9GXmEpFwJzJ5dW+roNj0m5Pp7j5UMYiZwx3TdQwfHLe1y9DV4KKvteBLXmiJhKpLqgQO9bfpOmlzU2urENB8mj6KiXnqy8SqWcVvoIkpIkhbT6PNFEszGyBibOoz2KicyrQ6oz+CYesPb/pG+ZOCi+BzSu2Bi6j74huTbGokvI7FTR8MaQ08E2mMzCROpCpibUoGwb9u7EAYsJC2CkkJf2DoQqENNRsIgSqklJFpo1H4VVaIpKNI0KJYI3HuGNKUsnGTeq1JLQ1Y0py3FuhJTVGqYtRTGwmKitcAe1yLiwmuafh5iUqG/qda6FBSCJ1y3FzibFa+xWVGW2TvKaMy/pijyUqlEjoQyC3kvLKGyUiKVo30n4aHU2Lla4wRm4N8PIXFqLZE2bKojIHmcl9znQ/I/8AgxgOUVcWi38NDSlxn9sZU5Ln6GFVNoeYEalPunwF09CXEJfZYHvYcpNU5UQxuJL7YCKZYKnmR5GkUEae51+BG9L4K5kIodCcNZPBBUZnWoW3HsGoAzJcZvuqDvDaF5ZBIREE4XI1RhbUVKlNPUhxunNsrVPJiTisfY5GadCWxVkeaJGBEq97dZPddi06Bbs0809RlOBUXgyJuxdHQHZGq5IPcqL5C2j0XHsclLvqO+EGamgzQzsQk5WSqr/lyLZVOHFJpyldi7zQ5S2WrQavZRW9qlIizSTlLQnwSEpsMe0Ay0myrwyClbUJuRD20Y0MgEXGk1qyBimVhqHVT/SDpgxrdD7XIkbItRhZQ8xyxkTCLVWFVTT+TZCRLhJQkWsUR5auoteiBCySifUgaAozTyQuWEhpIb2uVivS3QYxapZ+upG1asg2YSvmH+Aj2pOJm1p6GSylen+FUka5v/1ZNUo7lUVVV2Q6XHpPVwRMbavAwXlM/kqpN3kQ7m0QwyDmBODDVGiCX8IvsfSoY1LDTRTlFTTU5uW22Ij3kE1QTWSnEu96DewRIOKmob/CkX2Q42TNMc5dSWRKTIpLrVEhxlcnyMkTJUVSV7CK0HVVy2c5FWJTReRxWThFYXb0Hh7m5bCIDq4a5Qpsj8HmLLWchG2lDuo1NnLoZOEDyi6YVbi8juV+M3/BRugSCrVJ/qLgoSoIoSuGPZeHqhwDULQowIFLrwrNU+RLey6jyrdCcu5N/wBeCUkyxUhMiU0lXMq+YHwN0GefmZX06iKsdT4aJqEsQ9xol4c2EnZ1ZZSlFYCWU2IB+J/sXJwrhOgv9G3/ADDCXdfIfWZXa6dCSs3VvDH9GtK6KrXW2mRFFRr+8/hGZQYQnQylL1JVVlosuQrVOomSeFWKwwiWwknQEFNDtLickYkO53NxjqbpdE9SHNUYkk8sdTMoE99tgYqQIRYQWJ9G0J/xjhkIOoQUWrXc6CKhSVeiUvVciIG9i+QS4VWAyqbkdSNOmYFXtZYlB6GszIElUb5yrjqDyGUm+/d2M4M0h4OE2idKCcoyNT29P1hcnTBETOXBdkVEmbgl7FKm0ChtsWkl+csK/H6FJNXc1DWbiTsQGQ4GhI6Cl43X2supJWDQJ2pcq9hSmtXQkMaPW6s+8F3oSx8ZoXcKoxbqQ2CoL7IKQcPoqiNKIX88GhOsZSwDZyUxOyj5qOuWOryKBNshRtcpX4KbXzyOknIUCZOCSpeaLIlp/hkN8DRYTqVx5MwUVB+YySqGjZ8kuBv3RGgS1cfZJ0ebgTjS0/0kTtkJohhTtjiUEyWUzY+I/wAGpNjOuFaIWrp/oFPapT8jHqRdD3EU+duzkhR7qRZhnFpc5+Cp6hteZ3Y5yhGE1BN5JeNikpJIq2ExqTzskleeIJTTbXholG1Rz0NsRAx5ohjfcYpEE/4HigRaORYlA6aELFzcg8yBtGbQiT2Wp0uyUO6bIAi6SRIysgnHM6DCVfYVKnc1Peg7kYgqMSkSJ1VGSEFCJTYq1QhRTDIIIRECEkTAdFPJUbXTjrgjOCq80oVpBI2FkKMmbJSw2varQm1csiSMM8qJ0RIOcwhNWHzimu5RBh26GkEjfIaSYucS+lxwxYH75RJu7H5EXaXKJSXPRVFqjK5rdmSDQwMywv7QrvDYUg1eVO4lnIluliKG0RARJRZD3FkmckVLDpcIZoLabGFQVDURslUgdipYgoQQLqKhRImh6kjwsajnqiXUp4ZuKwiyG2H6f6NVlNifSkhTt+pNMGfcaZjPY0z0haPupEISRbWUZskRosZW94Hw0vJPckGhvU5FhxddlsTPuhfTXNBaknUyUo552G2iedBlOHcJkooqSuLM63o1UncJmtCFCQWU4kQ2QmI2mG9xSoaKSuQoiAO2K2JGZcMcNQTLMgyEU1Qm6tdxaPpCZSroI79gJXJOw4xZezJpF9GIKvixZw+oWeJoA9J+iHDe7DU9HVjhQznXsPGsHqaRmXLVwiR30zt9D5BSDoR3BpfQmUktVhu3AlTvVNvctHt0RfZGSVy8NV53J7awOtCgwBoSV6wpROtzaZE9CEgk6qmZs0kOm96F8wnUknKKWr59aB+kqFQKcrZjU3wVV4ZSintJCKMlX8IuCPDIkOnUfnvTGUzTIST9KE0UpEXwquCbwhdoi1X4JVUPIr3/AKLK8UamOgrNIs1MH3ghKirUZj/TJ9IkbHRWyQRWOEv4ZC8tCobDRTtwJplIzEm+sDoxzCq6iwyRFTkRoCXTdhuVR+aDMIPQHvirMTeSE1lfCHMdv0xSmr8jZFe0eP8ASaRZaZsuk9lGXH9Iqmlsi51Yqx592cFeP6TGjMJpscxk1HhJjOxKGSWFR/sZdwbhLgOXQptac5MvjyGpNVhpr4cEk4jQzTGusEH1U/bOGQ0IOdVc7pDzTpVpGNxonL9jUXK0uab0uPSmWn8JCkkq8OZWlhwEhVdURvDS3h5kwz3pcOK0M5NtP9G8rd0H9PzZFkczqkP7EVG3ZqN3IJ2aroUm1wS12giyOKHYVCCc5HLikzyGpqSXcDQjzSGyElOIleBucmm9TeRoBuq3LGy77mRN70N89SNW7Bb0zJGfcibuJqS5VzhJlikZiB1CdSMpMT3J1CZmf6SVn5uf6I3bf6bT3OOgthRl7/g1lp4/wt01yHHuRvaNCnv4V9/D33Y3Hgt0w992F77oPctqia1Ke/Q3lrQyG8rnAfwn/wAJx7rxqZ0rphsuhlQmMsLGkYr3Y8fh7wZaGs9SdaanPX+mpLKeDPX+DrucFyuXCx992JUe+wTnoVW0eCY2/BN9jnImePfAvfdCYsXnIlZ3E2vo5G8h+yMeE/CcLFfgqlglEuYwvfqVrqWyx/pzbM56nrPecZzJ06FX+FaeCsR7/wAM9CbC1Zybd/dT+ZCcX/6Snv7YnqXLf7hfk2tkeF9D8ke+5C990JoTDJi1Bv3QmD/g5H/58FqYX1K/8PJnToLboJk9i18K4pW8EadDjMSIm9B79SpNMu+dTy/szIeXv+lV+Cy8FPcsMi+5Gtddzye1OCHB190P+f4R7+GaWvsHByRBUckdBqOg/hn/AOPIl/BLCII8HJyflyxUyPoUZlI+yv8ATOO5rqbXEoZOmCp7ZkdD2n5h7Gouf9I65HTh45+9yufLLZe/0VY99ZWbSZmSXvB7/h12P+CdKGUHTCRlvhx/4XEoWZyVzFh7QQ8eSaEHqP8Agpl0GqT0wh3w95OMi8FBbe/4OZN11Ke5jQn/ANHs/wBPa5ENTlHgiNvwtQr7+FZttT24+tjLb2hEX92Kfn+ES/ex2vFfbEKyvbr/AAkqOgx/FfJIsM6YLIW5E3HueTfuQJSzYSExDIIY25IbFZAmNAk8x1kcl3tRM3r+iTFnJL3ye/6dT24xAjePcyE1dvA6mUeDoESxTcCz32SAvWwwfO3+DiNkanxS7nBcSxb6CMYc9cEYZjWC2yNhE4ZiUQbHGB1kpyMKFapLSjsLkmLnPUo1v9kyqRUWxko17DaipNPv+j6f00tMdymXQrP1/o2448Cpt7chz5f9LZ7/AOlLe8i0oVy95K5Fe1KlsynYS6R4HKp1/wBPf9Pf9P8Ap+nvu4iFnhJKuesTSuISqkJQeP4TRiZ7QjU//9oADAMBAAIAAwAAABD8aamicxAFXHqYbQjV4eJ1X2sINTJTeizqEo6cO8iIjqKpDQK/zo57vJ8Bg6+poOEM4ZD5XMocrBsjn8pdSbvoKFfDjBJIG5wuMLi4g4Jp4mfbPgEZZOOF22sgz4pwd4r+kua1L21KsKp9E7F3UAUQh4wKHv8AD0lElzR59MC+BSvL/JI+Qb46t9nl3Jctgwo4cL1wPZHjriykES+L9D73Ml1Zg47LuKw769t8RzLnow0xnfgVFPe2JEVYr9avqiVMYdmjpFwjZdtFEv5NkqpuQqLLjyDX/opkRLuEnRG/EvvIkPXtwuykvvGB0Q/Gq4wsa0sz9qWWkr/b4N2FcPCAcq/P6JMQPobVfGkuXVuCW8xlEu4FkM72jA3ynHfAQJgt3N0nbPD1K5/IOeczXBN9FoBEVFARCvGQ7DZOMJsWL+dOIZBp+b6vfJO0s4u8Sl6/PET3HOvP1cTsjtu6EG7H8o8TRArL5nsTeLrydlsC2TAK8JWe3DlRvvW9du2ZMiSksAO2F0EPqqXj4tWEvxPXmWjLnREE+5vefreRlGhiLCP9ajfDuYUqnSbVbE3ux8ro0pp3NuHjn+OMph+0eG62+U07WkV9T2aY8f0OKoz+G399W+Qq61DQwoVwkfcgS+RSLGSf09wv9gLAnp5jeB9qhfCgj+jA8eih/hAD9ih/eA9dghB+fC//xAApEQEAAgEDAgYDAQEBAQAAAAABABEhEDFBUWEgcYGRobHB4fDRMEDx/9oACAEDAQE/EBl6Voa3L8LpcYStL1rwdvDcvwXpfgvwXpcqMrU1I+N8aQNNoS4PgfEvh3lStE8FVKuVGBK0VoFLcE7MRUytXwBVeaOJR+7P6LP7LP3CbJoqxqsym2cHgdm86PuPor2fplfx9IhtHl/f5G0l/wCdYgsfaJ7H2m2H2jvQfaPBSUyVs6yts9oI1Az5n68FStAlb6595knUwBXMMj6f7U4o+f6h8Wlnk6eXYixHsiBwVAzB2jvkb6kOHsoeRiApKHBtmyt/XaDcrKlpP10h4tml61n2zEVYBZR3sAM9p0ZsWbZLAiKMIKW5dndD+NK1ZUUzzKD4A+JUpUNrrPxGRgFc5zHFssvygdOhrOZgLDGMBG2SebMXZzb8PM87X3MIptnGHvKv5ZzEpovGa2m4uT6I2VoEA9R22zFWduV45j9RrfNB9EBBa4cj5MDpT3vo3uM3u7Ygh3duQ/lGXvwY++B0JzozzMH2zMiUQv1amLTL4z+JUFayRfIAT1d/KcTBg5XYlOinFi2LtdtJe/xFKpX1E9AH3CUdsE/A/mUt1p+EQJ4R8DKIj0L7EoPqD5ROk+1txVtLewv1crkI4tR8pKe6zA3sSnKobHL37R1acaKPXL4IrexT039zPpAsslTGHPvKgxjpbvh94myVcCp/rxGV4ZlduidnB91jEbHc/MTHXe/rv3hEMd38ebLpLBsXFgYavuI/RK02Uc8mJgEOXo0iBSkN2sgH4hhlwme3WUD0c54jRQDl+PJlLU8siSndXZ/2Gs2bHLyQgDlmt4PbTvT4mKAuL3q+PaEAQgTfDEneXF0rXyh7f/YsS8QUCMsVNjWM99okAKoDbyO1mz1ibeeqvhE9o2KnyK+AlXRjYMB6RLhE7IdvE2ZicsGXoATwXEQXPebtlCmK7rqYfXh+4fKr+b3KwNyp3Xq6b4GcvaJrWndDb/ekTLmKUvbjBbA2hswyCxwc28BkoIFDt0l+APIlAPnUsHbghC636kFOZl7pbLJQuFR+eChLmCSb5tPBPePuIUlSptCqiEXwBpuOimEAzgFFresJBxnrG4AhpMRwVP3Mwx8HMzHTqy/a2IZCR3vweduIudO9QANPpGurl9Ll96BCjcur6zfjJBl3MHKKD13+bly6lzzOPiECbIIgp2XtFx7lRANGBhuMy66MQI4YqjxLRc5yAOHBIcHJh794KTueX6lcscxDDGIQ5Hb06S4K/dcRbC+/+RLEeiyqIvsRKasXn42h2gdRuDbxMB919n50S4zIuGovSC2qGyfmBc3tLeaXz81BrN+V3YvUI7o1W87s511mN2QymURHiM5Lh6ER1X+wZ09GAB2+kXvJzpK27uZSecHp+riVoy1fKCl5ZQsq5dW8VRj6oPlgRzfl9RNYX04hNwlYcRdwgYNTMUw+Ut2cLmEhBt4LkJwwxbwGzoMwFXP+Q6BmA/l39IdXBxKiB2wlRtzJPZ1z3nMMqGIRxBHEu0et5doCcL52lQhwvKA3GrZzHxHhsylCib9UyqbrmMjBXZvGlTUlmLAKpsXU2Zhgh5wVoVttlEjIg+xSnwQVtuQsY4JbsFMxh7QBYVDJLWEG+OEwqgxm+yEV068wGs7yuXlRbuMUKObVlpUPIJezotkUCQAG+SPWGy6kJBup14c8Wb0H2gNgvj/Za4+L/Yp1b3INS/vFAr/PKYcR6x4IgsjB5uH/AKnTuCWqJAGIr943WfOWqPnOG+82wJx35gOwh0UW4lDMHk2lcy1SGwnvFCre8ep941ZWLbLEi3SDuIM5iIVspEN43ljdRwrSNmLjV0RTLLOYb1x68W5l+s7kv1gusuXHV8C6VcTV0SVoqB/wNLl9I+GpdS9H/wABK4/41KlaVKgSomlaKlaVpUqVA0NWVqaHiJUZUNBhoQlZ1ZWIOn//xAAoEQEAAgECBQMFAQEAAAAAAAABABEhEDFBUWFxkYGhwSAwsdHw4fH/2gAIAQIBAT8Q+wypUrTvoSoR+kjK1xKhL+yzhrVS4ctHRfoPqDUhpUdOsvW5elapofZNK0NLiy5f0Xrei9LlxE6k6kEcn2KjjVuJwI8Ef+cn8wl/+D9RDPsP1Kq/YQRYo+i+xCMN3ma918Cz8yb5C/SKfdPgim6d/wC8bwFv9O0pjPdi+/kYzlerGy28sT3NcmFF07ZYvj8sRa147P8Av0josZ/Ax4nECUKGP7094vPw/i5UFz2f3K4DGfRNz9dIJmCALTKCveMI3qt8JXJimNwXux2KBGXfGb+IKecLMj178+suU4WHK2vMS5Fa6QRd1XG2esyApYyTDQ8l4vD+fxASfZLkcFPk/H1XAR7Es/iXyy9gNvK8QFbb05RBt9Ylq5UDigDvEBqLvO6wTZe0Myvm/fKXHoSpOW3xnPaeKrxLUDxxe8rKc/ywtkIZwi7c95VzFnFN8IWF0xb+5XcI5YTuQTDD35VEuqXhLC2xzJEZLuHww1GEvS9CVO9w84lZgkh1otj0lBvybH86Fhh49VTwbd4wYVtvkG8ViNW0hSG+xY1tFJ4SGn4WeGU0nPHdUWLkj3ZZSt/ukd938kFvWRkOCvZGYcf0IP3QrdD8y9xt5LfaAm3xit3lL+IPg6Q5Q8dtvph+YPLk87PnHZlzDLJchT6S52lwNKg8R7Zi1MspQ5fjPxAN4kw2UEepivFQULSf1Mwg7HH/ADpA482PntHRbF3feKrvO66IkpT3VOzmbbNPJaByd1K5KvzCvFUOOsCptMYjQFnE6fsliR9kZYFD0lFtYKd64PmXpRyXtMU7eqBHwDbbj6MWr45iINqT6CVLRuwvn/k4ka5JYlwtPrBohCk446bw+sFlKOCb07kOEdA/Iz5hFAvJL98S0sW6yvrwlqROY29o7MI4HP0gN4QiwkU00gHKs3i5RqL3cihQxCZTAK8OCL6EyeuIvR/HtNo/1Ng5GmvO1yDp00Z2xR4P3Hwi84YqQ4we9BpQXHvElflXycdM+kW7PrE4Afx8y+YEtA2PgjFMe4lOzNKH7igzXNX/AJLsDpwjfuwbPIXZ9YhsRChbFiwomVdvaVXAR4c0epuSwS7c5/UpQQx1v++YKm4qh8MLaSDBl6UFS8eKsWYts4nf+mPMxFJzYeQuGCdiMfoORKrrFo5uALscIFgG0NRgaY9LiWX6QPh27ec5NgvlBlYc+B0hptKEwWjoMrpRnXKWCtoNDI3P4NvapehK+5PviLLBegx4G0hROItkA5hyxKUW1XzluDEDHNANptCZYY5cJSFh9oBEuZoXUTDDC5cE3O/MjRatuJ/cofXpkEbT2qHSqjbHywJwXsTJhAI7+8h+H4hLhzlQOKDloVeFGKgu4ypYeYFhgF8RHAUcA2IBtNpQXL5ZtOFERcXiIBhRqEAMPsYEA27z2m5WbPMg+hRKkPFDRMTEu1UfKTeuMnrt71BhAnQXMPYO7KlgSX+5gd1mFFmQVc2EYCpXEEBWd4osxWzKElsKJwTDYgdDHStpWJKVAWXRZWipuFcfjkCBFmHg9Y2bZyhIvuAbhbeA+YRldOGJvCbzh3abTQRBw8uRBqcrLCIIZvM+Q27AMwgqH1MvWVuWABlYumYgwsdmkDr0d9LE0vHYyxcGVs6N/b4QYqFnXZZR+7LyLeEJc/05zBJ6TGeDZCroysHVRVIKoxuQMMgKZn+3LhA2UNFiw0pjv0SgRXa4xuxCYdE7VjZUcv6OjsnJjJi5lsYbVE2iPMOiMC3PvDMBB7HiBvzfuAcj6RBYWX4hm0zHIWtr+9Jbqnv+otdz66Kvx+EU59sctXiHN8IZc3RRHFnPomFA46CEIzIPEG3TxK9j4gGyAcIZAc46wxLvolqq4IrMK8YA20ME2EyXNinQnArRdKdCV5SvKI5aq+g0uMuEuXB0XLl6LH6llxaV9i5UHS9alQ0rU0Omq1pegfauXGXFl6XL0uXLlyyXFuVpcuGnHS9WD9ZosvRfoqMvStP/xAAmEAEAAgICAgEFAQEBAQAAAAABABEhMUFRYXGBkaGxwfDR4fEQ/9oACAEBAAE/ECjyd9Sg6gl/eGCop8kDFj7iF1n1Ecs8wNy6GmjiCEW1wpSAacnjiZAkrnPzGjTc/qllGNRq1O7hCuWYWNMnmAq2539oUHxGnRxMHiAHHqfhzAGm5XUKfrLxQX6hQjWLnCofhmngxHvPnEau6ijj5xHGM+4G399TOeJYd+Y1VsDsiZL5YiuIYhV+tVK5q5k2yjYdVMaZQLYriYd1cEXXH6mNjWIh73PHmFNqF9QaZipjjfxB1pYZOsQO2Zb/ANqFZwcSle4gPYY2Pf8AyVWjMa+Zv8Yhb2ivXMp4xKrNbgY2VKL6ZZwrxDzv1MnxmUPj3Cqv6wrgyxDNGeZSqYcvH3mDBmcW/MzxBZQagGeID2tjnC748wcGIjq40P8AMUlA69Ss3z3NPMA73KGT5lFj955ituKnOepdVczrqaWBrUoa8faUYGfMswaPcQqnyQvrxAuxL8QMYx5lXMtOpZvr6TJx1mBQVBM9bjbX7g8e+/78zDL/AFQNT8n/ACNm5io00Gr+Yh3zSXqo4C/1QW04ohdwD3A6ICsSvR3UzwPtOc11FZeFGhzMpe8faCcBIBaWUbqvvr++IFvxqYbdl6iw+v3nYxDlrMwxAdGviWbTf+QL/UXNvMAaxiBW5ufaZKmUNQyBfUaTEIbLYLUy78QQxzcx1CvQ+IK1Lzk7JZRxiX1DdN+4FZJl78SmrvMLDqW9wSDxDDesTOZioinaK+7mma7YFzt4gt1oYLuj4gaWAWKIMcQd/DKTZR3KMnJqBMlV4mG/mVlDyqUvOpRY/E2RzAOq6uFG851MhcVpmFwMcDqJS7wfaW8/UiEw3mApgsHPmWCO4gxVtcTb/Zngvsl0bz+pzQPiUpTDJXISmrfU6y0RyTJ92Jd9sL2QbW84gg3h4jeruJ3dNVGw1C0rOfMDFSnzAQu4ZNzSNvmWY5gKUZ3ERnEGtsbhV58/3+xCm1fF/wB+4AOa81EcVdkznNwcE/v77Qpc2+Y1g5mdfErGdwWv7+/EKqLs9TBrIZWHWoFXUVeMDueO4Gc+sR7HFbgXzUWsLdwq6SvPiNFRa+sKHBj/AGIgp1LdPkr/AOV0VeIBg+altJ9JbNc69Ruv/mTHcw3NeY4KxBmrTOBqWYAYl6T6xQUuKlaubYxDG5is/E4PmdjMVrzDoyJ9o24NsDR6xC6LfEMGN6gu/wDyJ+8w5Uhho+steV7lMDzL7frBWO2O/wC/MNLvj+/uJwK7ycxsBLL4/vsxwq/1LUBfpKYjWHJ9MTje3+/uYXjWucEK3efEwznRuLZZG3JYtff++YJlOiF5Cv8AyNL/AHUoF6CUAhl/v+zsvrMULwV4g35titiu9dyzce3EK8XGPnuNmu+Yq6/9gT4mzEzeri81AGsTqcC8RvQ6in1lnDWOorgGYt7hf2n7QRKdMph3HPBMWJmIOPzEozqDy9MAYZzBeaubK4I2K8wTbFinjcHOsjn1BZMCk/2UBW7zc3ivn1HDTnNMpAGqmXf9/dfSWbxNmOMf3X4lgNnC+P73KCk1nEUr2ZI8m72v9/7AW0+agbcZOPMF6+sKpDK9kNCh7gKLxXPr++I4arUo2GfDLHVdbYOg6g2UVWXuC2frKOXWrsmKr8QpODcMwNT01TcFKHHMLI27g2hfXMvyuK54lZvxC99RyUagqxOm3mVwZrcDvNSkXLGimVWDEsmCbxWZoyUShfjqWGsu3iAuHUcZvcDDzj4n2TGu5VLv+/tyyuOmZr3A5PxL0c+P76StMJ5I5GT+/vcKesb4/v1Cm+PvEpoB/dxpijHuZY11ULKtt/v7xKzbeZnZ1/f8iMOPMyZLv+5lOePf9/5EdU3ut/37lHX1hfJk3VS9ZKZgB6JY4b/UKeUQeNS/JnHH9/2B2HjMUAwLcnH3/vrL3dAYgUcVu4UWIsrpawxkqA3TTiDXREVePrE7FzQpcK7PcazkM3Vw8JmXOC4oZHnUE5s9pfgb0P8AkJK0sEVd01MmG8R3WLmD9TCAfeBemYLJjHNRXJxXcLropv1N+blOpd6NxfPiHV4ggvvU0tdcWH0ZiPNAIBrKgReEIIfh/wCMydfg/wApcb6fL1SEDdM2f6SpaN4oX+x/JDVEqIJ8WZxoD1IYQ3zMkOBxiZQX8E+Lplb4yGILcdxR+Wdyfig7KfF+5e/tKYS52cCVTfw2wW2R8DDblf8AzkjY4eFRGxpeslpMnrJ143f+EY58iEIV/f6mcMU7nHRZ3bQmWl7tIvH1UVcr3k/MHBYo0flDDZ5s/kY6wE7fzMV6jt4OabTaAJEcF0EKruFiDr4hClaK2CvdYL1KC9D9oNbiNmA+Y8oBJZeWv8gqs/8AsujKszA1n7vUDlNQs1PBmCsnqXjln2GvUQ9Y9Sg+4mJzCcuGHqJAFAUN3B1iNQvcAxiKVeoIOpdAsABzHas4nRgLwm5SNUnAlfZOEkE8eD6yJS9toQ9FvhlNFgTa63KeyzzKUQSGOxbeDK6mChINXm5fxjXImvoL/bCrRRKg2VUMhYTTEqUKYRpTQuUNl4JuiqcdH+KVRMLtLNNq8gqJpY/gNr8IBylDuEstKUL4tfyjcr2sHpb9F6iHQLWE01ihyUJpIWrG4zSOikBSiPhG9QgtLvUpimIRxAHKG0cQghgGw4EHt7lUvxoFlgVrUvLM1KLEEoQv3H5mIIim0L8QAobBxM0uaA7/ALqCshxUCWKZbwYbiuj3AvZ7Ye0BCVf5jV17rmWD4QVwbws40pD6VAoWPVSxwy1CBugq9TbgJqPqwCzjZX1in3hV82p+fxI8CjmQeFXu4aTC4o0iYFkG44YnDBBvzUA6uKcJAobb8XfgEiMvMHicAcdYFu8YKthkeAohlkKCWV5vEobojoBFWKx6INJNRuud9uF8AEMZm5tCI9FuX1Di/k2nqaQHgqDKBI3tc9Y15uU7mld3ZpvN2HdHiE2uoEN3boQ+VWGHUQZ8g6OwW6j3wBktROzT5hE3QuvcsTzGCh8TgMTHq44CXB4iTirCsL8clJYYpGONWF1ZNbLLVCwmEAam6iuzXWmZmPSO3SOGz2VazSLlDZ420W6FjV66/jcwbKRwniPjeGUqle81+YilfVgVrO5dOnxBWPaAYPuiVk+kacXzonrFcMo5PpKvF5m2POojhAsPrCzfxAVBU7X8RAQDZFgVwFvQZV8AwJus79I4HqDcwhWb3ajI+YZtS+k/dDRtt6vysKH84wk+08NdD9AS0ICtIUn0jKrGyjE9nHPziqERDpySirbLNfEOQzMvVw4bFvIrUEwB6+GpfcKeHwGQZcpkgABGxkrGyMzQ5oZpkDC04hl0AKWAULbusEbNuIQzyPoDBgXTm0lNiN3Ti+I/qKs+fC2PcB0qM6tEdgxgA0jMiMqWuohs4hRgEmKVDsw8tf408rctAIQ1S59ECkTYkrbrWzdUk+wnufup3dZjjKDc6v71CLNaAOwWJ6YDKVCLm5Vn7JQrXsgmd9TI5NjnUUVe9QVt3DQ6Yyij02PqiT1KPuCMKvUKZcQOO5Qc54/7NuJS8zeHLuA/7DDnPxObqOqLPiFOS/jxCz4cwGi3ZtmGX71LvTHaQacLsbdahkJ4T9iI8/WbxOJWPpxWBRqWmiXv9scp4B8mUATgDfr7+eo/Ns/UBylVhWIbfV2kWFWgplChbyL8j/iA01tIK/8AUsS6NQOu/wCqgw8iktAmxqW82qvYr7kpIwBWkIeQYGNQdRyUOBTZWRn5kpFPszGJ2gwWXUOT2AxYD4RyPDHQdiq04cbc/SIgsGUXZ+UlOsxKLjv0H6mlRbfnELjB5IWrH9JEl+3uIUBUXVXRuimEBDHsXN2z815gw5KpVBL4aRv8R+SIRpkCMpmVfh+mWT7WTw1rHnawDFigOMy5z1E44BV9iPcpzK7yYvlKqS9p+kSgFUUdbD2ECTLG3gBjiYrhzCFcu/MRcJi8IrAdfuRtwlcwF5+sOtEvFqOZlxkvuHLOP/Y9jSdQpKV8zASoatJz1Lov6Qg6aeg/EwhjLoFH2gKLiN4bKhMI2VwCyuaLCehW+0XQ8BAnhKGCnYtwtVFTlzO+ZXBcjs/trL9KUFurJmq0wKGd+jdPMa+6lg+lg3A0B4a5ZgpsDPzQW+WWqoWWEY9YirvpR9HwkPWm5ZaZVJbq2YzL+39H59glMLVCzQC2yAByv4jzYcEyZAnnqN8IRDjD9hgcQ5tUaRAMWlYjBH6sqzC3y3jZRGLa9XETUeqtBPj9kJa/X6B+oFSrUnsHgLgo+ssFuqoWFAspa8Q+w5zj5Sv81FL4dR1RwAKwSyem8Zlwm2zEfChp4K0UBPeBzKIJkciSiE9YSKQlXtmGx7lMGVgAUecIjo8QCpCCnYdj7s8wZjEAB6ACOGztfhSyFdFoPFaZ33Z4mSXEilaMgLeGO6hfrRqhFoaSooGQMVM7CEYv2rA91phrF60qN9pIVtFu8v8ApNM1bAOeM+4jam2Nt11LDq71AUvi/vDMb+sOkN6i5vziLe9SnPEKkW99XvwaVHesRzfdQIjOC628BfXUvjLYEz1Y/oEKs5MCGksg3qpYENR2/QYE4g8iG4raUd1kPBR9TDC1bpkpc5L8UO5g8x2K1dtsGWCULeTAaqhYtwPq/Z8YJYYUSFoUp851aWYM4wSgNd9Cy8LGEKWOReGv/g5SYxX8CIk/HABQ0afaIVVQfWXhNuH+NeZap9NRiLnF4llf+mfqVOEan8u4tV7D4n4iDhTGBMso6aoH5yqbcxGXXOuwzCnkalC+8h4gKAwAGIIhCrBZ5KH2hqjRcBQfBKDRYuyp+HMPPFoClU47tXdysEQ/WVDJVDMiUomQlyMIT4Zt3FlyaGCRZkwhkMJ02DQFg783p0+IvKaS22yu3bt6RyyCKmCWEjQYWK/KH3Eo5zMl1x+IFwVkcZw9yrLxe4CGi/tKc736gU5uaPnXETLTbzLXHEOHmabPaj/E45csbPhBsX6QmNMByMxHhQ9PymDeZiHZNr/9lYvuBGGBgAaA8Rn547CIPLUzVBVcE/IzUFDEdiVTC9qUPQBG4QNdS3hANDYbqGrZj0gU+sD8sx/62CKfGiBzqDVCWFOIqfJfwiLlQp6w/pA7gQR9NBP3EHZOdZeb3/8AOP1KcjXE7fOrzn2l0s/l7+54YGbU3trlTdKgaiu8I+5yuAuKspSVNmWx6hQHdfqls8lzCDXT739n+cTDxdmFaMgpupi6sgyCgwKJcQaHeQAGhMCDwQXUdf8ABNLvCcmmAY/+ANvEcl/VJaee4hGI/SXGspMStjdhFL0EF8xa1v5RDnxHB8zeMnzFXvB/fqGdt/eOMHOtw8XcXOJd7+JivEDecEMqkL1Yn3GMAftNw2WZ8916nGPiM9+W2R9Dcp/8+URxmHgMe4rMc/uOCiQdI4R8JECNwseFhRGFHamoIa4hPQ0eKuCIIQlGmwhyWRsC7E3H6V++KznVpwXErWrsu2V82N8ykx/ZQeEYtdX1UD7SZrgAHX+FCo6amI7V+ILRhE7uH8JTSZb6CDmXIfyV8So/8G37jY43KgWr11SfUTJadJ0EHKje8nFxdxLzVQHPJ6Hiw5jwoaq/kiLl08jEElbaj2v+koJDZGw6wr6VMW0UpswVog5c1GAjvwF/S0QViyr2crVRbBpsFznqJoxykPtT7RGt/bjV4/Phf9wIkzzsvtv0Vi1LbrVTNsQcAJ8OIXKHUIsWoNCl6acmTiJQJtLirZ+GZuj8RqnTiY2NQMfiUooeoCZgO7hhTVxb1mM+9V/cMUdVC5u61Dvf2IKreJYIHmbX5xEGDJGivY6vH/CPDbF4B/8AhjFruhB8RUxcii8cp5DG75NbwxONjBFA9guP7jKziBHl2vAZXiUSYEotX1hYfOVBMUdTwWACliC2B3jJZKIz/dlxCs07GFuu5gts9QBpEsu/rg3Yub5spGAM2XMV65aHwP5jo8gOUbtYKxx4gZC2BaIRoycQRx6sUvCzWF2YEPHeIjUI4CRQulMKq6jK1QqLk4JBvXJFo0phewYd4gmnNWYuSNALDhEUSKnUZ2WbrFaKVYa2OUhmj2Fpf3NCIDfeJ9hgwdShykfmE3dxwGK75yg1sYaEzgUnR5be+d3VVXXkPUiG1VbCGoBCawhpEgPA0HCPCcJwwgqwpwudlnkKEOaaBr4ZB6K+5gEDbAt+EDJftThmXdhE2X1HkQCfuEyZFhPDhgp0Nazfiojp5+Yl0OHzMY/JNa+d/wBqW7q/mKA4Zf7/ANilURrP2lBU+0ArGDughJAQdAo/EoivcGsYmdEcYzW4m7wQHsAfItn0INpa/wB20PS4vQOToP3MZGpgm4sZN2y7uLCzlGmKAo7VVsWEW0XQn077IzqDd1/h3K8bfzTDwQHVkUPPeD6Cr5wzSDUa612pWzIOY49tcFsgDjxIYvIlDqJZm7kfTKOCpRap+EeqK0OUA2FQriZUhJplq8wbBp5GFZgcNYgkHuAlWzih0WviFCRWiZViFy214mFGszQ+CYLkupnkKr0Xqm55VUXdzICzUjOw4XQwwZ7leLUsa1eIBcDVqFAC75KmA7kH+0JW6gQJaUQdqWKSKBLUiIhhHEXw0C3m81XhDgAlzF0qNchR+W46ym7Q95T7RVWOJU+S64xHQkoQRTlltKyOrSWV8vWG7VM9HT4uYogqj8iWza8gqw4LGXc8BfWquYQBSwuZ7ynyEAfth8YifCmK4IFb2/VILMKCcZJRCU90KXt8Sj5i+hjGx7lZ52+f8PKJx8TFFX9ZkYRGhg3XUbNlb8XFeOF/5f5i/wDk96ZWLYXfYyoBUr5Cn3JzXVwlfhKoqYM77gOGolUw1AjMpHXK0ahX7SvXLxVzVHfaEpV/NQj9Upa3Vh8Zn9ijTotFiEgt0ABiFxrTPiujDpuFf487x/gg2xeZT5rGeIpANFSMWqEwrh+pWpaMi3NAOWYFa6EGyHpw9kN8ywEFZumzaLRqIqrJttEwU9gsMktdcFANVlCHlkDVyhCAQLvBfW1UCALRiuMBmmaxolLq/MyiuhmSunmt4g4fQnImKUOO74lsMMjdlZpDjnpKgHyUpYdGmNgpYTIxgwta1g9ABnmMAYulUgLVGt4c43O66ASQcKUoWHQOr7gpUzTG8JC1NNHq1klvkSUEq/3BNIgOTGlGZbRlwn3ZoAgvMfOgWBFsWhjAAGAKF1DrLakom3EBx1xSqFIogGtay8uRXDyLqcgbacS/WSsYF4WTU3VsNCtVZVACAaJEw8MxXGi7+cB7GFpFpWLZvRVSydy2VbDS+Vo+sjbWuDvrPoz1tBWZAPKr8JBwOLoA58rysUeYgSlvMZlY5tjhSiq7H8asoVYvWH+7hrJDIWdSzBozuWYHekNxophzfvxEHOJQ4r/YOteprWtR7tTl7f5jMBx94clEFA76mE+8xIXLlVg5iK19pQsVCu3ZsuULOgjbSKEBtLgDK3hrvGkbrJchRuaQrNyIWHLCbYjFWSMEKt8iAIqOG6DN1oUe5carAe2I0AYAacTLmc1MdfVkWUitygs/ShN100uDmU3D/WQQAw2hmBm/lIMisrBOUwwiRKGKWmiLOGPUyOimGBZu0MxqiNr0D1zAp5GgQ58xYu3KFunNPjHmJlM1aD5cZPLg118Wil9tRP2PtGoB2C3whNkepp+8D1AdTGoeCWMXBkXUWfeFXCWkoiWAwHTFx41mOBg0pCF1ysJiERwUidAcIDFEW0LWQhZRaDUEwzkrt9fmDYA6MK0C7WWNglMqSquM9qy3VyDR6epiQ9COmAGorhAZWagpu8X6p0qfRbKhQ7iD0/Erlf0yteYNKuHSeZVuM84mItcU/wCZhgVfsN/7rTEdOMVKNrft/wC/iczxGLuaGi6h1dnOrAfu4QDhcdcsVC0JiWmZdax3HtCIkO1oy4lfPpMHB1TIaKS52mTV8mBQBgyx0JNxlVK7sLdKVGrwhobNEApS8W4mniNhjJHOhLAWaIFGAGQAMxpuigLO1rb7lutH/wAxoRZng7YTnfSoDlOhUrxYM4tVBr3Bmpb5VxoS/wDI5gt+AaF63LTQOdULle2oLKGjlfPZPoBSiCyVyxKpgmvWJrAJMoAChbm9DsY8OssOoKFmThlQz8MYSoV3qYYlpsU4C1vgjdNUEz2C2fJLtqwWPK0oOBYJnzAwSusPwyxpWao+hP3FIBxVtetwWE2AsZlIA5ZQ56wWluUoTgHRBH3l8HDFlB2eriLQdEQDlrcKuNNRIvniFRGz3OSuoRcNpORwnyQGFVq5uVnhEqAMqnXZ/VKcFxUS8Du+44cjUuws3n+73ucS31zjx+5bl/viUzT94lOGQZWl3FdIAeYAKK9RJFEWkIGMPuGB1FEYZ6M8/g66ABQ2rCQEBgrAWFuDRRKlVQQPJCBcwERVNfMwmIxYQpt/4HMIC2F1jgOKgwAbK4eqi/SHYYjHBooaa67gOmhVoOEXCJLpJz66EthgsXXDVvJJgMIWc3lf4gAHoWb3c7MMEx1t1fQojJQjwKhA2KDMGBSUK3cLWSUJjwOZfsipgAtOS2N0vBzVcRKwAv0K/QIthrdC3kd1rUo9pFxnAGrrbzKM69Q62u5UBN5LftKhnmhhtU1AgiFcg+Hj4iZESjs1RTl/qAZfkWl+iPpr5jnmodI/MdtvOJUAv5lv0jVV3LGbhm6cY3j3V/MCw0MRFZAQ6jjIpXX63l6Zd2P94zFeLpcWdv8AOGaf9ivH07g+yNoqL94/cxuDjqgJsV/VGCO2NBm04iyD1FTFkrowUVUZNtTicINhxjB8zcncU667frEoTp31N/Eq6FmO/AQiPe/tmaO80JvjX9om9qDk+QeGmF2FoA8DHyw+pBlY35MRJ9QZiXYUwNbt1EAGBuvJg+BiF0ULZwXf6CxtOuKsfVgPgig9gJ+wkI8YAX9SCODww80fYJbZjBMeLT4V7j4BzeTzZQ+XqEz9AQXQyk4okJ2IPg+GVOOKCOxoqzMVN1WTcgrVf/YU5mgxTzBty3X58j8SDKnAAspcWjU68CA1GOhOIriANIOZdqKbNPiZmOSxWADMUk/SMVBDAv8AYlYYtAqRFtVTtmwLfYDFQDiLPyFRkiLvRGql4jDOqlGe3ccsfWAOK9aLDFa9Bq59I2rJMnBjPiWVvIX6/wDc7mw8rqBaUat3f9cvPjjH2n25gpYJZCtoC8foxGIupT1MaWJhmFvmLjAZXBECuWj6Ic+XUv6BS6D27YxcK6WVCm5ZmMOYaAHVxlm7ZQJZaYVn3ggTvR5s6Gyo0/SgC3zYvzA12ayp10IxBIK8livAm1x7hOJWmFO1eWO77TvenHzGbRu24VRA3K3Ubu6hkTkpV+ZVeKArxATBSk9yNO4E0C2QdFo6Jh8Q0cKqywtwifTiUHLVukHfL4WtIBuoSzwQOgFeCw2ofFhheLoPmPoa6jEQ5HMJKhVKp9IJJmYgU28HyRocaEDgXB83F4DbZkO6R8k8ROIOk+0D9okDatSkEK5YuGeWWN4sMfylSUpbYcqz8bgbBRLWto3uVTA62ly8m9QBaI9vxBWFdrC8RxYvqpXhIBXD4hXBODacou641nFPUq20dv7/APJgxdZr+95wzEUH/HB+yUvb4z/c4jl3cEGnjmC3nv6RbsXgurw/bDSco1GqmPOVlirzBI6Au/BMhAheKZV+kdRO2uV7dv8AyMCoLcsed3cZkyiweImyjfcTd9v/ACImrde5uMQ8vABzmG2NJWeBzxQB6jiXgN74fSIhpkOOv0EVkoa3FH1F9uIyNQRG1ysVi2pQLvcxAcx8RQPvH0CLT9YJVRvdhjzcW5Thyhj8QlFLfKV7kM9XE2oL2DS+yoiivBlOE6ftcUE6carp+I6T5nbBhGLicaiU4lQciMiPmISZRkvkNPqFx7QGD2C/HBmod/VGSLud0H7GKH4E+hF1k2LS7JULDaAAesCvhliMKovPb+1hRgHQoYbFbURU+hVHK/uXtey6e/EF2MweA5p19ZTVnoaQ8kvblIjWdQBFY4BAPo2Ro2cc/wAwfAX/AJ3nnEuHVe/g783NK846/r5xPiGVgf8AkVGKs4wbfv8AZOhg4mAgXEgyLzEu2I3hj2lNX5MT5D2RQifaFC7ioG8l7mxrwtvMGE+ZTkSC0XcvkLC5CllqajYulO3jHljghaSvQlD6fMTAApSgwHR6IM5l4QHPzuKulfkOnwQ2wcVLDymaWbYULeczGGUhYGSEiotZmHFwLwYmcpsHItxMlMHYxrd5vQfFhK1ayD5HZBlbGRcAWkMb93KiRBlA6DB6HHcolWFsdAwkEbTKB6VmGWwMTU6i8KmsMrpNRaSLkDgzv0+DV58fDDXbu5RaOTRtuKqirrIMXh9jGvA21v0CWri1quDteDuVSU6CVPyPmEKy8tZay3KDA4cOXdvuYowZcLg1W0qnYWuPpEN4p5gjLBswQuVze/pYBYMZQHZ/yA9vj+9waay7rL8fvmIG15+dfnA+YUuNXERso8Sw3M49ksQpu+b2P0qVpWoqor3HdDCOdV6gOitpaVfmURQlg/BgftBKCLoP7KX8XHGAwuu9U/QiY2dQvOFfxAdpougrBONi+gYEVWW4fUEOIW7T8DX1ZpFU5mLateMlxcGDFy30y/KsaTUC3xX7iLDhhV5x+AqJt31UXPmDBd1geOZQSmqYgFxTbKhSDcVgoFZL3CBUXlS/oQb1HxWdPwR1NoF0D7ZueeI1ESFizivXmLUclBn2zXqlcnMbVCoRuVdvkCvtBJsumdmg+k+Ja0qmzP8AyVOF1MWx3nErlECw8Q4aiw8XtLebwODnzzNgB2p2pyrtmdZsxdZ/iL2z0R+RFRUWL43ltF1HKPoYW3qHkGA9wbQ6f+AH5uWKCDC359wSc7Vd7gMsa5xHKq1iFluAt/ce+kYXhV8WF9Qat5f7qVisr1/c8wpgwac/X97jBVSP98h3Nc5uiUxXqEUKHA5XAfeCZwNfgP1LsWVmF6RDpaOjyQttPEl5SyhTOModBjoDogQ5MKFIPcu7ZVq4rSW0BQbpWooXBl2AA82QUjsrDOE/2WZXVi6gqRA00X1/2XDtKqPQQQW3ecxQyP52stTh2AY+IRUUogaxt5bosmRXCUYnhVT5ljRrIk/eMuUPUaitrWn6RjKvNPJARahsUWEqhSgSqiNJglIYjYVBQW8zWrBEWYD57xM+tfLxCeBA4DAEVMGkZdz4P4SpmOGQ9Aff3LBpsq+MQJzcomjgmmnqUZ27H6MbTCgeTGy84eImIFjyrgpj70FJukE/4/EbhTyfgsqVKngyoqEhijnUafiPRXuVrS9rDFMRgav6k00QGnonuOizgDshoNGADtq80semHOJqw7+WGEJJpCn3USATt4smx0OfMuE3yt/MGFRFitYi3W8erQnzqMrcUYpMJ+biue7Pff3jsSub1GmroKFrH8+YZcHFQ6+uNy+yywns/YqNdjcMxmgUemsRcWDVmFbgUMXtj18m2AVJmQbgtwM3eSGgerqqBXjMBdknMoFzvC5gKs4UzwBvBi1fpiI6HWqrXyf8iGdqwcJA0bAZWZahrvr5YB0zhFjsbHWTuNRhSr2MlsupjZROqHIxzWILRoVACgJfUarIxUNmyjzFMuR8DX98krQWKPwoloQLxw+GONDCE5PcBVmwLR02S4FHFShy+Iwg1EozQkAAFKgMq9S+0MuD68PvCrkG/QKmUWzbKzV0GQ+sa1CV/l+kReqR74fY5IKb29GSCZd0anKVfUZc5JmrFtRWgcNA6ouEYzXOADr6Ee05ReFX9VX9I8xUgCO4Tsf3KjOO5SJwjaH6aRZetzANolr55Z1Bn6xIByOrgj8SrToDLCnTUfZovSF4twGuLvmA7dJLc5o6JyFXhgjDrB5jpLwc5jLtUfiMOsqduBr5eCZGBu91X/kFQrFfb10ud4g2xvxx5l7vhzU8kOrRA/IZhb+Yq3JfzuY+SLkXrQoLxVTwTPGiITXTdyDRtg1G/AwRfZQmK2Yi1bRE8G7NysDR/Ll4ajCRgew5BxKGGnbNbx8QCVxqiZxfGt6lqlo8Danyv2jd7LRoPMsYrd258TkdoHFe4/N2NGhhbxQZtOnklBu4cbs8RKpKmMYnMNY1HFN18S3bJnMfS5jCnVFqviWVzfxLwI5DLmO1S4zo+CPSLeJDq8voggeFLb+FuZvugobfUhACg4aih9rzDwGOnVRHVLJ/CeY4FrhzLXKuSbrqKqnE1xCOdWq6Z9AQxwqOQOT6OPtEYMKIAPAZ6mRjh2rlrRfXBUewCxcZElLrE/8AY2v8hiiojkPwLHtjaLV/MVS6l+pcFM6xHqtEsArHMxnKVFYruFWggu79ozVLeSvj971BRT6P7k8RRduOK/nnEDJrq3EFnXT+o8AlEKo1eaVFgMkSHtxL36VPBVi6qFtDJCuoxyVa5qXN9NwQBQvIuWwFGckylLcfWueI2FUE9JGZFpRu+HGCWZ5oVVBox4IyUFsbL6n8RxW+LReSrWtwV2Aq1/uKQVVkH0dS7rk3jqMIOSxfcgjuHqJyQGQWDUpMaOSEIuxWz8sv5ldwBbI7umIGFNUnzkiu2PNf1KvT5P0Euds1g+r+IhJYUCOLzh9pYFQ06gFBzQFHA2/BAuQqFwruCLHTMKLvzGuMoka2QpMvh4TxEd+mkbH3w+Jcst4Wfps+kcOvS5bMS5ZhLo5WGYaaqHAVMUbf8mHMchi8trBWcfZ8n+S1iMUL8IIi7rQfRtjLgiBb5QAeZnsdL+B3zLBZfjq42wyX4lBdVccbCehTzLuIVECrtQvA3d7i4tZS7/vca0wvHiJkDnJ6/JvM4zuAZzafMN6yV7X+oAQpnYBqN3teXofbOoWVwOqwNLosNCqrEBV3J7CmmDQNalwwbqVGPYNAXwW7qU8XeYoswbGYA7duIPAA6A1hN3R1i5bzdgCh1e2/LE3paWvr3iHvPHryQrX2fPwJkS3G1q7JenY4qYDKcdsNRSWvGb/BFBaqqKc6yeI1utlKy+EBGv3F/ZnUSANrq5U4SctPRq/NXM4strZ3FwLtIHyxlg7QD5Rgnuj3OaO1oOA0B0FSn00EtAcQt4U3KO0aeJpJmm1jnlUcWmwx8YjF9G5kRH8eIrQTwYPoVBWwyXDy1MulEEst6MRGqSIUtvW49Mg+IbgK1FAuTjEFA1jUE02dRd3k6iIJSyuYkac/7MTr7fI/gj8QtKsK8bV3jcMln9/jAN4KP74WobDuEtTB5v8AcDtB62gIJaMizlEm0bKsOdYzGLiALBR5c2v0POIcPFHovSlbro3LNtNcQFIRSzfb18yh/BLakYsODsBm7AorTVIXb9oC3LZK7yWGoXOrBbv6pgKwRTZofwkALkyY3spLMia/9oMgWlt8VcbmC3YNeiVelQ6KRpZaIZOZmAJ8Ru1YdLhKrsjX6g1VDOl/aHaXBRhPLH2nMUTILxgPgjIdyViHirgox3KWGNSvfEEW98TlBklyrC8xPAagG6MbTLBjBrMYorTEsLt4jZIDhxHRrCvmFZrZMI0eGNhln4iI6RrEvm2V4oP6jkNrqUI5loHCTIpzKXjfOYqxbSglDSlMZW37DEMtDeK/vxNCOnCV8/hwxW+VuK9S6aCtL8iFwpdTzKulpouHkxaqU5zfEqAQBTZs0Fs8V+Jc7cNWjQtbFRhoEtxM8pwyoJVBost+MswZmXJM2yVdVxKxByuktJk/aEwzgtxzHIKHNjx8QSRQ7Mfncb7F2SWADzi9fME5N1TL8eZeGFwZ2fgtYwWm2XjnzDYq07C68XC1BqmV9TQ+owbvyTC8FtpK3xiFsSigrjW4zL3lmBfPiKTDh9U0BbLr/ZQo+Y7hxaOHZDABIwaEKH0GWQs4gFOlpcxlkLxuIeRnERa70Qn2BXMuj8S2zUuSXCmh3KJDrcH1azkn7gliev8ApLWM4Q/cdGcV/wBosiDuj+JYFx4bIF2/C/qWBXzdf8JZXUr4OJ51SQE9b/hAWYWLFX5hdqocA/LEjq7aP3A0LmT+MMA5tSP4Yt5ojpPOnPEtxkvk80Aph6lAs4Lrx+42HZKO7rR5MQ8yl3l8AHF6unxHNMhBQD9w5jP1/ErgAd2MwwTwNlB3fcC03CW/tOYUDqgqind9TjuJitHJF5otxqLtxBHYQytNM9XzNjxSEIVQdFzZLBhq7jLkBzWI2VpuIjSjq/Pry1VRhYBdguMdVEVphm44FXmhrF9n5o2vQ0ANFrxuW4tripayL0QGDWoa81QUzveGGvl1t4QbVA2BdeYQmQbpkIAOlT35LbSrb40BgKxhY6wgHBKVZS3lzAmZtyRVVSKDT8wE6Y4N5qyHrqY35C/kq24XpW5eQFh9kUSlRtVxmsyoxgAlVEVmcLLql2t6xuZyjqv9JifSl+Y8Dt6H7RN9E4vjgllZaKwZiJJISqlrwM4jjSuBj5a3MsKIzvAtwqBUWknFXceLkkCnN5xUAyaSivZXjzKarVctAG1eKmovTtXfqBCr1zFatBLisY2KywMLNGA/z8+tgCrTeq/wnR+4gtmYNrp4PP8A7L1RqKEcDmu13o4mo2uAv/gdvP3iwpIYH0HlhCMwsjadr7Gv0lqpuv4OvGvbAIoBhe89rl/EwELcX58QouW8hlu/+ygCKa2qfSyWFN03Zi3w8cTOg6yOvr/VEI1jBn9+FqVRq4mbbNcMWDDBqvxDCFfSf5OivQgRHTSoivA4sQ4T+/20OIVdAVzhd/MJusM2v7inITq7/cCKV/vMygE7bX5qWlCpWRD2BBrpg1ct4FE5K9MtZo8svkhtLW1fdOfowghDQp9DsOr+Zz6Qh9ZvCviWioa+gKzd83yEGM66CeOSEd1HgmWQLWaa1jpq+4oBiJLe0bfqWHrsjgzXjbCIOQdiJbq/MFwKgBv5Wt4hWAtW4zrGP0lHtGktNW/o+4BiAhYp9uPMXv0oi64b0eYXaF3RfeV46jqDjkY6v3KQDAtKdliQ/bsYDLQFbZtiQYnxdMVoJLbJVy33cRygtrRi/wCcywyt84u799QDoWUvygfqBjA0Mb+kVuJlFv8A2IN0V49/aAlCcaIhR0ZCKKCreB/XLL5HBmK1i2Vo54P3Fw4GqH+S3Y+hmvjMO3qvITCr8EbxYP76YiMKjGX/ADjzHV1Nuc9+sleoDw3bx0sLs4LLiAhoQPjg83iU5q3GefQdkywOuDl8eMam8ne4U4XHL/bm1Uvv/fPqKKIQz5P7iUQW/wA/jfiLpZq/Y5+udQbgK5N/bficAcYA3fxsvRL9FQuqDJ/svKFuzWTk3sz4hIGJYXpyfGczKubLrA9t1+4Xbc7HSHDjGvmIrbezfqvoxAVLNtKv4c7ziFOLCtcvZvLnfEQdOD545x5mimcnodmuF55mCwGwJpx1l1EM6oWXk4vw8EoNUiq7V3t31x+UAoHyExsxzz1NCiq6zS+mu5QyAZsowFu3XcutvA/jMZdqzdu2suddE43ibu6v5zf2iCaatrku/rf2hV3oGgrV8GOeYJgpKKPtjXygpOtao4vjSVC0X/b1jqDS8g1bsu95y9RVhuMHZ43tgqrN4rmumd+YGUK/Y65+sxYdv3/yvvMOB7c+XquIFa5GXvy9MFLe6/37x/uP5gt4/j/Zx/eJTLV8nUsfj+7yYmsf3/kuv78xXNYP7/Nx0lWuP7/Y83l6e/7mDyfjmNi7f79wrpPP9zMV38fbuDZ5ND6D7QtHo4Z8esYg4E5yJi39ai0CXWPLz7wRtyIccfXrEcjw78fhangzj7S3XNfc68Q4LjHH/ktGq2/TxApAxRheL2eDzMjkzi+X+azBXaA0HL/GLngrKa9jxkhwun48+otI0xbp4fW8SyqaLfi9/nBMZFa6bb3TtxKaVWWXXFVk7cNywpeLo08Y89sNVzaN7Oz1VLFbK5FY5H/me5YV6dCeeq4glm2NvJ04+hFtY23i/wAP6g8POTKLsfOfiKgVhMFbL4ffc34rB47PXmZqtUVk1orWPKeAVTn9w2sJWXrr48TgcH8r93Bkbcnyp+c3AomNPV8fMtKPAc14PHbBIDgcfb/URYuPfxvwqVpYGrbzXl8dR2Ngzbs3l78RupUN3bv83MBdFXOixrcXFBx814lmnhrnx6l6t5w9v+R3a5XfmLNeq/7D/HPPuNMfNwzhr+/cwqHGMY/mUuDPiAQ/Ut/ZBML9f3xH6qnhu6+0s21/cSs4iUAXf9n7wAuOn9v6ZQCw167fODPmOl0Ub4D/AHGZdl1NDrr/ALGzRwMvrR5MSkcue79dmoKUF3f3P1ibqs3pgNW4r7pyvNp+eYZH6nd69wy9+Gcd+9xEUBXkTTz2xG1zrbyce2C8L0WXZ+3MwQeark63l/EAA2R/9HveYJga1yxyf9lCjVPoHZrXbFR6aetY1jaDgiA3Zr/jEFDBfOjPOdY1EtpWl0o4zv7QzeFmXFU9mNxEbZdgF+THSAoPOHl9ee2AWjbqs0ODOytwSFFsFUWfhXco63K9+HHEBx9gumuHGsYiWXJjYcPn9SkBMOs5peHPPEareAoXWF4c7Y0NtH4dn/YOa0NF/ZrN9y3QZGNHj15irqq8fqEhl21lzxuFAMld43y9nUFY3zt15c/SPVpkvNeXPME6EKv9s8zJQVTvdePNy93oy+dFwDF3TX/PXmLlbriLS2t/32jfGP78Qw38U/2p+f7f1ju+ZsU3Dvf9r3MmKlG93/z75nOvnv8AyOsP7+I4Uf4/cKGssaDIE2cDWvOdQeRa5rL0H7IcPDrlM48FGIqZ6zft2fbEDRnn6g2/bUwCII44+TpxMisFscUeelgLyqsN+O+nG5dq1l3L4dZ8kRujNmzr+JWq6x66jFrKr29eCCThbdMU8nrzAR4cExT16lmyr+Kf8zlilnls0Hk6IlXS3R153gzC0PJm3KcO8GZQlt0+Rw/4S6FrAqOrcvkvErDxzW/eN9ETapdYffH1S8Bi7td/G9zLBTjwXje3mZAmKwnZvBvHbGm+G6xinxjXbCrDd8g69eL3Fz4OXzvJnUb7FsjgHO4gimW9GTt85wRBzYr9RnLjfUEsuut5x043Cg56L88PmULscGP9b8wQoFrAfppf3jwxWt6/nMC6PQ1t/DzALaAOM19PUOVmj/1DRDho5X941nET3Ts+746luGzHPHGffELZzTvi/mIFChVbxf8AsDz/AOf7ELfGPUX+6vrxPLx9iatWJear+/ycDfjP9qBZ4uOfrz+5dBTRWv8Af/iNNa59dSl2+/8Av0iA18v+/wCxlo5dv3GrFZ1ffnqrwzenG84+Xpzicjii/g7843LZL7N8Br5a2ThcDk+MD8cyquzjDeben6OSNo34WzdYz2Yj9Rkpv6PJiNKMPIwopzs/uZkM7Pxf7xAHKu74SIk38vswKNl3yz8/eaVLpwTZ378QTKtOTZ5xvOpgaGQZeTz5ipVZMXrPHlzKFWytlcePLKsodGPD15gKZQu6M7Mebo9QF6Rejvxj6wKEq654PH4WzI90caTs8Y3CkQbK0cDxniBQCwiFcDj7bgmq2KXzWzwE1QDyG889GJSaNVlKq6346hYF45dYeF8eIrYospbdOPlfUsOLiqNvn34hlXBu/pmLBciWBu4QUKFz58Gd9waoFDjt4wZ3ncENk5O2LFrfHV1X8YCFguynDrHojQOLHI78a0TCAKNaq3zjUW7MrgvH8QF9t3658dTHdXn15YoMYrN9eXxF8AfT37j8K+0cGC+ZWk4hx4JnWH9/2aDr8epoTVEb/wAqU74Ov7UvNvH9+po+1wMa/u4dMY+0fLVnz/2UJek+3AdmoW52rN9cHki8l983X5LILrJjXN+fJiIiXngrPt8m8QKa8WeHKXu87iKOuA+/zvER6L+P+OGW1XGn3OMY8wbpvbl/5MKVeNdzLBnpOe6zBeMZyOut+YChozhbz1/2GjUy+j/VKLKDStj4x94plCrdHD4xzywQtaXmvyf7KKOU4OfX7YNYOjXD6+JZYO6IVVIbJlWpvBVZOvAQsjeXB7x4qsx6bhZa4p/UMrNs/o+swtwN7/bwEBdltbqk7fVzYM3bfIzlx9CWgoawLX2b6hVUrhu7dnOS2JLeTnLbvNvELm8TdVfp5al6CqrVY8nmJyCinHH0b7hq2TAP2x9kI6wwxefxmI2LWgezpndwq2pxXde2/MpdA4Vz8l13LINZxwD/AMdyiiymRRvruncb7H2eHNfz7gGsPF9v01KthrwXvv1E8E5z3/kV53bcAlgn9sj4rvH5j2OXMKHx/nJ9IDo1/nMFuPZ/sqmj7fmFa4/tQB5zzKaemUGH4rn15zLHGt/Pj6yxhl2Grd37K1HGW0cVi6vPhwQXD3dPYc+HxFQn7dbs6XMpg4cXWt10tMQK05Pth7mBeeS/bx4dx2nLfFvnydysW2uTzzSfuHAKmUc9RTRh+4UDenD/AHETQZzj3/kGtdL9/wDItpapw1z/AITOpTjPky36mxVqx5D8BDiDnerP4i1Q3VF8+PBuKKChyNc9PRNaVTT1xv1lirBY7b+50QRobNmr6d6ma0r2aHPipaUzN80/yKbocqWedNGvEwoVTArp8+JXtwbacj+mNShlXNKXxj+EK8KFtHk58GMnY6eETb5zZGsDNcvN7vH0jaqpLC26u4TRUWpcuXOeY+2wEK5c/MvtFBo3XnzK0Vo647PLEQWpjig+NxItjoPByNQlrbXPHXuAh5KzeRx7jgtKqucHTDZnKslz7ZlPiuXk3RtxBFAA3Rk8fM4fl4P3EN+Mvj1FXTYrn14l+aXmviW55+JfBLVxz6g1oyPXLFNDNuK5c6lyVm3jl/mGNub0Xt/2CS8Nuznf/JkLXenuoBzduCt+fDiY9O/7w4IFHi271XXhxuNjV+APjh84hefgj+H6bmbV5dnb0/XcbVcOc3y+fWczl9M9+frhiVbpNuzu+zO5wGLSs5o59kdVZKNV9cdm8RRW3qCsajlm3P0l1a4ozr6zfKzZ/wCQlbOMXi/DCxptMf8AYZbw6/7jxBnK1u80MorW8ZM3q9yuAh35871CLpsSurPmFAVgxaNmcam+iZ/mILpFd4rLd8+MRQwawGXZ+oOLFKf+tmItm8uCim7u+IMBKjS1kjClYvDw+HEKwEu2bLefGIIIrmqbHtzqOS90oTetrlVoVZxWGc/EHTLkxQ843BWVamDee7ojU24OV48YfSKpoRTymsviUFbGfX1faFYdmhMfVn1MqqCGAlV0zuYFDNWjWT9orE2wpfJnODfUvymWt4+G+peoTgW2jOHFXAFLZlS+Hp98S7WIxjGvD3EqGTg9ZN51NCYfJtz5IFFZRS/NYdwxVOsldHD6alAiK3nXFmHmC8Len2yecTFh045O/eIYbciY+36SzQb+mv3iFFHF5ea68MfPpddYfOJQKtcgn6fpuKWvC8dY/OY2FLoKN5enxiIZZMJ9s+CWEzp581vs3GUNbM5q8X5Lipqxr3RpXsblu23WDr9xuNbMKXjg/wAZZdNXmjp6+uo2uDZftxX+Qt2HfF+unM//2Q==', 0)
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[LichSuKho] ON 

INSERT [dbo].[LichSuKho] ([IDLichSuKho], [ThoiGian], [SoLuong], [IDUser], [IDHangHoa], [IsXuat]) VALUES (6, CAST(N'2018-02-09 17:11:13.820' AS DateTime), 100, 1, 1, 0)
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
/****** Object:  Index [UQ__User__536C85E44DF59FEA]    Script Date: 2/10/2018 1:35:18 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E44DF59FEA] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User__536C85E4BF588BD7]    Script Date: 2/10/2018 1:35:18 AM ******/
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
