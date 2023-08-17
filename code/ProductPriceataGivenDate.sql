WITH t AS (
  SELECT product_id, MAX(change_date) AS change_date
  FROM Products
  WHERE change_date <= "2019-08-16"
  GROUP BY product_id
)
  
SELECT t.product_id, p.new_price AS price
FROM t
INNER JOIN Products p ON (
  t.product_id=p.product_id
) AND (
  t.change_date=p.change_date
)

UNION

SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM t);
