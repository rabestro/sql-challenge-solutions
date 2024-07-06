-- Find the sales of cars that are electric by using a subquery


SELECT
    DATE(solddate)                AS date,
    FORMAT('$%,.2f', salesamount) AS amount,
    colour                        AS colour,
    year                          AS year
FROM
    sales
    INNER JOIN inventory USING (inventoryid)
WHERE
    modelid IN
    (SELECT
         modelid
     FROM
         model
     WHERE
         enginetype = 'Electric');