WITH minYear AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id 
)
SELECT m.product_id, m.first_year, s.quantity, s.price
FROM minYear m
LEFT JOIN Sales s ON (
    m.product_id=s.product_id
) AND (
    m.first_year=s.year
);
