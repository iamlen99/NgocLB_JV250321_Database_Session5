CREATE SCHEMA `sales_db`;

USE `sales_db`;

CREATE TABLE customers (
	`customer_id` INT,
    `customer_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(15),
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`customer_id`)
);

CREATE TABLE products (
	`product_id` INT,
    `product_name` VARCHAR(255) NOT NULL,
    `category` VARCHAR(255),
    `price` decimal(10, 2) NOT NULL,
    PRIMARY KEY (`product_id`)
);

CREATE TABLE orders (
	`order_id` INT,
    `customer_id` INT,
    `total_amount` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`order_id`),
    CONSTRAINT `customer_id_fk`
		FOREIGN KEY (`customer_id`)
		REFERENCES customers (`customer_id`)
);

CREATE TABLE order_details (
	`order_detail_id` INT,
    `order_id` INT,
	`product_id` INT,
    `quantity` INT NOT NULL,
    `unit_price` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`order_detail_id`),
    CONSTRAINT `order_id_fk`
		FOREIGN KEY (`order_id`)
		REFERENCES orders (`order_id`),
	CONSTRAINT `product_id_fk`
	FOREIGN KEY (`product_id`)
	REFERENCES products (`product_id`)
);

CREATE INDEX `customer_name_idx`
ON customers (`customer_name`);

CREATE INDEX `total_amount_idx`
ON orders (`total_amount`);
