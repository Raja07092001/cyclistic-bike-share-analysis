-- Cyclistic Bike-Share Analysis — 2025
-- SQL Analysis Queries
-- Author: Raja
-- Database: SQLite / DB Browser for SQLite
-- Clean analysis table: tripdata_2025_clean

/* ============================================================
   1. DATA CLEANING
   ============================================================ */

-- Monthly cleaning logic used during preparation:
-- Keep records with required fields and positive ride duration.
-- The same logic was applied while preparing the monthly datasets.

SELECT *
FROM tripdata_2025_clean
WHERE start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND member_casual IS NOT NULL
  AND rideable_type IS NOT NULL
  AND (julianday(ended_at) - julianday(started_at)) * 24 * 60 > 0;


/* ============================================================
   2. TOTAL NUMBER OF RIDES
   ============================================================ */

SELECT COUNT(*) AS total_rides
FROM tripdata_2025_clean;


/* ============================================================
   3. RIDES BY RIDER TYPE
   ============================================================ */

SELECT
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY member_casual
ORDER BY ride_count DESC;


/* ============================================================
   4. RIDES BY BIKE TYPE
   ============================================================ */

SELECT
    rideable_type AS bike_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY rideable_type
ORDER BY ride_count DESC;


/* ============================================================
   5. BIKE TYPE BY RIDER TYPE
   ============================================================ */

SELECT
    rideable_type AS bike_type,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual;


/* ============================================================
   6. MONTHLY RIDES
   ============================================================ */

SELECT
    strftime('%m', started_at) AS month_number,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%m', started_at)
ORDER BY month_number;


/* ============================================================
   7. MONTHLY RIDES BY RIDER TYPE
   ============================================================ */

SELECT
    strftime('%m', started_at) AS month_number,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%m', started_at), member_casual
ORDER BY month_number, rider_type;


/* ============================================================
   8. RIDES BY DAY OF WEEK
   ============================================================ */

SELECT
    CASE strftime('%w', started_at)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%w', started_at)
ORDER BY strftime('%w', started_at);


/* ============================================================
   9. RIDES BY DAY OF WEEK AND RIDER TYPE
   ============================================================ */

SELECT
    CASE strftime('%w', started_at)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%w', started_at), member_casual
ORDER BY strftime('%w', started_at), member_casual;


/* ============================================================
   10. RIDES BY HOUR
   ============================================================ */

SELECT
    strftime('%H', started_at) AS ride_hour,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%H', started_at)
ORDER BY ride_hour;


/* ============================================================
   11. RIDES BY HOUR AND RIDER TYPE
   ============================================================ */

SELECT
    strftime('%H', started_at) AS ride_hour,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
GROUP BY strftime('%H', started_at), member_casual
ORDER BY ride_hour, member_casual;


/* ============================================================
   12. AVERAGE RIDE DURATION
   ============================================================ */

SELECT
    member_casual AS rider_type,
    ROUND(
        AVG((julianday(ended_at) - julianday(started_at)) * 24 * 60),
        2
    ) AS avg_ride_duration_minutes
FROM tripdata_2025_clean
GROUP BY member_casual;


/* ============================================================
   13. AVERAGE RIDE DURATION BY MONTH AND RIDER TYPE
   ============================================================ */

SELECT
    strftime('%m', started_at) AS month_number,
    member_casual AS rider_type,
    ROUND(
        AVG((julianday(ended_at) - julianday(started_at)) * 24 * 60),
        2
    ) AS avg_ride_duration_minutes
FROM tripdata_2025_clean
GROUP BY strftime('%m', started_at), member_casual
ORDER BY month_number, member_casual;


/* ============================================================
   14. TOP 10 START STATIONS
   ============================================================ */

SELECT
    start_station_name,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY ride_count DESC
LIMIT 10;


/* ============================================================
   15. TOP 10 START STATIONS BY RIDER TYPE
   ============================================================ */

SELECT
    start_station_name,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name, member_casual
ORDER BY ride_count DESC
LIMIT 10;


/* ============================================================
   16. TOP 10 END STATIONS
   ============================================================ */

SELECT
    end_station_name,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
WHERE end_station_name IS NOT NULL
GROUP BY end_station_name
ORDER BY ride_count DESC
LIMIT 10;


/* ============================================================
   17. TOP 10 END STATIONS BY RIDER TYPE
   ============================================================ */

SELECT
    end_station_name,
    member_casual AS rider_type,
    COUNT(*) AS ride_count
FROM tripdata_2025_clean
WHERE end_station_name IS NOT NULL
GROUP BY end_station_name, member_casual
ORDER BY ride_count DESC
LIMIT 10;


/* ============================================================
   18. MONTHLY RIDES BY RIDER TYPE WITH PERCENTAGE SHARE
   ============================================================ */

WITH monthly_rides AS (
    SELECT
        strftime('%m', started_at) AS month_number,
        member_casual AS rider_type,
        COUNT(*) AS ride_count
    FROM tripdata_2025_clean
    GROUP BY strftime('%m', started_at), member_casual
),
monthly_totals AS (
    SELECT
        month_number,
        SUM(ride_count) AS total_rides
    FROM monthly_rides
    GROUP BY month_number
)
SELECT
    m.month_number,
    m.rider_type,
    m.ride_count,
    ROUND(100.0 * m.ride_count / t.total_rides, 2) AS percentage_of_month
FROM monthly_rides m
JOIN monthly_totals t
  ON m.month_number = t.month_number
ORDER BY m.month_number, m.rider_type;


/* ============================================================
   NOTES
   ============================================================

   The queries above support the Tableau analysis and Story built
   for the Cyclistic 2025 case study.

   Main analytical dimensions:
   - Rider type
   - Month
   - Day of week
   - Hour of day
   - Bike type
   - Ride duration
   - Start station
   - End station
*/
