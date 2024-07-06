-- Create a list of employees and their immediate managers
-- Include the first name, last name, title, and the first and last name of the manager
-- Sort the report by the employee's last name in ascending order

SELECT
    e.firstname,
    e.lastname,
    e.title,
    m.firstname || ' ' || m.lastname AS manager
FROM
    employee e
    LEFT OUTER JOIN
        employee m ON m.employeeid = e.managerid
ORDER BY
    e.lastname;

