-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Combining Tables - Part I
USE snp500
GO

CREATE TABLE tableA_CompanyStockPrices
   (Ticker varchar(5)  
   ,StockPrice decimal(6,2)
   )  
GO

INSERT INTO tableA_CompanyStockPrices VALUES ('AMZN', 350.5)
INSERT INTO tableA_CompanyStockPrices VALUES ('BBY', 68.79)
INSERT INTO tableA_CompanyStockPrices VALUES ('CMCSA', 38.19)
INSERT INTO tableA_CompanyStockPrices VALUES ('DG', 95.1)
GO

CREATE TABLE tableB_CompanyNames
   (Ticker varchar(5) 
   ,CompanyName varchar(50) 
   )  
GO

INSERT INTO tableB_CompanyNames VALUES ('AMZN', 'Amazon.com Inc')
INSERT INTO tableB_CompanyNames VALUES ('BBY', 'Best Buy Co. Inc')
INSERT INTO tableB_CompanyNames VALUES ('CMCSA', 'Comcast Corp.')
INSERT INTO tableB_CompanyNames VALUES ('F', 'Ford Motor')
GO

SELECT * FROM tableA_CompanyStockPrices
SELECT * FROM tableB_CompanyNames
GO

SELECT ta.Ticker, tb.CompanyName, ta.StockPrice
  FROM tableA_CompanyStockPrices ta
  INNER JOIN tableB_CompanyNames tb ON ta.Ticker = tb.Ticker 
GO

SELECT ta.Ticker, tb.CompanyName, ta.StockPrice
  FROM tableA_CompanyStockPrices ta
  LEFT OUTER JOIN tableB_CompanyNames tb ON ta.Ticker = tb.Ticker 
GO

SELECT tb.Ticker, tb.CompanyName, ta.StockPrice
  FROM tableA_CompanyStockPrices ta
  RIGHT OUTER JOIN tableB_CompanyNames tb ON ta.Ticker = tb.Ticker 
GO

SELECT tb.Ticker, tb.CompanyName, ta.StockPrice
  FROM tableA_CompanyStockPrices ta
  FULL OUTER JOIN tableB_CompanyNames tb ON ta.Ticker = tb.Ticker 
GO

CREATE TABLE GroupNumbers
   (Number int)  
GO

INSERT INTO GroupNumbers VALUES (1)
INSERT INTO GroupNumbers VALUES (2)
INSERT INTO GroupNumbers VALUES (3)
GO

SELECT tx.Ticker, tx.CompanyName, tx.StockPrice, tcross.Number
FROM
  (SELECT ta.Ticker, tb.CompanyName, ta.StockPrice
  FROM tableA_CompanyStockPrices ta
  INNER JOIN tableB_CompanyNames tb ON ta.Ticker = tb.Ticker) tx
  CROSS JOIN GroupNumbers tcross 
GO