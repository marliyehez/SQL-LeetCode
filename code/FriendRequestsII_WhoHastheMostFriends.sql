WITH t AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id FROM RequestAccepted
)
SELECT id, COUNT(*) AS num
FROM t
GROUP BY id
ORDER BY num DESC
LIMIT 1;
