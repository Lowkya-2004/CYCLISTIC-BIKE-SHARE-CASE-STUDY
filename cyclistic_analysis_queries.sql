-- Combining all six monthly datasets (November 2025 to April 2026) into a single table named combined_data using UNION ALL.
CREATE TABLE `cyclistic-case-study-da-01.cyclistic.combined_data` AS

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.november_2025`

UNION ALL

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.december_2025`

UNION ALL

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.january_2026`

UNION ALL

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.february_2026`

UNION ALL

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.march_2026`

UNION ALL

SELECT * FROM `cyclistic-case-study-da-01.cyclistic.april_2026`;


-- Check the total number of records in the combined dataset

SELECT COUNT(*) AS total_rides
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`;


-- Identify the distinct records in the combined dataset

SELECT DISTINCT *
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`;


-- Calculate the average ride length in minutes

SELECT
  ROUND(
    AVG(
      EXTRACT(HOUR FROM ride_length) * 60
      + EXTRACT(MINUTE FROM ride_length)
      + EXTRACT(SECOND FROM ride_length) / 60
    ), 2
  ) AS mean_ride_length_minutes
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`;


-- Find the maximum ride length in minutes

SELECT
  ROUND(
    MAX(
      EXTRACT(HOUR FROM ride_length) * 60
      + EXTRACT(MINUTE FROM ride_length)
      + EXTRACT(SECOND FROM ride_length) / 60
    ), 2
  ) AS maximum_ride_length_minutes
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`;


-- Identify the most frequently occurring day of the week

SELECT
  day_of_week,
  COUNT(*) AS ride_count
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
GROUP BY day_of_week
ORDER BY ride_count DESC
LIMIT 1;


-- Calculate the number of rides for each membership type

SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
GROUP BY member_casual
ORDER BY total_rides DESC;


-- Calculate the average ride length for each membership type

SELECT
  member_casual,
  ROUND(
    AVG(
      EXTRACT(HOUR FROM ride_length) * 60
      + EXTRACT(MINUTE FROM ride_length)
      + EXTRACT(SECOND FROM ride_length) / 60
    ), 2
  ) AS average_ride_length_minutes
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
WHERE ride_length IS NOT NULL
GROUP BY member_casual
ORDER BY average_ride_length_minutes DESC;


-- Calculate the number of rides for each day of the week

SELECT
  day_of_week,
  COUNT(*) AS total_rides
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
GROUP BY day_of_week
ORDER BY total_rides DESC;


-- Calculate the average ride length for each day of the week

SELECT
  day_of_week,
  ROUND(
    AVG(
      EXTRACT(HOUR FROM ride_length) * 60
      + EXTRACT(MINUTE FROM ride_length)
      + EXTRACT(SECOND FROM ride_length) / 60
    ), 2
  ) AS average_ride_length_minutes
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
GROUP BY day_of_week
ORDER BY average_ride_length_minutes DESC;


-- Calculate the number of rides for each membership type and day of the week

SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;


-- Calculate the average ride length for each membership type and day of the week

SELECT
  member_casual,
  day_of_week,
  ROUND(
    AVG(
      EXTRACT(HOUR FROM ride_length) * 60
      + EXTRACT(MINUTE FROM ride_length)
      + EXTRACT(SECOND FROM ride_length) / 60
    ), 2
  ) AS average_ride_length_minutes
FROM `cyclistic-case-study-da-01.cyclistic.combined_data`
WHERE ride_length IS NOT NULL
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;