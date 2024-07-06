-- Display a report for employees who have sold more than five cars this year.
-- Include their first name, last name, and the number of cars sold.
-- Sort the report by the number of cars sold in descending order.

SELECT
    employeeid,
    firstname,
    lastname,
    COUNT(salesid)   AS cars_sold,
    MIN(salesamount) AS min_price,
    MAX(salesamount) AS max_price
FROM
    employee
    INNER JOIN
        sales USING (employeeid)
WHERE
    solddate >= DATE('now', 'start of year')
GROUP BY
    employeeid
HAVING
    COUNT(salesid) > 5
ORDER BY
    cars_sold DESC;