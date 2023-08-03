-- Scandinavian Institute of Business Analytics SCANBA
-- www.scanba.org
-- Course:
-- SQL for Data Analysis
-- Chapter: Programming with SQL
-- Lecture: Mathematical Functions

SELECT ABS(10) AS Module_of_10
SELECT ABS(-10) AS Module_of_minus10
GO

SELECT SIGN(10) AS Sign_of_10
SELECT SIGN(-10) AS Sign_of_minus10
GO

SELECT RAND(100) AS Random_number_with_seed_of_100
SELECT RAND() AS Random_number_with_random_seed
GO

SELECT EXP(10) AS Exponent_of_10
SELECT SQRT(4) AS Square_root_of_4
SELECT SQUARE(2) AS Square_of_2
SELECT POWER(4, 0.5) AS Number_4_in_power_of_0_point_5
SELECT POWER(2, 2) AS Number_2_in_power_of_2
GO

SELECT LOG(22026.4657948067) AS Natural_logarithm
SELECT LOG10(100) AS Base_10_logarithm
GO

SELECT PI() AS Number_Pi
SELECT SIN(3.14159265358979) AS Sinus_of_approximate_Pi
SELECT COS(3.14159265358979) AS Cosinus_of_approximate_Pi
SELECT TAN(3.14159265358979) AS Tangent_of_approximate_Pi
GO

SELECT ROUND(SIN(3.14159265358979),2) AS Rounded_to_second_decimal_Sinus_of_approximate_Pi
SELECT ROUND(COS(3.14159265358979),2) AS Rounded_to_second_decimal_Cosinus_of_approximate_Pi
SELECT ROUND(TAN(3.14159265358979),2) AS Rounded_to_second_decimal_Tangent_of_approximate_Pi
GO