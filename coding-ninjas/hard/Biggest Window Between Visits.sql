SELECT "user_id", MAX("days_between_visits") AS "biggest_window"
FROM (SELECT uv."user_id",
             COALESCE(lead(uv."visit_date") OVER "visits", '2021-01-01'::date) -
             uv."visit_date" AS "days_between_visits"
      FROM "uservisits" AS uv
      WINDOW "visits" AS (PARTITION BY "user_id" ORDER BY "visit_date")) AS subquery
GROUP BY "user_id"
ORDER BY "user_id";