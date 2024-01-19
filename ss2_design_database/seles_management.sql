drop database if exists seles_management;
create database if not exists seles_management;
use seles_management;

CREATE TABLE customer (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(100),
    c_age INT CHECK (c_age > 18)
);

CREATE TABLE product (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(100),
    p_price FLOAT CHECK (p_price > 0)
);

CREATE TABLE orders (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    c_id INT,
    o_date DATE,
    o_total_price FLOAT CHECK (o_total_price > 0),
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT CHECK (od_qty > 0),
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES orders (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);