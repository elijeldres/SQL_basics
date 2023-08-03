-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Programming with SQL
-- Lecture: Loops
DECLARE @i int
SET @i = 1

WHILE @i <= 10
  BEGIN
    PRINT @i
	SET @i += 1
  END
GO

DECLARE @i decimal(6,2)
SET @i = 0
WHILE @i < PI()
  BEGIN
    IF SIN(@i) >= SQRT(2)/2
	  BEGIN
	    PRINT (ROUND(DEGREES(@i),0))
		BREAK
	  END
	SET @i +=0.01
  END
GO
