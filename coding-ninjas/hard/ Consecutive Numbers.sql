    -- Write an SQL query to find all numbers that appear at least three times consecutively.

    WITH
        numbers AS
            (SELECT
                 num,
                 LAG(num) OVER (ORDER BY id)  AS prev_num,
                 LEAD(num) OVER (ORDER BY id) AS next_num
             FROM
                 logs)

    SELECT DISTINCT
        num AS consecutivenums
    FROM
        numbers
    WHERE
        num = prev_num AND
        num = next_num;
