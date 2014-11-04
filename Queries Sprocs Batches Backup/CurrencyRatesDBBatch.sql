USE [master]
GO

IF DB_ID('Currency_Rates') IS NOT NULL
	DROP DATABASE [Currency_Rates]
GO

--By default, all SQL Server 2012 databases have a Containment set to 'NONE'.
--Microsoft recommend that Ansi Padding is set to on. The default for SQL Sever 2012  is 'SET ANSI_PADDING is ON'.

--Because of the finite nature of this database, tinyint has been used as the data type for all ID columns. In a real world 
--application int would probably be used instead. If all major currencies were to be included the possible permutations would far
--exceed 255 so tinyint would be the wrong datatype to use.


CREATE DATABASE [Currency_Rates]
ON  PRIMARY 
(NAME = N'CR_Data', FILENAME = N'C:\CurrencyDB\Currency_Rates.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 20%)

LOG ON 
(NAME = N'CR_Log', FILENAME = N'C:\CurrencyDB\Currency_Rates.ldf' , MAXSIZE = UNLIMITED, FILEGROWTH = 20%)

GO

USE [Currency_Rates]
GO

--Create Table [dbo].[Currency_From]   
CREATE TABLE [dbo].[Currency_From](
	[IDFrom] [tinyint] NOT NULL,
	[CurrencyInCode] [nvarchar](5) NOT NULL,
	CONSTRAINT [PK_Currency_From] PRIMARY KEY CLUSTERED ([IDFrom] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Currency_From]
INSERT INTO Currency_From
VALUES (1, '$AUD'),
(2, '$CAD'),
(3, '€EUR'),
(4, '£GBP'),
(5, '$USD');


--Create Table [dbo].[Currency_To]   
CREATE TABLE [dbo].[Currency_To](
	[IDTo] [tinyint] NOT NULL,
	[CurrencyOutCode] [nvarchar](5) NOT NULL,
	CONSTRAINT [PK_Currency_To] PRIMARY KEY CLUSTERED ([IDTo] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Currency_To]
INSERT INTO Currency_To
VALUES (1, '$USD'),
(2, '£GBP'),
(3, '$AUD'),
(4, '$CAD'),
(5, '€EUR');

--Create Table [dbo].[Rates]   
CREATE TABLE [dbo].[Rates](
	[RateID] [tinyint] NOT NULL,
	[Conversion_Currencies] [varchar] (12) NOT NULL,
	[Rate] [decimal] (5,4) NOT NULL, 
	[IDFrom] [tinyint]NOT NULL FOREIGN KEY REFERENCES Currency_From(IDFrom),
	[IDTo] [tinyint]NOT NULL FOREIGN KEY REFERENCES Currency_To(IDTo),
	CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED ([RateID] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Rates]
INSERT INTO Rates
VALUES (1, 'EUR to GBP', 0.81 ,3, 2),
(2, 'EUR to USD', 1.3631, 3, 1),
(3, 'EUR to AUD', 1.4767, 3, 3),
(4, 'EUR to CAD', 1.4806, 3, 4),
(5, 'GBP to EUR', 1.2346, 4, 5),
(6, 'GBP to AUD', 1.8231, 4, 3),
(7, 'GBP to USD', 1.683, 4, 1),
(8, 'GBP to CAD', 1.828, 4, 4),
(9, 'AUD to EUR', 0.6772, 1, 5),
(10, 'AUD to GBP', 0.5485, 1, 2),
(11, 'AUD to USD', 0.9231, 1, 1),
(12, 'AUD to CAD', 1.0027, 1, 4),
(13, 'USD to EUR', 0.7336, 5, 5),
(14, 'USD to GBP', 0.5942, 5, 2),
(15, 'USD to AUD', 1.0833, 5, 3),
(16, 'USD to CAD', 1.0862, 5, 4),
(17, 'CAD to EUR', 0.6754, 2, 5),
(18, 'CAD to GBP', 0.5471, 2, 2),
(19, 'CAD to USD', 0.9207, 2, 1),
(20, 'CAD to AUD', 0.9974, 2, 3),
(21, 'EUR to EUR', 1.0000, 3, 5),
(22, 'AUD to AUD', 1.0000, 1, 3),
(23, 'GBP to GBP', 1.0000, 4, 2),
(24, 'CAD to CAD', 1.0000, 2, 4),
(25, 'USD to USD', 1.0000, 5, 1);




