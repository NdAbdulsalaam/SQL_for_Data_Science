-- Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

-- This is a 2-part assignment. In the first part, you are asked a series of questions that
-- will help you profile and understand the data just like a data scientist would. For this
-- first part of the assignment, you will be assessed both on the correctness of your findings, 
-- as well as the code you used to arrive at your answer. You will be graded on how easy your
-- code is to read, so remember to use proper formatting and comments where necessary.

-- In the second part of the assignment, you are asked to come up with your own inferences and
-- analysis of the data for a particular research question you want to answer. You will be required
-- to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded,
-- in part, on how easy your code is to read, so use proper formatting and comments to illustrate and
-- communicate your intent as required.

-- For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked,
-- and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your
-- peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit,
-- Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other
-- page layout application, just be careful to make sure your answers and code are lined appropriately.
-- In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



-- Part 1: Yelp Dataset Profiling and Understanding

-- 1. Profile the data by finding the total number of records for each of the tables below:

SELECT COUNT(*)
FROM Attribute; -- replace Attribute with other tables's name

-- i. Attribute table = 10000
-- ii. Business table = 10000
-- iii. Category table = 10000
-- iv. Checkin table = 10000
-- v. elite_years table = 10000
-- vi. friend table =  10000
-- vii. hours table = 10000
-- viii. photo table = 10000
-- ix. review table = 10000
-- x. tip table = 10000
-- xi. user table = 10000

+-------+--------------+----------+
|  S/N  |     Table    |   COUNT  |
+-------+--------------+----------+
| i.    |  Attribute   |    10000 |
| ii.   |  Business    |    10000 |
| iii.  |  Category    |    10000 |
| iv.   |  Checkin     |    10000 |
| v.    |  elite_years |    10000 |
| vi.   |  friend      |    10000 |
| vii.  |  hours       |    10000 |
| viii. |  photo       |    10000 |
| ix.   |  review      |    10000 |
| x.    |  tip         |    10000 |
| xi.   |  user        |    10000 |
+-------+--------------+----------+
;
-- 2. Find the total distinct records by either the foreign key or primary key for each table.
-- If two foreign keys are listed in the table, please specify which foreign key.

-- i. Business = 10000 (id)
-- ii. Hours = 1562 (business_id)
-- iii. Category = 2643 (business_id)
-- iv. Attribute = 1115 (business_id)
-- v. Review = 10000 (id), 8090 (business_id), 9581 (user_id)
-- vi. Checkin = 493 (business_id)
-- vii. Photo = 10000 (id), 6493 (business_id)
-- viii. Tip = 537 (user_id), 3979 (business_id)
-- ix. User = 10000 (id)
-- x. Friend = 11 (user_id)
-- xi. Elite_years = 2780 (user_id)

+-------+--------------+----------+---------------+-----------+
|  S/N  |  table       |   id     |  business_id  |  user_id  |
+-------+--------------+----------+---------------+-----------+
| i.    |  Business    |  10000   |               |           |
| ii.   |  Hours       |          |  1562         |           |
| iii.  |  Category    |          |  2643         |           |
| iv.   |  Attribute   |          |  1115         |           |
| v.    |  Review      |  10000   |  8090         |  9581     |
| vi.   |  Checkin     |          |  493          |           |
| vii.  |  Photo       |  10000   |  6493         |           |
| viii. |  Tip         |          |  3979         |  537      |
| ix.   |  User        |  10000   |               |           |
| x.    |  Friend      |          |               |  11       |
| xi.   |  Elite_years |          |               |  2780     |
+-------+--------------+----------+---------------+-----------+
;
-- Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
-- 	Answer: No
	
-- 	SQL code used to arrive at answer:	
SELECT *
FROM user
WHERE id IS NULL;

	
-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum),
-- and average (mean) value for the following fields:

-- i. Table: Review, Column: Stars
-- min: 1 max: 5 avg: 3.7082


-- ii. Table: Business, Column: Stars
-- min: 1.0 max: 5.0 avg: 3.6549

-- iii. Table: Tip, Column: Likes
-- min: 0 max: 2 avg: 0.0144

-- iv. Table: Checkin, Column: Count
-- min: 1 max: 53 avg: 1.9414

-- v. Table: User, Column: Review_count
-- min: 0 max: 2000 avg: 24.2995
		

-- 5. List the cities with the most reviews in descending order:
-- 	SQL code used to arrive at answer:
SELECT city, SUM(review_count) AS Total_review
FROM business
GROUP BY city
ORDER BY Total_review DESC;
	
-- 	Copy and Paste the Result Below:
+-----------------+--------------+
| city            | Total_review |
+-----------------+--------------+
| Las Vegas       |        82854 |
| Phoenix         |        34503 |
| Toronto         |        24113 |
| Scottsdale      |        20614 |
| Charlotte       |        12523 |
| Henderson       |        10871 |
| Tempe           |        10504 |
| Pittsburgh      |         9798 |
| Montréal        |         9448 |
| Chandler        |         8112 |
| Mesa            |         6875 |
| Gilbert         |         6380 |
| Cleveland       |         5593 |
| Madison         |         5265 |
| Glendale        |         4406 |
| Mississauga     |         3814 |
| Edinburgh       |         2792 |
| Peoria          |         2624 |
| North Las Vegas |         2438 |
| Markham         |         2352 |
| Champaign       |         2029 |
| Stuttgart       |         1849 |
| Surprise        |         1520 |
| Lakewood        |         1465 |
| Goodyear        |         1155 |
+-----------------+--------------+
-- (Output limit exceeded, 25 of 362 total rows shown)
;	
-- 6. Find the distribution of star ratings to the business in the following cities:
-- i. Avon
-- SQL code used to arrive at answer:
SELECT stars AS Star_Rating
	,count(stars) AS star_count
FROM business b
WHERE city = 'Avon'
GROUP BY stars;
;
-- Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+------------+
| Star_Rating | star_count |
+-------------+------------+
|         1.5 |          1 |
|         2.5 |          2 |
|         3.5 |          3 |
|         4.0 |          2 |
|         4.5 |          1 |
|         5.0 |          1 |
+-------------+------------+
;
-- ii. Beachwood
-- SQL code used to arrive at answer:
SELECT stars AS Star_Rating
	,count(stars) AS star_count
FROM business b
WHERE city = 'Beachwood'
GROUP BY stars;

-- Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+------------+
| Star_Rating | star_count |
+-------------+------------+
|         2.0 |          1 |
|         2.5 |          1 |
|         3.0 |          2 |
|         3.5 |          2 |
|         4.0 |          1 |
|         4.5 |          2 |
|         5.0 |          5 |
+-------------+------------+
;
-- 7. Find the top 3 users based on their total number of reviews:		
-- 	SQL code used to arrive at answer:
SELECT name
	,review_count
FROM user
ORDER BY review_count DESC 
LIMIT 3;
		
-- 	Copy and Paste the Result Below:
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+	
;
-- 8. Does posing more reviews correlate with more fans?
-- Answer: Yes

-- 	SQL code used to arrive at answer:
SELECT CASE 
		WHEN fans BETWEEN 0
				AND 9
			THEN '0 - 9'
		WHEN fans BETWEEN 10
				AND 99
			THEN '10 - 99'
		ELSE '100-1000'
		END AS fans_range
	,COUNT(fans) AS num_fans
	,AVG(fans) AS avg_num_fans
	,AVG(review_count) AS avg_review_counts
FROM user
GROUP BY fans_range;

-- 	Copy and Paste the Result Below:
+------------+----------+----------------+-------------------+
| fans_range | num_fans |  avg_num_fans  | avg_review_counts |
+------------+----------+----------------+-------------------+
| 0 - 9      |     9690 | 0.447265221878 |     15.0085655315 |
| 10 - 99    |      294 |  25.5986394558 |     283.326530612 |
| 100-1000   |       16 |         189.75 |             891.5 |
+------------+----------+----------------+-------------------+
;
-- 	Please explain your findings and interpretation of the results:


	
-- 9. Are there more reviews with the word "love" or with the word "hate" in them?
-- 	Answer: Yes
	
-- 	SQL code used to arrive at answer:
SELECT text
FROM review
WHERE text LIKE '%love'
	OR text LIKE '%hate';
+----------------------------------------------------------------------------------------------------------------+
| text                                                                                                           |
+----------------------------------------------------------------------------------------------------------------+
| Awsome awsome place to eat highly recomend there banana deserve was delicious.  Loved the BBQ here I'm in love'|
+----------------------------------------------------------------------------------------------------------------+	
;	
-- 10. Find the top 10 users with the most fans:
-- 	SQL code used to arrive at answer:
SELECT name
	,fans
FROM user
ORDER BY fans DESC 
LIMIT 10;
	
-- 	Copy and Paste the Result Below:
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
;
		

-- Part 2: Inferences and Analysis

-- 1. Pick one city and category of your choice and group the businesses in that city or
-- category by their overall star rating. Compare the businesses with 2-3 stars to the businesses
-- with 4-5 stars and answer the following questions. Include your code.
	
-- i. Do the two groups you chose to analyze have a different distribution of hours?
	-- Yes, businesses with 4 -5 stars usually open than those with 2-3 stars

-- ii. Do the two groups you chose to analyze have a different number of reviews?
    -- Yes, businesses with 4 -5 stars are reviewed more than those with 2-3 stars
         
-- SQL codes used for analysis:
SELECT CASE 
		WHEN b.stars >= 4
			THEN '4-5 stars'
		WHEN b.stars >= 3
			THEN '3-4 stars'
		WHEN b.stars >= 2
			THEN '2-3 stars'
		WHEN b.stars >= 1
			THEN '1-2 stars'
		ELSE 'below 1 star'
		END AS star_range
	,COUNT(h.hours) AS days_open
    ,SUM(b.review_count) AS total_reviews
FROM business b
JOIN category c ON b.id == c.business_id
JOIN hours h ON b.id == h.business_id
WHERE star_range IN (
		'2-3 stars'
		,'4-5 stars'
		)
	AND b.city == 'Toronto'
	AND c.category == 'Food'
GROUP BY star_range;

+------------+-----------+---------------+
| star_range | days_open | total_reviews |
+------------+-----------+---------------+
| 2-3 stars  |         7 |            70 |
| 4-5 stars  |        13 |           272 |
+------------+-----------+---------------+
;
-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.
-- 4-5 stars are attributed to businesses in High park and wallace emerson while 2-3 stars are attributed to Roncesvalles.

-- SQL codes used for analysis:
SELECT CASE 
		WHEN b.stars >= 4
			THEN '4-5 stars'
		WHEN b.stars >= 3
			THEN '3-4 stars'
		WHEN b.stars >= 2
			THEN '2-3 stars'
		WHEN b.stars >= 1
			THEN '1-2 stars'
		ELSE 'below 1 star'
		END AS star_range
    ,b.neighborhood
FROM business b
JOIN category c ON b.id == c.business_id
WHERE star_range IN (
		'2-3 stars'
		,'4-5 stars'
		)
	AND b.city == 'Toronto'
	AND c.category == 'Food'
ORDER BY star_range;

+------------+-----------------+
| star_range | neighborhood    |
+------------+-----------------+
| 2-3 stars  | Roncesvalles    |
| 4-5 stars  | High Park       |
| 4-5 stars  | Wallace Emerson |
+------------+-----------------+
;
				
-- 2. Group business based on the ones that are open and the ones that are closed. What differences can you
-- find between the ones that are still open and the ones that are closed? List at least two differences and
-- the SQL code you used to arrive at your answer.
		
-- i. Difference 1:
    -- Most Businesses are opened than being closed. perhaps they are only closed on weekends and public holidays 
         
-- ii. Difference 2:
	--Businesses receive reviews more when they are opened.
 +---------+--------------+------------+
| is_open | num_business | num_review |
+---------+--------------+------------+
|       0 |           61 |         71 |
|       1 |          446 |        565 |
+---------+--------------+------------+
;        
-- SQL code used for analysis:
SELECT is_open
	,COUNT(DISTINCT (b.id)) AS num_business
	,COUNT(DISTINCT (r.id)) AS num_review
FROM business b
JOIN review r ON b.id = r.business_id
GROUP BY is_open;

	
	
-- 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the
-- Yelp dataset and are going to prepare the data for analysis.

-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering
-- businesses to find commonalities or anomalies between them, predicting the overall star rating for a business,
-- predicting the number of fans a user will have, and so on. These are just a few examples to get you started,
-- so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of
-- the following:
	
-- i. Indicate the type of analysis you chose to do:
        --Descriptive analysis: I would love to understand the categories of business that mostly ventured into and why.

-- ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        -- This analysis will require data such as how capital intensive each business is, the total number of people 
		-- that patronize on daily or monthly basis and also the si hter need for experts or not. These information can be gotten by
		-- carrying a survey to find anwer those questions
                  
-- iii. Output of your finished dataset:
 +-----------------------+------------------+-----------+--------------+
| category               | total_businesses | avg_stars | percent_open |
+------------------------+------------------+-----------+--------------+
| Automotive             |                9 |       4.5 |        100.0 |
| Local Services         |               12 |      4.21 |         83.3 |
| Active Life            |               10 |      4.15 |        100.0 |
| Health & Medical       |               17 |      4.09 |         94.1 |
| Home Services          |               16 |       4.0 |         93.8 |
| Shopping               |               30 |      3.98 |         83.3 |
| Beauty & Spas          |               13 |      3.88 |         92.3 |
| American (Traditional) |               11 |      3.82 |         72.7 |
| Food                   |               23 |      3.78 |         87.0 |
| Bars                   |               17 |       3.5 |         64.7 |
| Nightlife              |               20 |      3.48 |         60.0 |
| Restaurants            |               71 |      3.46 |         74.6 |
| Hotels & Travel        |                9 |      3.22 |         88.9 |
+------------------------+------------------+-----------+--------------+
;              
-- iv. Provide the SQL code you used to create your final dataset:
SELECT c.category
	,COUNT(b.id) AS total_businesses
	,ROUND(AVG(b.stars), 2) AS avg_stars
	,ROUND((AVG(b.is_open) * 100), 1) AS percent_open
FROM business b
JOIN category c ON b.id = c.business_id
GROUP BY c.category
HAVING total_businesses > 8
ORDER BY avg_stars DESC
	,percent_open DESC