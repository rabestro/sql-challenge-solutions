-- Create a report showing sales per month and an annual running total

WITH
    monthly_sales AS
        (SELECT
             STRFTIME('%Y', solddate) AS year,
             STRFTIME('%m', solddate) AS month,
             SUM(salesamount)         AS total_sales
         FROM
             sales
         GROUP BY
             year, month)
SELECT
    year,
    month,
    FORMAT('$%,.2f', total_sales)                          AS monthly_sales,
    FORMAT('$%,.2f', SUM(total_sales) OVER annual_running) AS running_total
FROM
    monthly_sales
WINDOW annual_running AS (PARTITION BY year ORDER BY month)
ORDER BY
    year, month;
