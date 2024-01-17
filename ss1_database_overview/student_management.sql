drop database if exists student_management;
create database if not exists student_management;
use student_management;

create table class(
	c_id int primary key auto_increment,
    c_name varchar(100)
);

create table teacher(
	t_id int primary key auto_increment,
    t_name varchar(100) not null,
    age int check(age > 0),
    country varchar(100) not null
);