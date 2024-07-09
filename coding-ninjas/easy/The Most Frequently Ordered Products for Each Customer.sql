WITH
    orders_count AS (
        SELECT
            customer_id,
            product_id,
            COUNT(product_id) AS orders_count
        FROM
            orders
        GROUP BY
            customer_id, product_id
    ),
    max_orders_count AS (
        SELECT
            customer_id,
            MAX(orders_count) AS max_orders_count
        FROM
            orders_count
        GROUP BY
            customer_id
    )

SELECT
    o.customer_id,
    o.product_id,
    p.product_name
FROM
    orders_count o
    INNER JOIN max_orders_count m
    ON o.customer_id = m.customer_id
    AND o.orders_count = m.max_orders_count
    INNER JOIN products p
    ON o.product_id = p.product_id