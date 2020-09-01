USE yelp;

-- 1 Explorethe raw data in each table using SELECT * queries. 
SELECT * FROM yelp.businesses_attributes;

SELECT * FROM yelp.businesses_categories;

SELECT * FROM yelp.categories;

SELECT *
FROM yelp.reviews
LIMIT 1000;

-- 2 How many unique businesses are represented in the database? Find out how many of them are currently open.
SELECT count(distinct id)
FROM yelp.businesses
limit 100000;

-- There are 7558 unique busnisess in the database. 

SELECT count(distinct id)
FROM yelp.businesses
WHERE is_open = 1
limit 100000;

-- There are 6420 unique businesses in the database that are still open.


-- 3)	How many unique users are represented in the user table?
SELECT count(distinct id)
FROM yelp.users
limit 100000;

-- There are 1183362 unique users in the user table. 

-- 4)	Which user has received the highest average stars?
SELECT users.name, average_stars, id
FROM yelp.users
GROUP BY id, users.name
ORDER BY users.average_stars DESC 
LIMIT 1;

-- The user who has the highest average stars is MIKE

-- 5)	How many types of votes can a user send? List them.

SELECT count(distinct vote_type)
FROM yelp.users_votes;

-- There are 3 vote types a user can send. 

SELECT vote_type 
FROM yelp.users_votes
LIMIT 3;

-- They can be cool, funny, or useful.

-- 6)	How many types of compliments can a user receive? List them.
SELECT compliment_type 
FROM yelp.users_compliments;

SELECT count(distinct compliment_type)
FROM yelp.users_compliments;

-- There are 11 distict types of compliments 

SELECT compliment_type
FROM yelp.users_compliments 
LIMIT 11;

-- They are: cool, cute, funny, hot, list, more, note, phtos, plain, profile, and writer.


-- 7)	Return the reviews which have received the greatest value for stars, the greatest number of useful votes and the greatest number of cool votes. Make sure that you are returning all relevant reviews if there is a tie.
SELECT stars, id
FROM yelp.reviews
ORDER BY stars desc;

SELECT useful, id
FROM yelp.reviews
ORDER BY useful desc;

SELECT cool, id
FROM yelp.reviews
ORDER BY cool desc;

-- 8)	Which users have been "Yelping" the longest?
SELECT yelping_since, id, name
FROM yelp.users
ORDER BY yelping_since asc;

-- James, Michael, and Ken are the top 3 longest serving users.


-- 9)	Which businesses have received the greatest value for stars? Sort these by the number of reviews, from highest to lowest. Return only open businesses.

SELECT stars, is_open, review_count, name
FROM yelp.businesses 
WHERE is_open = 1 
ORDER BY review_count desc;

-- Charlotte Douglas International Airport is the business with the highest review count and this code shows the others in descending order by review count.

-- 10)	Return the user who has written the greatest number reviews.
SELECT name, review_count 
FROM yelp.users
ORDER BY review_count desc;

-- Victor has the greatest number of reviews with 11656 reviews.


-- 11)	Return the number of open businesses in each Charlotte, NC neighborhood in the Yelp database. Sort from least number of businesses to greatest number of businesses.
SELECT sum(is_open), neighborhood
FROM yelp.businesses
GROUP BY neighborhood
ORDER BY sum(is_open) asc;

-- 12)	Modify the previous query to return only neighborhoods with at least 100 businesses. Change the sorting to order the neighborhoods from greatest number of businesses to least number of businesses.
SELECT sum(is_open), neighborhood
FROM yelp.businesses
WHERE is_open = 1 
GROUP BY neighborhood
HAVING sum(is_open) >100
ORDER BY sum(is_open) desc;


-- 13)	Return the neighborhood associated with the greatest number of reviews.
SELECT neighborhood, sum(review_count)
FROM yelp.businesses 
GROUP BY neighborhood
ORDER BY sum(review_count) desc;

-- South Park has the greatest number of reviews.

-- 14)	Return the average star rating for the businesses in each neighborhood. How could you modify this query to return the average star rating for the entire neighborhood? Hint: this will involve a weighted average.

SELECT neighborhood, avg(stars)
FROM yelp.businesses 
GROUP BY neighborhood
ORDER BY avg(stars) desc;

-- The neighborhood with the highest average review is Quail Hollow with 4.16 Stars. 

SELECT neighborhood, avg(stars)
FROM yelp.businesses 
GROUP BY neighborhood
ORDER BY avg(stars) desc;

-- 15)	Determine the average star rating given by the users who have written the greatest number of reviews. Return only the user's name, average stars and review count.
SELECT name, review_count, average_stars 
FROM yelp.users 
ORDER BY review_count desc;


-- Victor has the highest review count at 11656 with an average star rating as 3.28.