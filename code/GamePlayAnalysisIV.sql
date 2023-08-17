WITH t AS (
    SELECT
        player_id,
        MIN(event_date) AS first_day
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(SUM(DATE_ADD(first_day, INTERVAL 1 DAY) = a.event_date) / (SELECT COUNT(*) FROM t), 2) AS fraction
FROM t
LEFT JOIN Activity a ON t.player_id = a.player_id;
