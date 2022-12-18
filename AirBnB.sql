-- Lets See our table
SELECT *
From messina_province;

-- who are the top earners?
-- To find this, we must findout the Monthly Revenue
-- Monthly Revenue= Price per night * Nights booked per month
-- We got a column name with price, but it has a $ sign. 
-- To get the monthly revenue, we must clear the $ sign
SELECT *,
       price,
       REPLACE(REPLACE(price,'$',' '),',','') AS price_cleaned  
FROM messina_province;

-- There is no column for bookings. so we have to create it

SELECT host_name,
	   neighbourhood_cleansed, 
       30-availability_30 AS bookings_30
FROM messina_province;

-- Lets findout who are the highest earners and is it good idea to start a BnB business in Messina

SELECT id,
       host_name,
	   neighbourhood_cleansed, 
       30-availability_30 AS bookings_30,
       REPLACE(REPLACE(price,'$',' '),',',' ') AS price_cleaned,
       (30-availability_30) * (REPLACE(REPLACE(price,'$',' '),',','')) AS rev_30
FROM messina_province
ORDER BY rev_30 DESC LIMIT 20;


-- My idea is to start the business in messina, so lets check about messina city

SELECT id,
       host_name,
	   neighbourhood_cleansed, 
       30-availability_30 AS bookings_30,
       REPLACE(REPLACE(price,'$',' '),',',' ') AS price_cleaned,
       (30-availability_30) * (REPLACE(REPLACE(price,'$',' '),',','')) AS rev_30
FROM messina_province
WHERE neighbourhood_cleansed = 'Messina'
ORDER BY rev_30 DESC Limit 20;

-- Yep, It is a good revenue to GO

-- Lets find the correlation between Price and Bookings. 
-- To get a wide view lets consider yearly behaviour

SELECT id,
       host_name,
	   neighbourhood_cleansed, 
       365-availability_365 AS bookings_365,
       REPLACE(REPLACE(price,'$',' '),',',' ') AS price_cleaned       
FROM messina_province
ORDER BY bookings_365 desc; 


-- Lets consider about Location

SELECT id,
       host_name,
	   neighbourhood_cleansed, 
       365-availability_365 AS bookings_365,
       REPLACE(REPLACE(price,'$',' '),',',' ') AS price_cleaned
       
FROM messina_province
ORDER BY bookings_365 DESC;

-- So bookings are mainly depend on location

-- Lets find about property types, What kind of Property types are best for the business

 SELECT  
	property_type,
    Sum(365-availability_365),
       count(property_type)	
FROM messina_province
group by property_type;

-- Listings count per location
SELECT  
	neighbourhood_cleansed,
    Count(neighbourhood_cleansed) 	
FROM messina_province
group by neighbourhood_cleansed


 



