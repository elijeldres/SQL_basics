-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Filtering Data

SELECT * 
  FROM CompanyBySector
  WHERE
    StockPrice > 1000
GO

SELECT * 
  FROM CompanyBySector
  WHERE
    Sector = 'Information Technology'
GO

SELECT * 
  FROM CompanyBySector
  WHERE
    StockPrice >  1000
 GO

SELECT * 
  FROM CompanyBySector
  WHERE
    StockPrice >  1000
	OR
    Sector = 'Information Technology'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE '% inc%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName NOT LIKE '% inc%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE 'a%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName NOT LIKE 'a%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE 'a%'
  OR
  CompanyName LIKE 'b%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE '[ab]%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName NOT LIKE '[ab]%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE '[^ab]%'
GO

SELECT * 
  FROM CompanyBySector
  WHERE CompanyName LIKE '______'
GO

SELECT * 
  FROM CompanyBySector
  WHERE LEN(CompanyName) = 6
GO