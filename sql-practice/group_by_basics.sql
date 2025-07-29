-- group by

SELECT product_id, AVG(order_total)
FROM customer_orders
GROUP BY product_id
ORDER BY AVG(order_total) DESC
;