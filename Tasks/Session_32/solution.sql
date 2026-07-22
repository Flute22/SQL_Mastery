-- First of all I rename the file. 
EXEC sp_rename 'insurance_data - insurance_data', 'insurance' 



-- Check all the rows of insurance table
SELECT * FROM insurance



-- 1. Show records of 'male' patient from 'southwest' region.
SELECT * FROM insurance
WHERE gender = 'male' AND region = 'southwest'



-- 2. Show all records having bmi in range 30 to 45 both inclusive.
SELECT * FROM insurance
WHERE bmi BETWEEN 30 AND 45



-- 3.Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
SELECT min(bloodpressure) AS 'MinBP', max(bloodpressure) AS 'MaxBP'
FROM insurance
WHERE diabetic = 1 AND smoker = 'Yes'



-- 4. Find no of unique patients who are not from southwest region.
SELECT COUNT(DISTINCT (PatientID)) AS Unique_Patients
FROM insurance
WHERE region <> 'southwest'



-- 5. Total claim amount from male smoker.
SELECT ROUND(SUM(claim), 2) AS 'Total Amount'
FROM insurance
WHERE gender = 'male' AND smoker = 'Yes'



-- 6. Select all records of south region.
SELECT * FROM insurance
WHERE region IN ('southeast', 'southwest')

-- Here is the another way of doing this with LIKE 
SELECT * FROm insurance
WHERE region LIKE 'south%'



-- 7. No of patient having normal blood pressure. Normal range[90-120]
SELECT COUNT(DISTINCT(PatientID)) AS 'No Of Patients'
FROM insurance
WHERE bloodpressure BETWEEN 90 AND 120



/*
8. No of pateint below 17 years of age having normal blood pressure as per below formula -
	BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
	Note: Formula taken just for practice, don't take in real sense. 
*/
SELECT COUNT(*) FROM insurance
WHERE age < 17 AND bloodpressure BETWEEN (80 + age * 2) AND (100 + age * 2)



-- 9. What is the average claim amount for non-smoking female patients who are diabetic?
SELECT ROUND(AVG(claim), 2) AS 'Average Claim Amount'
FROM insurance
WHERE smoker = 'No' AND diabetic = 1



-- 10. Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
UPDATE insurance
SET PatientID = 5000
WHERE PatientID = 1234



-- 11. Write a SQL query to delete all records for patients who are smokers and have no children.
DELETE insurance
WHERE smoker = 'Yes' AND children = 0