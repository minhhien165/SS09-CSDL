-- 1,
USE classicmodels;

-- 2,
CREATE INDEX idx_productLine ON products(productLine);

-- 3,
CREATE VIEW view_highest_priced_products AS
SELECT p1.productLine, p1.productName, p1.MSRP
FROM products p1
WHERE p1.MSRP = (
    SELECT MAX(p2.MSRP)
    FROM products p2
    WHERE p2.productLine = p1.productLine
);

-- 4,
SELECT * FROM view_highest_priced_products;

-- 5,
SELECT vhp.productLine, vhp.productName, vhp.MSRP, pl.textDescription
FROM view_highest_priced_products vhp
JOIN productlines pl ON vhp.productLine = pl.productLine
ORDER BY vhp.MSRP DESC
LIMIT 10;
