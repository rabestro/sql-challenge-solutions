SELECT
    *,
    city,
    state
FROM
    person
    LEFT JOIN address USING (personid);