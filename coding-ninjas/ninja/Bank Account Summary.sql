WITH
    paid AS
        (SELECT
             paid_by     AS user_id,
             SUM(amount) AS amount
         FROM
             transactions
         GROUP BY paid_by)
  , received AS
        (SELECT
             paid_to     AS user_id,
             SUM(amount) AS amount
         FROM
             transactions
         GROUP BY paid_to)
  , balance AS
        (SELECT
             users.user_id,
             user_name,
             users.credit - COALESCE(paid.amount, 0) + COALESCE(received.amount, 0) AS credit
         FROM
             users
             LEFT JOIN paid ON users.user_id = paid.user_id
             LEFT JOIN received ON users.user_id = received.user_id)
SELECT
    user_id,
    user_name,
    credit,
    IIF(credit < 0, 'Yes', 'No') AS credit_limit_breached
FROM
    balance;
