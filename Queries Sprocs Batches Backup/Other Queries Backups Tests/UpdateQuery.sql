/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [RateID]
      ,[Conversion_Currencies]
      ,[Rate]
      ,[IDFrom]
      ,[IDTo]
  FROM [C:\CURRENCYDB\CURRENCY_RATES.MDF].[dbo].[Rates]

  
USE [C:\CURRENCYDB\CURRENCY_RATES.MDF]
UPDATE Rates 
SET Rate= 0.81
WHERE Conversion_Currencies='EUR to GBP'; 

USE [C:\CURRENCYDB\CURRENCY_RATES.MDF]
UPDATE Rates SET Rate = 0.81
FROM Rates as R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 
ON R1.IDFrom = F1.IDFrom 
WHERE F1.CurrencyInCode = '€EUR'  AND T1.CurrencyOutCode = '£GBP'

DELETE Rates FROM Rates as R1 JOIN Currency_To AS T1 ON R1.IDTo = T1.IDTo JOIN Currency_From as F1 ON R1.IDFrom = F1.IDFrom WHERE F1.CurrencyInCode = ' " + ddlFrom.SelectedItem.Text + "'  AND T1.CurrencyOutCode = '" + ddlTo.SelectedItem.Text + "'"