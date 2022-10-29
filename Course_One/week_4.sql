-- Module 4 Quiz
-- Select the correct SQL syntax for creating a view.
CREATE VIEW customers
AS
SELECT *
FROM customers
WHERE Name LIKE '%I';

-- Module 4 Coding Questions
-- Q1
-- Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
SELECT CustomerId
	,Firstname
	,Lastname
	,Address
	,UPPER(city || " " || country) AS City_Country
FROM Customer
LIMIT 16;

-- Q2
-- Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT firstname
	,Lastname
	,SUBSTR(firstname, 1, 4) AS f_name
	,SUBSTR(lastname, 1, 2) AS l_name
	,LOWER(SUBSTR(firstname, 1, 4) || SUBSTR(lastname, 1, 2)) AS user_id
FROM employee;

-- Q3
-- Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT Lastname
	,STRFTIME('%Y-%m-%d', HireDate) AS HireDate
	-- ,STRFTIME('%Y', HireDate) AS HireYear
	-- ,STRFTIME('%m', HireDate) AS HireMonth
	-- ,STRFTIME('%d', HireDate) AS HireDay
	,DATE ('now') TodayDate
	,CAST(STRFTIME('%Y:%m:%d', 'now') - STRFTIME('%Y:%m:%d', HireDate) AS INT) AS YearsInService
FROM employee
WHERE YearsInService >= 15
ORDER BY Lastname;

-- Q4
-- Profiling the Customers table, answer the following question.
SELECT *
FROM customer
WHERE fax IS NULL
	OR company IS NULL
	OR phone IS NULL
	OR postalcode IS NULL
	OR firstname IS NULL
	OR address IS NULL;

-- Q5
-- Find the cities with the most customers and rank in descending order.
SELECT city
	,COUNT(*) total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Q6
-- Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT c.firstname
	,c.lastname
	,i.invoiceid
	,(c.firstname || c.lastname || i.invoiceid) AS NewId
FROM customer AS c
JOIN invoice AS i ON c.customerid == i.customerid
WHERE NewId LIKE "AstridGruber%"
ORDER BY c.firstname
	,c.lastname
	,i.invoiceid;

-- THE END --
