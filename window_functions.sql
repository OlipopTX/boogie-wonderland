-- OVER + PARTITION BY
 
 
SELECT c.customer_id, 
    first_name, 
    MAX(order_total) 
    OVER(
        PARTITION BY customer_id) 
        AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;