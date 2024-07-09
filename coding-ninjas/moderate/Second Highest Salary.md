# Second Highest Salary

## Problem Statement

Write a SQL query to get the second highest salary from the Employee table.

The structure of the Employee table is as follows:

```
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```

Your task is to find the second highest salary from the table. If there is no second highest salary (in case there's only one unique salary), the query should return null.

Example output for the given table:

```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

## Solution

To solve this problem, we can use the following SQL query:

```sql
SELECT DISTINCT
    salary
FROM
    employee
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;
```

This query selects distinct salaries from the `employee` table, orders them in descending order, and uses `LIMIT 1 OFFSET 1` to get the second highest salary. If there is no second highest salary, it returns null.