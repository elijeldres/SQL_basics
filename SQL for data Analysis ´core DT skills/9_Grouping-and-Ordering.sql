-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Grouping and Ordering
USE snp500
GO

SELECT * FROM CompanyBySector
ORDER BY StockPrice ASC
GO

SELECT * FROM CompanyBySector
ORDER BY StockPrice DESC
GO

SELECT * FROM CompanyBySector
ORDER BY CompanyName DESC
GO

SELECT Sector, AVG(StockPrice) AS SectorAverage FROM CompanyBySector
GROUP BY Sector
ORDER BY SectorAverage ASC
GO

SELECT Sector, AVG(StockPrice) AS SectorAverage FROM CompanyBySector
GROUP BY Sector
HAVING AVG(StockPrice) > 100
ORDER BY SectorAverage ASC
GO