-- Module 3 Coding Assignment
-- Q1
-- Using a subquery, find the names of all the tracks for the album "Californication".
SELECT name
FROM track
WHERE albumid IN (
		SELECT albumid
		FROM album
		WHERE title = 'Californication'
		)
LIMIT 8;

-- Q2
-- Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT c.customerid
	,COUNT(i.invoiceid) AS total_invoices
	,firstname || " " || Lastname AS Fullname
	,city
	,email
FROM customer AS c
JOIN invoice AS i ON c.customerid == i.customerid
GROUP BY c.customerid
LIMIT 5;

-- Q3
-- Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT tr.name AS track_name
	,al.title AS album_title
	,al.artistid
	,tr.trackid
FROM track AS tr
JOIN album AS al ON tr.albumid == al.albumid;

-- Q4
-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT e.EmployeeId
	,e.ReportsTo
	,e.Lastname AS Employee
	,m.Lastname AS Manager
FROM employee AS e
JOIN employee AS m ON e.ReportsTo == m.EmployeeId
WHERE Manager = 'Mitchell' limit 10;

-- Q5
-- Find the name and ID of the artists who do not have albums. 
SELECT ar.*
	,al.title
	,al.albumid -- ar.name, ar.artistid
FROM artist AS ar
LEFT JOIN album AS al ON al.artistid == ar.artistid
LEFT JOIN artist AS ar2 ON al.artistid == ar2.artistid
WHERE al.title IS NULL; --and ar.name = ar2.name

-- Q6
-- Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT Firstname
	,Lastname
FROM employee

UNION

SELECT firstname
	,lastname
FROM customer
ORDER BY lastname DESC
LIMIT 6;

-- Q7
-- See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT c.city
	,i.billingcity
FROM customer AS c
JOIN invoice AS i ON c.customerid == i.customerid
WHERE c.city != i.billingcity
LIMIT 5;