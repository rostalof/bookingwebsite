USE [master]
GO

IF DB_ID('Gaa_Games') IS NOT NULL
	DROP DATABASE [Gaa_Games]
GO

--By default, all SQL Server 2012 databases have a Containment set to 'NONE'.
--Microsoft recommend that Ansi Padding is set to on. The default for SQL Sever 2012  is 'SET ANSI_PADDING is ON'.

--Owing to the finite nature of this database, tinyint has been used as the data type most ID columns. In a real world 
--application int or bigint would probably be used instead. A large agency offering numerous trips/packages would not take long 
--to exceed the 255 entries permitted by using tinyint as the data type for key columns. However the Quantity 
--column in Ticket_Details table and the BookingID in the bookings table both use the int data type. The reason 
--being that I have read numerous warnings on various websites about troubles arising from attempting to 
--auto-generate a Primary Key value when the data type is set to tinyint. Similarly as the Quantity values will be 
--used for some calculations and there are further warnings relating to the use of tinyint in SQL Server and 
--transferring to C#, I decided it would be best not to use this data type in this instance.


CREATE DATABASE [Gaa_Games]
ON  PRIMARY 
(NAME = N'CR_Data', FILENAME = N'C:\GAAdb\Gaa_Games.mdf' , MAXSIZE = UNLIMITED, FILEGROWTH = 20%)

LOG ON 
(NAME = N'CR_Log', FILENAME = N'C:\GAAdb\Gaa_Games.ldf' , MAXSIZE = UNLIMITED, FILEGROWTH = 20%)

GO

USE [Gaa_Games]
GO

--Create Table [dbo].[Games]   
CREATE TABLE [dbo].[Games](
	[GameID] [tinyint] NOT NULL,
	[NameOfGame] [varchar](40) NOT NULL,
	[GameType] [varchar](15) NOT NULL,
	[LocationOfGame] [varchar](30) NOT NULL,
	[GameDate] [date] NOT NULL,
	[ThrowIn] [time] (0) NOT NULL,
	CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED ([GameID] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Games]
INSERT INTO Games
VALUES (1, 'SFC Quarter Final 1', 'Football', 'Pairc Ui Chaoimh, Cork', '08/02/2014', '15:00' ),
(2, 'SFC Quarter Final 2', 'Football', 'Pearse Stadium, Galway', '08/03/2014','14:30' ),
(3, 'SFC Quarter Final 3', 'Football', 'Croke Park, Dublin', '08/09/2014', '15:00'),
(4, 'SFC Quarter Final 4', 'Football', 'Gaelic Grounds, Limerick', '08/10/2014', '14:30'),
(5, 'SFC Semi Final 1', 'Football', 'Croke Park, Dublin', '08/24/2014', '15:00' ),
(6, 'SFC Semi Final 2', 'Football', 'Croke Park, Dublin', '08/31/2014', '14:30'),
(7, 'SFC All Ireland Final', 'Football', 'Croke Park, Dublin', '09/21/2014', '15:00'),
(8, 'SHC Quarter Final 1', 'Hurling', 'Pearse Stadium, Galway', '07/26/2014','14:30'),
(9, 'SHC Quarter Final 2', 'Hurling', 'Gaelic Grounds, Limerick', '07/27/2014','14:30'),
(10, 'SHC Quarter Final 3', 'Hurling', 'Croke Park, Dublin', '08/02/2014','15:30'),
(11, 'SHC Quarter Final 4', 'Hurling', 'Pairc Ui Chaoimh, Cork', '08/03/2014','14:30'),
(12, 'SHC Semi Final 1', 'Hurling', 'Croke Park, Dublin', '08/10/2014','15:30'),
(13, 'SHC Semi Final 2', 'Hurling', 'Croke Park, Dublin', '08/17/2014','14:30'),
(14, 'SHC All Ireland Final', 'Hurling', 'Croke Park, Dublin', '09/07/2014','15:00');


--Create Table [dbo].[Cost]   
CREATE TABLE [dbo].[Cost](
	[CostID] [tinyint] NOT NULL,
	[CostInEuro] [smallmoney] NOT NULL,
	[Route] [varchar](25) NOT NULL,
	CONSTRAINT [PK_Cost] PRIMARY KEY CLUSTERED ([CostID] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Cost]
INSERT INTO Cost
VALUES (1, 90.00, 'Ballina - Dublin'),
(2, 120.00, 'Ballina - Cork'),
(3, 80.00, 'Ballina - Galway'),
(4, 100.00,'Ballina - Limerick'),
(5, 80.00, 'Sligo - Dublin'),
(6, 110.00, 'Sligo - Cork'),
(7, 75.00, 'Sligo - Galway'),
(8, 85.00, 'Sligo - Limerick');

--Create Table [dbo].[Ticket_Details]   
CREATE TABLE [dbo].[Ticket_Details](
	[TicketID] [tinyint] NOT NULL,
	[Departure_Location] [varchar] (10) NOT NULL,
	[Destination] [varchar] (10) NOT NULL,
	[Departure_Time] [time] (0) NOT NULL,
	[Arrival_Time] [time] (0) NOT NULL,
	[GameID] [tinyint]NOT NULL FOREIGN KEY REFERENCES Games(GameID),
	[CostID] [tinyint]NOT NULL FOREIGN KEY REFERENCES Cost(CostID),
	[Quantity] [int] NOT NULL, 
	CONSTRAINT [PK_Ticket_Details] PRIMARY KEY CLUSTERED ([TicketID] ASC)) ON [PRIMARY]
Go

--Populate Table [dbo].[Ticket_Details]
INSERT INTO Ticket_Details
VALUES (1, 'Ballina', 'Cork', '06:50' ,'10:50', 1, 2, 100),
(2, 'Ballina', 'Galway', '06:50', '09:50', 2, 3, 100),
(3, 'Ballina', 'Dublin', '07:05', '10:35', 3, 1, 100),
(4, 'Ballina', 'Limerick', '07:05', '10:35', 4, 4, 100),
(5, 'Ballina', 'Dublin', '07:05', '10:35', 5, 1, 100),
(6, 'Ballina', 'Dublin', '07:05', '10:35', 6, 1, 100),
(7, 'Ballina', 'Dublin', '07:05', '10:35', 7, 1, 100),
(8, 'Ballina', 'Galway', '06:50', '09:50', 8, 3, 100),
(9, 'Ballina', 'Limerick', '07:05', '10:35', 9, 4, 100),
(10, 'Ballina', 'Dublin', '07:05', '10:35', 10, 1, 100),
(11, 'Ballina', 'Cork', '06:50', '10:50', 11, 2, 100),
(12, 'Ballina', 'Dublin', '07:05', '10:35', 12, 1, 100),
(13, 'Ballina', 'Dublin', '07:05', '10:35', 13, 1, 100),
(14, 'Ballina', 'Dublin', '07:05', '10:35', 14, 1, 100),
(15, 'Sligo', 'Cork', '06:45', '10:45', 1, 6, 100),
(16, 'Sligo', 'Galway', '06:45', '08:30', 2, 7, 100),
(17, 'Sligo', 'Dublin', '07:00', '09:30', 3, 5, 100),
(18, 'Sligo', 'Limerick', '07:00', '10:45', 4, 8, 100),
(19, 'Sligo', 'Dublin', '07:00', '09:30', 5, 5, 100),
(20, 'Sligo', 'Dublin', '07:00', '09:30', 6, 5, 100),
(21, 'Sligo', 'Dublin', '07:00', '09:30', 7, 5, 100),
(22, 'Sligo', 'Galway', '06:45', '08:30', 8, 7, 100),
(23, 'Sligo', 'Limerick', '07:00', '10:45', 9, 8, 100),
(24, 'Sligo', 'Dublin', '07:00', '09:30', 10, 5, 100),
(25, 'Sligo', 'Cork', '06:45', '10:45', 11, 6, 100),
(26, 'Sligo', 'Dublin', '07:00', '09:30', 12, 5, 100),
(27, 'Sligo', 'Dublin', '07:00', '09:30', 13, 5, 100),
(28, 'Sligo', 'Dublin', '07:00', '09:30', 14, 5, 100);

--Create Table [dbo].[Bookings]   
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [varchar](30) NOT NULL,
	[CustomerSecondName] [varchar](30) NOT NULL,
	[QuantityofTickets] [tinyint] NOT NULL,
	[TotalCost] [smallmoney] NOT NULL,
	[CurrencyCode] [nvarchar] (5) NOT NULL,
	[CreditCardNo] [bigint] NOT NULL,
	[TicketID] [tinyint] NOT NULL FOREIGN KEY REFERENCES Ticket_Details(TicketID),
	[EmailAddress] [nvarchar] (50) NOT NULL,
	CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED ([BookingID] ASC)) ON [PRIMARY]
Go