USE [master]
GO
/****** Object:  Database [IEASalesTrackingDb]    Script Date: 14.10.2023 15:20:51 ******/
CREATE DATABASE [IEASalesTrackingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IEATestDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IEATestDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IEATestDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IEATestDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IEASalesTrackingDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IEASalesTrackingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IEASalesTrackingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IEASalesTrackingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IEASalesTrackingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IEASalesTrackingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IEASalesTrackingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET RECOVERY FULL 
GO
ALTER DATABASE [IEASalesTrackingDb] SET  MULTI_USER 
GO
ALTER DATABASE [IEASalesTrackingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IEASalesTrackingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IEASalesTrackingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IEASalesTrackingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IEASalesTrackingDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IEASalesTrackingDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IEASalesTrackingDb', N'ON'
GO
ALTER DATABASE [IEASalesTrackingDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [IEASalesTrackingDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IEASalesTrackingDb]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [text] NOT NULL,
	[PhoneCode] [varchar](50) NOT NULL,
	[Cordinat] [text] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Countries_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Countries_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Countries_Phone] UNIQUE NONCLUSTERED 
(
	[PhoneCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowCountries]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwShowCountries]
as
select Code,Name,Description,PhoneCode,Cordinat from Countries
GO
/****** Object:  Table [dbo].[AddressTypes]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressTypes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [text] NULL,
	[PostalCode] [varchar](50) NOT NULL,
	[CountyId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [text] NULL,
	[Cordinat] [text] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressTypeId] [smallint] NOT NULL,
	[Address] [text] NOT NULL,
	[Description] [varchar](500) NULL,
	[PostalCode] [varchar](50) NULL,
	[ContactNumber] [varchar](50) NULL,
	[ContactPerson] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Address] [text] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [text] NULL,
	[PostalCode] [smallint] NOT NULL,
	[Cordinat] [text] NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[IsMarried] [bit] NOT NULL,
	[Gender] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CustomerAddressId] [int] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[TotalVATAmount] [money] NOT NULL,
	[AmountIncludingVAT] [money] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [text] NULL,
	[Image] [varchar](350) NULL,
	[UnitWeight] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [smallint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Cities]
GO
ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Countries] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Countries]
GO
ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Districts]
GO
ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Regions]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Regions]
GO
ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_AddressTypes] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[AddressTypes] ([Id])
GO
ALTER TABLE [dbo].[CustomerAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_AddressTypes]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CustomerAddresses] FOREIGN KEY([CustomerAddressId])
REFERENCES [dbo].[CustomerAddresses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CustomerAddresses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[spCreateCountry]    Script Date: 14.10.2023 15:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateCountry]
    @Code varchar(10),
    @Name varchar(150),
    @Description text,
    @PhoneCode varchar(50),
    @Cordinat text
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IsExistCode varchar(10);
    DECLARE @IsExistName varchar(150);
    DECLARE @IsExistPhoneCode varchar(50);
    DECLARE @ErrorMsg varchar(1000);

    SELECT @IsExistCode = Code FROM Countries WHERE Code = @Code;
    SELECT @IsExistName = Name FROM Countries WHERE Name = @Name;
    SELECT @IsExistPhoneCode = PhoneCode FROM Countries WHERE PhoneCode = @PhoneCode;

    IF @Code = @IsExistCode
    BEGIN
        BEGIN TRY
            SET @ErrorMsg = 'Böyle bir ülke kodu var.' + ERROR_MESSAGE();
            RAISERROR(@ErrorMsg, 16, 1);
            RETURN;
        END TRY
        BEGIN CATCH
            -- Hata yakalandığında CATCH bloğunu kullanarak hata mesajını yakalayın ve yazdırın.
            SET @ErrorMsg = 'Hata: Böyle bir ülke kodu var.' + ERROR_MESSAGE();
            RAISERROR(@ErrorMsg, 16, 1);
            RETURN;
        END CATCH
    END
	IF @Name = @IsExistName
	BEGIN
		BEGIN TRY
			SET @ErrorMsg = 'Böyle bir ülke adı var.' + ERROR_MESSAGE();
			RAISERROR(@ErrorMsg, 16, 1);
			RETURN
		END TRY
		BEGIN CATCH
			SET @ErrorMsg = 'Hata: Böyle bir ülke adı var.' + ERROR_MESSAGE();
            RAISERROR(@ErrorMsg, 16, 1);
            RETURN;
		END CATCH
	END
	IF @PhoneCode = @IsExistPhoneCode
	BEGIN
		BEGIN TRY
			SET @ErrorMsg = 'Böyle bir ülke telefon kodu var.' + ERROR_MESSAGE();
			RAISERROR(@ErrorMsg, 16, 1);
			RETURN
		END TRY
		BEGIN CATCH
			SET @ErrorMsg = 'Hata: Böyle bir ülke telefon kodu var.' + ERROR_MESSAGE();
            RAISERROR(@ErrorMsg, 16, 1);
            RETURN;
		END CATCH
	END

    -- Ülke kodu mevcut değilse yeni bir kayıt ekler.
    INSERT INTO Countries (Code, Name, Description, PhoneCode, Cordinat)
    VALUES (@Code, @Name, @Description, @PhoneCode, @Cordinat);

    PRINT('Ülke başarıyla eklendi');
	RETURN
END
GO
USE [master]
GO
ALTER DATABASE [IEASalesTrackingDb] SET  READ_WRITE 
GO
