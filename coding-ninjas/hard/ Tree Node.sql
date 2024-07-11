SELECT
    parent.id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN EXISTS (SELECT 1 FROM tree leaf WHERE leaf.p_id = parent.id) THEN 'Inner'
        ELSE 'Leaf'
        END AS type
FROM
    tree parent
