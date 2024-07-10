# Rising Temperature

## Problem Statement

Given a `Weather` table, the task is to find all dates' IDs with a higher temperature compared to its previous day.

## Table Structure

### Weather Table

| Column Name   | Type    |
|---------------|---------|
| id            | int     |
| recordDate    | date    |
| temperature   | int     |

- `id` is the primary key for this table.
- This table contains information about the temperature on a certain day.

## Objective

Write an SQL query to identify all the dates (represented by their IDs) where the temperature was higher than the previous day.

## Example

### Input: Weather Table

| id | recordDate | Temperature |
|----|------------|-------------|
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

### Output: Result Table

| Id |
|----|
| 2  |
| 4  |

### Explanation

- On 2015-01-02, the temperature was higher than the previous day (10 -> 25).
- On 2015-01-04, the temperature was higher than the previous day (20 -> 30).

## Solution

The solution involves joining the `Weather` table with itself to compare each day's temperature with the previous day's temperature. The query filters out the records where the temperature is higher than the previous day.

```sql
SELECT
    today.id AS "Id"
FROM
    weather today
    JOIN weather yesterday
    ON today.recorddate = yesterday.recorddate + 1
        AND today.temperature > yesterday.temperature;
```