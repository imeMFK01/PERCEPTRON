USE [master]
GO
/****** Object:  Database [PerceptronDatabase]    Script Date: 4/19/2021 1:08:12 PM ******/
CREATE DATABASE [PerceptronDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PerceptronDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PerceptronDatabase.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PerceptronDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PerceptronDatabase_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PerceptronDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PerceptronDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PerceptronDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PerceptronDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PerceptronDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PerceptronDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PerceptronDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PerceptronDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [PerceptronDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [PerceptronDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PerceptronDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PerceptronDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PerceptronDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PerceptronDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PerceptronDatabase', N'ON'
GO
ALTER DATABASE [PerceptronDatabase] SET QUERY_STORE = OFF
GO
USE [PerceptronDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PerceptronDatabase]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 4/19/2021 1:08:12 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 4/19/2021 1:08:12 PM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
/****** Object:  Table [dbo].[ExecutionTimes]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecutionTimes](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[InsilicoTime] [nvarchar](max) NULL,
	[PtmTime] [nvarchar](max) NULL,
	[TunerTime] [nvarchar](max) NULL,
	[MwFilterTime] [nvarchar](max) NULL,
	[PstTime] [nvarchar](max) NULL,
	[TotalTime] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[TruncationEngineTime] [nvarchar](max) NULL,
 CONSTRAINT [PK_ExecutionTimes] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[JobSubmission] ASC,
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeakListData]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeakListData](
	[JobSubmission] [datetime2](7) NOT NULL,
	[FileUniqueId] [nvarchar](128) NOT NULL,
	[PeakListMasses] [nvarchar](max) NULL,
	[PeakListIntensities] [nvarchar](max) NULL,
 CONSTRAINT [PK_PeakListData] PRIMARY KEY CLUSTERED 
(
	[FileUniqueId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerceptronSdk]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerceptronSdk](
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[ResultsAvailable] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PerceptronSdk] PRIMARY KEY CLUSTERED 
(
	[JobSubmission] ASC,
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PtmFixedModifications]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PtmFixedModifications](
	[JobSubmission] [datetime2](7) NOT NULL,
	[ModificationId] [int] IDENTITY(1,1) NOT NULL,
	[QueryId] [nvarchar](128) NULL,
	[FixedModifications] [nvarchar](max) NULL,
 CONSTRAINT [PK_PtmFixedModifications] PRIMARY KEY CLUSTERED 
(
	[ModificationId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PtmVariableModifications]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PtmVariableModifications](
	[JobSubmission] [datetime2](7) NOT NULL,
	[ModificationId] [int] IDENTITY(1,1) NOT NULL,
	[QueryId] [nvarchar](128) NULL,
	[VariableModifications] [nvarchar](max) NULL,
 CONSTRAINT [PK_PtmVariableModifications_1] PRIMARY KEY CLUSTERED 
(
	[JobSubmission] ASC,
	[ModificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultInsilicoMatchLefts]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultInsilicoMatchLefts](
	[ResultId] [nvarchar](max) NULL,
	[MatchedPeaks] [nvarchar](max) NULL,
	[RowId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_dbo.ResultInsilicoMatchLefts] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultInsilicoMatchRights]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultInsilicoMatchRights](
	[ResultId] [nvarchar](max) NULL,
	[MatchedPeaks] [nvarchar](max) NULL,
	[RowId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_dbo.ResultInsilicoMatchRights] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultPtmSites]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultPtmSites](
	[JobSubmission] [datetime2](7) NOT NULL,
	[ResultPtmSitesId] [int] IDENTITY(1,1) NOT NULL,
	[ResultId] [nvarchar](128) NOT NULL,
	[Index] [nvarchar](max) NOT NULL,
	[ModName] [nvarchar](max) NOT NULL,
	[Site] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ResultPtmSites_1] PRIMARY KEY CLUSTERED 
(
	[ResultPtmSitesId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultsDownloadable]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultsDownloadable](
	[JobSubmission] [datetime2](7) NOT NULL,
	[ResultId] [nvarchar](128) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[MassSpectrumImageFilePath] [nvarchar](max) NOT NULL,
	[JsonExpThrTableFilePath] [nvarchar](max) NOT NULL,
	[CompleteDetailedResultsFilePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ResultsDownloadable] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchFiles]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchFiles](
	[JobSubmission] [datetime2](7) NOT NULL,
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[QueryId] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FileType] [nvarchar](max) NOT NULL,
	[UniqueFileName] [nvarchar](max) NULL,
	[FileUniqueId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.SearchFiles] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchParameters]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchParameters](
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[ProteinDatabase] [nvarchar](max) NOT NULL,
	[NumberOfOutputs] [nvarchar](max) NOT NULL,
	[MassMode] [nvarchar](max) NULL,
	[FilterDb] [nvarchar](max) NOT NULL,
	[MwTolerance] [float] NOT NULL,
	[MwToleranceUnit] [nvarchar](max) NULL,
	[PeptideTolerance] [float] NOT NULL,
	[PeptideToleranceUnit] [nvarchar](max) NOT NULL,
	[Autotune] [nvarchar](max) NOT NULL,
	[NeutralLoss] [float] NOT NULL,
	[SliderValue] [float] NOT NULL,
	[InsilicoFragType] [nvarchar](max) NULL,
	[HandleIons] [nvarchar](max) NULL,
	[DenovoAllow] [nvarchar](max) NOT NULL,
	[MinimumPstLength] [int] NOT NULL,
	[MaximumPstLength] [int] NOT NULL,
	[HopThreshhold] [float] NOT NULL,
	[HopTolUnit] [nvarchar](max) NULL,
	[PSTTolerance] [float] NOT NULL,
	[Truncation] [nvarchar](max) NOT NULL,
	[TerminalModification] [nvarchar](max) NOT NULL,
	[PtmAllow] [nvarchar](max) NOT NULL,
	[PtmTolerance] [float] NOT NULL,
	[PtmToleranceUnit] [nvarchar](max) NULL,
	[MethionineChemicalModification] [nvarchar](max) NOT NULL,
	[CysteineChemicalModification] [nvarchar](max) NOT NULL,
	[MwSweight] [float] NOT NULL,
	[PstSweight] [float] NOT NULL,
	[InsilicoSweight] [float] NOT NULL,
	[TruncationIndex] [int] NOT NULL,
	[FDRCutOff] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SearchParameters] PRIMARY KEY CLUSTERED 
(
	[JobSubmission] ASC,
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchQueries]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchQueries](
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Progress] [nvarchar](max) NULL,
	[CreationTime] [nvarchar](max) NULL,
 CONSTRAINT [PK_SearchQueries] PRIMARY KEY CLUSTERED 
(
	[JobSubmission] ASC,
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchResults]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchResults](
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[ResultId] [nvarchar](128) NOT NULL,
	[Header] [nvarchar](max) NULL,
	[Sequence] [nvarchar](max) NULL,
	[PstScore] [float] NOT NULL,
	[InsilicoScore] [float] NOT NULL,
	[PtmScore] [float] NOT NULL,
	[Score] [float] NOT NULL,
	[MwScore] [float] NOT NULL,
	[Mw] [float] NOT NULL,
	[FileId] [nvarchar](max) NULL,
	[OriginalSequence] [nvarchar](max) NULL,
	[PSTTags] [nvarchar](max) NULL,
	[RightMatchedIndex] [nvarchar](max) NULL,
	[RightPeakIndex] [nvarchar](max) NULL,
	[RightType] [nvarchar](max) NULL,
	[LeftMatchedIndex] [nvarchar](max) NULL,
	[LeftPeakIndex] [nvarchar](max) NULL,
	[LeftType] [nvarchar](max) NULL,
	[InsilicoMassLeft] [nvarchar](max) NULL,
	[InsilicoMassRight] [nvarchar](max) NULL,
	[InsilicoMassLeftAo] [nvarchar](max) NULL,
	[InsilicoMassLeftBo] [nvarchar](max) NULL,
	[InsilicoMassLeftAstar] [nvarchar](max) NULL,
	[InsilicoMassLeftBstar] [nvarchar](max) NULL,
	[InsilicoMassRightYo] [nvarchar](max) NULL,
	[InsilicoMassRightYstar] [nvarchar](max) NULL,
	[InsilicoMassRightZo] [nvarchar](max) NULL,
	[InsilicoMassRightZoo] [nvarchar](max) NULL,
	[TerminalModification] [nvarchar](max) NULL,
	[TruncationSite] [nvarchar](max) NULL,
	[TruncationIndex] [int] NOT NULL,
	[FileUniqueId] [nvarchar](128) NOT NULL,
	[Evalue] [float] NOT NULL,
	[BlindPtmLocalization] [nvarchar](max) NOT NULL,
	[ProteinRank] [int] NOT NULL,
 CONSTRAINT [PK_SearchResults] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC,
	[ResultId] ASC,
	[JobSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipResultsDownloadInfo]    Script Date: 4/19/2021 1:08:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipResultsDownloadInfo](
	[JobSubmission] [datetime2](7) NOT NULL,
	[QueryId] [nvarchar](128) NOT NULL,
	[ZipFileWithQueryId] [nvarchar](max) NOT NULL,
	[ZipFileName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ZipResultsDownloadInfo] PRIMARY KEY CLUSTERED 
(
	[JobSubmission] ASC,
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SearchParameters]    Script Date: 4/19/2021 1:08:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_SearchParameters] ON [dbo].[SearchParameters]
(
	[QueryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionTimes] ADD  CONSTRAINT [DF__Execution__Query__36B12243]  DEFAULT ('') FOR [QueryId]
GO
ALTER TABLE [dbo].[ResultPtmSites] ADD  CONSTRAINT [DF__ResultPtmS__Site__77AABCF8]  DEFAULT ('XYZ') FOR [Site]
GO
ALTER TABLE [dbo].[SearchFiles] ADD  CONSTRAINT [DF__SearchFil__FileU__1E05700A]  DEFAULT ('UniqueID-XYZ') FOR [FileUniqueId]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF__SearchPar__Pepti__70A8B9AE]  DEFAULT ('ppm') FOR [PeptideToleranceUnit]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF_SearchParameters_NeutralLoss]  DEFAULT ((0.0)) FOR [NeutralLoss]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF_SearchParameters_SliderValue]  DEFAULT ((50.0)) FOR [SliderValue]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF__SearchPar__PSTTo__531856C7]  DEFAULT ((0.5)) FOR [PSTTolerance]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF_SearchParameters_TerminalModification]  DEFAULT (N'None') FOR [TerminalModification]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF__SearchPar__Methi__10E07F16]  DEFAULT ('None') FOR [MethionineChemicalModification]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF__SearchPar__Cyste__0FEC5ADD]  DEFAULT ('None') FOR [CysteineChemicalModification]
GO
ALTER TABLE [dbo].[SearchParameters] ADD  CONSTRAINT [DF__SearchPar__Trunc__1A34DF26]  DEFAULT ((-1000)) FOR [TruncationIndex]
GO
ALTER TABLE [dbo].[SearchResults] ADD  CONSTRAINT [DF__SearchRes__Trunc__1C1D2798]  DEFAULT ((-1000)) FOR [TruncationIndex]
GO
ALTER TABLE [dbo].[SearchResults] ADD  CONSTRAINT [DF__SearchRes__FileU__1FEDB87C]  DEFAULT ('NO ID') FOR [FileUniqueId]
GO
ALTER TABLE [dbo].[SearchResults] ADD  CONSTRAINT [DF__SearchRes__Evalu__72E607DB]  DEFAULT ((0.0)) FOR [Evalue]
GO
ALTER TABLE [dbo].[SearchResults] ADD  CONSTRAINT [DF__SearchRes__Blind__73DA2C14]  DEFAULT ('-1,-1,-1') FOR [BlindPtmLocalization]
GO
ALTER TABLE [dbo].[SearchResults] ADD  CONSTRAINT [DF__SearchRes__Prote__041093DD]  DEFAULT ((0)) FOR [ProteinRank]
GO
USE [master]
GO
ALTER DATABASE [PerceptronDatabase] SET  READ_WRITE 
GO
