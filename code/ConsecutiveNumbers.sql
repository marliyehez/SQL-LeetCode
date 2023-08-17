WITH SalaryCTE AS (
  SELECT 
    num,
    LAG(num, 1) OVER (ORDER BY id) AS lag1,
    LAG(num, 2) OVER (ORDER BY id) AS lag2
  FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM SalaryCTE
WHERE num = lag1 AND lag1 = lag2;
