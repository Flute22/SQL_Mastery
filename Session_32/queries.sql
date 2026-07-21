-- Creating a new Database name campusx
CREATE DATABASE campusx



-- Creating a users table in campusx 
CREATE TABLE users (
	user_id INTEGER PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL, 
	email VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL
)



-- Let's print the users table
SELECT * FROM users



-- Inserting values in the users table
INSERT INTO users (
	name, 
	email, 
	password
) 
VALUES (
	'Kabir', 
	'kabir@gmail.com',
	'123'
)



-- Another way of Insertion without specifing the columns - [ keep one thing in your mind, insert each value in squenc ]
INSERT INTO users
VALUES (
	'flute',
	'flute@gmail.com',
	'flute'
)



-- You can also insert multiple values in single query
INSERT INTO users VALUES 
('Rahul', 'rahul@gmail.com', '123'),
('Ajit', 'ajit@gmail.com', '123'),
('Napa', 'napa@gmail.com', '123'),
('Doliya', 'doliya@gmail.com', '123'), 
('Abhi', 'abhi@gmail.com','123')



-- Rename the imported dataset 
EXEC sp_rename 'smartphones_cleaned_v6', 'smartphones'



-- Query to fetch all the rows from the dataset
SELECT * FROM smartphones



-- Query to fetch selected columns not all the rows from the dataset
SELECT model, price, rating FROM smartphones

SELECT model, battery_capacity, os FROM smartphones



-- How to give an Alias to column name
SELECT os as 'Operating System', Model, battery_capacity as 'mAH' FROM smartphones



-- Calculate the PPI value of smartphones
SELECT 
	model, 
	ROUND (SQRT (
		CAST(resolution_width AS FLOAT) * CAST(resolution_width AS FLOAT) + CAST(resolution_height AS FLOAT) * CAST(resolution_height AS FLOAT)
	) / screen_size, 2) AS ppi
FROM smartphones



-- Fetch all the distinct brand names
SELECT DISTINCT(brand_name) AS 'All brands'
FROM smartphones



-- Fetch all the distinct processor brands
SELECT DISTINCT(processor_brand) AS 'Processors'
FROM smartphones



-- Fetch all the combination distinct values of brand name and processor brand
SELECT DISTINCT brand_name, processor_brand
FROM smartphones



-- Fetch all the samsung brand 
SELECT * FROM smartphones
WHERE brand_name = 'samsung'



-- Fetch all the phones with price > 50,000
SELECT * FROM smartphones
WHERE price > 50000



-- Fetch all the phones with price > 1,00,000
SELECT * FROM smartphones
WHERE price > 100000



-- Fetch all the phones in the price range of 10000 and 20000
SELECT * FROM smartphones
WHERE price > 10000 AND price < 20000

-- Same thing you can do with using BETWEEN keyword
SELECT * FROM smartphones
WHERE price BETWEEN 10000 AND 20000



-- Find phones with rating > 80 and price < 25000
SELECT * FROM smartphones
WHERE rating > 80 AND price < 25000



-- Find all samsung phones with ram > 8gb
SELECT * FROM smartphones
WHERE brand_name = 'samsung' AND ram_capacity > 8



-- Find all samsung phones with snapdragon processor
SELECT * FROM smartphones
WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon'



-- IN & NOT IN
SELECT * FROM smartphones
WHERE processor_brand IN ('snapdragon', 'exynos', 'bionic')

SELECT * FROM smartphones
WHERE processor_brand NOT IN ('snapdragon', 'exynos', 'bionic')



-- UPDATE
UPDATE smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek'

UPDATE users
SET password = 'flute'
WHERE email = 'kabir@gmail.com'

SELECT * FROM users



-- DELETE
SELECT * FROM smartphones
WHERE price > 200000

DELETE FROM smartphones
WHERE price > 200000



-- MAX()/MIN() - Fetch the top 1 expensive and cheapest phone 
SELECT MAX(price) FROM smartphones

SELECT MIN(price) FROM smartphones



-- Average
SELECT AVG(price) FROM smartphones
WHERE brand_name = 'apple'