-- Write a SQL query to find employees who have the highest salary in each of the departments.

WITH
    max_salary AS
        (SELECT
             departmentid,
             MAX(salary) AS max_salary
         FROM
             employee
             INNER JOIN department
             ON employee.departmentid = department.id
         GROUP BY
             departmentid)

SELECT
    d.name       AS Department,
    e.name       AS Employee,
    m.max_salary AS salary
FROM
    max_salary m
    INNER JOIN department d
    ON d.id = m.departmentid
    INNER JOIN employee e
    ON m.departmentid = e.departmentid
        AND e.salary = m.max_salary
ORDER BY
    m.max_salary DESC, e.name DESC;