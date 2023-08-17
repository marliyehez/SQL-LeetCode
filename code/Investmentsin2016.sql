WITH t2 AS (            -- second condition
    SELECT lat, lon, COUNT(*) AS numCoord
    FROM Insurance
    GROUP BY lat, lon
    HAVING numCoord = 1
), 
t1 AS (                 -- first condition
    SELECT tiv_2015, COUNT(tiv_2015) AS numTiv15
    FROM Insurance
    GROUP BY tiv_2015
    HAVING numTiv15 > 1
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
RIGHT JOIN t1 ON i.tiv_2015 = t1.tiv_2015
RIGHT JOIN t2 ON i.lat = t2.lat AND i.lon = t2.lon;
