USE [master]
GO
/****** Object:  Database [CB_Test]    Script Date: 10/5/2020 10:22:54 PM ******/
CREATE DATABASE [CB_Test_1]
Go
USE [CB_Test]
GO
/****** Object:  StoredProcedure [dbo].[SP_MasterAccount]    Script Date: 10/5/2020 10:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MasterAccount]
AS
BEGIN
	

if exists(select * from MasterAccount )
begin
	truncate table MasterAccount
end 

Insert into MasterAccount 
select	a.ID, 
		a.Name,
		a.AccountNo, 
		a.OriginalBalance-b.HoldBalance as availableBalance
from Account a
	join HoldBalance b on a.ID=b.ID

END

GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/5/2020 10:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[OriginalBalance] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoldBalance]    Script Date: 10/5/2020 10:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoldBalance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](50) NULL,
	[HoldBalance] [nchar](10) NULL,
 CONSTRAINT [PK_HoldBalance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterAccount]    Script Date: 10/5/2020 10:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterAccount](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[AvailableBalance] [decimal](18, 0) NULL,
 CONSTRAINT [PK_MasterAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

GO
INSERT [dbo].[Account] ([ID], [Name], [AccountNo], [OriginalBalance]) VALUES (1, N'Budi', N'12345654321', CAST(10000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Account] ([ID], [Name], [AccountNo], [OriginalBalance]) VALUES (2, N'Ani', N'56789098765', CAST(12000000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[HoldBalance] ON 

GO
INSERT [dbo].[HoldBalance] ([ID], [AccountNo], [HoldBalance]) VALUES (1, N'12345654321', N'500000    ')
GO
INSERT [dbo].[HoldBalance] ([ID], [AccountNo], [HoldBalance]) VALUES (2, N'56789098765', N'800000    ')
GO
SET IDENTITY_INSERT [dbo].[HoldBalance] OFF
GO
INSERT [dbo].[MasterAccount] ([ID], [Name], [AccountNo], [AvailableBalance]) VALUES (1, N'Budi', N'12345654321', CAST(9500000 AS Decimal(18, 0)))
GO
INSERT [dbo].[MasterAccount] ([ID], [Name], [AccountNo], [AvailableBalance]) VALUES (2, N'Ani', N'56789098765', CAST(11200000 AS Decimal(18, 0)))
GO
