USE [master]
GO
/****** Object:  Database [EventPublisherDB]    Script Date: 20.4.2018 12:28:10 ******/
CREATE DATABASE [EventPublisherDB]
 CONTAINMENT = NONE
GO
ALTER DATABASE [EventPublisherDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventPublisherDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventPublisherDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventPublisherDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventPublisherDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventPublisherDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventPublisherDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventPublisherDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventPublisherDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EventPublisherDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventPublisherDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventPublisherDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventPublisherDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventPublisherDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventPublisherDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventPublisherDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventPublisherDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventPublisherDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventPublisherDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventPublisherDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventPublisherDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventPublisherDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventPublisherDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventPublisherDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventPublisherDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventPublisherDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventPublisherDB] SET  MULTI_USER 
GO
ALTER DATABASE [EventPublisherDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventPublisherDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventPublisherDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventPublisherDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EventPublisherDB]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 20.4.2018 12:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Event] [int] NOT NULL,
	[Attendance] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ID_City] [int] NOT NULL,
	[ID_Type] [int] NOT NULL,
	[ID_Place] [int] NOT NULL,
	[StartEvent] [datetime] NOT NULL,
	[EndEvent] [datetime] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Approved] [bit] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Place]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceName] [nvarchar](200) NOT NULL,
	[ID_City] [int] NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PubEvent]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PubEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Publisher] [int] NOT NULL,
	[ID_Event] [int] NOT NULL,
 CONSTRAINT [PK_PubEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NOT NULL,
	[ID_City] [int] NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[ID_User] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 20.4.2018 12:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([ID], [ID_Event], [Attendance]) VALUES (1, 1, 100)
INSERT [dbo].[Attendance] ([ID], [ID_Event], [Attendance]) VALUES (2, 2, 60)
INSERT [dbo].[Attendance] ([ID], [ID_Event], [Attendance]) VALUES (4, 3, 0)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'Bitola')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Skopje')
INSERT [dbo].[City] ([ID], [Name]) VALUES (3, N'Ohrid')
INSERT [dbo].[City] ([ID], [Name]) VALUES (4, N'Kicevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (5, N'Gostivar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (6, N'Prilep')
INSERT [dbo].[City] ([ID], [Name]) VALUES (7, N'Stip')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [Name], [ID_City], [ID_Type], [ID_Place], [StartEvent], [EndEvent], [Description], [Approved]) VALUES (1, N'Turnir vo mal fudbal', 1, 1, 1, CAST(0x0000A8C6011826C0 AS DateTime), CAST(0x0000A8D001391C40 AS DateTime), N'Turnir vo mal fudbal', 0)
INSERT [dbo].[Event] ([ID], [Name], [ID_City], [ID_Type], [ID_Place], [StartEvent], [EndEvent], [Description], [Approved]) VALUES (2, N'Koncert', 1, 1, 1, CAST(0x0000A8C9017B0740 AS DateTime), CAST(0x0000A8CA00317040 AS DateTime), N'Koncert na najpoznatite makedonski zvezdi', 0)
INSERT [dbo].[Event] ([ID], [Name], [ID_City], [ID_Type], [ID_Place], [StartEvent], [EndEvent], [Description], [Approved]) VALUES (3, N'Izlozba', 3, 5, 2, CAST(0x0000A8E600C5C100 AS DateTime), CAST(0x0000A8E600E6B680 AS DateTime), N'Izlozba na crtezi', 0)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([ID], [PlaceName], [ID_City]) VALUES (1, N'Saat Kula', 1)
INSERT [dbo].[Place] ([ID], [PlaceName], [ID_City]) VALUES (2, N'Kej', 3)
INSERT [dbo].[Place] ([ID], [PlaceName], [ID_City]) VALUES (3, N'Kaneo', 3)
INSERT [dbo].[Place] ([ID], [PlaceName], [ID_City]) VALUES (4, N'Stadion Boris Trajkovski', 2)
SET IDENTITY_INSERT [dbo].[Place] OFF
SET IDENTITY_INSERT [dbo].[PubEvent] ON 

INSERT [dbo].[PubEvent] ([ID], [ID_Publisher], [ID_Event]) VALUES (1, 5, 1)
INSERT [dbo].[PubEvent] ([ID], [ID_Publisher], [ID_Event]) VALUES (2, 7, 2)
INSERT [dbo].[PubEvent] ([ID], [ID_Publisher], [ID_Event]) VALUES (3, 5, 3)
SET IDENTITY_INSERT [dbo].[PubEvent] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([ID], [Name], [CompanyName], [Email], [ID_City], [PhoneNumber], [ID_User]) VALUES (1, N'Dejan Stankovski', N'Interworks', N'dejan.stankovski@gmail.com', 1, N'078123456', N'1')
INSERT [dbo].[Publisher] ([ID], [Name], [CompanyName], [Email], [ID_City], [PhoneNumber], [ID_User]) VALUES (4, N'Daniel Ristevski', N'Seavus', N'daniel123@hotmail.com', 2, N'077987654', N'2')
INSERT [dbo].[Publisher] ([ID], [Name], [CompanyName], [Email], [ID_City], [PhoneNumber], [ID_User]) VALUES (5, N'Hristina Georgievska', N'Endava', N'gorgievskahristina1996@gmail.com', 6, N'077135791', N'3')
INSERT [dbo].[Publisher] ([ID], [Name], [CompanyName], [Email], [ID_City], [PhoneNumber], [ID_User]) VALUES (6, N'Sara Kotevska', NULL, N'kotevskasara@gmail.com', 1, N'078098765', N'4')
INSERT [dbo].[Publisher] ([ID], [Name], [CompanyName], [Email], [ID_City], [PhoneNumber], [ID_User]) VALUES (7, N'Martin Ristevski', N'Interworks', N'martin1998@hotmail.com', 7, N'076123890', N'5')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([ID], [Type]) VALUES (1, N'Sport')
INSERT [dbo].[Type] ([ID], [Type]) VALUES (2, N'Seminar')
INSERT [dbo].[Type] ([ID], [Type]) VALUES (3, N'Proslava')
INSERT [dbo].[Type] ([ID], [Type]) VALUES (4, N'Muzika')
INSERT [dbo].[Type] ([ID], [Type]) VALUES (5, N'Izlozba')
SET IDENTITY_INSERT [dbo].[Type] OFF
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_Attendance]  DEFAULT ((0)) FOR [Attendance]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Event_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Event] FOREIGN KEY([ID_Event])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Event]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_City] FOREIGN KEY([ID_City])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_City]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Place] FOREIGN KEY([ID_Place])
REFERENCES [dbo].[Place] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Place]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Type] FOREIGN KEY([ID_Type])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Type]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_City] FOREIGN KEY([ID_City])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_City]
GO
ALTER TABLE [dbo].[PubEvent]  WITH CHECK ADD  CONSTRAINT [FK_PubEvent_Event] FOREIGN KEY([ID_Event])
REFERENCES [dbo].[Event] ([ID])
GO
ALTER TABLE [dbo].[PubEvent] CHECK CONSTRAINT [FK_PubEvent_Event]
GO
ALTER TABLE [dbo].[PubEvent]  WITH CHECK ADD  CONSTRAINT [FK_PubEvent_Publisher] FOREIGN KEY([ID_Publisher])
REFERENCES [dbo].[Publisher] ([ID])
GO
ALTER TABLE [dbo].[PubEvent] CHECK CONSTRAINT [FK_PubEvent_Publisher]
GO
ALTER TABLE [dbo].[Publisher]  WITH CHECK ADD  CONSTRAINT [FK_Publisher_City] FOREIGN KEY([ID_City])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Publisher] CHECK CONSTRAINT [FK_Publisher_City]
GO
USE [master]
GO
ALTER DATABASE [EventPublisherDB] SET  READ_WRITE 
GO
