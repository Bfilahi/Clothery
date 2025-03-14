-- -----------------------------------------------------
-- Schema clothery-full-stack
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clothery-full-stack`;

CREATE SCHEMA `clothery-full-stack`;
USE `clothery-full-stack`;


-- -----------------------------------------------------
-- Table `clothery-full-stack`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothery-full-stack`.`product_category`(
	
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`category_name` VARCHAR(255) NULL DEFAULT NULL,
    `category_type` VARCHAR(20) DEFAULT NULL,
    `category_image` VARCHAR(255) DEFAULT NULL,
    `category_gender` VARCHAR(15) DEFAULT NULL,
	
	PRIMARY KEY(`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;



-- -----------------------------------------------------
-- Table `clothery-full-stack`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothery-full-stack`.`product`(
	
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) DEFAULT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `unit_price` DECIMAL(13,2) DEFAULT NULL,
    `img_url` VARCHAR(255) DEFAULT NULL,
    `active` BIT DEFAULT 1,
    `gender` VARCHAR(15) DEFAULT NULL,
    `units_in_stock` INT(11) DEFAULT NULL,
    `date_created` DATETIME(6) DEFAULT NULL,
    `last_updated` DATETIME(6) DEFAULT NULL,
    `category_id` BIGINT(20) NOT NULL,
    
    PRIMARY KEY(`id`),
    KEY `fk_category` (`category_id`),
    CONSTRAINT `fk_category` FOREIGN KEY(`category_id`) REFERENCES `product_category` (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `clothery-full-stack`.`product-images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothery-full-stack`.`product_images`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`img_url` VARCHAR(255) DEFAULT NULL,
    `product_id` BIGINT(20) NOT NULL,
    
    PRIMARY KEY(`id`),
    KEY `fk_product`(`product_id`),
    CONSTRAINT `fk_product` FOREIGN KEY(`product_id`) REFERENCES `product` (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `clothery-full-stack`.`product-sizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothery-full-stack`.`product_sizes`(
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `size` VARCHAR(2) DEFAULT NULL,
    `quantity` INT(10) DEFAULT NULL,
    `product_id` BIGINT(20) NOT NULL,
    
    PRIMARY KEY(`id`),
    KEY `fk_prod`(`product_id`),
    CONSTRAINT `fk_prod` FOREIGN KEY(`product_id`) REFERENCES `product` (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Add data: Categories
-- -----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('WOMEN\'S DRESSES', 'dress', 'assets/images/category/women-dress.avif', 'women');
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('WOMEN\'S DENIM', 'jeans', 'assets/images/category/women-denim.avif', 'women');
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('WOMEN\'S SKIRTS', 'skirts', 'assets/images/category/women-skirt.avif', 'women');
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('MEN\'S SHIRTS', 'shirts', 'assets/images/category/men-shirt.avif', 'men');
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('MEN\'S DENIM', 'jeans', 'assets/images/category/men-denim.avif', 'men');
INSERT INTO product_category(category_name, category_type, category_image, category_gender) 
VALUES ('MEN\'S TEES', 't-shirts', 'assets/images/category/men-t-shirt.avif', 'men');


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Add data: Products
-- -----------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- WOMEN --> DRESSES
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Amy Callista Printed Long Sleeve Midi Dress', 135, 'assets/images/women/dresses/Amy-Callista-Printed-Long-Sleeve-Midi-Dress_1.avif', 1, 'women', 10, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Astrida 3D Floral Mini Dress', 68, 'assets/images/women/dresses/Astrida-3D-Floral-Mini-Dress_1.avif', 1, 'women', 2, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Azra Twill Contrast Stitching Mini Dress', 160, 'assets/images/women/dresses/Azra-Twill-Contrast-Stitching-Mini-Dress_1.avif', 1, 'women', 5, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Echo Crepe Strappy Midi Dress', 150, 'assets/images/women/dresses/Echo-Crepe-Strappy-Midi-Dress_1.avif', 1, 'women', 5, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Journee Mari Lurex Long Sleeve Dress', 120, 'assets/images/women/dresses/Journee-Mari-Lurex-Long-Sleeve-Dress_1.avif', 1, 'women', 15, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Long sleeve tucked waist bias maxi dress in olive green', 70, 'assets/images/women/dresses/long-sleeve-tucked-waist-bias-maxi-dress_1.avif', 1, 'women', 1, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Mozza Collared Knit Midi Dress', 50, 'assets/images/women/dresses/Mozza-Collared-Knit-Midi-Dress_1.avif', 1, 'women', 1, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Topshop occasion lace up back maxi dress', 150, 'assets/images/women/dresses/Topshop-occasion-lace-up-back-maxi-dress_1.avif', 1, 'women', 2, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Topshop pinned sleeve mini tea dress', 40.45, 'assets/images/women/dresses/Topshop-pinned-sleeve-mini-tea-dress_1.avif', 1, 'women', 3, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Whisper Collar Mini Dress', 30, 'assets/images/women/dresses/Whisper-Collar-Mini-Dress_1.avif', 1, 'women', 5, 1, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Dress', 'Wrap front midi dress', 60, 'assets/images/women/dresses/wrap-front-midi-dress_1.avif', 1, 'women', 10, 1, NOW());

-- -----------------------------------------------------
-- WOMEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Baggy wide leg jeans', 24.99, 'assets/images/women/jeans/baggy-wide-leg-jeans_1.avif', 1, 'women', 1, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Finley Denim Wide Leg Jeans', 30, 'assets/images/women/jeans/Finley-Denim-Wide-Leg-Jeans_1.avif', 1, 'women', 5, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans a Gamba Larga Parallela', 35, 'assets/images/women/jeans/Jeans-a-Gamba-Larga-Parallela_1.avif', 1, 'women', 10, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans Baggy Raw Jaya', 39.99, 'assets/images/women/jeans/Jeans-Baggy-Raw-Jaya_1.avif', 1, 'women', 3, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans da Baseball a Righe', 50, 'assets/images/women/jeans/Jeans-da-Baseball-a-Righe_1.avif', 1, 'women', 2, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans Extra Oversize', 30, 'assets/images/women/jeans/Jeans-Extra-Oversize_1.avif', 1, 'women', 12, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Logan Boyfriend Leopard Print Jeans', 39.99, 'assets/images/women/jeans/Logan-Boyfriend-Leopard-Print-Jeans_1.avif', 1, 'women', 5, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Ribcage bells high rise flare jeans', 50, 'assets/images/women/jeans/ribcage-bells-high-rise-flare-jeans_1.avif', 1, 'women', 2, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Soft Stretch Denim High Rise Skinny Jeans', 40, 'assets/images/women/jeans/Soft-Stretch-Denim-High-Rise-Skinny-Jeans_1.avif', 1, 'women', 1, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Toms Denim Bleach Line Jeans', 19.99, 'assets/images/women/jeans/Toms-Denim-Bleach-Line-Jeans_1.avif', 1, 'women', 10, 2, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Wide leg turn up dad jean in light blue', 30, 'assets/images/women/jeans/wide-leg-turn-up-dad-jean-in-light-blue_1.avif', 1, 'women', 5, 2, NOW());

-- -----------------------------------------------------
-- WOMEN --> SKIRTS
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Alessandra Recycled Pleated Skirt', 19.99, 'assets/images/women/skirts/Alessandra-Recycled-Pleated-Skirt_1.avif', 1, 'women', 50, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Amy Sequin Midi Skirt', 29.99, 'assets/images/women/skirts/Amy-Sequin-Midi-Skirt_1.avif', 1, 'women', 10, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Byrdie Chino Mini Skirt', 40, 'assets/images/women/skirts/Byrdie-Chino-Mini-Skirt_1.avif', 1, 'women', 5, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'denim tailored mini skirt', 35, 'assets/images/women/skirts/denim-tailored-mini-skirt_1.avif', 1, 'women', 2, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Finley Denim Maxi Skirt', 50, 'assets/images/women/skirts/Finley-Denim-Maxi-Skirt_1.avif', 1, 'women', 1, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Gina Check Pleated Mini Skirt', 25, 'assets/images/women/skirts/Gina-Check-Pleated-Mini-Skirt_1.avif', 1, 'women', 12, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Gonna Midi Prairie a Pieghe', 40, 'assets/images/women/skirts/Gonna-Midi-Prairie-a-Pieghe_1.avif', 1, 'women', 3, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Kimchi Blue Kendra Gonna', 45, 'assets/images/women/skirts/Kimchi-Blue-Kendra-Gonna_1.avif', 1, 'women', 10, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Pleated Mini Skirt', 20, 'assets/images/women/skirts/Pleated-Mini-Skirt_1.avif', 1, 'women', 5, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Topshop denim mini pelmet skirt in green', 49.99, 'assets/images/women/skirts/Topshop-denim-mini-pelmet-skirt-in-green_1.avif', 1, 'women', 7, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Ultimate Denim Mini Skirt', 29.99, 'assets/images/women/skirts/Ultimate-Denim-Mini-Skirt_1.avif', 1, 'women', 20, 3, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Skirt', 'Wool blend mini skirt', 29.99, 'assets/images/women/skirts/wool-blend-mini-skirt_1.avif', 1, 'women', 2, 3, NOW());

-- -----------------------------------------------------
-- MEN --> SHIRTS
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Baby Corduroy Shirt', 15.99, 'assets/images/men/shirts/Baby-Corduroy-Shirt_1.avif', 1, 'men', 50, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Camicia a Maniche Corte', 29.99, 'assets/images/men/shirts/Camicia-a-Maniche-Corte_1.avif', 1, 'men', 10, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Camicia a Righe Bianche Loom', 18.99, 'assets/images/men/shirts/Camicia-a-Righe-Bianche-Loom_1.avif', 1, 'men', 2, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Camicia Oxford Corta Rossa', 20, 'assets/images/men/shirts/Camicia-Oxford-Corta-Rossa_1.avif', 1, 'men', 1, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Cutaway Collar Stretch Shirt', 25, 'assets/images/men/shirts/Cutaway-Collar-Stretch-Shirt_1.avif', 1, 'men', 10, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Long Sleeve Denim Shirt', 29.99, 'assets/images/men/shirts/Long-Sleeve-Denim-Shirt_1.avif', 1, 'men', 3, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Long Sleeve Linen Blend Shirt', 15.99, 'assets/images/men/shirts/Long-Sleeve-Linen-Blend-Shirt_1.avif', 1, 'men', 15, 4, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Shirt', 'Unbrushed Flannel Check Shirt', 19.99, 'assets/images/men/shirts/Unbrushed-Flannel-Check-Shirt_1.avif', 1, 'men', 10, 4, NOW());

-- -----------------------------------------------------
-- MEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Baggy jeans in washed black', 25, 'assets/images/men/jeans/baggy-jeans-in-washed-black_1.avif', 1, 'men', 10, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Black Cacoon Jeans', 24.99, 'assets/images/men/jeans/Black-Cacoon-Jeans_1.avif', 1, 'men', 1, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Denim Jeans', 30, 'assets/images/men/jeans/Denim-Jeans_1.avif', 1, 'men', 3, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Edge straight fit jeans in mid blue wash', 45, 'assets/images/men/jeans/Edge-straight-fit-jeans-in-mid-blue-wash_1.avif', 1, 'men', 12, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jack Smokey Blue Jeans', 20, 'assets/images/men/jeans/Jack-Smokey-Blue-Jeans_1.avif', 1, 'men', 4, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans Black Jack lavati', 19.99, 'assets/images/men/jeans/Jeans-Black-Jack-lavati_1.avif', 1, 'men', 8, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Jeans Jack', 25, 'assets/images/men/jeans/Jeans-Jack_1.avif', 1, 'men', 10, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Light Wash Carpenter Jeans', 40, 'assets/images/men/jeans/Light-Wash-Carpenter-Jeans_1.avif', 1, 'men', 20, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Tapered jeans in black wash', 40, 'assets/images/men/jeans/tapered-jeans-in-black-wash_1.avif', 1, 'men', 20, 5, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('Jeans', 'Tapered jeans in light blue wash', 40, 'assets/images/men/jeans/tapered-jeans-in-light-blue-wash_1.avif', 1, 'men', 20, 5, NOW());

-- -----------------------------------------------------
-- MEN --> TEEs
-- -----------------------------------------------------
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Abstract Line Organic Graphic T-Shirt', 18, 'assets/images/men/tees/Abstract-Line-Organic-Graphic-T-Shirt_1.avif', 1, 'men', 0, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Maglietta a Righe Marroni', 14.99, 'assets/images/men/tees/Maglietta-a-Righe-Marroni_1.avif', 1, 'men', 5, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Maglietta UO Rosso Sognatore', 15, 'assets/images/men/tees/Maglietta-UO-Rosso-Sognatore_1.avif', 1, 'men', 2, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Melange Fever Dream T-Shirt', 14.99, 'assets/images/men/tees/Melange-Fever-Dream-T-Shirt_1.avif', 1, 'men', 10, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Mount Fuji Organic Graphic T-Shirt', 20, 'assets/images/men/tees/Mount-Fuji-Organic-Graphic-T-Shirt_1.avif', 1, 'men', 7, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Olive Farcito T-Shirt', 15, 'assets/images/men/tees/Olive-Farcito-T-Shirt_1.avif', 1, 'men', 15, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Organic Cotton Classic T-Shirt', 19.99, 'assets/images/men/tees/Organic-Cotton-Classic-T-Shirt_1.avif', 1, 'men', 20, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Organic Pocket T-Shirt', 14.99, 'assets/images/men/tees/Organic-Pocket-T-Shirt_1.avif', 1, 'men', 12, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Ottoman Trophy Neck T-Shirt', 9.99, 'assets/images/men/tees/Ottoman-Trophy-Neck-T-Shirt_1.avif', 1, 'men', 4, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Rosa Creatori Cotone T-Shirt', 9.99, 'assets/images/men/tees/Rosa-Creatori-Cotone-T-Shirt_1.avif', 1, 'men', 1, 6, NOW());
INSERT INTO product(name, description, unit_price, img_url, active, gender, units_in_stock, category_id, date_created)
VALUES('T-shirt', 'Yellow Peace Off T-Shirt', 29.99, 'assets/images/men/tees/Yellow-Peace-Off-T-Shirt_1.avif', 1, 'men', 0, 6, NOW());

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Add data: Product's images
-- -----------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- WOMEN --> DRESSES
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Amy-Callista-Printed-Long-Sleeve-Midi-Dress_1.avif', 1);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Amy-Callista-Printed-Long-Sleeve-Midi-Dress_2.avif', 1);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Amy-Callista-Printed-Long-Sleeve-Midi-Dress_3.avif', 1);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Amy-Callista-Printed-Long-Sleeve-Midi-Dress_4.avif', 1);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Astrida-3D-Floral-Mini-Dress_1.avif', 2);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Astrida-3D-Floral-Mini-Dress_2.avif', 2);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Astrida-3D-Floral-Mini-Dress_3.avif', 2);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Astrida-3D-Floral-Mini-Dress_4.avif', 2);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Azra-Twill-Contrast-Stitching-Mini-Dress_1.avif', 3);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Azra-Twill-Contrast-Stitching-Mini-Dress_2.avif', 3);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Azra-Twill-Contrast-Stitching-Mini-Dress_3.avif', 3);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Azra-Twill-Contrast-Stitching-Mini-Dress_4.avif', 3);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Echo-Crepe-Strappy-Midi-Dress_1.avif', 4);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Echo-Crepe-Strappy-Midi-Dress_2.avif', 4);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Echo-Crepe-Strappy-Midi-Dress_3.avif', 4);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Echo-Crepe-Strappy-Midi-Dress_4.avif', 4);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Journee-Mari-Lurex-Long-Sleeve-Dress_1.avif', 5);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Journee-Mari-Lurex-Long-Sleeve-Dress_2.avif', 5);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Journee-Mari-Lurex-Long-Sleeve-Dress_3.avif', 5);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Journee-Mari-Lurex-Long-Sleeve-Dress_4.avif', 5);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/long-sleeve-tucked-waist-bias-maxi-dress_1.avif', 6);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/long-sleeve-tucked-waist-bias-maxi-dress_2.avif', 6);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/long-sleeve-tucked-waist-bias-maxi-dress_3.avif', 6);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/long-sleeve-tucked-waist-bias-maxi-dress_4.avif', 6);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Mozza-Collared-Knit-Midi-Dress_1.avif', 7);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Mozza-Collared-Knit-Midi-Dress_2.avif', 7);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Mozza-Collared-Knit-Midi-Dress_3.avif', 7);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Mozza-Collared-Knit-Midi-Dress_4.avif', 7);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-occasion-lace-up-back-maxi-dress_1.avif', 8);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-occasion-lace-up-back-maxi-dress_2.avif', 8);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-occasion-lace-up-back-maxi-dress_3.avif', 8);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-occasion-lace-up-back-maxi-dress_4.avif', 8);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-pinned-sleeve-mini-tea-dress_1.avif', 9);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-pinned-sleeve-mini-tea-dress_2.avif', 9);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-pinned-sleeve-mini-tea-dress_3.avif', 9);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Topshop-pinned-sleeve-mini-tea-dress_4.avif', 9);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Whisper-Collar-Mini-Dress_1.avif', 10);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Whisper-Collar-Mini-Dress_2.avif', 10);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Whisper-Collar-Mini-Dress_3.avif', 10);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/Whisper-Collar-Mini-Dress_4.avif', 10);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/wrap-front-midi-dress_1.avif', 11);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/wrap-front-midi-dress_2.avif', 11);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/wrap-front-midi-dress_3.avif', 11);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/dresses/wrap-front-midi-dress_4.avif', 11);

-- -----------------------------------------------------
-- WOMEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/baggy-wide-leg-jeans_1.avif', 12);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/baggy-wide-leg-jeans_2.avif', 12);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/baggy-wide-leg-jeans_3.avif', 12);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/baggy-wide-leg-jeans_4.avif', 12);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Finley-Denim-Wide-Leg-Jeans_1.avif', 13);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Finley-Denim-Wide-Leg-Jeans_2.avif', 13);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Finley-Denim-Wide-Leg-Jeans_3.avif', 13);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Finley-Denim-Wide-Leg-Jeans_4.avif', 13);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-a-Gamba-Larga-Parallela_1.avif', 14);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-a-Gamba-Larga-Parallela_2.avif', 14);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-a-Gamba-Larga-Parallela_3.avif', 14);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-a-Gamba-Larga-Parallela_4.avif', 14);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Baggy-Raw-Jaya_1.avif', 15);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Baggy-Raw-Jaya_2.avif', 15);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Baggy-Raw-Jaya_3.avif', 15);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Baggy-Raw-Jaya_4.avif', 15);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-da-Baseball-a-Righe_1.avif', 16);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-da-Baseball-a-Righe_2.avif', 16);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-da-Baseball-a-Righe_3.avif', 16);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-da-Baseball-a-Righe_4.avif', 16);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Extra-Oversize_1.avif', 17);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Extra-Oversize_2.avif', 17);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Extra-Oversize_3.avif', 17);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Jeans-Extra-Oversize_4.avif', 17);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Logan-Boyfriend-Leopard-Print-Jeans_1.avif', 18);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Logan-Boyfriend-Leopard-Print-Jeans_2.avif', 18);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Logan-Boyfriend-Leopard-Print-Jeans_3.avif', 18);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Logan-Boyfriend-Leopard-Print-Jeans_4.avif', 18);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/ribcage-bells-high-rise-flare-jeans_1.avif', 19);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/ribcage-bells-high-rise-flare-jeans_2.avif', 19);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/ribcage-bells-high-rise-flare-jeans_3.avif', 19);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/ribcage-bells-high-rise-flare-jeans_4.avif', 19);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Soft-Stretch-Denim-High-Rise-Skinny-Jeans_1.avif', 20);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Soft-Stretch-Denim-High-Rise-Skinny-Jeans_2.avif', 20);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Soft-Stretch-Denim-High-Rise-Skinny-Jeans_3.avif', 20);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Soft-Stretch-Denim-High-Rise-Skinny-Jeans_4.avif', 20);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Toms-Denim-Bleach-Line-Jeans_1.avif', 21);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Toms-Denim-Bleach-Line-Jeans_2.avif', 21);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Toms-Denim-Bleach-Line-Jeans_3.avif', 21);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/Toms-Denim-Bleach-Line-Jeans_4.avif', 21);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/wide-leg-turn-up-dad-jean-in-light-blue_1.avif', 22);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/wide-leg-turn-up-dad-jean-in-light-blue_2.avif', 22);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/wide-leg-turn-up-dad-jean-in-light-blue_3.avif', 22);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/jeans/wide-leg-turn-up-dad-jean-in-light-blue_4.avif', 22);

-- -----------------------------------------------------
-- WOMEN --> SKIRTS
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Alessandra-Recycled-Pleated-Skirt_1.avif', 23);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Alessandra-Recycled-Pleated-Skirt_2.avif', 23);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Alessandra-Recycled-Pleated-Skirt_3.avif', 23);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Alessandra-Recycled-Pleated-Skirt_4.avif', 23);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Amy-Sequin-Midi-Skirt_1.avif', 24);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Amy-Sequin-Midi-Skirt_2.avif', 24);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Amy-Sequin-Midi-Skirt_3.avif', 24);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Amy-Sequin-Midi-Skirt_4.avif', 24);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Byrdie-Chino-Mini-Skirt_1.avif', 25);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Byrdie-Chino-Mini-Skirt_2.avif', 25);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Byrdie-Chino-Mini-Skirt_3.avif', 25);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Byrdie-Chino-Mini-Skirt_4.avif', 25);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/denim-tailored-mini-skirt_1.avif', 26);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/denim-tailored-mini-skirt_2.avif', 26);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/denim-tailored-mini-skirt_3.avif', 26);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/denim-tailored-mini-skirt_4.avif', 26);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Finley-Denim-Maxi-Skirt_1.avif', 27);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Finley-Denim-Maxi-Skirt_2.avif', 27);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Finley-Denim-Maxi-Skirt_3.avif', 27);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Finley-Denim-Maxi-Skirt_4.avif', 27);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gina-Check-Pleated-Mini-Skirt_1.avif', 28);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gina-Check-Pleated-Mini-Skirt_2.avif', 28);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gina-Check-Pleated-Mini-Skirt_3.avif', 28);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gina-Check-Pleated-Mini-Skirt_4.avif', 28);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gonna-Midi-Prairie-a-Pieghe_1.avif', 29);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gonna-Midi-Prairie-a-Pieghe_2.avif', 29);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gonna-Midi-Prairie-a-Pieghe_3.avif', 29);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Gonna-Midi-Prairie-a-Pieghe_4.avif', 29);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Kimchi-Blue-Kendra-Gonna_1.avif', 30);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Kimchi-Blue-Kendra-Gonna_2.avif', 30);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Kimchi-Blue-Kendra-Gonna_3.avif', 30);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Kimchi-Blue-Kendra-Gonna_4.avif', 30);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Pleated-Mini-Skirt_1.avif', 31);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Pleated-Mini-Skirt_2.avif', 31);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Pleated-Mini-Skirt_3.avif', 31);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Pleated-Mini-Skirt_4.avif', 31);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Topshop-denim-mini-pelmet-skirt-in-green_1.avif', 32);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Topshop-denim-mini-pelmet-skirt-in-green_2.avif', 32);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Topshop-denim-mini-pelmet-skirt-in-green_3.avif', 32);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Topshop-denim-mini-pelmet-skirt-in-green_4.avif', 32);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Ultimate-Denim-Mini-Skirt_1.avif', 33);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Ultimate-Denim-Mini-Skirt_2.avif', 33);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Ultimate-Denim-Mini-Skirt_3.avif', 33);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/Ultimate-Denim-Mini-Skirt_4.avif', 33);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/wool-blend-mini-skirt_1.avif', 34);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/wool-blend-mini-skirt_2.avif', 34);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/wool-blend-mini-skirt_3.avif', 34);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/women/skirts/wool-blend-mini-skirt_4.avif', 34);


-- -----------------------------------------------------
-- MEN --> SHIRTS
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Baby-Corduroy-Shirt_1.avif', 35);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Baby-Corduroy-Shirt_2.avif', 35);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Baby-Corduroy-Shirt_3.avif', 35);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Baby-Corduroy-Shirt_4.avif', 35);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Maniche-Corte_1.avif', 36);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Maniche-Corte_2.avif', 36);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Maniche-Corte_3.avif', 36);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Maniche-Corte_4.avif', 36);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Righe-Bianche-Loom_1.avif', 37);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Righe-Bianche-Loom_2.avif', 37);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Righe-Bianche-Loom_3.avif', 37);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-a-Righe-Bianche-Loom_4.avif', 37);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-Oxford-Corta-Rossa_1.avif', 38);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-Oxford-Corta-Rossa_2.avif', 38);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-Oxford-Corta-Rossa_3.avif', 38);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Camicia-Oxford-Corta-Rossa_4.avif', 38);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Cutaway-Collar-Stretch-Shirt_1.avif', 39);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Cutaway-Collar-Stretch-Shirt_2.avif', 39);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Cutaway-Collar-Stretch-Shirt_3.avif', 39);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Cutaway-Collar-Stretch-Shirt_4.avif', 39);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Denim-Shirt_1.avif', 40);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Denim-Shirt_2.avif', 40);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Denim-Shirt_3.avif', 40);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Denim-Shirt_4.avif', 40);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Linen-Blend-Shirt_1.avif', 41);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Linen-Blend-Shirt_2.avif', 41);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Linen-Blend-Shirt_3.avif', 41);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Long-Sleeve-Linen-Blend-Shirt_4.avif', 41);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Unbrushed-Flannel-Check-Shirt_1.avif', 42);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Unbrushed-Flannel-Check-Shirt_2.avif', 42);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Unbrushed-Flannel-Check-Shirt_3.avif', 42);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/shirts/Unbrushed-Flannel-Check-Shirt_4.avif', 42);


-- -----------------------------------------------------
-- MEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/baggy-jeans-in-washed-black_1.avif', 43);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/baggy-jeans-in-washed-black_2.avif', 43);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/baggy-jeans-in-washed-black_3.avif', 43);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/baggy-jeans-in-washed-black_4.avif', 43);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Black-Cacoon-Jeans_1.avif', 44);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Black-Cacoon-Jeans_2.avif', 44);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Black-Cacoon-Jeans_3.avif', 44);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Black-Cacoon-Jeans_4.avif', 44);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Denim-Jeans_1.avif', 45);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Denim-Jeans_2.avif', 45);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Denim-Jeans_3.avif', 45);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Denim-Jeans_4.avif', 45);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Edge-straight-fit-jeans-in-mid-blue-wash_1.avif', 46);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Edge-straight-fit-jeans-in-mid-blue-wash_2.avif', 46);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Edge-straight-fit-jeans-in-mid-blue-wash_3.avif', 46);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Edge-straight-fit-jeans-in-mid-blue-wash_4.avif', 46);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jack-Smokey-Blue-Jeans_1.avif', 47);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jack-Smokey-Blue-Jeans_2.avif', 47);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jack-Smokey-Blue-Jeans_3.avif', 47);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jack-Smokey-Blue-Jeans_4.avif', 47);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Black-Jack-lavati_1.avif', 48);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Black-Jack-lavati_2.avif', 48);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Black-Jack-lavati_3.avif', 48);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Black-Jack-lavati_4.avif', 48);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Jack_1.avif', 49);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Jack_2.avif', 49);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Jack_3.avif', 49);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Jeans-Jack_4.avif', 49);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Light-Wash-Carpenter-Jeans_1.avif', 50);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Light-Wash-Carpenter-Jeans_2.avif', 50);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Light-Wash-Carpenter-Jeans_3.avif', 50);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/Light-Wash-Carpenter-Jeans_4.avif', 50);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-black-wash_1.avif', 51);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-black-wash_2.avif', 51);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-black-wash_3.avif', 51);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-black-wash_4.avif', 51);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-light-blue-wash_1.avif', 52);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-light-blue-wash_2.avif', 52);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-light-blue-wash_3.avif', 52);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/jeans/tapered-jeans-in-light-blue-wash_4.avif', 52);


-- -----------------------------------------------------
-- MEN --> TEEs
-- -----------------------------------------------------
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Abstract-Line-Organic-Graphic-T-Shirt_1.avif', 53);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Abstract-Line-Organic-Graphic-T-Shirt_2.avif', 53);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Abstract-Line-Organic-Graphic-T-Shirt_3.avif', 53);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Abstract-Line-Organic-Graphic-T-Shirt_4.avif', 53);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-a-Righe-Marroni_1.avif', 54);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-a-Righe-Marroni_2.avif', 54);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-a-Righe-Marroni_3.avif', 54);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-a-Righe-Marroni_4.avif', 54);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-UO-Rosso-Sognatore_1.avif', 55);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-UO-Rosso-Sognatore_2.avif', 55);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-UO-Rosso-Sognatore_3.avif', 55);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Maglietta-UO-Rosso-Sognatore_4.avif', 55);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Melange-Fever-Dream-T-Shirt_1.avif', 56);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Melange-Fever-Dream-T-Shirt_2.avif', 56);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Melange-Fever-Dream-T-Shirt_3.avif', 56);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Melange-Fever-Dream-T-Shirt_4.avif', 56);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Mount-Fuji-Organic-Graphic-T-Shirt_1.avif', 57);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Mount-Fuji-Organic-Graphic-T-Shirt_2.avif', 57);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Mount-Fuji-Organic-Graphic-T-Shirt_3.avif', 57);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Mount-Fuji-Organic-Graphic-T-Shirt_4.avif', 57);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Olive-Farcito-T-Shirt_1.avif', 58);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Olive-Farcito-T-Shirt_2.avif', 58);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Olive-Farcito-T-Shirt_3.avif', 58);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Olive-Farcito-T-Shirt_4.avif', 58);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Cotton-Classic-T-Shirt_1.avif', 59);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Cotton-Classic-T-Shirt_2.avif', 59);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Cotton-Classic-T-Shirt_3.avif', 59);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Cotton-Classic-T-Shirt_4.avif', 59);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Pocket-T-Shirt_1.avif', 60);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Pocket-T-Shirt_2.avif', 60);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Pocket-T-Shirt_3.avif', 60);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Organic-Pocket-T-Shirt_4.avif', 60);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Ottoman-Trophy-Neck-T-Shirt_1.avif', 61);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Ottoman-Trophy-Neck-T-Shirt_2.avif', 61);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Ottoman-Trophy-Neck-T-Shirt_3.avif', 61);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Ottoman-Trophy-Neck-T-Shirt_4.avif', 61);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Rosa-Creatori-Cotone-T-Shirt_1.avif', 62);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Rosa-Creatori-Cotone-T-Shirt_2.avif', 62);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Rosa-Creatori-Cotone-T-Shirt_3.avif', 62);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Rosa-Creatori-Cotone-T-Shirt_4.avif', 62);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Yellow-Peace-Off-T-Shirt_1.avif', 63);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Yellow-Peace-Off-T-Shirt_2.avif', 63);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Yellow-Peace-Off-T-Shirt_3.avif', 63);
INSERT INTO product_images(img_url, product_id)
VALUES('assets/images/men/tees/Yellow-Peace-Off-T-Shirt_4.avif', 63);


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Add data: Product's sizes
-- -----------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- WOMEN --> DRESSES
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 1);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 1);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 1);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 1);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 2);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 2);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 2);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 2);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 3);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 3);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 3);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 3);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 4);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 4);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 4);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 4);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 5);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 5);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 5);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 5);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 6);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 6);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 6);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 6);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 7);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 7);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 7);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 7);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 8);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 8);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 8);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 8);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 9);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 9);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 9);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 9);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 10);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 10);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 10);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 10);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 11);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 3, 11);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 11);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 11);

-- -----------------------------------------------------
-- WOMEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 12);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 12);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 12);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 12);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 12);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 13);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 13);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 13);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 13);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 13);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 14);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 14);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 14);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 14);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 14);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 15);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 15);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 15);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 15);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 15);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 16);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 16);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 16);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 16);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 16);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 17);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 17);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 17);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 17);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 17);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 18);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 18);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 18);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 18);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 18);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 19);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 19);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 19);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 19);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 19);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 20);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 20);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 20);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 20);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 20);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 21);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 21);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 21);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 21);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 21);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 22);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 22);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 22);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 4, 22);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 3, 22);

-- -----------------------------------------------------
-- WOMEN --> SKIRTS
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 23);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 23);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 23);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 23);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 23);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 24);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 24);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 24);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 24);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 24);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 25);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 25);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 25);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 25);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 25);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 26);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 26);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 26);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 26);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 26);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 27);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 27);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 27);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 27);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 27);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 28);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 28);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 28);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 28);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 28);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 29);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 29);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 29);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 29);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 29);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 30);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 30);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 30);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 30);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 30);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 31);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 31);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 31);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 31);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 31);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 32);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 32);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 32);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 32);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 32);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 33);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 33);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 33);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 33);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 33);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 34);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 34);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 34);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 34);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 7, 34);


-----------------------------------------------------
-- MEN --> SHIRTS
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 35);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 35);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 35);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 35);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 36);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 36);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 36);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 36);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 37);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 37);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 37);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 37);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 38);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 38);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 38);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 38);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 39);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 39);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 39);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 39);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 40);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 40);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 40);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 40);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 41);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 41);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 41);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 41);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 42);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 42);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 8, 42);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 42);


-----------------------------------------------------
-- MEN --> JEANS
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 43);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 43);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 43);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 43);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 44);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 44);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 44);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 44);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 45);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 45);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 45);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 45);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 46);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 46);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 46);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 46);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 47);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 47);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 47);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 47);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 48);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 48);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 48);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 48);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 49);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 49);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 49);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 49);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 50);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 50);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 50);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 50);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 51);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 51);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 51);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 51);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('30', 3, 52);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('32', 10, 52);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('34', 1, 52);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('36', 0, 52);


-- -----------------------------------------------------
-- MEN --> TEEs
-- -----------------------------------------------------
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 53);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 53);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 0, 53);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 0, 53);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 53);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 3, 54);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 54);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 54);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 10, 54);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 54);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 4, 55);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 6, 55);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 8, 55);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 10, 55);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 55);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 11, 56);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 2, 56);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 33, 56);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 12, 56);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 4, 56);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 1, 57);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 9, 57);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 5, 57);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 5, 57);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 2, 57);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 1, 58);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 3, 58);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 2, 58);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 15, 58);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 58);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 3, 59);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 10, 59);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 1, 59);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 13, 59);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 4, 59);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 2, 60);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 1, 60);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 0, 60);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 9, 60);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 10, 60);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 5, 61);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 10, 61);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 13, 61);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 1, 61);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 61);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 12, 62);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 1, 62);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 8, 62);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 10, 62);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 62);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XS', 0, 63);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('S', 0, 63);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('M', 0, 63);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('L', 0, 63);
INSERT INTO product_sizes(size, quantity, product_id)
VALUES('XL', 0, 63);
