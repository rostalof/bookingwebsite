--Simple table backup.
--By using a backup and a copy of the backup we initially have 2 copies of the same table. However when the first drop table query 
--runs we have only one copy of the original and when the select into query runs there is now a copy of both old and new tables.
--If the new back up has been successful we can run the second drop and insert query and we now have 2 new copies of the table.

USE [C:\GAADB\GAA_GAMES.MDF]

IF OBJECT_ID ('TDBackup') IS NOT NULL
	DROP TABLE [TDBackup]
GO

SELECT *
INTO TDBackup
FROM Ticket_Details;
GO

IF OBJECT_ID ('TDBackup1') IS NOT NULL
	DROP TABLE [TDBackup1]
GO

SELECT *
INTO TDBackup1
FROM Ticket_Details;
GO