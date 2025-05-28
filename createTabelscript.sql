#create database project4;
CREATE TABLE Continent (
    continent_id INT PRIMARY KEY AUTO_INCREMENT,
    continent_name VARCHAR(100) NOT NULL
);

CREATE TABLE Country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    continent_id INT NOT NULL,
    FOREIGN KEY (continent_id) REFERENCES Continent(continent_id)
);

CREATE TABLE State (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE City (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20),
    state_id INT NOT NULL,
    FOREIGN KEY (state_id) REFERENCES State(state_id)
);

CREATE TABLE Customer (
    customer_id INT (100) PRIMARY KEY,
    gender VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    birthday DATE,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

CREATE TABLE ExchangeRate (
    currency_code CHAR(3) NOT NULL,
    exchange_date DATE NOT NULL,
    exchange_rate DECIMAL(10, 4) NOT NULL,
    PRIMARY KEY (currency_code, exchange_date)
);

CREATE TABLE Store (
    store_id INT (100) PRIMARY KEY,
    country VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    square_meters DECIMAL(10, 2) NOT NULL,
    open_date DATE NOT NULL
);

CREATE TABLE Subcategory (
    subcategory_id INT (100) PRIMARY KEY,
    subcategory_name VARCHAR(100) NOT NULL
);

CREATE TABLE Category (
    category_id INT (100) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    product_id INT (100) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    color VARCHAR(50),
    unit_cost_USD DECIMAL(10, 2) NOT NULL,
    unit_price_USD DECIMAL(10, 2) NOT NULL,
    subcategory_id INT NOT NULL,
    category_id INT NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

CREATE TABLE PhysicalSale (
    order_id INT NOT NULL,
    line_item INT NOT NULL,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, line_item),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE OnlineSale (
    order_id INT NOT NULL,
    line_item INT NOT NULL,
    order_date DATE NOT NULL,
    delivery_date DATE,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    currency_code CHAR(3),
    PRIMARY KEY (order_id, line_item),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES Store(store_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (currency_code, order_date) REFERENCES ExchangeRate(currency_code, exchange_date)
);

