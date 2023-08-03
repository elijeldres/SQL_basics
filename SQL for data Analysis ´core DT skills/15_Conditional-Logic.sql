-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Programming with SQL
-- Lecture: Conditional Logic 
DECLARE @showHighProfile bit
SET @showHighProfile = 0

IF @showHighProfile = 1
  BEGIN
    USE snp500
	SELECT 'Companies with the stock price greater than 100$'
	SELECT * FROM CompanyBySector WHERE StockPrice > 100 ORDER BY StockPrice DESC
  END
ELSE
  BEGIN
    USE snp500
	SELECT 'All companies'
	SELECT * FROM CompanyBySector ORDER BY Sector
  END
GO

USE snp500

-- simple CASE
SELECT CompanyName, TickerLength = 
       CASE LEN(Ticker)
	      WHEN 1 THEN '1 letter'
		  WHEN 2 THEN '2 leters'
		  WHEN 3 THEN '3 letters'
		  WHEN 4 THEN '4 letters'
		  ELSE 'more than 4 letters'
	   END
FROM CompanyBySector
GO

-- searched CASE
SELECT CompanyName, StockPrice, 'Tier' =
       CASE
	     WHEN StockPrice < 30 THEN 1
		 WHEN (StockPrice >=30 AND StockPrice <= 100) THEN 2
		 ELSE 3
	   END
FROM CompanyBySector
ORDER BY Tier
GO

-- set the variable with CASE
DECLARE @tier_number int
DECLARE @tier_name varchar(max)

SET @tier_number = 4

SET @tier_name = CASE @tier_number 
                     WHEN 1 THEN 'tier 1'
					 WHEN 2 THEN 'tier 2'
					 WHEN 3 THEN 'tier 3'
					 ELSE 'not defined'
				 END

SELECT @tier_name
GO
