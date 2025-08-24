-- Create Database
CREATE DATABASE global_store
    WITH
        OWNER = postgres
        ENCODING = 'UTF8'
;


-- Create Tables
CREATE TABLE products(
    id_product CHAR(11) PRIMARY KEY,
    category VARCHAR(50),
    subcategory VARCHAR(50),
    product_name VARCHAR(250)
);


CREATE TABLE cities(
    id_city SERIAL PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    region VARCHAR(50),
    market VARCHAR(50)
);


CREATE TABLE customers(
    id_customer VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(50),
    segment VARCHAR(50)
);


CREATE TABLE orders(
    id_row SERIAL PRIMARY KEY,
    id_order VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    order_priority VARCHAR(50),
    id_customer VARCHAR(50) REFERENCES customers(id_customer),
    id_city INT REFERENCES cities(id_city),
    id_product CHAR(11) REFERENCES products(id_product),
    unit_price NUMERIC,
    unit_cost NUMERIC,
    quantity INT,
    discount NUMERIC,
    shipping_cost NUMERIC,
    returned VARCHAR(50)
);

