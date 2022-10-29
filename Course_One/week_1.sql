-- Module 1 Quiz
-- Q5
SELECT FirstName
	,LastName
	,Company
FROM customer;


-- Module 1 Coding Questions
-- Q1
SELECT *
FROM employee
WHERE FirstName = "Robert"; --and FirstName = "King"

-- Q2
SELECT FirstName
	,LastName
	,BirthDate
	,Address
	,City
	,STATE
FROM employee
WHERE BirthDate LIKE '1965%';

-- Q3
SELECT *
FROM track
Limit 20;