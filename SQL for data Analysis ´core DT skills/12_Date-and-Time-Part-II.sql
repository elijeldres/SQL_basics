-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Date and Time - Part II
USE snp500
GO

CREATE TABLE TimeRecords
  (record varchar(max))
GO

INSERT INTO TimeRecords VALUES ('  09:01:03  ')
INSERT INTO TimeRecords VALUES ('  17:15:00  ')
INSERT INTO TimeRecords VALUES ('  11:45:24  ')
GO

SELECT record, TRY_PARSE(record as time) AS recordPARSE
FROM TimeRecords
GO

SELECT DATEPART(hour, TRY_PARSE(record as time)) AS hours
      ,DATEPART(minute, TRY_PARSE(record as time)) AS minutes
	  ,DATEPART(second, TRY_PARSE(record as time)) AS seconds
FROM TimeRecords
GO

/* keywords for the DATEPART command
year
quarter
month
dayofyear
day
week
weekday
hour
minute
second
millisecond
microsecond
nanosecond
*/

SELECT SUBSTRING(LTRIM(record), 1, 2) AS hours_str
      ,SUBSTRING(LTRIM(record), 4, 2) AS minutes_str
	  ,SUBSTRING(LTRIM(record), 7, 2) AS seconds_str
FROM TimeRecords
GO


SELECT CONVERT(time, CONCAT(hours_str,':',minutes_str,':',seconds_str)) AS time_record
FROM
(SELECT SUBSTRING(LTRIM(record), 1, 2) AS hours_str
      ,SUBSTRING(LTRIM(record), 4, 2) AS minutes_str
	  ,SUBSTRING(LTRIM(record), 7, 2) AS seconds_str
FROM TimeRecords) a
GO