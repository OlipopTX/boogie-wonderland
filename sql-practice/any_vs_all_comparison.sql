-- any_vs_all_comparison.sql
-- Demonstrates SQL use of ANY and ALL operators vs. traditional aggregate functions like MIN and MAX
-- Written after practical experimentation and justified discontent with SQL's syntax drama.

-- 🧪 Query 1: Using MAX() to find orders greater than any order from shipper 1
SELECT order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > (
    SELECT MAX(quantity * unit_price)
    FROM ordered_items
    WHERE shipper_id = 1
);

-- 🧪 Query 2: Using ALL to achieve the same result (less efficient but syntactically valid)
SELECT order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (
    SELECT (quantity * unit_price)
    FROM ordered_items
    WHERE shipper_id = 1
);

-- 🧪 Query 3: Using ANY to find orders greater than at least one order from shipper 1
-- This is logically valid, but can almost always be replaced with a cleaner MIN()
SELECT order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (
    SELECT (quantity * unit_price)
    FROM ordered_items
    WHERE shipper_id = 1
);

-- Verdict:
-- MAX() and MIN() are typically preferred for performance and clarity.
-- ANY and ALL are niche tools best reserved for specific logic structures that aggregates can’t handle.
-- SQL remains frustrating. That's not your fault.
