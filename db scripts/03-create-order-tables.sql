USE `clothery-full-stack`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
SET FOREIGN_KEY_CHECKS=1;


--
-- Table `address`
--
CREATE TABLE `address`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) DEFAULT NULL,
    `last_name` VARCHAR(255) DEFAULT NULL,
    `city` VARCHAR(255) DEFAULT NULL,
    `country` VARCHAR(255) DEFAULT NULL,
    `street` VARCHAR(255) DEFAULT NULL,
    `zip_code` VARCHAR(255) DEFAULT NULL,
    `phone` VARCHAR(255) DEFAULT NULL,
    
    PRIMARY KEY(`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1;


--
-- Table `customer`
--
CREATE TABLE `customer`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) DEFAULT NULL,
    `last_name` VARCHAR(255) DEFAULT NULL,
    `email` VARCHAR(255) DEFAULT NULL,
    
    PRIMARY KEY(`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1;




--
-- Table `orders`
--
CREATE TABLE `orders`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `order_tracking_number` VARCHAR(255) DEFAULT NULL,
    `total_price` DECIMAL(19,2) DEFAULT NULL,
    `total_quantity` INT(11) DEFAULT NULL,
    `billing_address_id` BIGINT(20) DEFAULT NULL,
    `shipping_address_id` BIGINT(20) DEFAULT NULL,
    `customer_id` BIGINT(20) DEFAULT NULL,
    `status` VARCHAR(100) DEFAULT NULL,
    `date_created` DATETIME(6) DEFAULT NULL,
    `last_updated` DATETIME(6) DEFAULT NULL,
    
    PRIMARY KEY(`id`),
	UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
	UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
	KEY `K_customer_id` (`customer_id`),
	CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
	CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
	CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) 
ENGINE=InnoDB 
AUTO_INCREMENT=1;


--
-- Table `order_items`
--
CREATE TABLE `order_item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `quantity` INT(11) DEFAULT NULL,
  `unit_price` DECIMAL(19,2) DEFAULT NULL,
  `order_id` BIGINT(20) DEFAULT NULL,
  `product_id` BIGINT(20) DEFAULT NULL,
  
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) 
ENGINE=InnoDB 
AUTO_INCREMENT=1;










