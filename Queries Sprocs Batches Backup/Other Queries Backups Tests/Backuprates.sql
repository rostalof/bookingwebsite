/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [RateID]
      ,[Conversion_Currencies]
      ,[Rate]
      ,[IDFrom]
      ,[IDTo]
  FROM [C:\CURRENCYDB\CURRENCY_RATES.MDF].[dbo].[Rates]


  use [C:\CURRENCYDB\CURRENCY_RATES.MDF]

  IF OBJECT_ID ('RsBackup') IS NOT NULL
	DROP TABLE [RsBackup]
GO


use [C:\CURRENCYDB\CURRENCY_RATES.MDF]

SELECT *
INTO RsBackup
FROM Rates;
GO

  