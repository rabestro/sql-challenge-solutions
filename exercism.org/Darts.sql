-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.

UPDATE Darts
SET
    Score = CASE
                WHEN X * X + Y * Y <= 1 THEN 10
                WHEN X * X + Y * Y <= 25 THEN 5
                WHEN X * X + Y * Y <= 100 THEN 1
                ELSE 0
        END
