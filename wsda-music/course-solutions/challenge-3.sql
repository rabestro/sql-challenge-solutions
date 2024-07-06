-- Code Challenge: Analyzing customer support interactions

SELECT
    c.firstname AS customerfirstname,
    c.lastname  AS customerlastname,
    e.firstname AS supportrepfirstname,
    e.lastname  AS supportreplastname
FROM
    customer AS c
    INNER JOIN employee e ON e.employeeid = c.supportrepid
ORDER BY
    e.lastname, c.lastname
