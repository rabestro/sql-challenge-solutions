-- List all customers and their sales, even if some data is gone

SELECT
    customerid,
    firstname,
    lastname,
    salesid,
    salesamount,
    solddate
FROM
    customer
    FULL OUTER JOIN
        sales USING(customerId);