CREATE DATABASE user_manager;
USE user_manager;

CREATE TABLE users(
id INT(3) AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(120) NOT NULL,
email VARCHAR(120) NOT NULL,
country VARCHAR(120)
);

INSERT INTO users(name, email, country)
VALUE ('Minh','minh@codegym.vn','Viet Nam'),
	  ('Kante','kante@che.uk','Kenia');
      
DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
SELECT users.name, users.email, users.country
FROM users
WHERE users.id = user_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name VARCHAR(50),
IN user_email VARCHAR(50),
IN user_country VARCHAR(50)
)
BEGIN
INSERT INTO users(name, email, country) VALUE (user_name, user_email, user_country);
END $$
DELIMITER ;

CREATE TABLE permission (
    id INT(11) PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE user_permission (
    permission_id INT(11),
    user_id INT(11)
);

insert into permission(id, name) values(1, 'add');

insert into permission(id, name) values(2, 'edit');

insert into permission(id, name) values(3, 'delete');

insert into permission(id, name) values(4, 'view');

DELIMITER $$
CREATE PROCEDURE get_all_user()
BEGIN
SELECT *
FROM users;
END $$
DELIMITER ;
CALL get_all_user();

DELIMITER $$
CREATE PROCEDURE get_edit_user(
IN name_edit VARCHAR(50),
IN email_edit VARCHAR(50),
IN country_edit VARCHAR(50),
IN id_edit INT)
BEGIN
UPDATE users SET name = name_edit, email = email_edit, country = country_edit
where id = id_edit;
END $$
DELIMITER ;
call get_edit_user("Binh", "nhan@codegym.com", "Da Nang", 1);

DELIMITER $$
CREATE PROCEDURE get_delete_user_by_id(IN user_id INT)
BEGIN
DELETE FROM users
WHERE users.id = user_id;
END $$
DELIMITER ;
CALL get_delete_user_by_id(16);


