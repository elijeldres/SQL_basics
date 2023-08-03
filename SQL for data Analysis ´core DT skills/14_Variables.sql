-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Programming with SQL
-- Lecture: Variables
DECLARE @MyInteger int  

SET @MyInteger = 10
SELECT @MyInteger

SET @MyInteger += 5
SELECT @MyInteger 

SET @MyInteger -= 5
SELECT @MyInteger 

GO

DECLARE @KidAges table
(age int
,name varchar(max)
)

INSERT INTO @KidAges VALUES (10, 'amy')
INSERT INTO @KidAges VALUES (12, 'krista')
INSERT INTO @KidAges VALUES (14, 'emil')

DECLARE @emil_age int

SET @emil_age = (SELECT age FROM @KidAges WHERE name = 'emil')

SELECT @emil_age

SELECT * FROM @KidAges

GO
