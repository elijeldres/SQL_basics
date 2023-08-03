-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Creating a View
USE snp500
GO

SELECT Sector, AVG(StockPrice) AS StockPriceAverage
     FROM CompanyBySector
	   WHERE StockPrice > 100
	 GROUP BY Sector
GO

CREATE VIEW TopSectorAverage
AS
SELECT Sector, AVG(StockPrice) AS StockPriceAverage
     FROM CompanyBySector
	   WHERE StockPrice > 100
	 GROUP BY Sector
GO

SELECT * FROM TopSectorAverage
GO

DROP VIEW TopSectorAverage
GO

SELECT Ticker, CompanyName, Sector, StockPrice
FROM CompanyBySector
WHERE CompanyName LIKE '% Inc%'
GO

CREATE VIEW Incorporated WITH SCHEMABINDING
AS
SELECT Ticker, CompanyName, Sector, StockPrice
FROM [dbo].[CompanyBySector]
WHERE CompanyName LIKE '% Inc%'
GO

SELECT * FROM Incorporated
GO

CREATE UNIQUE CLUSTERED INDEX idx_Incorporated
ON Incorporated(Ticker)
GO

DROP INDEX Incorporated.idx_Incorporated
GO

DROP VIEW Incorporated
GO
