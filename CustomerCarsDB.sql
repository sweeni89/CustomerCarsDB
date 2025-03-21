USE [master]
GO
/****** Object:  Database [CustomerCars]    Script Date: 3/9/2025 11:37:12 AM ******/
CREATE DATABASE [CustomerCars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerCars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CustomerCars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerCars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CustomerCars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CustomerCars] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerCars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerCars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerCars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerCars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerCars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerCars] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerCars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerCars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerCars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerCars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerCars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerCars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerCars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerCars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerCars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerCars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerCars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerCars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerCars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerCars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerCars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerCars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerCars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerCars] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerCars] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerCars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerCars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerCars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerCars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerCars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerCars] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CustomerCars] SET QUERY_STORE = ON
GO
ALTER DATABASE [CustomerCars] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CustomerCars]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/9/2025 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarsId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](250) NOT NULL,
	[RetailValue] [decimal](18, 0) NULL,
	[DateManufactured] [datetime] NOT NULL,
	[TopSpeed] [int] NOT NULL,
 CONSTRAINT [PK__Cars__51FED41A033502C8] PRIMARY KEY CLUSTERED 
(
	[CarsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCars]    Script Date: 3/9/2025 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomersId] [int] NOT NULL,
	[CarsId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerCars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/9/2025 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomersId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[LastName] [varchar](250) NOT NULL,
	[IdNumber] [varchar](250) NOT NULL,
 CONSTRAINT [PK__Customer__EB5B58FE13D30D5F] PRIMARY KEY CLUSTERED 
(
	[CustomersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCars_Cars] FOREIGN KEY([CarsId])
REFERENCES [dbo].[Cars] ([CarsId])
GO
ALTER TABLE [dbo].[CustomerCars] CHECK CONSTRAINT [FK_CustomerCars_Cars]
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCars_Customers] FOREIGN KEY([CustomersId])
REFERENCES [dbo].[Customers] ([CustomersId])
GO
ALTER TABLE [dbo].[CustomerCars] CHECK CONSTRAINT [FK_CustomerCars_Customers]
GO
/****** Object:  StoredProcedure [dbo].[CustomerCars_Select]    Script Date: 3/9/2025 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerCars_Select]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TenYearsAgo DATE = DATEADD(YEAR, -10, GETDATE());

    SELECT 
        c.CustomersId,c.FirstName,c.LastName,
        c.FirstName + ' ' 
		+
        c.LastName As FullName,
        c.IdNumber,
        (SELECT 
             car.CarsId, 
             car.Model,
             car.RetailValue,
             car.DateManufactured,
             car.TopSpeed,
			 C.IdNumber
         FROM Cars car
         INNER JOIN CustomerCars cc ON car.CarsId = cc.CarsId  -- Join with CustomerCars
         WHERE cc.CustomersId = c.CustomersId
         AND car.DateManufactured >= @TenYearsAgo -- Exclude old cars
		 ORDER BY IdNumber,DateManufactured Asc
         FOR JSON AUTO) AS 'Cars'
		
    FROM Customers c
    FOR JSON PATH;
END
GO
USE [master]
GO
ALTER DATABASE [CustomerCars] SET  READ_WRITE 
GO
