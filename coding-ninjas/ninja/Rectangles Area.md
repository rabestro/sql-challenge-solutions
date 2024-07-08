# Rectangles Area Problem

## Problem Statement

Given a table `Points` representing points as 2D coordinates `(x_value, y_value)`, the task is to write an SQL query that reports all possible axis-aligned rectangles with non-zero area that can be formed by any two points in the table.

### Table Structure

- **Table Name:** Points
- **Columns:**
  - `id` (int): Primary key.
  - `x_value` (int): The x-coordinate of a point.
  - `y_value` (int): The y-coordinate of a point.

### Requirements

- The result should contain three columns: `p1`, `p2`, and `area`.
  - `p1` and `p2` are the IDs of the two points forming the opposite corners of a rectangle.
  - `area` is the area of the rectangle, which must be non-zero.
- The results should be ordered by `area` in descending order. In case of a tie, order by `p1`'s ID in ascending order, and if there's still a tie, then by `p2`'s ID in ascending order.

### Example

#### Points Table

| id | x_value | y_value |
|----|---------|---------|
| 1  | 2       | 7       |
| 2  | 4       | 8       |
| 3  | 2       | 10      |

#### Result Table

| p1 | p2  | area |
|----|-----|------|
| 2  | 3   | 4    |
| 1  | 2   | 2    |

- The rectangle formed by points `p1 = 2` and `p2 = 3` has an area of `|4-2| * |8-10| = 4`.
- The rectangle formed by points `p1 = 1` and `p2 = 2` has an area of `|2-4| * |7-8| = 2`.
- The rectangle formed by points `p1 = 1` and `p2 = 3` is invalid because the area is `0`.

## Solution

```sql
SELECT
    p1.id                                                       AS p1,
    p2.id                                                       AS p2,
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) AS area
FROM
    points AS p1,
    points AS p2
WHERE
      p2.id > p1.id
  AND p1.x_value != p2.x_value
  AND p1.y_value != p2.y_value
ORDER BY
    area DESC,
    p1.id;
```