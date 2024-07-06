-- CHALLENGE 2
-- More targeted questions that query tables containing data about customers and employees

CREATE TEMPORARY TABLE IF NOT EXISTS purchases_2011_2012 AS
SELECT
    *
FROM
    invoice
WHERE
    invoicedate BETWEEN '2011-01-01' AND '2012-12-31';

-- 1. Get a list of customers who made purchases between 2011 and 2012.

SELECT DISTINCT
    customerid,
    firstname || ' ' || lastname AS customer_name,
    total
FROM
    purchases_2011_2012
    INNER JOIN customer USING (customerid);

-- 2. Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.

SELECT
    c.firstname || ' ' || c.lastname AS customer_name,
    e.firstname || ' ' || e.lastname AS sales_rep,
    total
FROM
    purchases_2011_2012
    INNER JOIN customer c USING (customerid)
    INNER JOIN employee e ON c.supportrepid = e.employeeid
ORDER BY
    total DESC;

-- 3. How many transactions are above the average transaction amount during the same time period?

SELECT
    COUNT(*) AS above_avg_transactions
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

-- Other solutions
SELECT
    STRFTIME('%Y', invoicedate) AS [Year],
    ROUND(AVG(total), 2)        AS [Avg Transaction Amount]
FROM
    invoice
GROUP BY
    STRFTIME('%Y', invoicedate)
