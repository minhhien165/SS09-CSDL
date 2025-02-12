-- 1,
USE classicmodels;

-- 2,
CREATE INDEX idx_customerNumber ON payments(customerNumber);

-- 3,
CREATE VIEW view_customer_payments AS
SELECT 
    customerNumber, 
    SUM(amount) AS total_payments, 
    COUNT(*) AS payment_count
FROM payments
GROUP BY customerNumber;

-- 4,
SELECT * FROM view_customer_payments;

-- 5,
SELECT c.customerNumber, c.customerName, v.total_payments, v.payment_count
FROM view_customer_payments v
JOIN customers c ON v.customerNumber = c.customerNumber
WHERE v.total_payments > 150000 AND v.payment_count > 3
ORDER BY v.total_payments DESC
LIMIT 5;
