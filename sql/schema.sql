USE [DiagnosticLabDB]
GO
/****** Object:  Table [lab].[Booking]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[BookingDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lab].[BookingTest]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[BookingTest](
	[BookingTestID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[TestID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lab].[Patient]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [char](1) NULL,
	[Age] [int] NULL,
	[RegisteredDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lab].[Payment]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[PaidAmount] [decimal](10, 2) NULL,
	[PaymentMode] [varchar](30) NULL,
	[PaidOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lab].[Report]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[Status] [varchar](30) NULL,
	[DispatchedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lab].[Test]    Script Date: 23-05-2026 15:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lab].[Test](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NULL,
	[Department] [nvarchar](100) NULL,
	[MRP] [decimal](10, 2) NULL,
	[TAT_Hours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [lab].[Booking]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [lab].[Patient] ([PatientID])
GO
ALTER TABLE [lab].[BookingTest]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [lab].[Booking] ([BookingID])
GO
ALTER TABLE [lab].[BookingTest]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [lab].[Test] ([TestID])
GO
ALTER TABLE [lab].[Payment]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [lab].[Booking] ([BookingID])
GO
ALTER TABLE [lab].[Report]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [lab].[Booking] ([BookingID])
GO
