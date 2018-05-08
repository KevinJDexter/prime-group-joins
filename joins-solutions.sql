
-- 1. Get all customers and their addresses
SELECT * FROM "customers"
FULL OUTER JOIN "addresses" ON "customers"."id" = "customer_id";

-- 2. Get all orders and their line items
SELECT * FROM "orders"
LEFT JOIN "line_items" ON "order_id" = "orders"."id";

--3. Which werehouses have cheetos?
SELECT * FROM "warehouse_product"
FULL OUTER JOIN "products" ON "products"."id" = "product_id"
FULL OUTER JOIN "warehouse" ON "warehouse"."id" = "warehouse_id"
WHERE "description" = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse_product"
JOIN "products" ON "products"."id" = "product_id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_id"
WHERE "description" = 'diet pepsi';

--5. Get the number of orders for each customer
SELECT "first_name", "last_name", COUNT(*) FROM "orders"
JOIN "addresses" ON "addresses"."id" = "address_id"
JOIN "customers" ON "customers"."id" = "customer_id"
GROUP BY "customer_id", "first_name", "last_name";

--6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

--7. How many products do we have?
SELECT COUNT("description") FROM "products";

--8. What is the total available on hand diet pepsi?
SELECT SUM("on_hand") FROM "products"
JOIN "warehouse_product" ON "products"."id" = "product_id"
WHERE "description" = 'diet pepsi';
