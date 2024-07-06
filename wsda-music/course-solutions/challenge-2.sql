-- Code Challenge: Categorize tracks by price

SELECT
    name      AS "Track Name",
    composer,
    unitprice AS price,
    CASE
        WHEN unitprice <= 0.99 THEN 'Budget'
        WHEN unitprice BETWEEN 1.0 AND 1.49 THEN 'Regular'
        WHEN unitprice BETWEEN 1.5 AND 1.99 THEN 'Premium'
        ELSE 'Exclusive'
        END   AS pricecategory
FROM
    track
ORDER BY
    unitprice
