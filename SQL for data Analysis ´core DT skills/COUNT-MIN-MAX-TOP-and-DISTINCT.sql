-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Statistics with SQL
-- Lecture: COUNT, MIN, MAX, TOP, and DISTINCT

SELECT * 
FROM CompanyBySector
GO

SELECT TOP 10 * 
FROM CompanyBySector
GO

SELECT COUNT(*)
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, COUNT(*) AS Number
FROM CompanyBySector
GROUP BY Sector
GO

SELECT MAX(StockPrice) AS MaxStockPrice
FROM CompanyBySector
GO

SELECT MIN(StockPrice) AS MinStockPrice
FROM CompanyBySector
GO

SELECT MAX(StockPrice) AS MaxStockPrice, MIN(StockPrice) AS MinStockPrice
FROM CompanyBySector
GO

SELECT Sector, MAX(StockPrice) AS MaxStockPrice, MIN(StockPrice) AS MinStockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT Sector, MIN(StockPrice) AS MinStockPrice, MAX(StockPrice) AS StockPrice
FROM CompanyBySector
GROUP BY Sector
GO

SELECT DISTINCT Sector
FROM CompanyBySector
GO       