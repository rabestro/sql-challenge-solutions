# Actor-Director Collaboration Analysis

## Problem Statement

Given a table `ActorDirector` that records collaborations between actors and directors through various projects (identified by timestamps), the goal is to write a SQL query that identifies pairs of `actor_id` and `director_id` who have worked together on at least three separate occasions.

### Table Structure

The `ActorDirector` table has the following columns:

- `actor_id` (int): The ID of the actor.
- `director_id` (int): The ID of the director.
- `timestamp` (int): A unique identifier for each collaboration, serving as the primary key.

### Objective

Identify all actor-director pairs (`actor_id`, `director_id`) that have collaborated at least three times.

### Example

Consider the following `ActorDirector` table:

| actor_id | director_id | timestamp |
|----------|-------------|-----------|
| 1        | 1           | 0         |
| 1        | 1           | 1         |
| 1        | 1           | 2         |
| 1        | 2           | 3         |
| 1        | 2           | 4         |
| 2        | 1           | 5         |
| 2        | 1           | 6         |

**Expected Result:**

| actor_id | director_id |
|----------|-------------|
| 1        | 1           |

Explanation: The only pair that meets the criteria is (1, 1), with three collaborations.

## Solution

The solution involves grouping records by `actor_id` and `director_id`, then filtering for those pairs with a count of at least three.

### SQL Query

```sql
SELECT
    actor_id,
    director_id
FROM
    actordirector
GROUP BY
    actor_id, director_id
HAVING
    COUNT(timestamp) >= 3;
```