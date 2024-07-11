# Shortest Distance Between Points in a Plane

## Problem Statement

Given a table `point_2d` that holds the coordinates `(x,y)` of some unique points in a plane, the task is to write a SQL query to find the shortest distance between these points, rounded to 2 decimals.

### Table Structure

The `point_2d` table has the following structure:

| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |

### Objective

Find the shortest distance between the points in the `point_2d` table, with the distance rounded to 2 decimals.

### Example Output

The expected output for the given data is:

| shortest |
|----------|
| 1        |

### Note

- The longest distance among all the points is less than 10000.

## Solution

To find the shortest distance between points in a plane stored in a SQL table, we can use the following approach:

1. Calculate the distance between each pair of points using the distance formula. For points `(x1, y1)` and `(x2, y2)`, the distance `d` is calculated as `sqrt((x2 - x1)^2 + (y2 - y1)^2)`.
2. Use a self-join on the `point_2d` table to compare each point with every other point.
3. Order the results by distance in ascending order.
4. Use `LIMIT` to get the shortest distance.
5. Since the task specifies rounding to 2 decimals, we use the `ROUND` function to format the output.

### SQL Query

```sql
SELECT 
    ROUND(MIN(SQRT(POWER(p1.x - p2.x, 2) + POWER(p1.y - p2.y, 2))), 2) AS shortest
FROM
    point_2d p1,
    point_2d p2
WHERE
    p1.x != p2.x OR p1.y != p2.y
```

This query calculates the distance between each pair of distinct points in the `point_2d` table and selects the minimum distance, rounded to 2 decimal places.