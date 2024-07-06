-- Find the least and most expensive car sold by each employee in the last two years

SELECT
    employeeid,
    firstname,
    lastname,
    title,
    MIN(salesamount) AS min_price,
    MAX(salesamount) AS max_price
FROM
    employee
    INNER JOIN
        sales USING (employeeid)
WHERE
    solddate >= DATE('now', '-2 year')
GROUP BY
    employeeid;