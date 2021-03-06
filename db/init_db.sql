CREATE TABLE `USERS`(
  `USER_ID` INT NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` VARCHAR(255) NOT NULL UNIQUE,
  `PASSWORD` VARCHAR(255) NOT NULL,
  `FIRST_NAME` VARCHAR(255) NOT NULL,
  `LAST_NAME` VARCHAR(255) NOT NULL,
  `ADDRESS` VARCHAR(255) NOT NULL,
  `CITY` VARCHAR(255) NOT NULL,
  `ZIP_CODE` VARCHAR(255) NOT NULL,
  `COUNTRY` VARCHAR(255) NOT NULL,
  `PHONE` VARCHAR(255) NOT NULL,
  `EMAIL` VARCHAR(255) NOT NULL UNIQUE,
  `BILLING_ADDRESS` VARCHAR(255),
  `BILLING_CITY` VARCHAR(255),
  `BILLING_ZIP_CODE` VARCHAR(255),
  `BILLING_COUNTRY` VARCHAR(255),
  `BILLING_PHONE` VARCHAR(255),
  `SHIPPING_ADDRESS` VARCHAR(255),
  `SHIPPING_CITY` VARCHAR(255),
  `SHIPPING_ZIP_CODE` VARCHAR(255),
  `SHIPPING_COUNTRY` VARCHAR(255),
  `SHIPPING_PHONE` VARCHAR(255),
  `REGISTRATION_DATE` DATE NOT NULL,
  PRIMARY KEY(`USER_ID`)
);
CREATE TABLE `PRODUCTS`(
  `CATEGORY_ID` INT NOT NULL,
  `IMAGE_ID` INT NOT NULL,
  `PRODUCT_ID` INT NOT NULL AUTO_INCREMENT,
  `VENDOR_PRODUCT_ID` VARCHAR(255) NOT NULL,
  `PRODUCT_NAME` VARCHAR(255) NOT NULL,
  `PROUCT_DESCRIPTION` TEXT NOT NULL,
  `UNITS_IN_STOCK` INT NOT NULL,
  `PRODUCT_PRICE` FLOAT NOT NULL,
  `PRODUCT_AVAILABLE` BOOLEAN NOT NULL,
  `NOTES` TEXT NOT NULL,
  `TIMESTAMP` TIMESTAMP NOT NULL,
  PRIMARY KEY(`PRODUCT_ID`)
);
CREATE TABLE `CATEGORIES`(
  `CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` VARCHAR(255) NOT NULL,
  `CATEGORY_DESCRIPTION` TEXT NOT NULL,
  `ACTIVE` BOOLEAN NOT NULL,
  PRIMARY KEY(`CATEGORY_ID`)
);
CREATE TABLE `VENDORS`(
  `VENDOR_ID` INT NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` VARCHAR(255) NOT NULL,
  `ADDRESS` VARCHAR(255) NOT NULL,
  `CITY` VARCHAR(255) NOT NULL,
  `ZIP_CODE` VARCHAR(255) NOT NULL,
  `COUNTRY` VARCHAR(255) NOT NULL,
  `PHONE` VARCHAR(255) NOT NULL,
  `EMAIL` VARCHAR(255) NOT NULL,
  `URL` VARCHAR(255) NOT NULL,
  `NOTES` TEXT NOT NULL,
  PRIMARY KEY(`VENDOR_ID`)
);
CREATE TABLE `IMAGES`(
  `IMAGE_ID` INT NOT NULL AUTO_INCREMENT,
  `IMAGE` BLOB NOT NULL,
  `IMAGE_NAME` VARCHAR(255) NOT NULL,
  PRIMARY KEY(`IMAGE_ID`)
);
CREATE TABLE `ORDERS`(
  `ORDER_ID` INT NOT NULL AUTO_INCREMENT,
  `USER_ID` INT NOT NULL,
  `PAYMENT_ID` INT NOT NULL,
  `ORDER_DATE` DATE NOT NULL,
  `SHIP_DATE` DATE NOT NULL,
  `TIMESTAMP` TIMESTAMP NOT NULL,
  `TRANSACTION_STATUS` VARCHAR(255) NOT NULL,
  `FULFILLED` BOOLEAN NOT NULL,
  `DELETED` BOOLEAN NOT NULL,
  `PAID` BOOLEAN NOT NULL,
  `PAYMENT_DATE` DATE NOT NULL,
  PRIMARY KEY(`ORDER_ID`)
);
CREATE TABLE `ORDER_DETAILS`(
  `ORDER_DETAIL_ID` INT NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` INT NOT NULL,
  `ORDER_ID` INT NOT NULL,
  `QUANTITY` INT NOT NULL,
  `PRICE` FLOAT NOT NULL,
  `FULFILLED` BOOLEAN NOT NULL,
  `SHIP_DATE` DATE NOT NULL,
  `BILL_DATE` DATE NOT NULL,
  PRIMARY KEY(`ORDER_DETAIL_ID`)
);
CREATE TABLE `STOCK_ORDERS`(
  `VENDOR_ID` INT NOT NULL,
  `STOCK_ORDER_ID` INT NOT NULL AUTO_INCREMENT,
  `PAYMENT_ID` INT NOT NULL,
  `ORDER_DATE` DATE NOT NULL,
  `SHIP_DATE` DATE NOT NULL,
  `TIMESTAMP` TIMESTAMP NOT NULL,
  `FULFILLED` BOOLEAN NOT NULL,
  PRIMARY KEY(`STOCK_ORDER_ID`)
);
CREATE TABLE `STOCK_ORDER_DETAILS`(
  `STOCK_ORDER_DETAIL_ID` INT NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` INT NOT NULL,
  `STOCK_ORDER_ID` INT NOT NULL,
  `QUANTITY` INT NOT NULL,
  `PRICE` FLOAT NOT NULL,
  `FULFILLED` BOOLEAN NOT NULL,
  `SHIP_DATE` DATE NOT NULL,
  PRIMARY KEY(`STOCK_ORDER_DETAIL_ID`)
);
CREATE TABLE `PAYMENTS`(
  `PAYMENT_ID` INT NOT NULL AUTO_INCREMENT,
  `PAYMENT_TYPE` INT NOT NULL,
  `PAYMENT_METHOD` INT NOT NULL,
  PRIMARY KEY(`PAYMENT_ID`)
);
ALTER TABLE
  `PRODUCTS` ADD CONSTRAINT `PRODUCTS_fk0` FOREIGN KEY(`CATEGORY_ID`) REFERENCES `CATEGORIES`(`CATEGORY_ID`);
ALTER TABLE
  `PRODUCTS` ADD CONSTRAINT `PRODUCTS_fk1` FOREIGN KEY(`IMAGE_ID`) REFERENCES `IMAGES`(`IMAGE_ID`);
ALTER TABLE
  `ORDERS` ADD CONSTRAINT `ORDERS_fk0` FOREIGN KEY(`USER_ID`) REFERENCES `USERS`(`USER_ID`);
ALTER TABLE
  `ORDERS` ADD CONSTRAINT `ORDERS_fk1` FOREIGN KEY(`PAYMENT_ID`) REFERENCES `PAYMENTS`(`PAYMENT_ID`);
ALTER TABLE
  `ORDER_DETAILS` ADD CONSTRAINT `ORDER_DETAILS_fk0` FOREIGN KEY(`PRODUCT_ID`) REFERENCES `PRODUCTS`(`PRODUCT_ID`);
ALTER TABLE
  `ORDER_DETAILS` ADD CONSTRAINT `ORDER_DETAILS_fk1` FOREIGN KEY(`ORDER_ID`) REFERENCES `ORDERS`(`ORDER_ID`);
ALTER TABLE
  `STOCK_ORDERS` ADD CONSTRAINT `STOCK_ORDERS_fk0` FOREIGN KEY(`VENDOR_ID`) REFERENCES `VENDORS`(`VENDOR_ID`);
ALTER TABLE
  `STOCK_ORDERS` ADD CONSTRAINT `STOCK_ORDERS_fk1` FOREIGN KEY(`PAYMENT_ID`) REFERENCES `PAYMENTS`(`PAYMENT_ID`);
ALTER TABLE
  `STOCK_ORDER_DETAILS` ADD CONSTRAINT `STOCK_ORDER_DETAILS_fk0` FOREIGN KEY(`PRODUCT_ID`) REFERENCES `PRODUCTS`(`PRODUCT_ID`);
ALTER TABLE
  `STOCK_ORDER_DETAILS` ADD CONSTRAINT `STOCK_ORDER_DETAILS_fk1` FOREIGN KEY(`STOCK_ORDER_ID`) REFERENCES `STOCK_ORDERS`(`STOCK_ORDER_ID`);
