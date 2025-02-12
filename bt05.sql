-- 1,
USE classicmodels;

-- 2,
CREATE INDEX idx_creditLimit ON customers(creditLimit);

-- 3,
SELECT c.customerNumber, c.customerName, c.city, c.creditLimit, o.country
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices o ON e.officeCode = o.officeCode
WHERE c.creditLimit BETWEEN 50000 AND 100000
ORDER BY c.creditLimit DESC
LIMIT 5;

-- 4,
EXPLAIN ANALYZE 
SELECT c.customerNumber, c.customerName, c.city, c.creditLimit, o.country
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices o ON e.officeCode = o.officeCode
WHERE c.creditLimit BETWEEN 50000 AND 100000
ORDER BY c.creditLimit DESC
LIMIT 5;
