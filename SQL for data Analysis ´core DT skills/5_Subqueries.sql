-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Subqueries

SELECT
  t1.CompanyName,
  t1.Sector,
  t1.StockPrice,
  (SELECT AVG(StockPrice) FROM CompanyBySector t2 WHERE t1.Sector = t2.Sector) AS SectorAverage
FROM
  CompanyBySector t1
GO

SELECT
  t1.Sector,
  AVG(t1.StockPrice) AS SectorAverage
FROM
  (SELECT
    Sector,
	StockPrice
  FROM
    CompanyBySector
  WHERE
    StockPrice > 100) t1
GROUP BY
  t1.Sector
GO

SELECT
 Sector
FROM
 CompanyBySector
WHERE
 StockPrice = (SELECT MAX(StockPrice) FROM CompanyBySector)
GO