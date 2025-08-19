USE Rishiraj;


-- EDA

SELECT * 
FROM layoffs_staging;


SELECT MAX(total_laid_off) AS maximum_layoff
FROM layoffs_staging;

-- Looking at Percentage to see how big these layoffs were
SELECT MAX(percentage_laid_off) AS max_percent_laid_off,  MIN(percentage_laid_off) AS min_percent_laid_off
FROM layoffs_staging
WHERE  percentage_laid_off IS NOT NULL;


SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 0;

SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
AND funds_raised_millions <> 'NULL'
ORDER BY funds_raised_millions DESC;


-- Companies with the biggest single Layoff

SELECT TOP 5 company, total_laid_off
FROM layoffs_staging
ORDER BY 2 DESC;


-- Companies with the most Total Layoffs
SELECT TOP 10 company, SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY company
ORDER BY 2 DESC;

-- by location
SELECT TOP 10 location, SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY location
ORDER BY 2 DESC;
-- this it total in the past 3 years or in the dataset


SELECT country, SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY country
ORDER BY 2 DESC;

SELECT * FROM layoffs_staging;

SELECT RIGHT(date,4) AS 'year', SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY RIGHT(date,4)
HAVING RIGHT(date,4) <> 'NULL'
ORDER BY 1 ASC;


SELECT industry, SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY industry
ORDER BY 2 DESC;


SELECT stage, SUM(total_laid_off) 'sum_total_laid_off'
FROM layoffs_staging
GROUP BY stage
ORDER BY 2 DESC;

-- Earlier we looked at Companies with the most Layoffs. Now let's look at that per year. It's a little more difficult.
-- I want to look at 

WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging
  GROUP BY company, YEAR(date)
  HAVING YEAR(date) IS NOT NULL 
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;


SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging
GROUP BY MONTH(date), YEAR(date)
ORDER BY 2,1 ASC;



WITH DATE_CTE AS 
(
SELECT YEAR(date) AS years, MONTH(date) AS months, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging
GROUP BY MONTH(date), YEAR(date)
)
SELECT years, months, total_laid_off, SUM(total_laid_off) OVER (ORDER BY years, months ASC) as rolling_total_layoffs
FROM DATE_CTE
WHERE years IS NOT NULL
ORDER BY 1,2 ASC;