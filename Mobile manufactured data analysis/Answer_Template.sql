--SQL Advance Case Study


--Q1--BEGIN 

	-- List all the states in which we have customers who have bought cellphones from 2005 till today.
	SELECT DISTINCT state
	FROM FACT_TRANSACTIONS t1
	JOIN DIM_LOCATION t2 ON t1.IDLocation = t2.IDLocation
	WHERE YEAR(DATE) >= 2005
	
--Q1--END

--Q2--BEGIN

	-- What state in the US is buying the most 'Samsung' cell phones?
	SELECT state, SUM(t2.Quantity) quantity
	FROM DIM_LOCATION t1
	JOIN FACT_TRANSACTIONS t2 ON t1.IDLocation = t2.IDLocation
	JOIN DIM_MODEL t3 ON t2.IDModel = t3.IDModel
	JOIN DIM_MANUFACTURER t4 ON t3.IDManufacturer = t4.IDManufacturer
	WHERE Country = 'US' AND t4.Manufacturer_Name = 'Samsung'  
	GROUP BY state
	ORDER BY 2 DESC

--Q2--END


--Q3--BEGIN      

	-- Show the number of transactions for each model per zip code per state.	
	SELECT model_name, zipcode, state, count(*)
	FROM DIM_LOCATION t1
	JOIN FACT_TRANSACTIONS t2 ON t1.IDLocation = t2.IDLocation
	JOIN DIM_MODEL t3 ON t2.IDModel = t2.IDModel
	GROUP BY model_name, ZipCode, State

--Q3--END


--Q4--BEGIN

	-- Show the cheapest cellphone (Output should contain the price also)
	SELECT top 1 Model_Name, Unit_price
	FROM DIM_MODEL 
	ORDER BY 2 ASC

--Q4--END


--Q5--BEGIN

	-- Find out the average price for each model in the top5 manufacturers in terms of sales quantity and order by average price.
	SELECT 
		t3.Manufacturer_Name, 
		t1.model_name, 
		AVG(t1.Unit_price) avg_price
	FROM DIM_MODEL t1
	JOIN FACT_TRANSACTIONS t2 ON t1.IDModel = t2.IDModel
	JOIN DIM_MANUFACTURER t3 ON t1.IDManufacturer = t3.IDManufacturer 
	WHERE t3.IDManufacturer IN ( 
		SELECT 
			TOP 5 t1.IDManufacturer  
		FROM DIM_MANUFACTURER t1
		JOIN DIM_MODEL t2 ON t1.IDManufacturer = t2.IDManufacturer
		JOIN FACT_TRANSACTIONS t3 ON t2.IDModel = t3.IDModel
		GROUP BY t1.IDManufacturer
		ORDER BY SUM(t3.Quantity) DESC
	) 
	GROUP BY t3.Manufacturer_Name, t1.Model_Name
	ORDER BY avg_price 

--Q5--END


--Q6--BEGIN

	-- List the names of the customers and the average amount spent in 2009, where the average is higher than 500
	SELECT t1.Customer_Name, AVG(t2.TotalPrice)
	FROM DIM_CUSTOMER t1
	JOIN FACT_TRANSACTIONS t2 ON t1.IDCustomer = t2.IDCustomer
	JOIN DIM_DATE t3 ON t2.Date = t3.DATE
	WHERE t3.YEAR = 2009
	GROUP BY t1.Customer_Name
	HAVING AVG(t2.TotalPrice) > 500

--Q6--END
	

--Q7--BEGIN  

	-- List if there is any model that was in the top 5 in terms of quantity, simultaneously in 2008, 2009 and 2010
	WITH RankedModels AS (
    SELECT
        t1.Model_Name,
        YEAR(t2.Date) AS Sales_Year,
        SUM(t2.Quantity) AS Total_Quantity,
        DENSE_RANK() OVER (
            PARTITION BY YEAR(t2.Date)
            ORDER BY SUM(t2.Quantity) DESC
        ) AS rnk
    FROM DIM_MODEL t1
    JOIN FACT_TRANSACTIONS t2 
        ON t1.IDModel = t2.IDModel
    WHERE YEAR(t2.Date) IN (2008, 2009, 2010)
    GROUP BY t1.Model_Name, YEAR(t2.Date)
	)
	SELECT Model_Name
	FROM RankedModels
	WHERE rnk <= 5
	GROUP BY Model_Name
	HAVING COUNT(DISTINCT Sales_Year) = 3;

--Q7--END


--Q8--BEGIN
	
	select * from DIM_LOCATION
	select * from DIM_MANUFACTURER
	select * from DIM_MODEL
	select * from FACT_TRANSACTIONS
	select * from DIM_DATE
	select * from DIM_CUSTOMER



















--Q8--END
--Q9--BEGIN
	

















--Q9--END

--Q10--BEGIN
	


















--Q10--END
	
