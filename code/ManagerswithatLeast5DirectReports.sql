WITH t AS(
    SELECT managerId, COUNT(managerId) AS numReports
    FROM Employee
    GROUP BY managerId
    HAVING managerId != "null"
)
SELECT e.name
FROM t
LEFT JOIN Employee e ON t.managerId = e.id
WHERE numReports >= 5 AND e.name != "null";
