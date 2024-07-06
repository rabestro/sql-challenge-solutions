-- CHALLENGE 1
-- General queries that begin to give you some high-level context

-- 1. How many transactions took place between the years 2011 and 2012?

SELECT
    COUNT(*)
FROM
    invoice
WHERE
    invoicedate BETWEEN '2011-01-01' AND '2012-12-31';

-- 2. How much money did WSDA Music make during the same period?

SELECT
    SUM(total) AS total_revenue
FROM
    invoice
WHERE
    invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
