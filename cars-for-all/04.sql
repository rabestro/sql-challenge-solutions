-- How many cars have been sold per employee?

SELECT
    employeeid,
    firstname,
    lastname,
    title,
    COUNT(salesid) AS cars_sold
FROM
    employee
    LEFT OUTER JOIN
        sales USING (employeeid)
GROUP BY
    employeeid
ORDER BY
    cars_sold DESC;