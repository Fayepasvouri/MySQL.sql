
CREATE TABLE orders (order_id int, customer_id int, order_amount int, order_date int, order_postal_code varchar(max), country varchar(max) )
INSERT INTO orders (order_id, customer_id , order_amount, order_date , order_postal_code, country)
VALUES (20, 10, 100, 2020, 'E14RG', 'UK')

CREATE TABLE order_items (order_item_id int, order_id int, item_id int, item_name varchar(max), item_unit_price int, item_quantity int, item_cancelled BIT)
INSERT INTO order_items (order_item_id, order_id, item_id , item_name, item_unit_price , item_quantity, item_cancelled)
VALUES (21543, 20, 100, "Hair extensions", 120, 5, 1)

SELECT 
COUNT(order_items.item_quantity)
FROM order_items
LEFT JOIN orders ON orders.order_id=order_items.order_id;


SELECT AVR(item_quantity)
FROM order_items
GROUP BY order_id;

SELECT MAX(order_amount)
FROM orders
WHERE country = 'UK' AND order_date >= DATE(NOW()) - INTERVAL 7 DAY
ORDER BY  order_postal_code  DESC
LIMIT 10;

Select item_unit_price * item_quantity*(5/100) as revenue
from order_items
left join orders on orders.order_id = order_items.order_id
where order_date = 2020 and country='UK'
group by orders.order_id;



Select item_unit_price * item_quantity*(35/100) as first_product
from order_items
left join orders on orders.order_id = order_items.order_id
where order_date = 2020 and country='UK'
group by orders.order_id;

Select item_unit_price * item_quantity*(2/100) as next_products
from order_items
left join orders on orders.order_id = order_items.order_id
where order_date = 2020 and country='UK'
group by orders.order_id;


SELECT @first_product, @next_products,
CASE WHEN @first_product = (item_unit_price * item_quantity*(35/100)) THEN "This money were earned from the first product"
WHEN @next_products = (item_unit_price * item_quantity*(2/100)) THEN "This money were added"
END AS product_type
FROM order_items;



SELECT count (customer_id)*10 as cost
FROM orders
WHERE MIN(order_date) BETWEEN 2020-01-01 AND 2020-12-31; 

DECLARE @revenue INT, @cost INT;
SELECT @revenue = (item_unit_price * item_quantity*(5/100)) 
from order_items
left join orders ON orders.order_id = order_items.order_id
where order_date = 2020 AND country='UK'
SELECT @cost = count (customer_id)*10 
FROM orders 
WHERE MIN(order_date) BETWEEN 2020-01-01 AND 2020-12-31

IF revenue > cost 
SET @revenue = " PROFITABLE"
ELSE
SET @revenue = "NO PROFITABLE"

END IF;
