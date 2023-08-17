SELECT u.name, t.balance
FROM Users u
LEFT JOIN (
    SELECT account, SUM(amount) as balance 
    FROM Transactions
    GROUP BY account
) t ON u.account = t.account
WHERE t.balance > 10000;
