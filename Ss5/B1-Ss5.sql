
SELECT *
FROM Product;

SELECT *
FROM Product
WHERE status = 'active';

SELECT *
FROM Product
WHERE price > 1000000;

SELECT *
FROM Product
WHERE status = 'active'
ORDER BY price ASC;
