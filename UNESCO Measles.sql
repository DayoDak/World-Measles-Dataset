/* Distribution of Measles cases by country, year and month
Official reported cases of measles per country from 2011-2022.
Data from World Health Organisation
*/

-- Table Rename
ALTER TABLE `measles`.`measles_cases_month_2022-12-06` 
RENAME TO  `measles`.`measles_cases_month` ;

SELECT  *
FROM measle.measles_cases_month;

-- Getting the total Measle cases per year in different Countries.
SELECT country,
Year,
(January + February + March + April + May + June + July + August + September + October + November + December) AS total_cases
FROM measle.measles_cases_month;

-- Create, Update and Populate New Column
ALTER TABLE measle.measles_cases_month
ADD total_cases int;

UPDATE measle.measles_cases_month
SET total_cases = (January + February + March + April + May + June + July + August + September + October + November + December);

SELECT *
FROM measle.measles_cases_month;

-- Case Study: Total Measles cases per country
-- The same process can be used for other selected countries.

SELECT Country, Year, total_cases
FROM measle.measles_cases_month;


-- Total cases per country
SELECT Country, SUM(total_cases) AS Measle_cases
FROM measle.measles_cases_month
WHERE Country is not null
GROUP BY Country
ORDER BY SUM(total_cases) desc;

-- Average reported case happening per country and per region.
SELECT Country, Year, total_cases, total_cases/12 AS Average_case_reported_per_year
FROM measle.measles_cases_month
WHERE Country is not null;

SELECT Region, SUM(total_cases) as Tota_cases, SUM(total_cases)/12 AS Average_cases_reported_per_year
FROM measle.measles_cases_month
WHERE Region is not null
GROUP BY Region;

-- Case study: Nigeria average reported case
SELECT Country, Year, total_cases, total_cases/12 AS Average_cases_per_year
FROM measle.measles_cases_month
WHERE Country is not null and Country = 'Nigeria';

-- Total Cases per Region
SELECT Region, SUM(total_cases) AS TotalMeasles
FROM measle.measles_cases_month
WHERE Country is not null
GROUP BY Region;

-- World Total cases recorded so far
SELECT count(distinct(Country)) as Member_Country,
SUM(total_cases) AS World_total_measles
FROM measle.measles_cases_month;
