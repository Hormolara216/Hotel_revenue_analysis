#calculate the total revenue of the hotel by year (method1) using CTE, note: adr is the average daily rate
WITH Hotels AS(
    SELECT * FROM hotel.2018 
    UNION 
    SELECT * FROM hotel.2019 
    UNION 
    SELECT * FROM hotel.2020)

SELECT 
    arrival_date_year,hotel,
    ROUND(SUM(((stays_in_week_nights + stays_in_weekend_nights) * adr)),3) AS total_revenue
FROM
    Hotels
GROUP BY arrival_date_year,hotel;


#calculate the total revenue of the hotel by year (method1) using subquery
SELECT 
    arrival_date_year,hotel,
    ROUND(SUM(((stays_in_week_nights + stays_in_weekend_nights) * adr)),3) AS total_revenue
FROM
    (
    SELECT * FROM hotel.2018 
    UNION 
    SELECT * FROM hotel.2019 
    UNION 
    SELECT * FROM hotel.2020
) AS Hotels
GROUP BY arrival_date_year,hotel;  

#using join to connect the tables together
WITH Hotels AS(
    SELECT * FROM hotel.2018 
    UNION 
    SELECT * FROM hotel.2019 
    UNION 
    SELECT * FROM hotel.2020)
SELECT 
    *
FROM
    Hotels
        LEFT JOIN
    hotel.market_segment ON Hotels.market_segment = market_segment.market_segment
        LEFT JOIN
    hotel.meal_cost ON Hotels.meal = meal_cost.meal;
