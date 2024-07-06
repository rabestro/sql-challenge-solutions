-- CHALLENGE 2
-- More targeted questions that query tables containing data about customers and employees

CREATE TEMPORARY TABLE purchases_2011_2012 AS
SELECT
    *
FROM
    invoice
WHERE
    invoicedate BETWEEN '2011-01-01' AND '2012-12-31';

-- 1. Get a list of customers who made purchases between 2011 and 2012.

SELECT DISTINCT
    customerid
FROM
    purchases_2011_2012;

-- 2. Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.

SELECT
    c.firstname || ' ' || c.lastname AS customer_name,
    e.firstname || ' ' || e.lastname AS sales_rep,
    ROUND(SUM(total), 2)             AS total_revenue
FROM
    purchases_2011_2012
    INNER JOIN customer c USING (customerid)
    INNER JOIN employee e ON c.supportrepid = e.employeeid
GROUP BY
    customerid;

-- 3. How many transactions are above the average transaction amount during the same time period?

SELECT
    COUNT(*)
FROM
    purchases_2011_2012
WHERE
    total > (SELECT
                 AVG(total)
             FROM
                 purchases_2011_2012);

-- 4. What is the average transaction amount for each year that WSDA Music has been in business?

WITH
    transactions AS
        (SELECT
             STRFTIME('%Y', invoicedate) AS year,
             total
         FROM
             invoice)
SELECT
    year,
    ROUND(AVG(total), 2) AS avg_transaction_amount
FROM
    transactions
GROUP BY
    year
ORDER BY
    year;

