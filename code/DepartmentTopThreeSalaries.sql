WITH t AS (
    SELECT departmentId,
        name,
        salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) AS salary_rank
    FROM Employee
)
SELECT d.name AS Department,
    t.name AS Employee,
    t.salary AS Salary
FROM t
LEFT JOIN Department d ON t.departmentId=d.id
WHERE salary_rank <= 3;
