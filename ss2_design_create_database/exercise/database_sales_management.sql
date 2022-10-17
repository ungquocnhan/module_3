CREATE DATABASE sales_management;
USE sales_management;

CREATE TABLE customer (
    id_cus INT AUTO_INCREMENT PRIMARY KEY,
    name_cus VARCHAR(30) NOT NULL,
    age_cus INT
);

CREATE TABLE `order` (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_cus INT,
    date_order DATE NOT NULL,
    total_price DOUBLE NOT NULL,
    FOREIGN KEY (id_cus)
        REFERENCES customer (id_cus)
);

CREATE TABLE product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    name_product VARCHAR(50) NOT NULL,
    price_product DOUBLE NOT NULL
);

CREATE TABLE order_detail (
    id_order INT,
    id_product INT,
    qty_od VARCHAR(30),
    PRIMARY KEY (id_order , id_product),
    FOREIGN KEY (id_order)
        REFERENCES `order` (id_order),
	FOREIGN KEY (id_product)
        REFERENCES product (id_product)
);


