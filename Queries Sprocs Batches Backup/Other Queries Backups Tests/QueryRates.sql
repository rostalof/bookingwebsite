/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [IDFrom]
      ,[CurrencyInCode]
  FROM [C:\CURRENCYDB\CURRENCY_RATES.MDF].[dbo].[Currency_From]

Use [C:\CURRENCYDB\CURRENCY_RATES.MDF]
SELECT  Rate
FROM Rates AS R1
JOIN Currency_To AS T1
ON R1.IDTo = T1.IDTo
JOIN Currency_From as F1
ON R1.IDFrom = F1.IDFrom
WHERE F1.CurrencyInCode = 'EUR'  AND T1.CurrencyOutCode = 'CAD';