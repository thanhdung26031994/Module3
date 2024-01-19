drop database if exists student_management;
create database if not exists student_management;
use student_management;

CREATE TABLE class (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(100)
);

CREATE TABLE teacher (
    t_id INT PRIMARY KEY AUTO_INCREMENT,
    t_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    country VARCHAR(100) NOT NULL
);