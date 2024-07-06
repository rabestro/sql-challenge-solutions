-- Find salespeople who have zero sales

SELECT
    firstname,
    lastname,
    title,
    startdate
FROM
    employee
    LEFT OUTER JOIN
        sales USING (employeeid)
WHERE
      title = 'Sales Person'
  AND salesid IS NULL;
