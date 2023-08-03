-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Combining Tables - Part II
USE snp500
GO

CREATE TABLE tableA_Stocks
   (CompanyName varchar(50)
   ,StockPrice decimal(6,2) 
   )  
GO

INSERT INTO tableA_Stocks VALUES ('Amazon.com Inc', 350.5)
INSERT INTO tableA_Stocks VALUES ('Best Buy Co. Inc', 68.79)
INSERT INTO tableA_Stocks VALUES ('Comcast Corp.', 38.19)
GO

CREATE TABLE tableB_Stocks
   (CompanyName varchar(50)
   ,StockPrice decimal(6,2) 
   )  
GO

INSERT INTO tableB_Stocks VALUES ('Amazon.com Inc', 350.5)
INSERT INTO tableB_Stocks VALUES ('Best Buy Co. Inc', 68.79)
INSERT INTO tableB_Stocks VALUES ('Ford Motor', 10.43)
GO

SELECT * FROM tableA_Stocks
SELECT * FROM tableB_Stocks
GO

SELECT * FROM tableA_Stocks
UNION
SELECT * FROM tableB_Stocks
GO

SELECT * FROM tableA_Stocks
UNION ALL
SELECT * FROM tableB_Stocks
GO

SELECT * FROM tableA_Stocks
INTERSECT
SELECT * FROM tableB_Stocks
GO

SELECT * FROM tableA_Stocks
EXCEPT
SELECT * FROM tableB_Stocks
GO