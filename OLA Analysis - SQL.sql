-- 1. Retrieve all successful bookings:
create view successful_bookings as
SELECT * FROM `bookings-40000-rows` WHERE Booking_Status = 'Success';

--  2. Find the average ride distance for each vehicle type:

SELECT avg(Ride_Distance), Vehicle_Type FROM ola.`bookings-40000-rows`
group by Vehicle_Type;

--  3. Get the total number of cancelled rides by customers:

SELECT count(*) FROM ola.`bookings-40000-rows` where Booking_Status = "Canceled by Customer";

--  4. List the top 5 customers who booked the highest number of rides:

SELECT Customer_ID, count(Booking_ID) as Total_Booking FROM ola.`bookings-40000-rows`
group by Customer_ID
order by Total_Booking desc
limit 5;


--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT count(*) FROM `bookings-40000-rows` 
where Canceled_Rides_by_Driver = "Personal & Car related issue";

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT Vehicle_Type, max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
FROM ola.`bookings-40000-rows` 
where Vehicle_Type = "Prime Sedan";

--  7. Retrieve all rides where payment was made using UPI:

SELECT * FROM ola.`bookings-40000-rows`
where Payment_Method = "UPI";


--  8. Find the average customer rating per vehicle type:

SELECT Vehicle_Type, round(avg(Customer_Rating)) as avg_customer_rating 
FROM ola.`bookings-40000-rows`
group by Vehicle_Type;

--  9. Calculate the total booking value of rides completed successfully:

SELECT sum(Booking_Value) as total_successful_ride_value FROM ola.`bookings-40000-rows`
where Booking_Status = "Success";

--  10. List all incomplete rides along with the reason:

SELECT Booking_ID, Incomplete_Rides_Reason FROM ola.`bookings-40000-rows`
where Incomplete_Rides = "Yes";


