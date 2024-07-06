-- Code Challenge: Concise track pricing report

SELECT
    name      AS [Track Name],
    unitprice AS [Price]
FROM
    track AS t
ORDER BY
    name
LIMIT 20