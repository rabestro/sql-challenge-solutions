-- Display the number of cars sold this month and last month

WITH
    monthly_sales AS
        (SELECT
             STRFTIME('%Y-%m', solddate) AS year_month,
             COUNT(*)                    AS cars_sold
         FROM
             sales
         GROUP BY
             year_month)
SELECT
    year_month,
    cars_sold,
    LAG(cars_sold) OVER (ORDER BY year_month) AS cars_sold_last_month
FROM
    monthly_sales
ORDER BY
    year_month;