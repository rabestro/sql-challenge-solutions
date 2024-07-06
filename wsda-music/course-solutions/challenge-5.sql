-- Code Challenge: Calculate average spend per city

SELECT
    Billingcity          AS City,
    ROUND(AVG(Total), 2) AS Averagespending
FROM
    Invoice AS I
GROUP BY
    Billingcity
ORDER BY
    City
