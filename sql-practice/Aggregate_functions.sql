-- Aggregate Functions

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
;
SELECT customer_id, AVG(tip) AS average_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY average_tips
;
SELECT customer_id, MAX(tip) AS biggest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY MAX(tip)
;
SELECT customer_id, COUNT(tip) AS count_of_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY count_of_tips
;
SELECT product_id, tip, COUNT(tip), COUNT(DISTINCT tip)
FROM customer_orders
GROUP BY product_id, tip
ORDER BY product_id
;