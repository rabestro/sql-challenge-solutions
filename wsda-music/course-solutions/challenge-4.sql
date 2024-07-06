-- Code Challenge: Customer postal code transformation

SELECT
    C.Firstname || ' ' || C.Lastname AS Customerfullname,
    SUBSTR(C.Postalcode, 1, 5)       AS Standardizedpostalcode
FROM
    Customer AS C
WHERE
    Country = 'USA'
ORDER BY
    Customerfullname
