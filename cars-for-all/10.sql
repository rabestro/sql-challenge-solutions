-- For each salesperson, rank the car models they've sold the most

WITH
    sales_per_model AS
        (SELECT
             employeeid,
             modelid,
             COUNT(*) AS sales
         FROM
             sales
             INNER JOIN inventory USING (inventoryid)
         GROUP BY
             employeeid, modelid),
    ranked_sales_per_model AS
        (SELECT
             employeeid,
             modelid,
             sales,
             RANK() OVER (PARTITION BY employeeid ORDER BY sales DESC) AS rank
         FROM
             sales_per_model)

SELECT
    firstname,
    lastname,
    model,
    sales,
    rank
FROM
    ranked_sales_per_model
    INNER JOIN employee USING (employeeid)
    INNER JOIN model USING (modelid)
ORDER BY
    lastname, firstname, rank;
