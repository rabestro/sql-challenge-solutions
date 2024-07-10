-- find all dates' id with higher temperature compared to its previous dates.

SELECT
    today.id AS "Id"
FROM
    weather today
    JOIN weather yesterday
    ON today.recorddate = yesterday.recorddate + 1
        AND today.temperature > yesterday.temperature;