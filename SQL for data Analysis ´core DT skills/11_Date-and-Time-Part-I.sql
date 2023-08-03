-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Data Preparation with SQL
-- Lecture: Date and Time - Part I
USE snp500
GO

CREATE TABLE DateRecords
  (RowDateRecord varchar(max))
GO

INSERT INTO DateRecords VALUES ('1/27/2018')
INSERT INTO DateRecords VALUES ('2018-01-27')
INSERT INTO DateRecords VALUES ('27-Jan-18')
INSERT INTO DateRecords VALUES ('27-Jan-2018')
INSERT INTO DateRecords VALUES ('January 27, 2018')
INSERT INTO DateRecords VALUES ('Saturday, January 27, 2018')
INSERT INTO DateRecords VALUES ('1/27/18 12:00 AM')
INSERT INTO DateRecords VALUES ('27. tammikuuta 2018 0:00')
GO

SELECT * FROM DateRecords
GO


SELECT RowDateRecord 
       ,TRY_CAST(RowDateRecord AS date) AS DateCAST
       ,TRY_CONVERT(date, RowDateRecord) AS DateCONVERT
	   ,TRY_PARSE(RowDateRecord AS date) AS DatePARSE 
FROM DateRecords
GO

SELECT RowDateRecord 
       ,TRY_CAST(RowDateRecord AS date) AS DateCAST
       ,TRY_CONVERT(date, RowDateRecord) AS DateCONVERT
	   ,TRY_PARSE(RowDateRecord AS date USING 'fi') AS DatePARSE 
FROM DateRecords
GO

/* codes for USING command in PARSE
British English:	en-GB
US English:	en-US
German:		de-DE
French:		fr-FR
Japanese:	ja-JP
Danish:		da-DK
Spanish:	es-ES
Italian:	it-IT
Dutch:		nl-NL
Norwegian:	nn-NO
Portuguese:	pt-PT
Finnish:	fi
Swedish:	sv-SE
Czech:		Cs-CZ
Hungarian:	Hu-HU
Polish:		Pl-PL
Romanian:	Ro-RO
Croatian:	hr-HR
Slovak:		Sk-SK
Slovenian:	Sl-SI
Greek:		El-GR
Bulgarian:	bg-BG
Russian:	Ru-RU
Turkish:	Tr-TR
Estonian:	Et-EE
Latvian:	lv-LV
Lithuanian:	lt-LT
Brazilian:	pt-BR
Traditional Chinese:	zh-TW
Simplified Chinese:	zh-CN
Korean:		Ko-KR
Arabic:		ar-SA
Thai:		Th-TH
*/

SELECT RowDateRecord 
	   ,TRY_PARSE(RowDateRecord AS date ) AS DatePARSE 
INTO DateRecordParsed
FROM DateRecords
GO

SELECT * FROM DateRecordParsed
GO