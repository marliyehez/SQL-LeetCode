WITH t AS (
    SELECT *,  id - ROW_NUMBER() OVER (ORDER BY id ASC) AS id_group
    FROM stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM t
WHERE id_group IN (
    SELECT id_group
    FROM t
    GROUP BY id_group
    HAVING COUNT(*) >= 3
);
