# Winning Candidate Problem

## Problem Statement

Given two tables, `Candidate` and `Vote`, the goal is to write an SQL query to find the name of the winning candidate. The winning candidate is the one with the highest number of votes. It is assumed that there is no tie, meaning there will be only one winning candidate.

### Tables Structure

#### Candidate Table

| id  | Name |
| --- | ---- |
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |
| 5   | E    |

- `id` is the primary key.
- `Name` is the name of the candidate.

#### Vote Table

| id  | CandidateId |
| --- | ----------- |
| 1   | 2           |
| 2   | 4           |
| 3   | 3           |
| 4   | 2           |
| 5   | 5           |

- `id` is the auto-increment primary key.
- `CandidateId` is the foreign key that references `id` in the Candidate table.

### Objective

Find the name of the candidate who has received the highest number of votes.

### Example Output

| Name |
| ---- |
| B    |

### Solution

The SQL query to find the winning candidate is as follows:

```sql
SELECT name
FROM candidate
ORDER BY (
    SELECT COUNT(*)
    FROM vote
    WHERE vote.candidateid = candidate.id) DESC
LIMIT 1;
```

This query orders the candidates by the number of votes they have received in descending order and limits the result to the top candidate.