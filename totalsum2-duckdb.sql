-- Set the block size and iterations
WITH constants AS (
    SELECT
        1000000000 AS block,
        3 AS times,
        63244053298881 AS expected
),
-- Calculate the sum of floor(sqrt(i)) for i in [1, block]
suma_calc AS (
    SELECT SUM(FLOOR(SQRT(i))::BIGINT) AS s_val
    FROM range(1, (SELECT block FROM constants) + 1) AS t(i)
),
-- Multiply by 'times' and verify the result
results AS (
    SELECT
        times,
        block,
        (s_val * times) AS total,
        expected
    FROM suma_calc, constants
)
SELECT
    times || '×suma(' || block || ') = ' || total AS output,
    CASE
        WHEN total != expected THEN 'ERROR: wrong result! (' || total || ')'
        ELSE 'Status: Correct'
    END AS validation
FROM results;
