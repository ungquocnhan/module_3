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
      
