WITH
Timeout AS(
    SELECT user_id, COUNT(*) AS countTimeout
    FROM Confirmations
    WHERE action="timeout"
    GROUP BY user_id
),
Confirmed AS(
    SELECT user_id, COUNT(*) AS countConfirmed
    FROM Confirmations
    WHERE action="confirmed"
    GROUP BY user_id
),
Combined AS(
    SELECT
        t1.user_id,
        IFNULL(t2.countTimeout, 0) AS countTimeout,
        IFNULL(t3.countConfirmed, 0) AS countConfirmed
    FROM Signups t1
    LEFT JOIN Timeout t2 ON t1.user_id=t2.user_id
    LEFT JOIN Confirmed t3 ON t1.user_id=t3.user_id
)
SELECT
    user_id,
    IFNULL(ROUND(countConfirmed / NULLIF(countTimeout + countConfirmed, 0), 2), 0) AS confirmation_rate
FROM Combined t;
