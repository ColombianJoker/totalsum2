-- Increase the recursion limit if necessary (though LIMIT usually overrides this)
WITH RECURSIVE
  constants(block, times, expected) AS (
    VALUES (1000000000, 3, 63244053298881)
  ),
  -- Generate numbers from 1 to 1,000,000,000
  generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1 FROM generate_series
    WHERE i < (SELECT block FROM constants)
  ),
  -- Calculate the sum of truncated square roots
  suma_calc AS (
    SELECT SUM(CAST(FLOOR(SQRT(i)) AS BIGINT)) AS s_val
    FROM generate_series
  ),
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
