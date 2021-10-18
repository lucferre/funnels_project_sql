-- Codecademy - Analyzing Data with SQL
-- Project: Usage Funnels with Warby Parker
-- Student: Lucas Gabriel Ferreyra
-- Website: https://lucasferreyra.eu
-- https://www.linkedin.com/in/ferreyra-lucas/

-- 1. Taking a look at the table's structure
SELECT *
FROM survey
LIMIT 10;

-- 2. What is the number of responses for each question?
SELECT question, COUNT(user_id)
FROM survey
GROUP BY question;

-- 5. Create a table with the given layout
SELECT
  q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
  ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
  ON q.user_id = p.user_id
LIMIT 10;


SELECT
  h.number_of_pairs,
  SUM(h.user_id IS NOT NULL) AS 'is_home_try',
  SUM(p.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
  ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
  ON q.user_id = p.user_id
WHERE h.user_id IS NOT NULL
GROUP BY h.number_of_pairs;
