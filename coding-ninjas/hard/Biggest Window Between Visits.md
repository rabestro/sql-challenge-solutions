# SQL Query for Largest Window Between Visits

## Problem Statement

Given a table `UserVisits` without a primary key, containing logs of dates that users visited a certain retailer, the task is to write an SQL query that finds, for each `user_id`, the largest window of days between each visit and the one right after it (or today if considering the last visit). The result should be ordered by `user_id`.

### Table: UserVisits

| Column Name | Type |
|-------------|------|
| user_id     | int  |
| visit_date  | date |

### Requirements

- Assume today's date is '2021-1-1'.
- Return the result table ordered by `user_id`.

### Example

#### UserVisits table:

| user_id | visit_date |
|---------|------------|
| 1       | 2020-11-28 |
| 1       | 2020-10-20 |
| 1       | 2020-12-3  |
| 2       | 2020-10-5  |
| 2       | 2020-12-9  |
| 3       | 2020-11-11 |

#### Result table:

| user_id | biggest_window|
|---------|---------------|
| 1       | 39            |
| 2       | 65            |
| 3       | 51            |

### Solution

The solution involves calculating the difference in days between each visit and the next one for each user, with a special case for the last visit where the difference is calculated up to today's date ('2021-1-1'). The largest window of days is then selected for each user.

```sql
SELECT "user_id", MAX("days_between_visits") AS "biggest_window"
FROM (SELECT uv."user_id",
             COALESCE(lead(uv."visit_date") OVER "visits", '2021-01-01'::date) -
             uv."visit_date" AS "days_between_visits"
      FROM "uservisits" AS uv
      WINDOW "visits" AS (PARTITION BY "user_id" ORDER BY "visit_date")) AS subquery
GROUP BY "user_id"
ORDER BY "user_id";
```

This query utilizes the `LEAD` window function to look ahead to the next visit date for each user, calculates the difference in days between visits, and handles the last visit by assuming the next visit date is '2021-01-01'. It then finds the maximum window for each user.