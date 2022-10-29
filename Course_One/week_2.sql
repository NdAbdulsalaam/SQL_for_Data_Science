-- Module 2 Quiz
-- Q2
-- You are doing an analysis on musicians that start with the letter “K”. Select
-- the correct query that would retrieve only the artists whose name starts with this letter. 
SELECT name
FROM Artist
WHERE name LIKE 'K%';

-- Module 2 Coding Assignment
-- All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

-- Q1
-- Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT count(*)
FROM track
WHERE Milliseconds >= 5000000;

--Q2
-- Find all the invoices whose total is between $5 and $15 dollars.
SELECT count(*)
FROM invoice
WHERE total BETWEEN '5'
		AND '15';

-- Q3
-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT firstname
	,lastname
	,state
	,company
FROM customer
WHERE STATE IN (
		"RJ"
		,"DF"
		,"AB"
		,"BC"
		,"CA"
		,"WA"
		,"NY"
		)
LIMIT 10;

-- Q4
-- Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT *
FROM invoice
WHERE (
		Customerid IN (
			'56'
			,'58'
			)
		)
	AND (
		total BETWEEN '1'
			AND '5'
		)
LIMIT 5;

-- Q5
-- Find all the tracks whose name starts with 'All'.
SELECT name
FROM track
WHERE name LIKE 'All%';

-- Q6
-- Find all the customer emails that start with "J" and are from gmail.com.
SELECT firstname
	,lastname
	,email
FROM customer
WHERE email LIKE 'j%@gmail.com'
LIMIT 5;

-- Q7
-- Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT invoiceid
	,total
FROM invoice
WHERE BillingCity IN (
		'Brasília'
		,'Edmonton'
		,'Vancouver'
		)
ORDER BY invoiceid DESC;

-- Q8
-- Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
SELECT customerid
	,COUNT(invoiceid) AS orders
FROM invoice
GROUP BY customerid
ORDER BY orders DESC;

-- Q9
-- Find the albums with 12 or more tracks.
SELECT albumid
	,COUNT(trackid) AS total_tracks
FROM track
GROUP BY albumid
HAVING total_tracks >= 12;