drop database if exists library;
create database if not exists library;
use library;

create table students(
	s_id int primary key auto_increment,
    s_name varchar(100),
    birthday date,
    class_name varchar(50)
);

create table category(
	cate_id int primary key,
    cate_name varchar(100)
);

create table authors(
	au_id int primary key,
    au_name varchar(100)
);

create table books(
	b_id int primary key,
    title varchar(100),
    page_size int check(page_size >=0),
    cate_id int,
    au_id int,
    foreign key(cate_id) references category(cate_id),
    foreign key(au_id) references authors(au_id)
);

create table borrows(
	s_id int,
    b_id int,
    borrow_date date,
    return_date date,
    primary key(s_id, b_id),
    foreign key(s_id) references students(s_id),
    foreign key(b_id) references books(b_id)
);

