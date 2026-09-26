USE cdg_hyd_jfs_058;

CREATE TABLE customers(

customer_id INT NOT NULL AUTO_INCREMENT,

customer_code VARCHAR(12) NOT NULL,

first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL,

email VARCHAR(120) NOT NULL, 
Phone VARCHAR(15),
date_of_birth DATE,
city VARCHAR(80) NOT NULL,
state VARCHAR(20) NOT NULL, 
Postal_Code VARCHAR(12) NOT NULL,
customer_type VARCHAR(15) NOT NULL DEFAULT 'REGULAR',
Credit_limit DECIMAL (12.2) NOT NULL DEFAULT 0.00, 
is_active BOOLEAN NOT NULL DEFAULT TRUE, 
registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT `PK-Customer_id` PRIMARY KEY (customer_id),
CONSTRAINT `ug_customer_code` UNIQUE (customer_code),
CONSTRAINT `uq_email` UNIQUE (email), 
CONSTRAINT `uq_phone` UNIQUE (phone),
CONSTRAINT `chk_creidt_limit_non_negative` CHECK (credit_limit >= 0.00)

);
ALTER TABLE customers AUTO_INCREMENT=001;
DROP TABLE customers;

INSERT INTO customers (customer_code, first_name, last_name, email, phone, date_of_birth, city, state, postal_code) 
VALUES ('CT987', 'Raji', 'Reddy', 'raji@gmail.com', 9177367293, '2004-06-21', 'Hyderabad', 'Telangana', '500073');

INSERT INTO customers (customer_code, first_name, last_name, email, phone, date_of_birth, city, state, postal_code, credit_limit) 
VALUES ('CT654', 'Niraja', 'Gunta', 'niraja@gmail.com', NULL, '2017-05-23', 'Vijayawada', 'Andhra Pradesh', '502305', 23000);

INSERT INTO customers (customer_code, first_name, last_name, email, phone, date_of_birth, city, state, postal_code, credit_limit) 
VALUES ('CT321', 'Niraja', 'Agarwal', 'niraja@gmail.com', NULL, '2018-11-30', 'Utar Pradesh', 'Agra', '567895', 26754.75);


SELECT * FROM customers;
