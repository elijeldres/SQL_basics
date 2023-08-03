-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Statistics with SQL
-- Lecture: Statistical Functions in SQL

SELECT *
FROM CompanyBySector
GO

SELECT SUM(StockPrice) AS SumStockPrice
FROM CompanyBySector
GO

SELECT Sector, SUM(StockPrice) AS SumStockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, SUM(StockPrice) AS SumStockPrice, AVG(StockPrice) AS AverageStockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, VARP(StockPrice) AS StockPriceVariance, VAR(StockPrice) AS AllStockPriceVarianceEstimator
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, STDEVP(StockPrice) AS StockPriceStandardDeviation, STDEV(StockPrice) AS AllStockPriceStandardDeviationEstimator
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, ROUND(AVG(StockPrice),2) AS AverageStockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, CAST(ROUND(AVG(StockPrice),2) AS decimal(6,2)) AS AverageStockPrice
FROM CompanyBySector
GROUP BY Sector
GO
