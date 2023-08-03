-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Statistics with SQL
-- Lecture: Create Table and Load Data

CREATE DATABASE snp500
GO

USE snp500
GO

CREATE TABLE CompanyBySector
   (Ticker varchar(5) 
   ,CompanyName varchar(50) 
   ,Sector varchar(50)
   ,StockPrice decimal(6,2)
   )  
GO

BULK INSERT CompanyBySector
FROM 'C:\DataSet\snp500-company-by-sector.csv'
WITH
(
    FIRSTROW = 2,          
    FIELDTERMINATOR = ';',  
    ROWTERMINATOR = '\n',   
    TABLOCK                 
)
GO