USE classicmodels;

-- 2,
EXPLAIN ANALYZE 
SELECT orderNumber, orderDate, status 
FROM orders 
WHERE YEAR(orderDate) = 2003 AND status = 'Shipped';

CREATE INDEX idx_orderDate_status ON orders(orderDate, status);

EXPLAIN ANALYZE 
SELECT orderNumber, orderDate, status 
FROM orders 
WHERE YEAR(orderDate) = 2003 AND status = 'Shipped';

-- 3,
EXPLAIN ANALYZE 
SELECT customerNumber, customerName, phone 
FROM customers 
WHERE phone = '2035552570';

CREATE UNIQUE INDEX idx_customerNumber ON customers(customerNumber);
CREATE UNIQUE INDEX idx_phone ON customers(phone);

EXPLAIN ANALYZE 
SELECT customerNumber, customerName, phone 
FROM customers 
WHERE phone = '2035552570';

-- 4,
DROP INDEX idx_orderDate_status ON orders;

DROP INDEX idx_customerNumber ON customers;
DROP INDEX idx_phone ON customers;
