CREATE DATABASE demo;
USE demo;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(20),
    product_name VARCHAR(20),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(30),
    product_status BIT
);

INSERT INTO products(product_code, product_name, product_price,product_amount, product_description,product_status)
VALUE
('CG1','LAPTOP_1',4000,5,'ASUS',1),
('CG2','LAPTOP_2',6000,3,'HP',1),
('CG3','LAPTOP_3',8000,4,'ACER',1),
('CG4','LAPTOP_5',3000,8,'DELL',1),
('CG5','LAPTOP_6',6000,1,'LENOVO',1);

CREATE UNIQUE INDEX 
	index_product_code
ON 
	products(product_code);

SELECT 
    *
FROM
    products
WHERE
    product_code = 'CG4';
    
EXPLAIN SELECT
     * 
FROM 
	products
WHERE 
	product_code = 'CG4';
     
ALTER TABLE 
	products 
ADD INDEX 
	index_name_price(product_name, product_price);
    
SELECT 
    *
FROM
    products
WHERE
    product_name = 'LAPTOP_3' OR product_price = 8000;
    
EXPLAIN SELECT 
    *
FROM
    products
WHERE
    product_name = 'LAPTOP_3' OR product_price = 8000;
    
CREATE VIEW view_products AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;

SELECT 
    *
FROM
    view_products;
    
UPDATE view_products 
SET 
    product_price = 10000
WHERE
    product_name = 'LAPTOP_6';
    
DROP VIEW view_products;

DELIMITER //
CREATE PROCEDURE products_store()
BEGIN
SELECT 
	* 
FROM 
	products;
END //
DELIMITER ;

CALL products_store();

DROP PROCEDURE products_store;

DELIMITER //
CREATE PROCEDURE products_store()
BEGIN
INSERT INTO 
	products(product_code, product_name, product_price,product_amount, product_description,product_status)
VALUE
	('CG9','LAPTOP_15',5500,3,'MSI',0);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE products_store()
BEGIN
UPDATE
	products
SET 
	product_name = 'LAPTOP_0'
WHERE 
	id = 3;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE products_store()
BEGIN
DELETE FROM
	products 
    WHERE 
	id = 5;
END //
DELIMITER ;