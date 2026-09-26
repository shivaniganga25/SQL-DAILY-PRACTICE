USE cdg_hyd_jfs_058;

CREATE TABLE products (

product_id INT NOT NULL AUTO_INCREMENT,
Sku VARCHAR (20) NOT NULL,
product_name VARCHAR (150) NOT NULL,
category VARCHAR(20) NOT NULL,
brand VARCHAR (80),
unit_price DECIMAL (12, 2) NOT NULL,
quantity_in_Stock INT UNSIGNED NOT NULL DEFAULT 0,
reorder_level INT UNSIGNED NOT NULL DEFAULT 5,
manufacture_date DATE,
expiry_date DATE,
product_status VARCHAR(15) NOT NULL DEFAULT 'Active',
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT `pk_product_id` PRIMARY KEY (product_id),
CONSTRAINT `Uk-Sku` UNIQUE (SKU),
CONSTRAINT `che_unit_price_should_be_greater_than_0` CHECK ( unit_price > 0),
CONSTRAINT `Chk_stock_quantity_should_not_be_negative`CHECK (quantity_in_Stock >= 0),
CONSTRAINT `Chk_reorder_level_should_not_be_negative` CHECK (reorder_level >= 0),
CONSTRAINT `chk_expiry_date` CHECK(manufacture_date IS NULL or expiry_date IS NULL or expiry_date >= manufacture_date)

);

ALTER TABLE products AUTO_INCREMENT=001;

DROP TABLE products;

INSERT INTO products (sku, product_name, category,brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status) 
VALUES ('2020105', 'Rice', 'Grains', 'Vijaya',2600, 26, 5, '2026-08-11','2028-08-11', 'Active');

INSERT INTO products (sku, product_name, category,brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status) 
VALUES ('2020103', 'Dal', 'Spices', 'Daily Goods',600, 16, 2, '2026-08-11','2028-10-11', 'Active');

INSERT INTO products (sku, product_name, category,brand, unit_price, quantity_in_stock, reorder_level, manufacture_date, expiry_date, product_status) 
VALUES ('2020104', 'Red Chili Powder', 'Spices', 'Vijaya',260, 50, 10, '2026-08-21','2028-12-11', 'Active');

SELECT * FROM products;

-- Updating price and stock quantity for a specific product by SKU
UPDATE products SET unit_price = 2750.00,quantity_in_stock = 40,updated_at = CURRENT_TIMESTAMP WHERE sku = '2020105';

-- Updating reorder level and product_status for a product by product_id
UPDATE products SET reorder_level = 8, product_status = 'Inactive',updated_at = CURRENT_TIMESTAMP WHERE product_id = 2;

-- Removing a product by SKU
DELETE FROM products WHERE sku = '2020104';

-- Removing all products that are 'Inactive'
DELETE FROM products WHERE product_status = 'Inactive';

