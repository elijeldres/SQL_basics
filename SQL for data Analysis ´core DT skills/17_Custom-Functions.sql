-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Programming with SQL
-- Lecture: Custom Functions
USE snp500
GO

-- scalar function
CREATE OR ALTER FUNCTION 
FunctionGetStringLength (@input nvarchar(max))  
RETURNS int  
AS  
BEGIN  
     DECLARE @output int
     SET @output = LEN(@input)
     RETURN(@output)  
END  
GO

SELECT dbo.FunctionGetStringLength('SCANBA')
GO

-- table function
CREATE OR ALTER FUNCTION 
GetStocksAboveThreshold (@threshold int)  
RETURNS table  
AS  
RETURN
   (  
     SELECT * FROM CompanyBySector 
	          WHERE StockPrice > @threshold
   )
GO

SELECT * FROM dbo.GetStocksAboveThreshold(100)  
         ORDER BY StockPrice ASC
GO

-- stored procedure
CREATE OR ALTER PROCEDURE
CopyTable @threshold int
AS
  BEGIN TRY
    DROP TABLE dbo.CompanyBySector_backup
  END TRY
  BEGIN CATCH
    PRINT 'CopyTable: dbo.CompanyBySector_backup drop table error'
  END CATCH
  SELECT * INTO dbo.CompanyBySector_backup
  FROM dbo.CompanyBySector
  WHERE StockPrice > @threshold
GO

EXECUTE dbo.CopyTable 100
GO

SELECT * FROM dbo.CompanyBySector_backup ORDER BY StockPrice ASC
GO

-- trigger
CREATE OR ALTER TRIGGER DropTableWarning
ON DATABASE
FOR DROP_TABLE
AS
  PRINT 'Warning: a table was dropped'
GO

DROP TABLE dbo.CompanyBySector_backup
GO
