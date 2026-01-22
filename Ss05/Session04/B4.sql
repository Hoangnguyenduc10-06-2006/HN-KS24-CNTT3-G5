USE Session04;
UPDATE products SET sold_quantity = 350 WHERE product_id = 4;
UPDATE products SET sold_quantity = 280 WHERE product_id = 7;
UPDATE products SET sold_quantity = 220 WHERE product_id = 1;
UPDATE products SET sold_quantity = 180 WHERE product_id = 2;
UPDATE products SET sold_quantity = 120 WHERE product_id = 3;
UPDATE products SET sold_quantity = 95 WHERE product_id = 6;
UPDATE products SET sold_quantity = 70 WHERE product_id = 8;
UPDATE products SET sold_quantity = 50 WHERE product_id = 5;

SELECT * FROM products 
ORDER BY sold_quantity DESC 
LIMIT 10;

SELECT * FROM products 
ORDER BY sold_quantity DESC 
LIMIT 5 OFFSET 10;
SELECT * FROM products 
WHERE price < 2000000 
ORDER BY sold_quantity DESC;