drop database if exists book_management;
create database if not exists book_management;
use book_management;

create table books(
	b_id int primary key,
    b_name varchar(30),
    page_size int,
    author varchar(100)
);

