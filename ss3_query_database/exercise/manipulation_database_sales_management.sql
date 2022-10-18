USE sales_management;

INSERT INTO customer (name_cus, age_cus)
VALUE
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

INSERT INTO `order` (id_cus, date_order, total_price)
VALUE
(1, '2006-3-21', NULL),
(2, '2006-3-23', NULL),
(1, '2006-3-16', NULL);

INSERT INTO product (name_product, price_product)
VALUE
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

INSERT INTO order_detail (id_order, id_product, qty_order)
VALUE
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT 
    id_order, date_order, total_price
FROM
    `order`;

SELECT 
    c.name_cus, p.name_product
FROM
    `order` o
        JOIN
    customer c ON o.id_cus = c.id_cus
        JOIN
    order_detail od ON od.id_order = o.id_order
        JOIN
    product p ON od.id_product = p.id_product;

SELECT 
    c.name_cus, COUNT(o.id_cus) AS not_buy
FROM
    `order` o
        RIGHT JOIN
    customer c ON o.id_cus = c.id_cus
GROUP BY c.id_cus
HAVING not_buy = 0;

SELECT 
    o.id_order,
    o.date_order,
    (od.qty_order * p.price_product) AS total_price
FROM
    order_detail od
        JOIN
    `order` o ON od.id_order = o.id_order
        JOIN
    product p ON p.id_product = od.id_product;