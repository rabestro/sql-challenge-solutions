SELECT
    p1.id                                                       AS p1,
    p2.id                                                       AS p2,
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) AS area
FROM
    points AS p1,
    points AS p2
WHERE
      p2.id > p1.id
  AND p1.x_value != p2.x_value
  AND p1.y_value != p2.y_value
ORDER BY
    area DESC,
    p1.id;
