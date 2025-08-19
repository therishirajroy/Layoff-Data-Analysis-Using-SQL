USE Rishiraj;
SELECT * FROM layoffs;

SELECT *
INTO layoffs_staging
FROM layoffs;



SELECT * FROM layoffs_staging;

-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways


-- 1. Remove Duplicates

-- First let's check for duplicates



SELECT *
FROM (
		SELECT company, industry, total_laid_off, percentage_laid_off,date,
				stage, country, funds_raised_millions,
			ROW_NUMBER() OVER (PARTITION BY company, industry, total_laid_off, percentage_laid_off,date,
											stage, country, funds_raised_millions 
											ORDER BY(SELECT NULL) DESC
						) AS row_num
			FROM layoffs_staging) duplicates
WHERE row_num > 1;

SELECT * FROM layoffs_staging 
WHERE company = 'Cazoo'


-- These are our duplicates
-- Creating a new table for staging

DROP TABLE layoffs_staging;

SELECT *, ROW_NUMBER() OVER (PARTITION BY company, industry, total_laid_off, percentage_laid_off,date,
											stage, country, funds_raised_millions 
											ORDER BY(SELECT NULL) DESC
						) AS row_num
INTO layoffs_staging
FROM layoffs;



SELECT * FROM layoffs_staging
WHERE row_num > 1;



DELETE FROM layoffs_staging
WHERE row_num>1;



SELECT * FROM layoffs_staging;



-- 2. Standardizing the data

-- Checking for NULL values

SELECT DISTINCT industry
FROM layoffs_staging
ORDER BY industry;

SELECT *
FROM layoffs_staging
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;


SELECT *
FROM layoffs_staging
WHERE company = 'Bally''s Interactive';
-- This is just one null value so I dont think we can populate this.




-- Setting blank values as NULL
UPDATE layoffs_staging
SET industry = NULL
WHERE industry = '';


SELECT *
FROM layoffs_staging
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;




SELECT * FROM layoffs_staging t1 JOIN layoffs_staging t2 ON t1.company = t2.company
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL

UPDATE t1
SET t1.industry = t2.industry
FROM layoffs_staging t1 JOIN layoffs_staging t2
ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


SELECT * FROM layoffs_staging;



UPDATE layoffs_staging
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'

-- --------------------------------------------------


SELECT DISTINCT country
FROM layoffs_staging
ORDER BY country;



UPDATE layoffs_staging
SET country = TRIM(TRAILING '.' FROM country);

-- Change the Date column to Date datatype

SELECT *
FROM layoffs_staging;

SELECT DISTINCT date FROM layoffs_staging;

UPDATE layoffs_staging
SET date = TRIM(date)
WHERE date <> 'NULL';

UPDATE layoffs_staging
SET date = NULL
WHERE date = 'NULL';


ALTER TABLE layoffs_staging
ALTER COLUMN date DATE;

-- 3. Look at Null Values

-- the null values in total_laid_off, percentage_laid_off, and funds_raised_millions all look normal. I don't think I want to change that
-- I like having them null because it makes it easier for calculations during the EDA phase

-- so there isn't anything I want to change with the null values




-- 4. remove any columns and rows we need to

SELECT *
FROM layoffs_staging
WHERE total_laid_off IS NULL;


SELECT *
FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT * 
FROM layoffs_staging;


ALTER TABLE layoffs_staging
DROP COLUMN row_num;



SELECT * 
FROM layoffs_staging;