SELECT
    d.Name AS Department,
    e.Name AS Employee,
    e.Salary AS Salary
FROM Department d
LEFT JOIN Employee e ON d.id = e.departmentId
WHERE (e.departmentId, e.Salary) IN (
    SELECT departmentId, MAX(salary) AS Salary
    FROM Employee
    GROUP BY departmentId
);
