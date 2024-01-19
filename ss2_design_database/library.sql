drop database if exists library;
create database if not exists library;
use library;

CREATE TABLE students (
    s_id INT PRIMARY KEY AUTO_INCREMENT,
    s_name VARCHAR(100),
    birthday DATE,
    class_name VARCHAR(50)
);

CREATE TABLE category (
    cate_id INT PRIMARY KEY,
    cate_name VARCHAR(100)
);

CREATE TABLE authors (
    au_id INT PRIMARY KEY,
    au_name VARCHAR(100)
);

CREATE TABLE books (
    b_id INT PRIMARY KEY,
    title VARCHAR(100),
    page_size INT CHECK (page_size >= 0),
    cate_id INT,
    au_id INT,
    FOREIGN KEY (cate_id)
        REFERENCES category (cate_id),
    FOREIGN KEY (au_id)
        REFERENCES authors (au_id)
);

CREATE TABLE borrows (
    id INT PRIMARY KEY,
    s_id INT,
    b_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (s_id)
        REFERENCES students (s_id),
    FOREIGN KEY (b_id)
        REFERENCES books (b_id)
);

