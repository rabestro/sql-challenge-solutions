-- CHALLENGE 3
-- Queries that perform in-depth analysis with the aim of finding employees
-- who may have been financially motivated to commit a crime

-- 1. Get a list of employees who exceeded the average transaction amount
-- from sales they generated during 2011 and 2012.

SELECT
    e.firstname || ' ' || e.lastname AS employee_name,
    ROUND(AVG(i.total), 2)           AS avg_transaction_amount
FROM
    invoice i
    INNER JOIN main.customer c ON c.customerid = i.customerid
    INNER JOIN main.employee e ON e.employeeid = c.supportrepid
WHERE
    i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
GROUP BY
    e.firstname, e.lastname
HAVING
    AVG(i.total) > (SELECT
                        AVG(total)
                    FROM
                        invoice
                    WHERE
                        invoicedate BETWEEN '2011-01-01' AND '2012-12-31');

-- 2. Create a Commission Payout column that displays each employee’s
-- commission based on 15% of the sales transaction amount.

SELECT
    e.firstname || ' ' || e.lastname AS employee_name,
    ROUND(SUM(i.total * 0.15), 2)    AS commission_payout
FROM
    invoice i
    INNER JOIN main.customer c ON c.customerid = i.customerid
    INNER JOIN main.employee e ON e.employeeid = c.supportrepid
WHERE
    i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
GROUP BY
    e.firstname, e.lastname
ORDER BY
    e.lastname;

-- 3. Which employee made the highest commission?

SELECT
    e.employeeid,
    e.firstname,
    e.lastname,
    ROUND(SUM(i.total * 0.15), 2) AS commission_payout
FROM
    employee e
    INNER JOIN main.customer c ON e.employeeid = c.supportrepid
    INNER JOIN main.invoice i ON c.customerid = i.customerid
WHERE
    i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
GROUP BY
    e.employeeid, e.firstname, e.lastname
ORDER BY
    commission_payout DESC
LIMIT 1;

-- 4. List the customers that the employee identified in the last question.

WITH
    suspicios_employee AS
        (SELECT
             e.employeeid,
             e.firstname || ' ' || e.lastname AS employee_name,
             ROUND(SUM(i.total * 0.15), 2)    AS commission_payout
         FROM
             employee e
             INNER JOIN main.customer c ON e.employeeid = c.supportrepid
             INNER JOIN main.invoice i ON c.customerid = i.customerid
         WHERE
             i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
         GROUP BY
             e.employeeid, e.firstname, e.lastname
         ORDER BY
             commission_payout DESC
         LIMIT 1)

SELECT DISTINCT
    c.customerid,
    c.firstname || ' ' || c.lastname AS customer_name
FROM
    customer c,
    suspicios_employee
    INNER JOIN invoice i ON c.customerid = i.customerid
WHERE
      i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
  AND c.supportrepid = suspicios_employee.employeeid
ORDER BY
    c.lastname, c.firstname;

-- 5. Which customer made the highest purchase?

WITH
    suspicios_employee AS
        (SELECT
             e.employeeid,
             e.firstname || ' ' || e.lastname AS employee_name,
             ROUND(SUM(i.total * 0.15), 2)    AS commission_payout
         FROM
             employee e
             INNER JOIN main.customer c ON e.employeeid = c.supportrepid
             INNER JOIN main.invoice i ON c.customerid = i.customerid
         WHERE
             i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
         GROUP BY
             e.employeeid, e.firstname, e.lastname
         ORDER BY
             commission_payout DESC
         LIMIT 1)
SELECT DISTINCT
    c.customerid,
    c.firstname || ' ' || c.lastname AS customer_name,
    ROUND(SUM(i.total), 2)           AS total_purchase
FROM
    customer c,
    suspicios_employee
    INNER JOIN invoice i ON c.customerid = i.customerid
WHERE
      i.invoicedate BETWEEN '2011-01-01' AND '2012-12-31'
  AND c.supportrepid = suspicios_employee.employeeid
ORDER BY
    total_purchase DESC
LIMIT 1;

-- 6. Look at this customer record—do you see anything suspicious?

SELECT
    *
FROM
    customer c
WHERE
    c.lastname = 'Doeein'

