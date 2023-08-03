-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Partitioning
USE snp500
GO

SELECT Sector, AVG(StockPrice) AS AverageStockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT CompanyName, StockPrice, Sector, AVG(StockPrice) OVER (PARTITION BY Sector) AS AverageStockPrice
FROM CompanyBySector
GO

SELECT DISTINCT Sector, COUNT(CompanyName) OVER (PARTITION BY Sector) AS CompanyCount
FROM CompanyBySector
ORDER BY CompanyCount DESC
GO

SELECT CompanyName, StockPrice, Sector, RANK() OVER (PARTITION BY Sector ORDER BY StockPrice) AS StockPriceRank
FROM CompanyBySector
GO

SELECT CompanyName, StockPrice, Sector, ROW_NUMBER() OVER (PARTITION BY Sector ORDER BY StockPrice) AS StockPriceRank
FROM CompanyBySector
GO

SELECT CompanyName, StockPrice, Sector, NTILE(4) OVER (PARTITION BY Sector ORDER BY StockPrice) AS StockPriceTile
FROM CompanyBySector
GO

SELECT DISTINCT Sector, StockPriceTile, COUNT(CompanyName) OVER (PARTITION BY StockPriceTile) AS CompaniesInTheTile
FROM
(SELECT CompanyName, StockPrice, Sector, NTILE(4) OVER (PARTITION BY Sector ORDER BY StockPrice) AS StockPriceTile
FROM CompanyBySector) a
GO