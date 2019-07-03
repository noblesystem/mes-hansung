USE [master]
GO
/****** Object:  Database [hansung]    Script Date: 5/11/2019 12:51:56 PM ******/
CREATE DATABASE [hansung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hansung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hansung.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hansung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hansung_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hansung] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hansung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hansung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hansung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hansung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hansung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hansung] SET ARITHABORT OFF 
GO
ALTER DATABASE [hansung] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hansung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hansung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hansung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hansung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hansung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hansung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hansung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hansung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hansung] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hansung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hansung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hansung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hansung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hansung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hansung] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hansung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hansung] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hansung] SET  MULTI_USER 
GO
ALTER DATABASE [hansung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hansung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hansung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hansung] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hansung] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hansung] SET QUERY_STORE = OFF
GO
USE [hansung]
GO
/****** Object:  User [hansung]    Script Date: 5/11/2019 12:51:59 PM ******/
CREATE USER [hansung] FOR LOGIN [hansung] WITH DEFAULT_SCHEMA=[hansung]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [hansung]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [hansung]
GO
ALTER ROLE [db_datareader] ADD MEMBER [hansung]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [hansung]
GO
/****** Object:  Schema [hansung]    Script Date: 5/11/2019 12:52:00 PM ******/
CREATE SCHEMA [hansung]
GO
/****** Object:  Table [dbo].[billbuy]    Script Date: 5/11/2019 12:52:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billbuy](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderdate] [datetime] NULL,
	[tradingmission] [int] NULL,
	[terms] [nvarchar](250) NULL,
	[contractdate] [datetime] NULL,
	[orderingemployer] [int] NULL,
	[customer] [int] NULL,
	[warehouse] [int] NULL,
	[paymoney] [float] NULL,
	[ordernumber] [varchar](255) NULL,
	[remark] [nvarchar](max) NULL,
	[dateconfirmation] [datetime] NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[namewarehouse] [nvarchar](250) NULL,
	[codeid] [nvarchar](500) NULL,
	[phone] [nvarchar](250) NULL,
	[notebill] [nvarchar](500) NULL,
	[currency] [nvarchar](50) NULL,
	[paymentoption] [nvarchar](50) NULL,
	[note] [nvarchar](500) NULL,
	[money] [float] NULL,
	[tolerancepercent] [float] NULL,
	[tolerancemoney] [float] NULL,
	[usance] [float] NULL,
	[datebeginpayment] [datetime] NULL,
	[creditduedate] [datetime] NULL,
	[orderbill] [nvarchar](250) NULL,
 CONSTRAINT [PK_billbuy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carship]    Script Date: 5/11/2019 12:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carship](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codebill] [nvarchar](250) NULL,
	[codeid] [nvarchar](250) NULL,
	[company] [int] NULL,
	[numberofvehicles] [nvarchar](250) NULL,
	[rate] [float] NULL,
	[verifyingacceptance] [bit] NULL,
	[deliveryworker] [int] NULL,
	[shippingtime] [datetime] NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[forwardingnumber] [nvarchar](500) NULL,
 CONSTRAINT [PK_carship] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[changewarehouse]    Script Date: 5/11/2019 12:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[changewarehouse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codedate] [nvarchar](500) NULL,
	[worker] [int] NULL,
	[sendwarehouse] [int] NULL,
	[rcvwarehouse] [int] NULL,
	[company] [int] NULL,
	[carnum] [nvarchar](250) NULL,
	[transportfee] [float] NULL,
	[verificatio] [datetime] NULL,
	[datecheck] [datetime] NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[remark] [nvarchar](500) NULL,
	[codeid] [nvarchar](500) NULL,
 CONSTRAINT [PK_changewarehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[container_location]    Script Date: 5/11/2019 12:52:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[container_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_location_id] [int] NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_container_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/11/2019 12:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[salesemployee] [int] NULL,
	[zonecode] [nvarchar](50) NULL,
	[name] [nvarchar](250) NULL,
	[registrationnumber] [nvarchar](250) NULL,
	[representative] [nvarchar](250) NULL,
	[phonenumber] [nvarchar](250) NULL,
	[fax] [nvarchar](250) NULL,
	[mobilephone] [nvarchar](250) NULL,
	[email] [nvarchar](250) NULL,
	[headofficeaddress] [nvarchar](250) NULL,
	[destinationphone] [nvarchar](250) NULL,
	[destinationaddress] [nvarchar](250) NULL,
	[transactionbalance] [float] NULL,
	[creditlimit] [float] NULL,
	[transactionaccountnumber] [nvarchar](50) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[isdelete] [bit] NULL,
	[idcode] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 5/11/2019 12:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[isdelete] [bit] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailbillbuy]    Script Date: 5/11/2019 12:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailbillbuy](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[iditem] [int] NULL,
	[nameitem] [nvarchar](250) NULL,
	[standard] [nvarchar](250) NULL,
	[quantityincase] [float] NULL,
	[qltcase] [float] NULL,
	[price] [float] NULL,
	[pricesupply] [float] NULL,
	[vat] [float] NULL,
	[totalamount] [float] NULL,
	[qltcontainer] [int] NULL,
	[sqm] [float] NULL,
	[remark] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[codeitem] [nvarchar](250) NULL,
	[codebill] [nvarchar](500) NULL,
	[codeid] [nvarchar](300) NULL,
	[codeship] [nvarchar](300) NULL,
 CONSTRAINT [PK_detailbillbuy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailchangewarehouse]    Script Date: 5/11/2019 12:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailchangewarehouse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codebill] [nvarchar](500) NULL,
	[itemcode] [nvarchar](250) NULL,
	[standard] [nvarchar](250) NULL,
	[nameitem] [nvarchar](250) NULL,
	[qltincase] [float] NULL,
	[qltbox] [float] NULL,
	[serinum] [nvarchar](250) NULL,
	[proplem] [nvarchar](250) NULL,
	[remark] [nvarchar](500) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[itemid] [int] NULL,
 CONSTRAINT [PK_detailchangewarehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailorder]    Script Date: 5/11/2019 12:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailorder](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codebill] [nvarchar](max) NULL,
	[itemid] [int] NULL,
	[itemcode] [nvarchar](250) NULL,
	[itemname] [nvarchar](250) NULL,
	[standard] [nvarchar](250) NULL,
	[qltincase] [float] NULL,
	[qltcase] [float] NULL,
	[price] [float] NULL,
	[pricesupply] [float] NULL,
	[vat] [float] NULL,
	[totalamount] [float] NULL,
	[itemremarks] [nvarchar](500) NULL,
	[serialNo] [nvarchar](250) NULL,
	[caseNo] [nvarchar](250) NULL,
	[PRODNo] [nvarchar](250) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
 CONSTRAINT [PK_detailorder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailwarehouse]    Script Date: 5/11/2019 12:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailwarehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[destination] [nvarchar](50) NULL,
	[rowdestination] [nvarchar](50) NULL,
	[YajiSelection] [nvarchar](50) NULL,
	[rowYaji] [nvarchar](50) NULL,
	[container] [nvarchar](50) NULL,
 CONSTRAINT [PK_detailwarehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 5/11/2019 12:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employeecode] [nvarchar](250) NULL,
	[name] [nvarchar](250) NULL,
	[permission] [nvarchar](50) NULL,
	[email] [nvarchar](250) NULL,
	[phonenumber] [nvarchar](50) NULL,
	[position] [int] NULL,
	[department] [int] NULL,
	[address] [nvarchar](250) NULL,
	[attachments] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[isdelete] [bit] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historybillsale]    Script Date: 5/11/2019 12:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historybillsale](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idold] [int] NULL,
	[contenold] [text] NULL,
	[contennew] [text] NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[actions] [nvarchar](500) NULL,
	[codeid] [nvarchar](max) NULL,
	[subcode] [nvarchar](500) NULL,
	[inforbill] [nvarchar](max) NULL,
 CONSTRAINT [PK_historybillsale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inputwarehouse]    Script Date: 5/11/2019 12:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inputwarehouse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[seriesnum] [nvarchar](max) NULL,
	[destination] [nvarchar](250) NULL,
	[rowdestination] [nvarchar](250) NULL,
	[YajiSelection] [nvarchar](250) NULL,
	[rowYaji] [nvarchar](250) NULL,
	[container] [nvarchar](250) NULL,
	[itemid] [int] NULL,
	[itemcode] [nvarchar](500) NULL,
	[itemname] [nvarchar](500) NULL,
	[size] [nvarchar](500) NULL,
	[qltincase] [float] NULL,
	[qltbox] [float] NULL,
	[problems] [nvarchar](500) NULL,
	[defecttype] [nvarchar](500) NULL,
	[manufacturer] [nvarchar](500) NULL,
	[remarksitem] [nvarchar](500) NULL,
	[location] [nvarchar](500) NULL,
	[purchasenotes] [nvarchar](500) NULL,
	[attachments] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[inspnumber] [nvarchar](500) NULL,
 CONSTRAINT [PK_Inputwarehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inspection]    Script Date: 5/11/2019 12:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inspection](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[inspnumber] [nvarchar](max) NULL,
	[codebill] [nvarchar](max) NULL,
	[warehouse] [int] NULL,
	[workerone] [int] NULL,
	[workertwo] [int] NULL,
	[remarks] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[warehousename] [nvarchar](500) NULL,
	[employeeone] [nvarchar](500) NULL,
	[employeetwo] [nvarchar](500) NULL,
 CONSTRAINT [PK_inspection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemList]    Script Date: 5/11/2019 12:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemcode] [nvarchar](250) NULL,
	[itemduzoncode] [nvarchar](250) NULL,
	[itemname] [nvarchar](250) NULL,
	[quantityincase] [float] NULL,
	[specifiedarea] [float] NULL,
	[safetystockquantity] [float] NULL,
	[manufacturer] [nvarchar](250) NULL,
	[status] [nvarchar](250) NULL,
	[itembrief] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[standard] [nvarchar](250) NULL,
	[isdelete] [bit] NULL,
	[width] [float] NULL,
	[unitprice1] [float] NULL,
	[unitprice2] [float] NULL,
	[unitprice3] [float] NULL,
	[height] [float] NULL,
 CONSTRAINT [PK_ItemList] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jigo_location]    Script Date: 5/11/2019 12:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jigo_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[warehourse_location_id] [int] NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_jigo_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderslips]    Script Date: 5/11/2019 12:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderslips](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderdate] [nvarchar](500) NULL,
	[salesrepresentative] [int] NULL,
	[customercompany] [int] NULL,
	[customercontacts] [nvarchar](250) NULL,
	[terms] [nvarchar](250) NULL,
	[receivables] [bit] NULL,
	[warehouse] [int] NULL,
	[issuedate] [datetime] NULL,
	[contactphone] [nvarchar](250) NULL,
	[frame] [nvarchar](250) NULL,
	[destinationaddress] [nvarchar](250) NULL,
	[remarks] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[codeid] [nvarchar](300) NULL,
	[transactionbalancectm] [float] NULL,
 CONSTRAINT [PK_orderslips] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 5/11/2019 12:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codeorder] [nvarchar](max) NULL,
	[paymentdate] [datetime] NULL,
	[employer] [int] NULL,
	[customer] [int] NULL,
	[transactionterms] [nvarchar](250) NULL,
	[cashT_T] [float] NULL,
	[billL_C] [float] NULL,
	[paymentaccount] [nvarchar](250) NULL,
	[feesmoney] [float] NULL,
	[remark] [nvarchar](max) NULL,
	[codebill] [nvarchar](max) NULL,
	[codeid] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[employerstr] [varchar](500) NULL,
 CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentOrder]    Script Date: 5/11/2019 12:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentOrder](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codeorder] [nvarchar](max) NULL,
	[paymentdate] [datetime] NULL,
	[employer] [int] NULL,
	[customer] [int] NULL,
	[transactionterms] [nvarchar](250) NULL,
	[cashT_T] [float] NULL,
	[billL_C] [float] NULL,
	[paymentaccount] [nvarchar](250) NULL,
	[feesmoney] [float] NULL,
	[remark] [nvarchar](max) NULL,
	[codebill] [nvarchar](max) NULL,
	[codeid] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[employerstr] [varchar](500) NULL,
 CONSTRAINT [PK_paymentOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plans]    Script Date: 5/11/2019 12:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plans](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[worker] [int] NULL,
	[time] [date] NULL,
	[money] [float] NULL,
	[remark] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[codeid] [nvarchar](500) NULL,
 CONSTRAINT [PK_plans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 5/11/2019 12:52:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[isdelete] [bit] NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rawyaji_location]    Script Date: 5/11/2019 12:52:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rawyaji_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[yaji_location_id] [int] NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_rawyaji_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rowjigo_location]    Script Date: 5/11/2019 12:52:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rowjigo_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jigo_location_id] [int] NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_rowjigo_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serinumber]    Script Date: 5/11/2019 12:52:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serinumber](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codebill] [nvarchar](max) NULL,
	[codeparent] [nvarchar](max) NULL,
	[seriNum] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
 CONSTRAINT [PK_serinumber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ship]    Script Date: 5/11/2019 12:52:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ship](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[codebill] [nvarchar](max) NULL,
	[codeid] [nvarchar](max) NULL,
	[orderbill] [nvarchar](250) NULL,
	[numbership] [nvarchar](250) NULL,
	[duedate] [datetime] NULL,
	[departuredate] [datetime] NULL,
	[dateofarrival] [datetime] NULL,
	[conDuedate] [datetime] NULL,
	[shipname] [nvarchar](250) NULL,
	[remark] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[nameshipname] [nvarchar](500) NULL,
	[qltbox] [float] NULL,
	[dateclearance] [datetime] NULL,
	[customsday] [datetime] NULL,
	[port] [nvarchar](250) NULL,
	[containernumber] [nvarchar](250) NULL,
	[daycertificate] [datetime] NULL,
	[sizefit] [nvarchar](50) NULL,
	[containerday] [datetime] NULL,
	[conreturnday] [datetime] NULL,
	[requestday] [datetime] NULL,
	[confirmreceiptday] [datetime] NULL,
	[serinumber] [nvarchar](max) NULL,
	[prodcode] [nvarchar](250) NULL,
	[casenom] [nvarchar](250) NULL,
	[proddate] [datetime] NULL,
	[shipnum] [nvarchar](50) NULL,
	[indexbox] [nvarchar](50) NULL,
 CONSTRAINT [PK_ship] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[styleItem]    Script Date: 5/11/2019 12:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[styleItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[size] [float] NULL,
	[code] [nvarchar](250) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[isdelete] [bit] NULL,
 CONSTRAINT [PK_styleItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subship]    Script Date: 5/11/2019 12:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subship](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idbill] [bigint] NULL,
	[codebill] [nvarchar](max) NULL,
	[numbership] [nvarchar](250) NULL,
	[duedate] [datetime] NULL,
	[departuredate] [datetime] NULL,
	[dateofarrival] [datetime] NULL,
	[conDuedate] [datetime] NULL,
	[shipname] [nvarchar](250) NULL,
	[remark] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
 CONSTRAINT [PK_subship] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table_detail_erorr]    Script Date: 5/11/2019 12:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_detail_erorr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Item_id] [int] NULL,
	[Defect_type] [nvarchar](250) NULL,
	[remark] [nvarchar](250) NULL,
	[serinum] [nvarchar](250) NULL,
	[Documents_attach] [nvarchar](250) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[qltincase] [float] NULL,
	[qltbox] [float] NULL,
	[qltremove] [float] NULL,
	[remarkremove] [nvarchar](250) NULL,
	[codebill] [nvarchar](300) NULL,
 CONSTRAINT [PK_table_detail_erorr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Erorr]    Script Date: 5/11/2019 12:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Erorr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numbercode] [nvarchar](250) NULL,
	[poor_handling_charge] [int] NULL,
	[warehouse_id] [int] NULL,
	[defective_processing_type] [nvarchar](250) NULL,
	[approved] [datetime] NULL,
	[remark] [nvarchar](250) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[codeid] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Table_Erorr] PRIMARY KEY CLUSTERED 
(
	[codeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_qlt_erorr]    Script Date: 5/11/2019 12:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_qlt_erorr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [int] NULL,
	[qltincase] [float] NULL,
	[qltbox] [float] NULL,
	[serinum] [nvarchar](250) NULL,
	[Defect_type] [nvarchar](250) NULL,
	[remark] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[codebill] [nvarchar](300) NULL,
 CONSTRAINT [PK_Table_qlt_erorr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tradingmission]    Script Date: 5/11/2019 12:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tradingmission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[isdelete] [bit] NULL,
 CONSTRAINT [PK_tradingmission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 5/11/2019 12:52:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[warehousecode] [nvarchar](250) NULL,
	[name] [nvarchar](250) NULL,
	[brief] [nvarchar](max) NULL,
	[telephone] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[datecreate] [datetime] NULL,
	[lastupdate] [datetime] NULL,
	[usercreate] [int] NULL,
	[userupdate] [int] NULL,
	[isdelete] [bit] NULL,
	[subname] [nvarchar](500) NULL,
 CONSTRAINT [PK_warehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehouse_location]    Script Date: 5/11/2019 12:52:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_warehouse_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yaji_location]    Script Date: 5/11/2019 12:52:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yaji_location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[warehouse_location_id] [int] NULL,
	[location] [nvarchar](250) NULL,
	[description] [nvarchar](500) NULL,
	[reg_date] [datetime] NULL,
	[reg_user] [nvarchar](250) NULL,
	[del_yn] [nchar](10) NULL,
 CONSTRAINT [PK_yaji_location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[billbuy] ON 

INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (1, NULL, 45, N'CIF', CAST(N'2018-12-01T00:00:00.000' AS DateTime), 7, NULL, 2, 150000000, N'P20181204A18', N'test change', CAST(N'2018-12-06T00:00:00.000' AS DateTime), CAST(N'2019-04-24T03:50:23.000' AS DateTime), NULL, NULL, NULL, N'인천 창고', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'086-2514-254-8415', NULL, N'$ ', NULL, N'aadaa1546', 15620, 4, 624.8, 60, CAST(N'2018-12-08T00:00:00.000' AS DateTime), CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'P20181204A14-03')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (2, NULL, 46, N'CFR', CAST(N'2018-12-10T00:00:00.000' AS DateTime), 10, NULL, 2, 1526700, N'P20181211A04', NULL, CAST(N'2018-12-13T00:00:00.000' AS DateTime), CAST(N'2019-04-24T06:19:29.000' AS DateTime), NULL, NULL, NULL, N'김해 창고', N'order615b6314bdf945d7b78fdb21024305e8', N'065-2541-2145-2354', NULL, N'$ ', N'L/C', N'gsagsd1546', 21200, 5, 1060, 60, CAST(N'2018-12-14T00:00:00.000' AS DateTime), CAST(N'2019-03-13T00:00:00.000' AS DateTime), N'P20181211A03-01')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (3, NULL, 47, N'CFR', CAST(N'2018-12-10T00:00:00.000' AS DateTime), 10, NULL, 2, 15320000, N'P20181211A04', NULL, CAST(N'2018-12-13T00:00:00.000' AS DateTime), CAST(N'2019-04-24T08:04:47.000' AS DateTime), NULL, NULL, NULL, N'김해 창고', N'orderb58e6e0c45194a3f8a9eb82dbc208f41', N'064-8541-5452-9854', NULL, N'$ ', N'L/C', N'gfgsg11666', 15350, 3, 460.5, 60, CAST(N'2018-12-14T00:00:00.000' AS DateTime), CAST(N'2019-03-13T00:00:00.000' AS DateTime), N'P20181211A04-01')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (4, NULL, 17, N'CIF', CAST(N'2018-12-26T00:00:00.000' AS DateTime), 6, NULL, 2, 23000000, N'P20181225A04', NULL, CAST(N'2018-12-27T00:00:00.000' AS DateTime), CAST(N'2019-04-24T10:53:29.000' AS DateTime), NULL, NULL, NULL, N'인천 창고', N'order22d373d0cab74677b0a4b98a8add699d', N'085-2547-5284-2547', NULL, N'$ ', N'L/C', N'fdafdf1422', 51850, 4, 2074, 90, CAST(N'2019-01-02T00:00:00.000' AS DateTime), CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'P20181225A04-02')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (5, NULL, 45, N'CIF', CAST(N'2019-01-01T00:00:00.000' AS DateTime), 7, NULL, 2, 150000000, N'P20190102A05', NULL, CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2019-04-25T05:21:17.000' AS DateTime), NULL, NULL, NULL, N'인천 창고', N'order318f737595b34431adadb467296f951a', N'086-2514-254-8415', NULL, N'$ ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (6, NULL, 15, N'내수', CAST(N'2019-01-11T00:00:00.000' AS DateTime), 7, NULL, 1, 15000000, N'P20190110A03', N'note', CAST(N'2019-01-11T00:00:00.000' AS DateTime), CAST(N'2019-04-30T23:24:21.000' AS DateTime), NULL, NULL, NULL, N'인천 창고', N'order9cf63e4db534408f83c708a38ecaa03e', N'031-2547-5847', N'20190111-01', N'₩ ', N'T/T', NULL, 9504120, NULL, NULL, NULL, NULL, NULL, N'P20190110A03-02')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (13, NULL, 14, N'내수', CAST(N'2019-01-23T00:00:00.000' AS DateTime), 6, NULL, 1, 10000000, N'P20190122A03', NULL, CAST(N'2019-01-23T00:00:00.000' AS DateTime), CAST(N'2019-05-06T17:28:38.000' AS DateTime), NULL, NULL, NULL, NULL, N'order7be0efae3c204e6dae60c3bca572be1b', N'051-2354-2514', N'20190123-01', N'₩ ', N'L/C', NULL, 17023000, NULL, NULL, NULL, NULL, NULL, N'P20190304A02-08')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (14, NULL, 45, N'CIF', CAST(N'2019-01-22T00:00:00.000' AS DateTime), 7, NULL, 2, 150000000, N'P20190124A02', N'test', CAST(N'2019-01-25T00:00:00.000' AS DateTime), CAST(N'2019-05-07T09:50:36.000' AS DateTime), NULL, NULL, NULL, NULL, N'orderb1d8516442624950b4f144064eb8fd1c', N'086-2514-254-8415', N'20190122-01', N'$ ', N'L/C', N'dsfsdf1545', 46000, 3, 1380, 90, CAST(N'2019-01-25T00:00:00.000' AS DateTime), CAST(N'2019-04-24T00:00:00.000' AS DateTime), N'P20190121A05-01')
INSERT [dbo].[billbuy] ([id], [orderdate], [tradingmission], [terms], [contractdate], [orderingemployer], [customer], [warehouse], [paymoney], [ordernumber], [remark], [dateconfirmation], [datecreate], [lastupdate], [usercreate], [userupdate], [namewarehouse], [codeid], [phone], [notebill], [currency], [paymentoption], [note], [money], [tolerancepercent], [tolerancemoney], [usance], [datebeginpayment], [creditduedate], [orderbill]) VALUES (15, NULL, 17, N'CIF', CAST(N'2019-02-04T00:00:00.000' AS DateTime), 6, NULL, 1, 23000000, N'P20190201A02', NULL, CAST(N'2019-02-04T00:00:00.000' AS DateTime), CAST(N'2019-05-10T17:16:17.000' AS DateTime), NULL, NULL, NULL, NULL, N'ordere347bd25f7584bf6b822e2e9e3205879', N'085-257-524-2547', N'20190204-01', N'$ ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[billbuy] OFF
SET IDENTITY_INSERT [dbo].[carship] ON 

INSERT [dbo].[carship] ([id], [codebill], [codeid], [company], [numberofvehicles], [rate], [verifyingacceptance], [deliveryworker], [shippingtime], [datecreate], [lastupdate], [usercreate], [userupdate], [forwardingnumber]) VALUES (1, N'orderb06de0235ef7459d95fd15dc22b870fe', N'orderdcfb629410b242c38060e377c22e7aa2', 52, N'54나2145', 250000, 1, 13, CAST(N'2019-04-24T18:40:00.000' AS DateTime), CAST(N'2019-04-24T18:41:26.000' AS DateTime), NULL, NULL, NULL, N'S20190304A02-03')
INSERT [dbo].[carship] ([id], [codebill], [codeid], [company], [numberofvehicles], [rate], [verifyingacceptance], [deliveryworker], [shippingtime], [datecreate], [lastupdate], [usercreate], [userupdate], [forwardingnumber]) VALUES (2, N'order05be9f19116e4822b0640f895e09afd6', N'orderfe457eda278a4313bb897d8f41a0c3e3', 53, N'54나2154', 350000, 1, 14, CAST(N'2019-04-25T12:00:00.000' AS DateTime), CAST(N'2019-04-25T05:01:19.000' AS DateTime), NULL, NULL, NULL, N'S20190307A01-01')
INSERT [dbo].[carship] ([id], [codebill], [codeid], [company], [numberofvehicles], [rate], [verifyingacceptance], [deliveryworker], [shippingtime], [datecreate], [lastupdate], [usercreate], [userupdate], [forwardingnumber]) VALUES (3, N'orderc4ce1c26283646b6a09364b3d6606846', N'order8c3cffe88d064786af3c2b316d73adc7', 53, N'부산5 다 3452', 250000, 1, 14, CAST(N'2019-04-25T12:58:00.000' AS DateTime), CAST(N'2019-04-25T05:58:44.000' AS DateTime), NULL, NULL, NULL, N'S20190311A01-01')
SET IDENTITY_INSERT [dbo].[carship] OFF
SET IDENTITY_INSERT [dbo].[changewarehouse] ON 

INSERT [dbo].[changewarehouse] ([id], [codedate], [worker], [sendwarehouse], [rcvwarehouse], [company], [carnum], [transportfee], [verificatio], [datecheck], [datecreate], [lastupdate], [usercreate], [userupdate], [remark], [codeid]) VALUES (1, N'M20190401A01', 7, 1, 2, 50, N'ewe', 150000, CAST(N'2019-04-02T00:00:00.000' AS DateTime), NULL, CAST(N'2019-04-28T03:24:31.000' AS DateTime), NULL, NULL, NULL, N'hghg', N'chang983959ca76cb4fc4af58791e37a46d59')
SET IDENTITY_INSERT [dbo].[changewarehouse] OFF
SET IDENTITY_INSERT [dbo].[container_location] ON 

INSERT [dbo].[container_location] ([id], [warehouse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (1, 1, N'1구역', N'description container_location', NULL, N'reg_user', N'y/n       ')
INSERT [dbo].[container_location] ([id], [warehouse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (2, 1, N'3구역', N'description container_location', NULL, N'reg_user', N'y/n       ')
INSERT [dbo].[container_location] ([id], [warehouse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (3, 1, N'4구역', N'description container_location', NULL, N'reg_user', N'y/n       ')
SET IDENTITY_INSERT [dbo].[container_location] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (14, N'B001', 6, NULL, N'한국유리', N'125-23534-152', N'주명길', N'051-2354-2514', N'051-2354-2514', NULL, N'hanglass@com', N'부산시 동구 구로동 215-254', N'051-2547-2548', N'부산시 남구 김해동 125-1245', 10000000, 20000000, N'154-2541-2541', CAST(N'2019-04-18T07:07:27.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (15, N'B002', 7, NULL, N'보오미거울', N'125-125-254125', N'최수빈', N'031-2547-5847', N'031-1254-2587', N'010-2547-2545', N'boomymorroe.com', N'경기도 파주시 문산면 동패리 234-23', N'031-2549-1254', N'경기도 파주시 문산면 동패리 234-23', 15000000, 200000000, N'125-2541-84579', CAST(N'2019-04-18T07:15:20.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (16, N'E002', NULL, N'222', N'2', N'2', N'1212', N'1212', N'12', N'121', N'2', N'2121', N'21', N'21', 121, 212, N'21', CAST(N'2019-04-19T11:38:30.000' AS DateTime), NULL, NULL, NULL, 1, 3)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (17, N'B003', 6, NULL, N'ASIA', N'111-5542-2547', N'JASON', N'085-257-524-2547', N'085-232-324-3254', NULL, N'eweadfsd@gmail.com', N'ewewe2', N'085-2514-3254-2514', N'kfhksdjafhdhsda', 23000000, 300000000, N'312-0215-2542', CAST(N'2019-04-19T12:13:49.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (45, N'B004', 7, NULL, N'DDTS', N'111-5324-2514', N'F. JONSON', N'086-254-254-8415', N'086-274-521-2341', NULL, N'sdfdfafg@gamil.com', N'sgsfdgsdgfs', N'086-2541-584-5147-5821', N'dffghfghf', 150000000, 300000000, N'154-2547-2561', CAST(N'2019-04-19T14:55:21.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (46, N'B005', 10, NULL, N'주)충칭', N'1254-2541-3652', N'안영명', N'065-251-214-2354', N'065-251-254-2541', NULL, N'dfdfdsf@naver.com', N'dffdf.dfdf', N'065-215-269-8945', N'fdgdfgdfgfg', 1526700, 100000000, N'152-54789-154', CAST(N'2019-04-19T08:27:31.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (47, N'B006', 10, NULL, N'CHAINA GLASS', N'1254-254-54128', N'TOM', N'064-851-542-9854', N'064-854-512-2598', NULL, N'dfsfdfs@gmail.com', N'gfsdg', N'064-8547-8645-6587', N'sdfgsf', 15320000, 100200000, N'154-3514-547', CAST(N'2019-04-19T08:29:33.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (48, N'S001', 9, NULL, N'에이스', N'152-2547-3587', N'김범수', N'031-2547-2315', N'031-4815-7841', N'010-2547-2635', N'dfddf@gmail.com', N'경기도 파주시 124-2547', N'031-2547-9854', N'경기도 파주시1254-5666', 15000000, 10000000, N'125-24545-254', CAST(N'2019-04-22T06:21:46.000' AS DateTime), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (49, N'S002', 10, NULL, N'동일', N'1254-2354-25471', N'김한수', N'032-2541-2541', N'032-2145-8965', N'010-8745-9652', N'adsfadfdsa@gmail.com', N'인천시 남동구 가좌동 120-23', N'032-2145-9864', N'인천시 남동구 가좌동 345-312', 20000000, 250000000, N'120-54762-2145', CAST(N'2019-04-22T06:24:31.000' AS DateTime), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (50, N'S003', 12, NULL, N'부만', N'021-24515-254', N'최인호', N'051-9856-9847', N'051-8954-1264', N'010-2548-5651', N'dfasdfas@gmail.com', N'부산시 중구 서면 321-293', N'051-2541-2154', N'부산시 중욱 2154-54', 1500000, 25000000, N'021-25418-547', CAST(N'2019-04-22T06:27:07.000' AS DateTime), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (51, N'S004', 12, NULL, N'신일유리', N'154-56987-2541', N'고종수', N'051-2541-2354', N'051-5874-6541', N'010-6598-7656', N'sdsdfksja@gmail.com', N'부산시 282-2939', N'051-3214-2211', N'부산시 동구 2323-232', 6600000, 35000000, N'021-54218-5487', CAST(N'2019-04-22T06:29:21.000' AS DateTime), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (52, N'E002', 11, NULL, N'청일운수', N'125-25487-5258', N'김청일', N'032-2541-3254', N'032-5478-6541', N'010-2541-2547', N'sadfasdmfa@gamil.com', N'인천시 남동구 121-451', N'032-2541-8754', N'인천시 남동구 154-254', 2500000, 10000000, N'1254-52122-541', CAST(N'2019-04-22T06:31:25.000' AS DateTime), NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[customer] ([id], [code], [salesemployee], [zonecode], [name], [registrationnumber], [representative], [phonenumber], [fax], [mobilephone], [email], [headofficeaddress], [destinationphone], [destinationaddress], [transactionbalance], [creditlimit], [transactionaccountnumber], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [idcode]) VALUES (53, N'E003', 11, NULL, N'청해운수', N'2145-35412-5484', N'김청해', N'051-3254-3215', N'051-6458-5478', N'010-2541-2541', N'dffasdf@gmail.com', N'부산시 남동구 245-5478', N'051-2514-5478', N'부산시 남동구 1254-365', 1502000, 10000000, N'125-35421-2541', CAST(N'2019-04-22T06:33:49.000' AS DateTime), NULL, NULL, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (1, N'총무부', NULL)
INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (2, N'인사부', NULL)
INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (3, N'구매부', NULL)
INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (4, N'영업부', NULL)
INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (5, N'인천창고부', NULL)
INSERT [dbo].[department] ([id], [name], [isdelete]) VALUES (6, N'부산창고부', NULL)
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[detailbillbuy] ON 

INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (7, 10, N'미스트3', N'1830*3050', 36, 10, 4, 10000, 1000, 11000, 1, 2009, NULL, CAST(N'2019-04-24T06:21:08.000' AS DateTime), NULL, NULL, NULL, N'10', N'order615b6314bdf945d7b78fdb21024305e8', N'dtbuy508b60014d8841aaa7a0b53a01f5ad60', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (8, 8, N'미스트5', N'2130*3048', 33, 8, 4, 9270, 927, 10200, 1, 1713, NULL, CAST(N'2019-04-24T06:21:08.000' AS DateTime), NULL, NULL, NULL, N'8', N'order615b6314bdf945d7b78fdb21024305e8', N'dtbuy60f71d904d6c4dbfae675659b03438b4', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (9, 11, N'워터큐브5', N'1830*2440', 40, 5, 3, 6590, 659, 7250, 1, 893, N'급', CAST(N'2019-04-24T08:06:00.000' AS DateTime), NULL, NULL, NULL, N'11', N'orderb58e6e0c45194a3f8a9eb82dbc208f41', N'dtbuy3e7d108035b040bab2f79b6a83851241', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (10, 12, N'워터큐브7', N'1830*3050', 35, 5, 3, 7360, 736, 8100, 1, 976, N'급', CAST(N'2019-04-24T08:06:00.000' AS DateTime), NULL, NULL, NULL, N'12', N'orderb58e6e0c45194a3f8a9eb82dbc208f41', N'dtbuy1b334d34eb264abe91098f5b98bfda02', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (13, 1, N'고방5', N'1830*2440', 40, 10, 9, 18500, 1850, 20350, 2, 1786, NULL, CAST(N'2019-04-24T10:54:39.000' AS DateTime), NULL, NULL, NULL, N'1', N'order22d373d0cab74677b0a4b98a8add699d', N'dtbuy8cf3481cbe7248e3a1a937bee54fbf29', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (14, 2, N'다이아5', N'1830*2440', 35, 10, 17, 28630, 2863, 31500, 2, 1562, NULL, CAST(N'2019-04-24T10:54:39.000' AS DateTime), NULL, NULL, NULL, N'3', N'order22d373d0cab74677b0a4b98a8add699d', N'dtbuy0fc8c555bda94a67a1b083403525e0f5', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (15, 4, N'초백5', N'2140*3300', 26, 8, 4, 9040, 904, 9950, 2, 1468, NULL, CAST(N'2019-04-25T05:25:26.000' AS DateTime), NULL, NULL, NULL, N'5', N'order318f737595b34431adadb467296f951a', N'dtbuyb0ffce8f9b414e5eb87990bc22043432', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (16, 6, N'오셔닉5', N'1830*3050', 33, 6, 3, 7760, 776, 8540, 1, 1105, NULL, CAST(N'2019-04-25T05:25:39.000' AS DateTime), NULL, NULL, NULL, N'7', N'order318f737595b34431adadb467296f951a', N'dtbuy693017618deb4dec89ace3a4cb3e7aa9', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (17, 4, N'4', N'2140*3300', 31, 5, 2905, 6847760, 684776, 7532542, 1, 1094, NULL, CAST(N'2019-04-25T10:29:34.000' AS DateTime), NULL, NULL, NULL, N'4', N'undefined', N'dtbuyf2da48b2d7b0464380ee63ca0a25f5c5', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (18, 6, N'6', N'1830*3050', 38, 5, 32777, 74832400, 7483240, 82315648, 1, 1060, NULL, CAST(N'2019-04-25T10:29:34.000' AS DateTime), NULL, NULL, NULL, N'6', N'undefined', N'dtbuya28499334d2c4566badacc9d99c8d4ca', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (19, 4, N'초백5', N'2140*3300', 31, 5, 2, 6810, 681, 7500, 1, 1094, N'test change 1', CAST(N'2019-04-25T10:30:59.000' AS DateTime), NULL, NULL, NULL, N'4', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'dtbuy6bf12e2913ef4094b99b915197992f8d', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (20, 6, N'오셔닉5', N'1830*3050', 38, 5, 3, 7380, 738, 8120, 1, 1060, N'test change 3', CAST(N'2019-04-25T10:30:59.000' AS DateTime), NULL, NULL, NULL, N'6', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'dtbuy558460c54b704cbab9f99f5b540c2f89', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (22, 13, N'은경5', N'2134*3048', 30, 5, 4113, 8640100, 864010, 9504120, 1, 975, NULL, CAST(N'2019-05-03T05:42:34.000' AS DateTime), NULL, NULL, NULL, N'13', N'order9cf63e4db534408f83c708a38ecaa03e', N'dtbuy743ee09a00134c99af970d01a8d5b4ce', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (30, 15, N'동경5', N'2134*3048', 30, 5, 4121, 8657270, 865727, 9523000, 1, 975, NULL, CAST(N'2019-05-07T00:14:22.000' AS DateTime), NULL, NULL, NULL, N'15', N'order7be0efae3c204e6dae60c3bca572be1b', N'dtbuy9e4a0431abee4b54a60c1324d999a067', N'shipe9919205759a4249aef2b2a00b2731f1')
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (31, 16, N'동경3', N'2134*3048', 35, 5, 2782, 6818180, 681818, 7500000, 1, 1138, NULL, CAST(N'2019-05-07T00:30:56.000' AS DateTime), NULL, NULL, NULL, N'16', N'order7be0efae3c204e6dae60c3bca572be1b', N'dtbuy3437c1444d054f1d861ab3f4e5294b69', N'shipe9919205759a4249aef2b2a00b2731f1')
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (32, 6, N'오셔닉5', N'1830*3050', 38, 10, 8, 19090, 1909, 21000, 2, 2120, NULL, CAST(N'2019-05-07T09:50:36.000' AS DateTime), NULL, NULL, NULL, N'6', N'orderb1d8516442624950b4f144064eb8fd1c', N'dtbuy57df9e7bfc0d49138ab02aabc646ee98', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (33, 6, N'오셔닉5', N'1830*3050', 33, 10, 11, 22720, 2272, 25000, 2, 1841, NULL, CAST(N'2019-05-08T03:06:06.000' AS DateTime), NULL, NULL, NULL, N'7', N'orderb1d8516442624950b4f144064eb8fd1c', N'dtbuya1276b40f584459da4d2b507e0b07e1f', NULL)
INSERT [dbo].[detailbillbuy] ([id], [iditem], [nameitem], [standard], [quantityincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [qltcontainer], [sqm], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeitem], [codebill], [codeid], [codeship]) VALUES (34, 2, N'다이아5', N'1830*2440', 40, 10, 4, 9560, 956, 10520, 1, 1786, NULL, CAST(N'2019-05-10T17:16:17.000' AS DateTime), NULL, NULL, NULL, N'2', N'ordere347bd25f7584bf6b822e2e9e3205879', N'dtbuy5aa2d43cb9c04045a0d7f182b5c8fb71', NULL)
SET IDENTITY_INSERT [dbo].[detailbillbuy] OFF
SET IDENTITY_INSERT [dbo].[detailchangewarehouse] ON 

INSERT [dbo].[detailchangewarehouse] ([id], [codebill], [itemcode], [standard], [nameitem], [qltincase], [qltbox], [serinum], [proplem], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [itemid]) VALUES (4, N'chang983959ca76cb4fc4af58791e37a46d59', N'1', N'1830*2440', N'고방5', 2, 2, N'23', N'부분파손', NULL, CAST(N'2019-04-28T06:14:17.000' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[detailchangewarehouse] OFF
SET IDENTITY_INSERT [dbo].[detailorder] ON 

INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (106, N'orderb06de0235ef7459d95fd15dc22b870fe', 4, N'4', N'4', N'2140*3300', 31, 1, 829, 1954540, 195454, 2150000, NULL, NULL, NULL, NULL, CAST(N'2019-04-24T11:34:02.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (107, N'orderb06de0235ef7459d95fd15dc22b870fe', 6, N'6', N'6', N'1830*3050', 38, 1, 935, 2136360, 213636, 2350000, NULL, NULL, NULL, NULL, CAST(N'2019-04-24T11:34:02.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (115, N'order05be9f19116e4822b0640f895e09afd6', 10, N'10', N'10', N'1830*3050', 36, 1, 819, 1772720, 177272, 1950000, N'ㅊㅁㅁㄴ', NULL, NULL, NULL, CAST(N'2019-04-25T06:21:16.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (116, N'order05be9f19116e4822b0640f895e09afd6', 8, N'8', N'8', N'2130*3048', 33, 2, 1241, 2863630, 286363, 3150000, NULL, NULL, NULL, NULL, CAST(N'2019-04-25T06:21:16.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (119, N'orderc4ce1c26283646b6a09364b3d6606846', 11, N'11', N'11', N'1830*2440', 40, 2, 2010, 3865500, 386550, 4252050, NULL, NULL, NULL, NULL, CAST(N'2019-04-28T04:41:13.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (120, N'orderc4ce1c26283646b6a09364b3d6606846', 12, N'12', N'12', N'1830*3050', 35, 2, 2313, 4864680, 486468, 5351150, NULL, NULL, NULL, NULL, CAST(N'2019-04-28T04:41:13.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (121, N'order5ebd9e41edcf4737a2d88f93f29cce7b', 3, N'3', N'다이아5', N'2134*2440', 35, 2, 1971, 3866900, 386690, 4253600, NULL, NULL, NULL, NULL, CAST(N'2019-05-03T21:45:59.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[detailorder] ([id], [codebill], [itemid], [itemcode], [itemname], [standard], [qltincase], [qltcase], [price], [pricesupply], [vat], [totalamount], [itemremarks], [serialNo], [caseNo], [PRODNo], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (122, N'order5ebd9e41edcf4737a2d88f93f29cce7b', 1, N'1', N'고방5', N'1830*2440', 40, 1, 1018, 1958180, 195818, 2154000, NULL, NULL, NULL, NULL, CAST(N'2019-05-03T21:46:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[detailorder] OFF
SET IDENTITY_INSERT [dbo].[detailwarehouse] ON 

INSERT [dbo].[detailwarehouse] ([id], [name], [destination], [rowdestination], [YajiSelection], [rowYaji], [container]) VALUES (1, N'인천창고', N'1', N'1', N'1', N'1', N'1')
INSERT [dbo].[detailwarehouse] ([id], [name], [destination], [rowdestination], [YajiSelection], [rowYaji], [container]) VALUES (2, N'인천창고', N'1', N'1', N'2', N'2', N'2')
INSERT [dbo].[detailwarehouse] ([id], [name], [destination], [rowdestination], [YajiSelection], [rowYaji], [container]) VALUES (3, N'인천창고', N'1', N'1', N'3', N'3', N'3')
INSERT [dbo].[detailwarehouse] ([id], [name], [destination], [rowdestination], [YajiSelection], [rowYaji], [container]) VALUES (4, N'인천창고', N'1', N'1', N'4', N'4', N'4')
SET IDENTITY_INSERT [dbo].[detailwarehouse] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (1, N'W01', N'tesr', NULL, N'tesr@', N'tesrw', 1, 1, N'11112', N'21.xlsx', CAST(N'2019-04-17T15:26:55.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (2, N'W02', N'대표이사', NULL, N'fdfsdf@gmail.com', N'010-2355-2613', 1, 6, N'서울시 서초구 방배동 125-1254', NULL, CAST(N'2019-04-17T10:01:24.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (3, N'W03', N'이상길', NULL, N'dffsdjsd@gmil.com', N'010-2514-2664', 2, 1, N'서울시 구로구 상암동124-254', NULL, CAST(N'2019-04-17T10:02:36.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (4, N'W03', N'홍길동', NULL, N'akadn@gkdm.com', N'010-6549-4569', 6, 3, N'가산동', NULL, CAST(N'2019-04-18T13:29:50.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (5, N'W04', N'test W04', NULL, N'W04@.hh.jh', N'W04', 4, 5, N'ss', N'2-1.png', CAST(N'2019-04-19T11:36:33.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (6, N'W01', N'홍길동', NULL, N'afadsda@gmail.com', N'010-2541-2541', 1, 1, N'서울시 은평구 갈현동 214-21', NULL, CAST(N'2019-04-19T05:11:33.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (7, N'W02', N'이문기', NULL, N'dfsdd@gmail.com', N'010-2354-1254', 2, 2, N'서울시', NULL, CAST(N'2019-04-19T05:13:55.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (8, N'W03', N'이상열', NULL, N'asdfsd@gmail.com', N'010-2154-2154', 3, 3, N'서울시', NULL, CAST(N'2019-04-19T05:15:55.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (9, N'W04', N'양만춘', NULL, N'dfasf@naer.com', N'010-2541-1541', 5, 4, N'경기도', N'스크린샷 2019-05-03 오후 10.53.40.png', CAST(N'2019-04-19T05:16:53.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (10, N'W05', N'조용필', NULL, N'fdadsf@naver.com', N'010-2541-2541', 6, 4, N'경상북도', NULL, CAST(N'2019-04-19T05:17:47.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (11, N'W06', N'이미연', NULL, N'sdfsdaf@naver.com', N'010-2547-2547', 9, 3, N'서울시', N'style_5a92dac2bdc8b-807x1024.jpg', CAST(N'2019-04-19T05:18:23.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (12, N'W07', N'김종대', NULL, N'afsff@naver.com', N'010-2145-2547', 8, 4, N'경기도', NULL, CAST(N'2019-04-19T05:19:11.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (13, N'W08', N'김만복', NULL, N'sdff@naver.com', N'010-2547-8547', 7, 5, N'인천시 동구 가좌동 동부APT 102동 302호', NULL, CAST(N'2019-04-19T05:20:21.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (14, N'W09', N'이순신', NULL, N'sdfsdf@gmail.com', N'010-2547-2547', 7, 6, N'부산시', NULL, CAST(N'2019-04-19T05:21:15.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [employeecode], [name], [permission], [email], [phonenumber], [position], [department], [address], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (15, N'W10', N'문문문', NULL, N'rddi@ddod.com', N'123-123456-56', 3, 4, NULL, N'다운로드33.jpg', CAST(N'2019-05-09T22:06:56.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[historybillsale] ON 

INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (1, NULL, N'[{"id":13,"orderdate":null,"tradingmission":14,"terms":"??","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A02","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"? ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-01"}]', N'[{"name":"ordernumber","vl":"P20190122A02"},{"name":"employer","vl":"???"},{"name":"tradingmission","vl":"????"},{"name":"phone","vl":"051-2354-2514"},{"name":"terms","vl":"??"},{"name":"warehouse","vl":"????"},{"name":"orderdate","vl":"2019.01.23"},{"name":"paymoney","vl":"10,000,000"},{"name":"notebill","vl":"20190123-01"},{"name":"dateconfirmation","vl":"2019.01.23"},{"name":"remark","vl":""},{"name":"currency","vl":"? "}]', CAST(N'2019-05-10T17:02:41.000' AS DateTime), NULL, NULL, NULL, N'edit bill', N'order7be0efae3c204e6dae60c3bca572be1b', NULL, NULL)
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (2, NULL, N'[{"id":30,"iditem":15,"nameitem":"??5","standard":"2134*3048","quantityincase":30.0,"qltcase":5.0,"price":4121.0,"pricesupply":8657270.0,"vat":865727.0,"totalamount":9523000.0,"qltcontainer":1,"sqm":975.0,"remark":null,"datecreate":"2019-05-07T00:14:22","lastupdate":null,"usercreate":null,"userupdate":null,"codeitem":"15","codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","codeship":"shipe9919205759a4249aef2b2a00b2731f1"},{"id":31,"iditem":16,"nameitem":"??3","standard":"2134*3048","quantityincase":35.0,"qltcase":5.0,"price":2782.0,"pricesupply":6818180.0,"vat":681818.0,"totalamount":7500000.0,"qltcontainer":1,"sqm":1138.0,"remark":null,"datecreate":"2019-05-07T00:30:56","lastupdate":null,"usercreate":null,"userupdate":null,"codeitem":"16","codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","codeship":"shipe9919205759a4249aef2b2a00b2731f1"}]', N'[{"codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","codeitem":"0015","nameitem":"??5","standard":"2134*3048","quantityincase":"30","qltcase":"5","price":"4121","pricesupply":"8657270","vat":"865727","totalamount":"9523000","qltcontainer":"1","sumpake":"975","remark":"","codebill":"order7be0efae3c204e6dae60c3bca572be1b","iditem":"15"},{"codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","codeitem":"0016","nameitem":"??3","standard":"2134*3048","quantityincase":"35","qltcase":"5","price":"2782","pricesupply":"6818180","vat":"681818","totalamount":"7500000","qltcontainer":"1","sumpake":"1138","remark":"","codebill":"order7be0efae3c204e6dae60c3bca572be1b","iditem":"16"}]', CAST(N'2019-05-10T17:02:42.000' AS DateTime), NULL, NULL, NULL, N'edit detail buy', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190122A02', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A02","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-01"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (3, NULL, N'[{"id":75,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T11:33:49","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":76,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T11:33:49","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"},{"id":77,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T11:33:49","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":1.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-07T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"ship_2","indexbox":"01-2"},{"id":78,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T11:33:49","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":2.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-24T00:00:00","serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"ship_3","indexbox":"02-3"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.07"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"ship_2"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"1"},{"name":"indexbox","vl":"01-2"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.24"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"ship_3"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"2"},{"name":"indexbox","vl":"02-3"}]]', CAST(N'2019-05-10T15:27:51.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-01', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-01"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (4, NULL, N'[{"id":88,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:27:51","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":89,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:27:51","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"},{"id":90,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:27:51","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":1.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-07T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"ship_2","indexbox":"01-2"},{"id":91,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:27:51","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":2.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-24T00:00:00","serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"ship_3","indexbox":"02-3"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-10T15:31:55.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-02', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-02"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (5, NULL, N'[{"id":85,"codebill":"orderfe6b6f85660b4e39bc0b0af940bfe22d","codeid":"dtbuy6bf12e2913ef4094b99b915197992f8d","orderbill":null,"numbership":"fddffa1254","duedate":"2018-12-25T00:00:00","departuredate":"2018-12-28T00:00:00","dateofarrival":"2019-01-04T00:00:00","conDuedate":"2019-01-31T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-10T13:51:22","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"????","qltbox":5.0,"dateclearance":"2019-01-09T00:00:00","customsday":"2019-01-09T00:00:00","port":"B","containernumber":"fsdff15466","daycertificate":"2019-01-10T00:00:00","sizefit":"40 ft","containerday":"2019-01-31T00:00:00","conreturnday":"2019-01-31T00:00:00","requestday":"2019-01-11T00:00:00","confirmreceiptday":"2019-01-10T00:00:00","serinumber":"20181201B0004-01,20181201B0004-02,20181201B0004-03,20181201B0004-04,20181201B0004-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":86,"codebill":"orderfe6b6f85660b4e39bc0b0af940bfe22d","codeid":"dtbuy558460c54b704cbab9f99f5b540c2f89","orderbill":null,"numbership":"fddffa1254","duedate":"2018-12-25T00:00:00","departuredate":"2018-12-28T00:00:00","dateofarrival":"2019-01-04T00:00:00","conDuedate":"2019-01-31T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-10T13:51:22","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"????","qltbox":5.0,"dateclearance":"2019-01-09T00:00:00","customsday":"2019-01-09T00:00:00","port":"B","containernumber":"fsdffs1545","daycertificate":"2019-01-10T00:00:00","sizefit":"20 ft","containerday":"2019-01-31T00:00:00","conreturnday":"2019-01-31T00:00:00","requestday":"2019-01-11T00:00:00","confirmreceiptday":"2019-01-10T00:00:00","serinumber":"20181201B0006-01,20181201B0006-02,20181201B0006-03,20181201B0006-04,20181201B0006-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"dateclearance","vl":"2019.01.09"},{"name":"customsday","vl":"2019.01.09"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fsdff15466"},{"name":"daycertificate","vl":"2019.01.10"},{"name":"sizefit","vl":"40 ft"},{"name":"containerday","vl":"2019.01.31"},{"name":"conreturnday","vl":"2019.01.31"},{"name":"requestday","vl":"2019.01.11"},{"name":"confirmreceiptday","vl":"2019.01.10"},{"name":"serinumber","vl":"20181201B0004-05,20181201B0004-04,20181201B0004-03,20181201B0004-02,20181201B0004-01"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy6bf12e2913ef4094b99b915197992f8d"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"},{"name":"numbership","vl":"fddffa1254"},{"name":"duedate","vl":"2018.12.25"},{"name":"departuredate","vl":"2018.12.28"},{"name":"dateofarrival","vl":"2019.01.04"},{"name":"conDuedate","vl":"2019.01.31"},{"name":"nameshipname","vl":"????"}],[{"name":"dateclearance","vl":"2019.01.09"},{"name":"customsday","vl":"2019.01.09"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fsdffs1545"},{"name":"daycertificate","vl":"2019.01.10"},{"name":"sizefit","vl":"20 ft"},{"name":"containerday","vl":"2019.01.31"},{"name":"conreturnday","vl":"2019.01.31"},{"name":"requestday","vl":"2019.01.11"},{"name":"confirmreceiptday","vl":"2019.01.10"},{"name":"serinumber","vl":"20181201B0006-05,20181201B0006-04,20181201B0006-03,20181201B0006-02,20181201B0006-01"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy558460c54b704cbab9f99f5b540c2f89"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"},{"name":"numbership","vl":"fddffa1254"},{"name":"duedate","vl":"2018.12.25"},{"name":"departuredate","vl":"2018.12.28"},{"name":"dateofarrival","vl":"2019.01.04"},{"name":"conDuedate","vl":"2019.01.31"},{"name":"nameshipname","vl":"????"}]]', CAST(N'2019-05-11T00:02:31.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'P20181204A14-01', N'{"id":1,"orderdate":null,"tradingmission":45,"terms":"CIF","contractdate":"2018-12-01T00:00:00","orderingemployer":7,"customer":null,"warehouse":2,"paymoney":150000000.0,"ordernumber":"P20181204A18","remark":"test change","dateconfirmation":"2018-12-06T00:00:00","datecreate":"2019-04-24T03:50:23","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":"인천 창고","codeid":"orderfe6b6f85660b4e39bc0b0af940bfe22d","phone":"086-2514-254-8415","notebill":null,"currency":"$ ","paymentoption":null,"note":"aadaa1546","money":15620.0,"tolerancepercent":4.0,"tolerancemoney":624.8,"usance":60.0,"datebeginpayment":"2018-12-08T00:00:00","creditduedate":"2019-03-07T00:00:00","orderbill":"P20181204A14-01"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (6, NULL, N'[{"id":94,"codebill":"orderfe6b6f85660b4e39bc0b0af940bfe22d","codeid":"dtbuy6bf12e2913ef4094b99b915197992f8d","orderbill":null,"numbership":"fddffa1254","duedate":"2018-12-25T00:00:00","departuredate":"2018-12-28T00:00:00","dateofarrival":"2019-01-04T00:00:00","conDuedate":"2019-01-31T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-11T00:02:31","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"????","qltbox":5.0,"dateclearance":"2019-01-09T00:00:00","customsday":"2019-01-09T00:00:00","port":"B","containernumber":"fsdff15466","daycertificate":"2019-01-10T00:00:00","sizefit":"40 ft","containerday":"2019-01-31T00:00:00","conreturnday":"2019-01-31T00:00:00","requestday":"2019-01-11T00:00:00","confirmreceiptday":"2019-01-10T00:00:00","serinumber":"20181201B0004-05,20181201B0004-04,20181201B0004-03,20181201B0004-02,20181201B0004-01","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":95,"codebill":"orderfe6b6f85660b4e39bc0b0af940bfe22d","codeid":"dtbuy558460c54b704cbab9f99f5b540c2f89","orderbill":null,"numbership":"fddffa1254","duedate":"2018-12-25T00:00:00","departuredate":"2018-12-28T00:00:00","dateofarrival":"2019-01-04T00:00:00","conDuedate":"2019-01-31T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-11T00:02:31","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"????","qltbox":5.0,"dateclearance":"2019-01-09T00:00:00","customsday":"2019-01-09T00:00:00","port":"B","containernumber":"fsdffs1545","daycertificate":"2019-01-10T00:00:00","sizefit":"20 ft","containerday":"2019-01-31T00:00:00","conreturnday":"2019-01-31T00:00:00","requestday":"2019-01-11T00:00:00","confirmreceiptday":"2019-01-10T00:00:00","serinumber":"20181201B0006-05,20181201B0006-04,20181201B0006-03,20181201B0006-02,20181201B0006-01","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"dateclearance","vl":"2019.01.09"},{"name":"customsday","vl":"2019.01.09"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fsdff15466"},{"name":"daycertificate","vl":"2019.01.10"},{"name":"sizefit","vl":"40 ft"},{"name":"containerday","vl":"2019.01.31"},{"name":"conreturnday","vl":"2019.01.31"},{"name":"requestday","vl":"2019.01.11"},{"name":"confirmreceiptday","vl":"2019.01.10"},{"name":"serinumber","vl":"20181201B0004-01,20181201B0004-02,20181201B0004-03,20181201B0004-04,20181201B0004-05"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy6bf12e2913ef4094b99b915197992f8d"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"},{"name":"numbership","vl":"fddffa1254"},{"name":"duedate","vl":"2018.12.25"},{"name":"departuredate","vl":"2018.12.28"},{"name":"dateofarrival","vl":"2019.01.04"},{"name":"conDuedate","vl":"2019.01.31"},{"name":"nameshipname","vl":"????"}],[{"name":"dateclearance","vl":"2019.01.09"},{"name":"customsday","vl":"2019.01.09"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fsdffs1545"},{"name":"daycertificate","vl":"2019.01.10"},{"name":"sizefit","vl":"20 ft"},{"name":"containerday","vl":"2019.01.31"},{"name":"conreturnday","vl":"2019.01.31"},{"name":"requestday","vl":"2019.01.11"},{"name":"confirmreceiptday","vl":"2019.01.10"},{"name":"serinumber","vl":"20181201B0006-01,20181201B0006-02,20181201B0006-03,20181201B0006-04,20181201B0006-05"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy558460c54b704cbab9f99f5b540c2f89"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"},{"name":"numbership","vl":"fddffa1254"},{"name":"duedate","vl":"2018.12.25"},{"name":"departuredate","vl":"2018.12.28"},{"name":"dateofarrival","vl":"2019.01.04"},{"name":"conDuedate","vl":"2019.01.31"},{"name":"nameshipname","vl":"????"}]]', CAST(N'2019-05-11T00:10:25.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'P20181204A14-02', N'{"id":1,"orderdate":null,"tradingmission":45,"terms":"CIF","contractdate":"2018-12-01T00:00:00","orderingemployer":7,"customer":null,"warehouse":2,"paymoney":150000000.0,"ordernumber":"P20181204A18","remark":"test change","dateconfirmation":"2018-12-06T00:00:00","datecreate":"2019-04-24T03:50:23","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":"인천 창고","codeid":"orderfe6b6f85660b4e39bc0b0af940bfe22d","phone":"086-2514-254-8415","notebill":null,"currency":"$ ","paymentoption":null,"note":"aadaa1546","money":15620.0,"tolerancepercent":4.0,"tolerancemoney":624.8,"usance":60.0,"datebeginpayment":"2018-12-08T00:00:00","creditduedate":"2019-03-07T00:00:00","orderbill":"P20181204A14-02"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (7, NULL, N'[{"id":92,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:31:55","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":93,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T15:31:55","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":"190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-11T00:59:44.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-03', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-03"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (8, NULL, N'[{"id":98,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T00:59:44","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":99,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T00:59:44","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":"190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-11T01:02:58.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-04', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-04"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (9, NULL, N'[{"id":100,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:02:58","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":101,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:02:58","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":"190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-11T01:05:39.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-05', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-05"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (10, NULL, N'[{"id":102,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:05:39","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":103,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:05:39","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":"190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.05.02"},{"name":"confirmreceiptday","vl":""},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":"190515K0016-05,190515K0016-04,190515K0016-03,190515K0016-02,190515K0016-01"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-11T01:07:10.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-06', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-06"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (11, NULL, N'[{"id":87,"codebill":"order9cf63e4db534408f83c708a38ecaa03e","codeid":"dtbuy743ee09a00134c99af970d01a8d5b4ce","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-10T17:09:24","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-01-15T00:00:00","confirmreceiptday":null,"serinumber":"190116K0013-01,190116K0013-02,190116K0013-03,190116K0013-04,190116K0013-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"T/T"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.01.15"},{"name":"confirmreceiptday","vl":"2019.01.16"},{"name":"serinumber","vl":"190116K0013-01,190116K0013-02,190116K0013-03,190116K0013-04,190116K0013-05"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy743ee09a00134c99af970d01a8d5b4ce"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}]]', CAST(N'2019-05-11T09:56:01.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order9cf63e4db534408f83c708a38ecaa03e', N'P20190110A03-01', N'{"id":6,"orderdate":null,"tradingmission":15,"terms":"내수","contractdate":"2019-01-11T00:00:00","orderingemployer":7,"customer":null,"warehouse":1,"paymoney":15000000.0,"ordernumber":"P20190110A03","remark":"note","dateconfirmation":"2019-01-11T00:00:00","datecreate":"2019-04-30T23:24:21","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":"인천 창고","codeid":"order9cf63e4db534408f83c708a38ecaa03e","phone":"031-2547-5847","notebill":"20190111-01","currency":"₩ ","paymentoption":"T/T","note":null,"money":9504120.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190110A03-01"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (12, NULL, N'[{"id":104,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy9e4a0431abee4b54a60c1324d999a067","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:07:10","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":"2019-05-02T00:00:00","confirmreceiptday":null,"serinumber":"190128K0015-01,190128K0015-02,190128K0015-03,190128K0015-04,190128K0015-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":105,"codebill":"order7be0efae3c204e6dae60c3bca572be1b","codeid":"dtbuy3437c1444d054f1d861ab3f4e5294b69","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-11T01:07:11","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":null,"conreturnday":null,"requestday":null,"confirmreceiptday":"2019-05-15T00:00:00","serinumber":"190515K0016-05,190515K0016-04,190515K0016-03,190515K0016-02,190515K0016-01","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"}]', N'[[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":"2019.01.28"},{"name":"confirmreceiptday","vl":"2019.01.28"},{"name":"serinumber","vl":"190128K0015-01,190128K0015-02,190128K0015-03,190128K0015-04,190128K0015-05"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy9e4a0431abee4b54a60c1324d999a067"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"01-1"}],[{"name":"orderbill","vl":""},{"name":"paymentoption","vl":"L/C"},{"name":"money","vl":""},{"name":"requestday","vl":""},{"name":"confirmreceiptday","vl":"2019.05.15"},{"name":"serinumber","vl":"190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy3437c1444d054f1d861ab3f4e5294b69"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"}]]', CAST(N'2019-05-11T09:59:10.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order7be0efae3c204e6dae60c3bca572be1b', N'P20190304A02-07', N'{"id":13,"orderdate":null,"tradingmission":14,"terms":"내수","contractdate":"2019-01-23T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":10000000.0,"ordernumber":"P20190122A03","remark":null,"dateconfirmation":"2019-01-23T00:00:00","datecreate":"2019-05-06T17:28:38","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"order7be0efae3c204e6dae60c3bca572be1b","phone":"051-2354-2514","notebill":"20190123-01","currency":"₩ ","paymentoption":"L/C","note":null,"money":17023000.0,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":"P20190304A02-07"}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (13, NULL, N'[{"id":15,"orderdate":null,"tradingmission":17,"terms":"CIF","contractdate":"2019-02-04T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":23000000.0,"ordernumber":"P20190201A01","remark":null,"dateconfirmation":"2019-02-04T00:00:00","datecreate":"2019-05-10T17:16:17","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"ordere347bd25f7584bf6b822e2e9e3205879","phone":"085-257-524-2547","notebill":"20190204-01","currency":"$ ","paymentoption":null,"note":null,"money":null,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":null}]', N'[{"name":"ordernumber","vl":"P20190201A01"},{"name":"employer","vl":"???"},{"name":"tradingmission","vl":"ASIA"},{"name":"phone","vl":"085-257-524-2547"},{"name":"terms","vl":"CIF"},{"name":"warehouse","vl":"????"},{"name":"orderdate","vl":"2019.02.04"},{"name":"paymoney","vl":"23,000,000"},{"name":"notebill","vl":"20190204-01"},{"name":"dateconfirmation","vl":"2019.02.04"},{"name":"remark","vl":""},{"name":"currency","vl":"$ "}]', CAST(N'2019-05-11T10:03:22.000' AS DateTime), NULL, NULL, NULL, N'edit bill', N'ordere347bd25f7584bf6b822e2e9e3205879', NULL, NULL)
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (14, NULL, N'[{"id":34,"iditem":2,"nameitem":"???5","standard":"1830*2440","quantityincase":40.0,"qltcase":5.0,"price":4.0,"pricesupply":9560.0,"vat":956.0,"totalamount":10520.0,"qltcontainer":1,"sqm":893.0,"remark":null,"datecreate":"2019-05-10T17:16:17","lastupdate":null,"usercreate":null,"userupdate":null,"codeitem":"2","codebill":"ordere347bd25f7584bf6b822e2e9e3205879","codeid":"dtbuy5aa2d43cb9c04045a0d7f182b5c8fb71","codeship":null}]', N'[{"codeid":"dtbuy5aa2d43cb9c04045a0d7f182b5c8fb71","codeitem":"0002","nameitem":"???5","standard":"1830*2440","quantityincase":"40","qltcase":"10","price":"4","pricesupply":"9560","vat":"956","totalamount":"10520","qltcontainer":"1","sumpake":"1786","remark":"","codebill":"ordere347bd25f7584bf6b822e2e9e3205879","iditem":"2"}]', CAST(N'2019-05-11T10:03:22.000' AS DateTime), NULL, NULL, NULL, N'edit detail buy', N'ordere347bd25f7584bf6b822e2e9e3205879', N'P20190201A01', N'{"id":15,"orderdate":null,"tradingmission":17,"terms":"CIF","contractdate":"2019-02-04T00:00:00","orderingemployer":6,"customer":null,"warehouse":1,"paymoney":23000000.0,"ordernumber":"P20190201A01","remark":null,"dateconfirmation":"2019-02-04T00:00:00","datecreate":"2019-05-10T17:16:17","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":null,"codeid":"ordere347bd25f7584bf6b822e2e9e3205879","phone":"085-257-524-2547","notebill":"20190204-01","currency":"$ ","paymentoption":null,"note":null,"money":null,"tolerancepercent":null,"tolerancemoney":null,"usance":null,"datebeginpayment":null,"creditduedate":null,"orderbill":null}')
INSERT [dbo].[historybillsale] ([id], [idold], [contenold], [contennew], [datecreate], [lastupdate], [usercreate], [userupdate], [actions], [codeid], [subcode], [inforbill]) VALUES (15, NULL, N'[{"id":54,"codebill":"order22d373d0cab74677b0a4b98a8add699d","codeid":"dtbuy8cf3481cbe7248e3a1a937bee54fbf29","orderbill":null,"numbership":"fdsdf15644","duedate":"2019-01-21T00:00:00","departuredate":"2019-01-24T00:00:00","dateofarrival":"2019-01-30T00:00:00","conDuedate":"2019-03-15T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-09T20:59:41","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"musk","qltbox":10.0,"dateclearance":"2019-02-05T00:00:00","customsday":"2019-02-08T00:00:00","port":"B","containernumber":"afdsafads154","daycertificate":"2019-02-08T00:00:00","sizefit":"40 ft","containerday":"2019-03-15T00:00:00","conreturnday":null,"requestday":"2019-02-06T00:00:00","confirmreceiptday":"2019-02-11T00:00:00","serinumber":"190211B0001-01,190211B0001-02,190211B0001-03,190211B0001-04,190211B0001-05,190211B0001-06,190211B0001-07,190211B0001-08,190211B0001-09,190211B0001-10","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"01-1"},{"id":55,"codebill":"order22d373d0cab74677b0a4b98a8add699d","codeid":"dtbuy0fc8c555bda94a67a1b083403525e0f5","orderbill":null,"numbership":"fdsdf15644","duedate":"2019-01-21T00:00:00","departuredate":"2019-01-24T00:00:00","dateofarrival":"2019-01-30T00:00:00","conDuedate":"2019-03-15T00:00:00","shipname":null,"remark":null,"datecreate":"2019-05-09T20:59:41","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":"musk","qltbox":5.0,"dateclearance":"2019-02-05T00:00:00","customsday":"2019-02-08T00:00:00","port":"B","containernumber":"fdfa1547","daycertificate":"2019-02-08T00:00:00","sizefit":"20 ft","containerday":"2019-03-15T00:00:00","conreturnday":null,"requestday":"2019-02-06T00:00:00","confirmreceiptday":"2019-02-11T00:00:00","serinumber":"190211B0003-01,190211B0003-02,190211B0003-03,190211B0003-04,190211B0003-05","prodcode":null,"casenom":null,"proddate":null,"shipnum":"shipone","indexbox":"02-1"},{"id":56,"codebill":"order22d373d0cab74677b0a4b98a8add699d","codeid":"dtbuy0fc8c555bda94a67a1b083403525e0f5","orderbill":null,"numbership":null,"duedate":null,"departuredate":null,"dateofarrival":null,"conDuedate":null,"shipname":null,"remark":null,"datecreate":"2019-05-09T20:59:41","lastupdate":null,"usercreate":null,"userupdate":null,"nameshipname":null,"qltbox":5.0,"dateclearance":null,"customsday":null,"port":null,"containernumber":null,"daycertificate":null,"sizefit":null,"containerday":"2019-03-15T00:00:00","conreturnday":null,"requestday":null,"confirmreceiptday":null,"serinumber":null,"prodcode":null,"casenom":null,"proddate":null,"shipnum":"ship_2","indexbox":"02-2"}]', N'[[{"name":"dateclearance","vl":"2019.02.05"},{"name":"customsday","vl":"2019.02.08"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"afdsafads154"},{"name":"daycertificate","vl":"2019.02.08"},{"name":"sizefit","vl":"40 ft"},{"name":"containerday","vl":"2019.03.15"},{"name":"conreturnday","vl":""},{"name":"requestday","vl":"2019.02.06"},{"name":"confirmreceiptday","vl":"2019.02.11"},{"name":"serinumber","vl":"190211B0001-10,190211B0001-09,190211B0001-08,190211B0001-07,190211B0001-06,190211B0001-05,190211B0001-04,190211B0001-03,190211B0001-02,190211B0001-01"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy8cf3481cbe7248e3a1a937bee54fbf29"},{"name":"qltBox","vl":"10"},{"name":"indexbox","vl":"01-1"},{"name":"numbership","vl":"fdsdf15644"},{"name":"duedate","vl":"2019.01.21"},{"name":"departuredate","vl":"2019.01.24"},{"name":"dateofarrival","vl":"2019.01.30"},{"name":"conDuedate","vl":"2019.03.15"},{"name":"nameshipname","vl":"musk"}],[{"name":"dateclearance","vl":"2019.02.05"},{"name":"customsday","vl":"2019.02.08"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fdfa1547"},{"name":"daycertificate","vl":"2019.02.08"},{"name":"sizefit","vl":"20 ft"},{"name":"containerday","vl":"2019.03.15"},{"name":"conreturnday","vl":""},{"name":"requestday","vl":"2019.02.06"},{"name":"confirmreceiptday","vl":"2019.02.11"},{"name":"serinumber","vl":"190211B0003-05,190211B0003-04,190211B0003-03,190211B0003-02,190211B0003-01"},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"shipone"},{"name":"codeid","vl":"dtbuy0fc8c555bda94a67a1b083403525e0f5"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-1"},{"name":"numbership","vl":"fdsdf15644"},{"name":"duedate","vl":"2019.01.21"},{"name":"departuredate","vl":"2019.01.24"},{"name":"dateofarrival","vl":"2019.01.30"},{"name":"conDuedate","vl":"2019.03.15"},{"name":"nameshipname","vl":"musk"}],[{"name":"dateclearance","vl":"2019.02.25"},{"name":"customsday","vl":"2019.02.27"},{"name":"port","vl":"B"},{"name":"containernumber","vl":"fdafdf15242"},{"name":"daycertificate","vl":"2019.02.27"},{"name":"sizefit","vl":"20 ft"},{"name":"containerday","vl":"2019.03.31"},{"name":"conreturnday","vl":""},{"name":"requestday","vl":"2019.02.26"},{"name":"confirmreceiptday","vl":"2019.02.28"},{"name":"serinumber","vl":""},{"name":"prodcode","vl":""},{"name":"casenom","vl":""},{"name":"proddate","vl":""},{"name":"ship","vl":"ship_2"},{"name":"codeid","vl":"dtbuy0fc8c555bda94a67a1b083403525e0f5"},{"name":"qltBox","vl":"5"},{"name":"indexbox","vl":"02-2"},{"name":"numbership","vl":"sdadd2145"},{"name":"duedate","vl":"2019.02.12"},{"name":"departuredate","vl":"2019.02.15"},{"name":"dateofarrival","vl":"2019.02.21"},{"name":"conDuedate","vl":"2019.03.31"},{"name":"nameshipname","vl":"musk"}]]', CAST(N'2019-05-11T10:25:02.000' AS DateTime), NULL, NULL, NULL, N'Edit ship', N'order22d373d0cab74677b0a4b98a8add699d', N'P20181225A04-01', N'{"id":4,"orderdate":null,"tradingmission":17,"terms":"CIF","contractdate":"2018-12-26T00:00:00","orderingemployer":6,"customer":null,"warehouse":2,"paymoney":23000000.0,"ordernumber":"P20181225A04","remark":null,"dateconfirmation":"2018-12-27T00:00:00","datecreate":"2019-04-24T10:53:29","lastupdate":null,"usercreate":null,"userupdate":null,"namewarehouse":"인천 창고","codeid":"order22d373d0cab74677b0a4b98a8add699d","phone":"085-2547-5284-2547","notebill":null,"currency":"$ ","paymentoption":"L/C","note":"fdafdf1422","money":51850.0,"tolerancepercent":4.0,"tolerancemoney":2074.0,"usance":90.0,"datebeginpayment":"2019-01-02T00:00:00","creditduedate":"2019-05-01T00:00:00","orderbill":"P20181225A04-01"}')
SET IDENTITY_INSERT [dbo].[historybillsale] OFF
SET IDENTITY_INSERT [dbo].[Inputwarehouse] ON 

INSERT [dbo].[Inputwarehouse] ([id], [seriesnum], [destination], [rowdestination], [YajiSelection], [rowYaji], [container], [itemid], [itemcode], [itemname], [size], [qltincase], [qltbox], [problems], [defecttype], [manufacturer], [remarksitem], [location], [purchasenotes], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [inspnumber]) VALUES (3, N'string', N'string', N'string', N'string', N'string', N'string', NULL, N'string', N'string', N'string', 5, 5, N'5', N'string', N'string', N'string', N'string', N'string', N'string', NULL, NULL, NULL, NULL, N'I201904261153')
INSERT [dbo].[Inputwarehouse] ([id], [seriesnum], [destination], [rowdestination], [YajiSelection], [rowYaji], [container], [itemid], [itemcode], [itemname], [size], [qltincase], [qltbox], [problems], [defecttype], [manufacturer], [remarksitem], [location], [purchasenotes], [attachments], [datecreate], [lastupdate], [usercreate], [userupdate], [inspnumber]) VALUES (4, N'string', N'string', N'string', N'string', N'string', N'string', NULL, N'string', N'string', N'string', 5, 5, N'tr', N'string', N'string', N'string', N'string', N'string', N'string', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Inputwarehouse] OFF
SET IDENTITY_INSERT [dbo].[inspection] ON 

INSERT [dbo].[inspection] ([id], [inspnumber], [codebill], [warehouse], [workerone], [workertwo], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [warehousename], [employeeone], [employeetwo]) VALUES (1, N'I201904261153', NULL, 2, 7, 8, N'ere', CAST(N'2019-04-26T11:57:29.000' AS DateTime), NULL, NULL, NULL, N'인천창고', N'ewe 34', N'43er')
INSERT [dbo].[inspection] ([id], [inspnumber], [codebill], [warehouse], [workerone], [workertwo], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [warehousename], [employeeone], [employeetwo]) VALUES (2, N'I201904161352', NULL, 2, 7, 10, N'668', CAST(N'2019-04-26T13:52:11.000' AS DateTime), NULL, NULL, NULL, N'인천창고', N'2', N'23')
INSERT [dbo].[inspection] ([id], [inspnumber], [codebill], [warehouse], [workerone], [workertwo], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [warehousename], [employeeone], [employeetwo]) VALUES (3, NULL, NULL, 2, 7, 7, NULL, CAST(N'2019-04-28T07:35:50.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[inspection] ([id], [inspnumber], [codebill], [warehouse], [workerone], [workertwo], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [warehousename], [employeeone], [employeetwo]) VALUES (4, NULL, NULL, 2, 7, 7, NULL, CAST(N'2019-04-28T07:35:53.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[inspection] ([id], [inspnumber], [codebill], [warehouse], [workerone], [workertwo], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [warehousename], [employeeone], [employeetwo]) VALUES (5, NULL, NULL, 2, 7, 7, NULL, CAST(N'2019-04-28T07:35:53.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[inspection] OFF
SET IDENTITY_INSERT [dbo].[ItemList] ON 

INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (1, N'1', NULL, N'고방5', 40, 178.61, 40, N'17', N'Select one', NULL, CAST(N'2019-04-19T08:55:27.000' AS DateTime), NULL, NULL, NULL, N'1830*2440', NULL, NULL, 1524300, 1623500, 1300000, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (2, N'2', NULL, N'다이아5', 40, 178.61, 12, N'17', N'Select one', NULL, CAST(N'2019-04-19T09:00:49.000' AS DateTime), NULL, NULL, NULL, N'1830*2440', NULL, NULL, 800000, 850000, 900000, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (3, N'3', NULL, N'다이아5', 35, 182.24, 10, N'17', N'Select one', NULL, CAST(N'2019-04-19T09:02:23.000' AS DateTime), NULL, NULL, NULL, N'2134*2440', NULL, NULL, 950000, 1000000, 1100000, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (4, N'4', NULL, N'초백5', 31, 218.92, 5, N'45', N'Select one', NULL, CAST(N'2019-04-19T09:03:59.000' AS DateTime), NULL, NULL, NULL, N'2140*3300', NULL, NULL, 1200000, 1300000, 1400000, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (5, N'5', NULL, N'초백5', 26, 203.64, 4, N'45', N'Select one', NULL, CAST(N'2019-04-19T09:05:01.000' AS DateTime), NULL, NULL, NULL, N'2140*3660', NULL, NULL, 1350000, 1500000, 1600000, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (6, N'6', NULL, N'오셔닉5', 38, 212.1, 4, N'45', N'Select one', NULL, CAST(N'2019-04-19T09:06:12.000' AS DateTime), NULL, NULL, NULL, N'1830*3050', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (7, N'7', NULL, N'오셔닉5', 33, 214.38, 4, N'45', N'Select one', NULL, CAST(N'2019-04-19T09:07:19.000' AS DateTime), NULL, NULL, NULL, N'2130*3050', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (8, N'8', NULL, N'미스트5', 33, 214.24, 10, N'46', N'Select one', NULL, CAST(N'2019-04-19T09:08:12.000' AS DateTime), NULL, NULL, NULL, N'2130*3048', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (9, N'9', NULL, N'미스트5', 40, 178.61, 10, N'46', N'Select one', NULL, CAST(N'2019-04-19T09:08:40.000' AS DateTime), NULL, NULL, NULL, N'1830*2440', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (10, N'10', NULL, N'미스트3', 36, 200.93, 10, N'46', N'Select one', NULL, CAST(N'2019-04-19T09:09:29.000' AS DateTime), NULL, NULL, NULL, N'1830*3050', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (11, N'11', NULL, N'워터큐브5', 40, 178.61, 4, N'47', N'Select one', NULL, CAST(N'2019-04-19T09:10:45.000' AS DateTime), NULL, NULL, NULL, N'1830*2440', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (12, N'12', NULL, N'워터큐브7', 35, 195.35, 5, N'47', N'2', NULL, CAST(N'2019-04-19T09:11:49.000' AS DateTime), NULL, NULL, NULL, N'1830*3050', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (13, N'13', NULL, N'은경5', 30, 195.13, 10, N'15', N'Select one', NULL, CAST(N'2019-05-03T05:36:07.000' AS DateTime), NULL, NULL, NULL, N'2134*3048', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (14, N'14', NULL, N'은경3', 35, 227.66, 10, N'15', N'Select one', NULL, CAST(N'2019-05-03T05:37:16.000' AS DateTime), NULL, NULL, NULL, N'2134*3048', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (15, N'15', NULL, N'동경5', 30, 195.13, 10, N'14', N'Select one', NULL, CAST(N'2019-05-03T05:37:44.000' AS DateTime), NULL, NULL, NULL, N'2134*3048', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (16, N'16', NULL, N'동경3', 35, 227.66, 10, N'14', N'Select one', NULL, CAST(N'2019-05-03T05:38:14.000' AS DateTime), NULL, NULL, NULL, N'2134*3048', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ItemList] ([id], [itemcode], [itemduzoncode], [itemname], [quantityincase], [specifiedarea], [safetystockquantity], [manufacturer], [status], [itembrief], [datecreate], [lastupdate], [usercreate], [userupdate], [standard], [isdelete], [width], [unitprice1], [unitprice2], [unitprice3], [height]) VALUES (17, N'17', NULL, N'213123', 2, 0, 2, N'14', N'2', N'3', CAST(N'2019-05-03T23:06:25.000' AS DateTime), NULL, NULL, NULL, N'10*10', NULL, NULL, 1000, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ItemList] OFF
SET IDENTITY_INSERT [dbo].[jigo_location] ON 

INSERT [dbo].[jigo_location] ([id], [warehourse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (1, 1, N'1jigo', N'description', NULL, N'reg_user', N'n         ')
INSERT [dbo].[jigo_location] ([id], [warehourse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (2, 1, N'2jigo', N'description', NULL, N'reg_user', N'n         ')
INSERT [dbo].[jigo_location] ([id], [warehourse_location_id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (3, 1, N'3jigo', N'description', NULL, N'reg_user', N'n         ')
SET IDENTITY_INSERT [dbo].[jigo_location] OFF
SET IDENTITY_INSERT [dbo].[orderslips] ON 

INSERT [dbo].[orderslips] ([id], [orderdate], [salesrepresentative], [customercompany], [customercontacts], [terms], [receivables], [warehouse], [issuedate], [contactphone], [frame], [destinationaddress], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid], [transactionbalancectm]) VALUES (1, N'S20190304A02', 9, 49, N'032-2541-2541', N'내수', 0, 1, CAST(N'2019-03-05T00:00:00.000' AS DateTime), N'032-2145-9864', N'한국', N'인천시 남동구 가좌동 345-312', NULL, CAST(N'2019-04-24T09:15:21.000' AS DateTime), NULL, NULL, NULL, N'orderb06de0235ef7459d95fd15dc22b870fe', 20000000)
INSERT [dbo].[orderslips] ([id], [orderdate], [salesrepresentative], [customercompany], [customercontacts], [terms], [receivables], [warehouse], [issuedate], [contactphone], [frame], [destinationaddress], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid], [transactionbalancectm]) VALUES (2, N'S20190307A02', 12, 50, N'051-9856-9847', N'내수', NULL, 1, CAST(N'2019-03-08T00:00:00.000' AS DateTime), N'051-2541-2154', N'KCC', N'부산시 중욱 2154-54', N'ㄹㅇㄴㅇㄹ', CAST(N'2019-04-24T11:54:33.000' AS DateTime), NULL, NULL, NULL, N'order05be9f19116e4822b0640f895e09afd6', 1500000)
INSERT [dbo].[orderslips] ([id], [orderdate], [salesrepresentative], [customercompany], [customercontacts], [terms], [receivables], [warehouse], [issuedate], [contactphone], [frame], [destinationaddress], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid], [transactionbalancectm]) VALUES (3, N'S20190311A01', 12, 51, N'051-2541-2354', N'내수', NULL, 1, CAST(N'2019-03-13T00:00:00.000' AS DateTime), N'051-3214-2211', N'KCC', N'부산시 동구 2323-232', NULL, CAST(N'2019-04-25T05:04:02.000' AS DateTime), NULL, NULL, NULL, N'orderc4ce1c26283646b6a09364b3d6606846', 6600000)
INSERT [dbo].[orderslips] ([id], [orderdate], [salesrepresentative], [customercompany], [customercontacts], [terms], [receivables], [warehouse], [issuedate], [contactphone], [frame], [destinationaddress], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid], [transactionbalancectm]) VALUES (4, N'S20190314A01', 9, 48, N'031-2547-2315', N'내수', NULL, 1, CAST(N'2019-03-18T00:00:00.000' AS DateTime), N'031-2547-9854', N'KCC', N'경기도 파주시1254-5666', NULL, CAST(N'2019-04-25T06:00:45.000' AS DateTime), NULL, NULL, NULL, N'order5ebd9e41edcf4737a2d88f93f29cce7b', 15000000)
INSERT [dbo].[orderslips] ([id], [orderdate], [salesrepresentative], [customercompany], [customercontacts], [terms], [receivables], [warehouse], [issuedate], [contactphone], [frame], [destinationaddress], [remarks], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid], [transactionbalancectm]) VALUES (5, N'S20190501A03', 7, 45, N'086-2514-254-8415', N'내수', NULL, 2, CAST(N'2019-05-15T00:00:00.000' AS DateTime), N'086-2541-584-5147-5821', N'Select one', N'dffghfghf', NULL, CAST(N'2019-05-03T23:18:42.000' AS DateTime), NULL, NULL, NULL, N'ordera547a64a77d045a28a2b070919926e67', 15000000)
SET IDENTITY_INSERT [dbo].[orderslips] OFF
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([id], [codeorder], [paymentdate], [employer], [customer], [transactionterms], [cashT_T], [billL_C], [paymentaccount], [feesmoney], [remark], [codebill], [codeid], [datecreate], [lastupdate], [usercreate], [userupdate], [employerstr]) VALUES (1, N'P20181204A09', CAST(N'2019-01-07T00:00:00.000' AS DateTime), 6, 45, N'외수', 5000, 10600, N'154-2547-2561', 20, N'1212', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', NULL, CAST(N'2019-04-25T21:42:01.000' AS DateTime), NULL, NULL, NULL, N'???')
INSERT [dbo].[payment] ([id], [codeorder], [paymentdate], [employer], [customer], [transactionterms], [cashT_T], [billL_C], [paymentaccount], [feesmoney], [remark], [codebill], [codeid], [datecreate], [lastupdate], [usercreate], [userupdate], [employerstr]) VALUES (3, N'P20181204A09', CAST(N'2019-01-07T00:00:00.000' AS DateTime), 6, 45, N'외수', 5000, 10600, N'154-2547-2561', 20, N'1212', N'orderfe6b6f85660b4e39bc0b0af940bfe22d', NULL, CAST(N'2019-04-25T21:47:36.000' AS DateTime), NULL, NULL, NULL, N'???')
INSERT [dbo].[payment] ([id], [codeorder], [paymentdate], [employer], [customer], [transactionterms], [cashT_T], [billL_C], [paymentaccount], [feesmoney], [remark], [codebill], [codeid], [datecreate], [lastupdate], [usercreate], [userupdate], [employerstr]) VALUES (4, N'P20190102A03', CAST(N'2019-05-04T00:00:00.000' AS DateTime), -1, 45, N'내수', 10000000, 1000000, N'154-2547-2561', 100000, N'r', N'order318f737595b34431adadb467296f951a', NULL, CAST(N'2019-05-04T03:47:57.000' AS DateTime), NULL, NULL, NULL, N'test')
SET IDENTITY_INSERT [dbo].[payment] OFF
SET IDENTITY_INSERT [dbo].[paymentOrder] ON 

INSERT [dbo].[paymentOrder] ([id], [codeorder], [paymentdate], [employer], [customer], [transactionterms], [cashT_T], [billL_C], [paymentaccount], [feesmoney], [remark], [codebill], [codeid], [datecreate], [lastupdate], [usercreate], [userupdate], [employerstr]) VALUES (1, N'S20190307A02', CAST(N'2019-04-09T00:00:00.000' AS DateTime), -1, 50, N'내수', 23434, 3434, N'021-25418-547', 2343, N'323', N'order05be9f19116e4822b0640f895e09afd6', NULL, CAST(N'2019-04-25T21:52:16.000' AS DateTime), NULL, NULL, NULL, N'ewew')
INSERT [dbo].[paymentOrder] ([id], [codeorder], [paymentdate], [employer], [customer], [transactionterms], [cashT_T], [billL_C], [paymentaccount], [feesmoney], [remark], [codebill], [codeid], [datecreate], [lastupdate], [usercreate], [userupdate], [employerstr]) VALUES (2, N'S20190501A03', CAST(N'2019-05-04T00:00:00.000' AS DateTime), -1, 45, N'내수', 7000000, 700000, N'154-2547-2561', 7000, NULL, N'ordera547a64a77d045a28a2b070919926e67', NULL, CAST(N'2019-05-04T03:51:08.000' AS DateTime), NULL, NULL, NULL, N'tew')
SET IDENTITY_INSERT [dbo].[paymentOrder] OFF
SET IDENTITY_INSERT [dbo].[plans] ON 

INSERT [dbo].[plans] ([id], [worker], [time], [money], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid]) VALUES (1, 9, CAST(N'2019-02-01' AS Date), 15000000, N'323gg', CAST(N'2019-04-28T01:49:02.000' AS DateTime), NULL, NULL, NULL, N'plana88cd0e7bdbe47e1bfb640a41e55dd5c')
INSERT [dbo].[plans] ([id], [worker], [time], [money], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid]) VALUES (2, 8, CAST(N'2019-05-01' AS Date), 25356300000, N'테스트', CAST(N'2019-05-06T16:14:57.000' AS DateTime), NULL, NULL, NULL, N'plan2b8eca64371c42b68178399155893044')
SET IDENTITY_INSERT [dbo].[plans] OFF
SET IDENTITY_INSERT [dbo].[position] ON 

INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (1, N'대표이사', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (2, N'전무이사', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (3, N'상무이사', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (4, N'이사', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (5, N'부장', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (6, N'차장', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (7, N'과장', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (8, N'대리', NULL)
INSERT [dbo].[position] ([id], [name], [isdelete]) VALUES (9, N'사원', NULL)
SET IDENTITY_INSERT [dbo].[position] OFF
SET IDENTITY_INSERT [dbo].[ship] ON 

INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (57, N'orderb1d8516442624950b4f144064eb8fd1c', N'dtbuy57df9e7bfc0d49138ab02aabc646ee98', NULL, N'daffsd1542', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2019-02-13T00:00:00.000' AS DateTime), CAST(N'2019-02-19T00:00:00.000' AS DateTime), CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-09T21:32:08.000' AS DateTime), NULL, NULL, NULL, N'musk', 5, CAST(N'2019-02-25T00:00:00.000' AS DateTime), CAST(N'2019-02-25T00:00:00.000' AS DateTime), N'B', N'arrawrawr17', CAST(N'2019-02-25T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, CAST(N'2019-02-26T00:00:00.000' AS DateTime), CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'190226B0006-01,190226B0006-02,190226B0006-03,190226B0006-04,190226B0006-05', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (58, N'orderb1d8516442624950b4f144064eb8fd1c', N'dtbuya1276b40f584459da4d2b507e0b07e1f', NULL, N'daffsd1542', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2019-02-13T00:00:00.000' AS DateTime), CAST(N'2019-02-19T00:00:00.000' AS DateTime), CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-09T21:32:08.000' AS DateTime), NULL, NULL, NULL, N'musk', 10, CAST(N'2019-02-25T00:00:00.000' AS DateTime), CAST(N'2019-02-25T00:00:00.000' AS DateTime), N'B', N'zffsfsdfdf2145', CAST(N'2019-02-25T00:00:00.000' AS DateTime), N'40 ft', CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, CAST(N'2019-02-26T00:00:00.000' AS DateTime), CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'190226B0007-01,190226B0007-02,190226B0007-03,190226B0007-04,190226B0007-05,190226B0007-06,190226B0007-07,190226B0007-08,190226B0007-09,190226B0007-10', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (61, N'orderb58e6e0c45194a3f8a9eb82dbc208f41', N'dtbuy3e7d108035b040bab2f79b6a83851241', NULL, N'aagggg126', CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2019-01-14T00:00:00.000' AS DateTime), CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-09T21:54:01.000' AS DateTime), NULL, NULL, NULL, N'현대상선', 5, CAST(N'2019-01-17T00:00:00.000' AS DateTime), CAST(N'2019-01-16T00:00:00.000' AS DateTime), N'B', N'asdff15487', CAST(N'2019-01-16T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, CAST(N'2019-01-18T00:00:00.000' AS DateTime), CAST(N'2019-01-17T00:00:00.000' AS DateTime), N'190117B0011-05,190117B0011-04,190117B0011-03,190117B0011-02,190117B0011-01', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (62, N'orderb58e6e0c45194a3f8a9eb82dbc208f41', N'dtbuy1b334d34eb264abe91098f5b98bfda02', NULL, N'aagggg126', CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2019-01-14T00:00:00.000' AS DateTime), CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-09T21:54:01.000' AS DateTime), NULL, NULL, NULL, N'현대상선', 5, CAST(N'2019-01-17T00:00:00.000' AS DateTime), CAST(N'2019-01-16T00:00:00.000' AS DateTime), N'B', N'aafdfaf1542', CAST(N'2019-01-16T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, CAST(N'2019-01-18T00:00:00.000' AS DateTime), CAST(N'2019-01-17T00:00:00.000' AS DateTime), N'190117B0012-05,190117B0012-04,190117B0012-03,190117B0012-02,190117B0012-01', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (73, N'order615b6314bdf945d7b78fdb21024305e8', N'dtbuy508b60014d8841aaa7a0b53a01f5ad60', NULL, N'dfs14546', CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2019-01-11T00:00:00.000' AS DateTime), CAST(N'2019-01-17T00:00:00.000' AS DateTime), CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-10T11:06:24.000' AS DateTime), NULL, NULL, NULL, N'musk', 10, CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'B', N'sdfsdf1544', CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'40 ft', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2019-02-04T00:00:00.000' AS DateTime), CAST(N'2019-01-23T00:00:00.000' AS DateTime), CAST(N'2019-01-22T00:00:00.000' AS DateTime), N'190122B0010-01,190122B0010-02,190122B0010-03,190122B0010-04,190122B0010-05,190122B0010-06,190122B0010-07,190122B0010-08,190122B0010-09,190122B0010-10', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (74, N'order615b6314bdf945d7b78fdb21024305e8', N'dtbuy60f71d904d6c4dbfae675659b03438b4', NULL, N'dfs14546', CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2019-01-11T00:00:00.000' AS DateTime), CAST(N'2019-01-17T00:00:00.000' AS DateTime), CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-10T11:06:24.000' AS DateTime), NULL, NULL, NULL, N'musk', 8, CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'B', N'sdfsdf65465', CAST(N'2019-01-21T00:00:00.000' AS DateTime), N'40 ft', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2019-02-04T00:00:00.000' AS DateTime), CAST(N'2019-01-23T00:00:00.000' AS DateTime), CAST(N'2019-01-22T00:00:00.000' AS DateTime), N'190422B0008-01,190422B0008-02,190422B0008-03,190422B0008-04,190422B0008-05,190422B0008-06,190422B0008-07,190422B0008-08', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (96, N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'dtbuy6bf12e2913ef4094b99b915197992f8d', NULL, N'fddffa1254', CAST(N'2018-12-25T00:00:00.000' AS DateTime), CAST(N'2018-12-28T00:00:00.000' AS DateTime), CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-11T00:10:25.000' AS DateTime), NULL, NULL, NULL, N'현대해상', 5, CAST(N'2019-01-09T00:00:00.000' AS DateTime), CAST(N'2019-01-09T00:00:00.000' AS DateTime), N'B', N'fsdff15466', CAST(N'2019-01-10T00:00:00.000' AS DateTime), N'40 ft', CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-11T00:00:00.000' AS DateTime), CAST(N'2019-01-10T00:00:00.000' AS DateTime), N'20181201B0004-01,20181201B0004-02,20181201B0004-03,20181201B0004-04,20181201B0004-05', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (97, N'orderfe6b6f85660b4e39bc0b0af940bfe22d', N'dtbuy558460c54b704cbab9f99f5b540c2f89', NULL, N'fddffa1254', CAST(N'2018-12-25T00:00:00.000' AS DateTime), CAST(N'2018-12-28T00:00:00.000' AS DateTime), CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-11T00:10:25.000' AS DateTime), NULL, NULL, NULL, N'현대해상', 5, CAST(N'2019-01-09T00:00:00.000' AS DateTime), CAST(N'2019-01-09T00:00:00.000' AS DateTime), N'B', N'fsdffs1545', CAST(N'2019-01-10T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-11T00:00:00.000' AS DateTime), CAST(N'2019-01-10T00:00:00.000' AS DateTime), N'20181201B0006-01,20181201B0006-02,20181201B0006-03,20181201B0006-04,20181201B0006-05', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (106, N'order9cf63e4db534408f83c708a38ecaa03e', N'dtbuy743ee09a00134c99af970d01a8d5b4ce', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-11T09:56:01.000' AS DateTime), NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-01-15T00:00:00.000' AS DateTime), CAST(N'2019-01-16T00:00:00.000' AS DateTime), N'190116K0013-01,190116K0013-02,190116K0013-03,190116K0013-04,190116K0013-05', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (107, N'order7be0efae3c204e6dae60c3bca572be1b', N'dtbuy9e4a0431abee4b54a60c1324d999a067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-11T09:59:10.000' AS DateTime), NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-01-28T00:00:00.000' AS DateTime), CAST(N'2019-01-28T00:00:00.000' AS DateTime), N'190128K0015-01,190128K0015-02,190128K0015-03,190128K0015-04,190128K0015-05', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (108, N'order7be0efae3c204e6dae60c3bca572be1b', N'dtbuy3437c1444d054f1d861ab3f4e5294b69', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-11T09:59:10.000' AS DateTime), NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-15T00:00:00.000' AS DateTime), N'190515K0016-01,190515K0016-02,190515K0016-03,190515K0016-04,190515K0016-05', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (109, N'order22d373d0cab74677b0a4b98a8add699d', N'dtbuy8cf3481cbe7248e3a1a937bee54fbf29', NULL, N'fdsdf15644', CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2019-01-24T00:00:00.000' AS DateTime), CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2019-03-15T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-11T10:25:02.000' AS DateTime), NULL, NULL, NULL, N'musk', 10, CAST(N'2019-02-05T00:00:00.000' AS DateTime), CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'B', N'afdsafads154', CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'40 ft', CAST(N'2019-03-15T00:00:00.000' AS DateTime), NULL, CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2019-02-11T00:00:00.000' AS DateTime), N'190211B0001-10,190211B0001-09,190211B0001-08,190211B0001-07,190211B0001-06,190211B0001-05,190211B0001-04,190211B0001-03,190211B0001-02,190211B0001-01', NULL, NULL, NULL, N'shipone', N'01-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (110, N'order22d373d0cab74677b0a4b98a8add699d', N'dtbuy0fc8c555bda94a67a1b083403525e0f5', NULL, N'fdsdf15644', CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2019-01-24T00:00:00.000' AS DateTime), CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2019-03-15T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-11T10:25:02.000' AS DateTime), NULL, NULL, NULL, N'musk', 5, CAST(N'2019-02-05T00:00:00.000' AS DateTime), CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'B', N'fdfa1547', CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-03-15T00:00:00.000' AS DateTime), NULL, CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2019-02-11T00:00:00.000' AS DateTime), N'190211B0003-05,190211B0003-04,190211B0003-03,190211B0003-02,190211B0003-01', NULL, NULL, NULL, N'shipone', N'02-1')
INSERT [dbo].[ship] ([id], [codebill], [codeid], [orderbill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [nameshipname], [qltbox], [dateclearance], [customsday], [port], [containernumber], [daycertificate], [sizefit], [containerday], [conreturnday], [requestday], [confirmreceiptday], [serinumber], [prodcode], [casenom], [proddate], [shipnum], [indexbox]) VALUES (111, N'order22d373d0cab74677b0a4b98a8add699d', N'dtbuy0fc8c555bda94a67a1b083403525e0f5', NULL, N'sdadd2145', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'2019-02-15T00:00:00.000' AS DateTime), CAST(N'2019-02-21T00:00:00.000' AS DateTime), CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2019-05-11T10:25:02.000' AS DateTime), NULL, NULL, NULL, N'musk', 5, CAST(N'2019-02-25T00:00:00.000' AS DateTime), CAST(N'2019-02-27T00:00:00.000' AS DateTime), N'B', N'fdafdf15242', CAST(N'2019-02-27T00:00:00.000' AS DateTime), N'20 ft', CAST(N'2019-03-31T00:00:00.000' AS DateTime), NULL, CAST(N'2019-02-26T00:00:00.000' AS DateTime), CAST(N'2019-02-28T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, N'ship_2', N'02-2')
SET IDENTITY_INSERT [dbo].[ship] OFF
SET IDENTITY_INSERT [dbo].[styleItem] ON 

INSERT [dbo].[styleItem] ([id], [name], [size], [code], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete]) VALUES (1, N'test', 232, N'MY', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[styleItem] OFF
SET IDENTITY_INSERT [dbo].[subship] ON 

INSERT [dbo].[subship] ([id], [idbill], [codebill], [numbership], [duedate], [departuredate], [dateofarrival], [conDuedate], [shipname], [remark], [datecreate], [lastupdate], [usercreate], [userupdate]) VALUES (1, 2, N'bill56d05f3cd33d49cda89c671db2e67876', N'hh', CAST(N'2019-04-03T00:00:00.000' AS DateTime), CAST(N'2019-04-15T00:00:00.000' AS DateTime), CAST(N'2019-04-24T00:00:00.000' AS DateTime), CAST(N'2019-04-22T00:00:00.000' AS DateTime), N'45', N'4444', CAST(N'2019-04-20T23:45:08.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[subship] OFF
SET IDENTITY_INSERT [dbo].[table_detail_erorr] ON 

INSERT [dbo].[table_detail_erorr] ([id], [Item_id], [Defect_type], [remark], [serinum], [Documents_attach], [datecreate], [lastupdate], [usercreate], [userupdate], [qltincase], [qltbox], [qltremove], [remarkremove], [codebill]) VALUES (1, 1, N'심부파손', NULL, N'111111', N'Upload file', CAST(N'2019-05-03T03:17:06.000' AS DateTime), NULL, NULL, NULL, 40, 2, NULL, NULL, N'plan1af70c700f4b4480b77714208e48438e')
INSERT [dbo].[table_detail_erorr] ([id], [Item_id], [Defect_type], [remark], [serinum], [Documents_attach], [datecreate], [lastupdate], [usercreate], [userupdate], [qltincase], [qltbox], [qltremove], [remarkremove], [codebill]) VALUES (32, 1, N'부분파손', N'243', N'w12', NULL, CAST(N'2019-05-03T11:46:34.000' AS DateTime), NULL, NULL, NULL, 30, 1, 10, NULL, N'plan631bd0c3140e48b5be5dc353e63821b5')
INSERT [dbo].[table_detail_erorr] ([id], [Item_id], [Defect_type], [remark], [serinum], [Documents_attach], [datecreate], [lastupdate], [usercreate], [userupdate], [qltincase], [qltbox], [qltremove], [remarkremove], [codebill]) VALUES (33, 2, N'심부파손', NULL, N'w23', NULL, CAST(N'2019-05-03T11:46:34.000' AS DateTime), NULL, NULL, NULL, 20, 1, 15, NULL, N'plan631bd0c3140e48b5be5dc353e63821b5')
SET IDENTITY_INSERT [dbo].[table_detail_erorr] OFF
SET IDENTITY_INSERT [dbo].[Table_Erorr] ON 

INSERT [dbo].[Table_Erorr] ([id], [numbercode], [poor_handling_charge], [warehouse_id], [defective_processing_type], [approved], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid]) VALUES (1, N'B2019050301', 7, 1, N'폐기', CAST(N'2019-05-03T00:00:00.000' AS DateTime), NULL, CAST(N'2019-05-03T03:16:25.000' AS DateTime), NULL, NULL, NULL, N'plan1af70c700f4b4480b77714208e48438e')
INSERT [dbo].[Table_Erorr] ([id], [numbercode], [poor_handling_charge], [warehouse_id], [defective_processing_type], [approved], [remark], [datecreate], [lastupdate], [usercreate], [userupdate], [codeid]) VALUES (2, N'B2019050301', 6, 1, N'대체', CAST(N'2019-05-03T00:00:00.000' AS DateTime), NULL, CAST(N'2019-05-03T03:17:38.000' AS DateTime), NULL, NULL, NULL, N'plan631bd0c3140e48b5be5dc353e63821b5')
SET IDENTITY_INSERT [dbo].[Table_Erorr] OFF
SET IDENTITY_INSERT [dbo].[tradingmission] ON 

INSERT [dbo].[tradingmission] ([id], [name], [isdelete]) VALUES (1, N'담당 선택하면', NULL)
INSERT [dbo].[tradingmission] ([id], [name], [isdelete]) VALUES (2, N'담당 거래처리스트 팝업', NULL)
INSERT [dbo].[tradingmission] ([id], [name], [isdelete]) VALUES (3, N'전체 선택시', NULL)
INSERT [dbo].[tradingmission] ([id], [name], [isdelete]) VALUES (4, N'NUL전체 거래처 팝업L', NULL)
SET IDENTITY_INSERT [dbo].[tradingmission] OFF
SET IDENTITY_INSERT [dbo].[warehouse] ON 

INSERT [dbo].[warehouse] ([id], [warehousecode], [name], [brief], [telephone], [address], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [subname]) VALUES (1, N'ICN01', N'인천', N'인천', N'032-5214-2351', N'인천시 가좌동323-012', CAST(N'2019-04-19T04:46:28.000' AS DateTime), NULL, NULL, NULL, NULL, N'인천창고')
INSERT [dbo].[warehouse] ([id], [warehousecode], [name], [brief], [telephone], [address], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [subname]) VALUES (2, N'BUS01', N'부산', N'김해', N'051-2354-2541', N'부산시 김해동 251-23', CAST(N'2019-04-19T04:48:54.000' AS DateTime), NULL, NULL, NULL, NULL, N'김해창고')
INSERT [dbo].[warehouse] ([id], [warehousecode], [name], [brief], [telephone], [address], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [subname]) VALUES (3, N'BUS02', N'부산', N'양산', N'051-3254-2254', N'부산시 양산구 215-215', CAST(N'2019-04-19T04:50:05.000' AS DateTime), NULL, NULL, NULL, NULL, N'양산창고')
INSERT [dbo].[warehouse] ([id], [warehousecode], [name], [brief], [telephone], [address], [datecreate], [lastupdate], [usercreate], [userupdate], [isdelete], [subname]) VALUES (4, N'ICN02', N'인천', N'인천창고', N'010-133-2323', N'가좌동', CAST(N'2019-05-03T23:09:23.000' AS DateTime), NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[warehouse] OFF
SET IDENTITY_INSERT [dbo].[warehouse_location] ON 

INSERT [dbo].[warehouse_location] ([id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (1, N'인천창고', N'description warehouse_location 양산창고', NULL, N'reg_user', N'y/n       ')
INSERT [dbo].[warehouse_location] ([id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (2, N'양산창고', N'description warehouse_location 양산창고', NULL, N'reg_user', N'y/n       ')
INSERT [dbo].[warehouse_location] ([id], [location], [description], [reg_date], [reg_user], [del_yn]) VALUES (3, N'김해창고', N'description warehouse_location 양산창고', NULL, N'reg_user', N'y/n       ')
SET IDENTITY_INSERT [dbo].[warehouse_location] OFF
ALTER TABLE [dbo].[rawyaji_location]  WITH CHECK ADD  CONSTRAINT [FK_rawyaji_location_jigo_location] FOREIGN KEY([yaji_location_id])
REFERENCES [dbo].[jigo_location] ([id])
GO
ALTER TABLE [dbo].[rawyaji_location] CHECK CONSTRAINT [FK_rawyaji_location_jigo_location]
GO
ALTER TABLE [dbo].[rowjigo_location]  WITH CHECK ADD  CONSTRAINT [FK_rowjigo_location_jigo_location] FOREIGN KEY([jigo_location_id])
REFERENCES [dbo].[jigo_location] ([id])
GO
ALTER TABLE [dbo].[rowjigo_location] CHECK CONSTRAINT [FK_rowjigo_location_jigo_location]
GO
USE [master]
GO
ALTER DATABASE [hansung] SET  READ_WRITE 
GO
