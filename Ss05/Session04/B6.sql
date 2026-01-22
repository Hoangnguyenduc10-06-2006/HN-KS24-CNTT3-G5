USE session04;

SELECT * FROM products 
WHERE status = 'active' 
  AND price BETWEEN 1000000 AND 30000000 
ORDER BY price ASC 
LIMIT 10;

SELECT * FROM products 
WHERE status = 'active' 
  AND price BETWEEN 1000000 AND 30000000 
ORDER BY price ASC 
LIMIT 10 OFFSET 10;