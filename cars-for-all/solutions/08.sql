-- Report the sales for each sales person for each month in 2021

WITH
    sales_person AS
        (SELECT
             employeeid,
             firstname,
             lastname
         FROM
             employee
         WHERE
             title = 'Sales Person'),
    sales_in_2021 AS
        (SELECT
             STRFTIME('%m', solddate) AS month,
             employeeid,
             salesamount
         FROM
             sales
         WHERE
             solddate BETWEEN '2021-01-01' AND '2021-12-31'),
    sales_per_month AS
        (SELECT
             employeeid,
             SUM(CASE WHEN month = '01' THEN salesamount END) AS jan,
             SUM(CASE WHEN month = '02' THEN salesamount END) AS feb,
             SUM(CASE WHEN month = '03' THEN salesamount END) AS mar,
             SUM(CASE WHEN month = '04' THEN salesamount END) AS apr,
             SUM(CASE WHEN month = '05' THEN salesamount END) AS may,
             SUM(CASE WHEN month = '06' THEN salesamount END) AS jun,
             SUM(CASE WHEN month = '07' THEN salesamount END) AS jul,
             SUM(CASE WHEN month = '08' THEN salesamount END) AS aug,
             SUM(CASE WHEN month = '09' THEN salesamount END) AS sep,
             SUM(CASE WHEN month = '10' THEN salesamount END) AS oct,
             SUM(CASE WHEN month = '11' THEN salesamount END) AS nov,
             SUM(CASE WHEN month = '12' THEN salesamount END) AS dec
         FROM
             sales_in_2021
         GROUP BY
             employeeid)
SELECT
    firstname,
    lastname,
    FORMAT('$%,.2f', jan) AS jan,
    FORMAT('$%,.2f', feb) AS feb,
    FORMAT('$%,.2f', mar) AS mar,
    FORMAT('$%,.2f', apr) AS apr,
    FORMAT('$%,.2f', may) AS may,
    FORMAT('$%,.2f', jun) AS jun,
    FORMAT('$%,.2f', jul) AS jul,
    FORMAT('$%,.2f', aug) AS aug,
    FORMAT('$%,.2f', sep) AS sep,
    FORMAT('$%,.2f', oct) AS oct,
    FORMAT('$%,.2f', nov) AS nov,
    FORMAT('$%,.2f', dec) AS dec
FROM
    sales_person
    LEFT OUTER JOIN sales_per_month USING (employeeid)
ORDER BY
    lastname, firstname
