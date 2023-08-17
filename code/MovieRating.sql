WITH
t1 AS (
    SELECT U.name
    FROM MovieRating MR
    LEFT JOIN Users U ON MR.user_id=U.user_id
    GROUP BY MR.user_id
    ORDER BY COUNT(*) DESC, U.name
    LIMIT 1
),
t2 AS (
    SELECT M.title
    FROM MovieRating MR
    LEFT JOIN Movies M ON MR.movie_id=M.movie_id
    WHERE MONTH(MR.created_at) = 2 AND YEAR(MR.created_at) = 2020
    GROUP BY MR.movie_id
    ORDER BY AVG(MR.rating) DESC, M.title
    LIMIT 1
)
SELECT name AS results FROM t1
UNION ALL
SELECT title FROM t2;
