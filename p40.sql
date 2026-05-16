-- Restaurant Growth

-- Step 1: compute daily totals
WITH
    daily_total
    AS
    (
        SELECT visited_on, SUM(amount) AS total_amount
        FROM Customer
        GROUP BY visited_on
    )

-- Step 2: for each day, compute 7-day sum + avg
SELECT
    d1.visited_on,
    (
        SELECT SUM(d2.total_amount)
    FROM daily_total d2
    WHERE d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY
) AND d1.visited_on
    ) AS amount,
    ROUND
((
        SELECT SUM(d3.total_amount) / 7
FROM daily_total d3
WHERE d3.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6
DAY) AND d1.visited_on
    ), 2) AS average_amount
FROM daily_total d1
WHERE d1.visited_on >=
(
    SELECT DATE_ADD(MIN(visited_on), INTERVAL
6 DAY) FROM daily_total
)
ORDER BY d1.visited_on;