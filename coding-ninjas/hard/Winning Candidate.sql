SELECT name
FROM candidate
ORDER BY (
    SELECT COUNT(*)
    FROM vote
    WHERE vote.candidateid = candidate.id) DESC
LIMIT 1;