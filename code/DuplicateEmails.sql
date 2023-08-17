SELECT email AS Email
FROM Person AS a
GROUP BY Email
HAVING COUNT(email) > 1;
