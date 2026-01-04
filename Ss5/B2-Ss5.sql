
SELECT *
FROM customers;

SELECT *
FROM customers
WHERE city = 'TP.HCM';

SELECT *
FROM customers
WHERE status = 'active'
  AND city = 'Hà Nội';

SELECT *
FROM customers
ORDER BY full_name ASC;
