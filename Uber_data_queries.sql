USE uber_data;

SELECT* FROM uber_data;

##Total Trips per Day by Each Vendor
SELECT VendorID,COUNT(VendorID) as Trips_by_each_Vendor
FROM uber_data
GROUP BY VendorID;

# Total amount received by each Vendor
SELECT VendorID,SUM(total_amount) as Yearly_Amount
FROM uber_data
GROUP BY VendorID;


# Maximum- Distance covered by each vendor
SELECT VendorID,MAX(trip_distance) as Max_distance
FROM uber_data
GROUP BY VendorID;


# Trips per day by each vendor
SELECT VendorID,DATE(tpep_pickup_datetime) AS date, COUNT(*) AS total_trips
FROM uber_data
GROUP BY DATE(tpep_pickup_datetime), VendorID;


# Most common pickup points
SELECT pickup_latitude, pickup_longitude, COUNT(*) AS total_trips
FROM uber_data
GROUP BY pickup_latitude, pickup_longitude
ORDER BY total_trips DESC
LIMIT 10;


#Most common DropOff points
SELECT dropoff_latitude, dropoff_longitude, COUNT(*) AS total_trips
FROM uber_data
GROUP BY dropoff_latitude, dropoff_longitude
ORDER BY total_trips DESC
LIMIT 10;


#Average Fare amount per trip
SELECT AVG(fare_amount) AS average_fare 
FROM uber_data;


#Payment collected by each payment method
SELECT payment_type, SUM(total_amount) AS total_collected
FROM uber_data
GROUP BY payment_type;

# Trips with more than 4 passengers for each vendor
SELECT  VendorID, COUNT(*)
FROM uber_data
WHERE passenger_count > 4
GROUP BY VendorID;

# Avg cost components per trip
SELECT 
    AVG(fare_amount) AS average_fare,
    AVG(mta_tax) AS average_mta_tax,
    AVG(tip_amount) AS average_tip,
    AVG(tolls_amount) AS average_tolls,
    AVG(improvement_surcharge) AS average_surcharge,
    AVG(total_amount) AS average_total
FROM uber_data;

# Ratings of each type for each vendor
SELECT VendorID, RatecodeID,COUNT(RatecodeID) as Ratings
FROM uber_data
GROUP BY VendorID, RatecodeID
ORDER BY RatecodeID ASC;



