-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: SQL Overview
-- Lecture: Data Definition with SQL

CREATE DATABASE snp500  
GO  

USE snp500
GO

CREATE TABLE FinancialsExtended
   (Ticker varchar(5)  
   ,CompanyName varchar(50)
   ,StockPrice decimal(6,2)
   ,EarningsPerShare decimal(4,2)
   ,FiftyTwoWeeksLow decimal(6,2)
   ,FiftyTwoWeeksHigh decimal(6,2)
   ,MarketCap real
   ,EBITDA real
   )  
GO

BULK INSERT FinancialsExtended
FROM 'C:\DataSet\snp500-financials.csv'
WITH
(
    FIRSTROW = 2,           --Skip the first row with column names
    FIELDTERMINATOR = ';',  --Your .csv file column delimiter
    ROWTERMINATOR = '\n',   --Row ends with a shift to the next row
    TABLOCK                 --Lock the table access while the data is loading
)
GO

ALTER TABLE FinancialsExtended
ADD Id INT IDENTITY(1,1)    --Add a column of integers starting at 1 with increment of 1 (i.e. 1, 2, 3, ...)
GO

ALTER TABLE FinancialsExtended
ADD CONSTRAINT PK_FinancialsExtended
PRIMARY KEY (Id)
GO

CREATE INDEX idx_Ticker
ON FinancialsExtended (Ticker)
GO

CREATE VIEW viewFinancialsExtended AS
SELECT 
  Ticker AS Ticker, CompanyName AS Company, StockPrice AS Price
FROM
  FinancialsExtended

CREATE SCHEMA MyData
GO


ALTER SCHEMA MyData 
TRANSFER viewFinancialsExtended
GO

