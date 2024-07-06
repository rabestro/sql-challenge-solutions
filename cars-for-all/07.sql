-- Summarize sales per year by using a CTE

WITH
    sales_per_year AS
        (SELECT
             STRFTIME('%Y', solddate) AS year,
             salesamount
         FROM
             sales)
SELECT
    year,
    FORMAT('$%,.2f', SUM(salesamount)) AS total_sales
FROM
    sales_per_year
GROUP BY
    year
ORDER BY
    year;