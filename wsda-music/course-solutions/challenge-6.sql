-- Code Challenge: Uncovering unpopular tracks

WITH Populartracks AS (
    SELECT DISTINCT
        Trackid
    FROM
        Invoiceline
)

SELECT
    T.Trackid AS "Track ID",
    T.Name    AS "Track Name",
    T.Composer,
    G.Name    AS Genre
FROM
    Track T
INNER JOIN
    Genre G ON G.Genreid = T.Genreid
WHERE
    T.Trackid NOT IN Populartracks
ORDER BY
    T.Name
