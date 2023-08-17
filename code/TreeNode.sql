WITH t AS (
  SELECT DISTINCT p_id AS parent_node
  FROM Tree
  WHERE p_id != 'null'
)
SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT parent_node FROM t) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;
