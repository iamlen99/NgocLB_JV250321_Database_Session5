CREATE SCHEMA `sales_db3`;

USE `sales_db3`;

CREATE TABLE customers (
	`customer_id` INT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `email` VARCHAR(100),
    PRIMARY KEY (`customer_id`)
);

CREATE TABLE products (
	`product_id` INT,
    `product_name` VARCHAR(100),
    `price` decimal(10, 2),
    PRIMARY KEY (`product_id`)
);

CREATE TABLE orders (
	`order_id` INT,
    `customer_id` INT NOT NULL,
    `order_date` DATE,
    `total_amount` DECIMAL(10, 2),
    PRIMARY KEY (`order_id`),
    CONSTRAINT `customer_id_fk`
		FOREIGN KEY (`customer_id`)
		REFERENCES customers (`customer_id`)
);

CREATE TABLE order_items (
	`order_item_id` INT,
    `order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
    `quantity` INT,
    `price` DECIMAL(10, 2),
    PRIMARY KEY (`order_item_id`),
    CONSTRAINT `order_id_fk`
		FOREIGN KEY (`order_id`)
		REFERENCES orders (`order_id`),
	CONSTRAINT `product_id_fk`
	FOREIGN KEY (`product_id`)
	REFERENCES products (`product_id`)
);


CREATE INDEX `order_id_idx`
ON order_items (`order_id`);
