drop database if exists quan_ly_hoc_vien;
create database if not exists quan_ly_hoc_vien;
use quan_ly_hoc_vien;

CREATE TABLE address (
    a_id INT PRIMARY KEY,
    address VARCHAR(50)
);

CREATE TABLE class (
    cl_id INT PRIMARY KEY,
    cl_name VARCHAR(100),
    cl_language VARCHAR(50),
    cl_description TEXT
);

CREATE TABLE course (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(100),
    c_description TEXT
);

CREATE TABLE students (
    s_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT CHECK (age > 14),
    phone VARCHAR(10) UNIQUE,
    a_id INT,
    cl_id INT,
    FOREIGN KEY (a_id)
        REFERENCES address (a_id),
    FOREIGN KEY (cl_id)
        REFERENCES class (cl_id)
);

CREATE TABLE points (
    p_id INT PRIMARY KEY,
    p_point FLOAT CHECK (p_point > 0),
    c_id INT,
    s_id INT,
    FOREIGN KEY (c_id)
        REFERENCES course (c_id),
    FOREIGN KEY (s_id)
        REFERENCES students (s_id)
);


-- Thêm 5 bản ghi trong bảng Address
insert into address
values (1, 'Đà Nẵng'),
(2, 'Hà Nội'),
(3, 'Huế'),
(4, 'Sài Gòn'),
(5, 'Quảng Nam');

-- Thêm 5 bản ghi trong bảng Class
insert into class
values (1, 'C0923G1', 'Tiếng Việt', 'Vui Vẻ'),
(2, 'C1023G1', 'Tiếng Nga', 'Hoà Đồng'),
(3, 'C0923H1', 'Tiếng Anh', 'Happy'),
(4, 'C1123G1', 'Tiếng Pháp', 'Sôi Nổi'),
(5, 'C1223G1', 'Tiếng Nhật', 'Chăm Chỉ');

-- Thêm 10 bản ghi trong bảng Student
insert into students
values (1, 'Nguyễn Văn Hải Nhật', 20, '0945962203', 1, 1),
(2, 'Huỳnh Trần Thanh Dụng', 30, '0356230012', 1, 2),
(3, 'Nguyễn trúc vi', 15, '0762589598', 1, 3),
(4, 'Nguyễn Văn Ánh', 18, '0965075904', 2, 1),
(5, 'Nguyễn Quốc Phú', 21, '0931966586', 2, 5),
(6, 'Lương Văn Đạt', 25, '0981900587', 2, 4),
(7, 'Nguyễn Minh Phương', 17, '0366553995', 3, 2),
(8, 'Lê Đăng Pháp', 19, '0842078955', 3, 1),
(9, 'Nguyễn Đình Thống', 22, '0353107446', 4, 2),
(10, 'Phan Quyết Thắng', 27, '0981264706', 5, 2),
(11, 'Lê Việt Hưng', 26, '0967548599', 4, 4);

-- Thêm Khoá học 
insert into course
values(1, 'Online', 'Trực tiếp trên Zoom'),
(2, 'Offline', 'Trực tiếp tại cơ sở theo địa chỉ'),
(3, 'Hybrid', 'Lý thuyết online và thực hành tại cơ sở');

-- Thêm 15 bản ghi trong bảng Point
insert into points(p_id, p_point, c_id, s_id)
values (1, 7.5, 1, 1),
(2, 2.1, 1, 2),
(3, 3.9, 2, 3),
(4, 9.7, 3, 4),
(5, 7.4, 2, 5),
(6, 5.5, 3, 6),
(7, 8.1, 1, 7),
(8, 7.0, 2, 8),
(9, 4.8, 1, 9),
(10, 5.1, 3, 10),
(11, 1.5, 3,11),
(12, 5.9, 1, 8),
(13, 9.5, 2, 7),
(14, 7.7, 3, 6),
(15, 6.6, 1, 5);

select * from students;
-- Viết câu query thực hiện:  
-- Tìm kiếm HV có họ Nguyen
select full_name, age, phone
from students
where full_name like 'Nguyen%_';

-- Tìm kiếm HV có ten Anh
select full_name, age, phone
from students
where full_name like '%_Anh';

-- Tim kiem HV có độ tuổi tư 18-15
select full_name, age, phone
from students
where age between 15 and 18;

-- Tìm kiếm HV có id là 10 hoặc 13
select s_id, full_name, age, phone
from students
where s_id = 10 or s_id = 13;

-- Viết các câu lệnh truy vấn thực hiện nhiệm vụ sau:

-- Thống kê số lượng học viên các lớp (count)
select class.cl_name as 'Tên Lớp', count(*) as 'Số lượng học viên'
from students
join class on class.cl_id = students.cl_id
group by class.cl_name;

-- Thống kê số lượng học viên tại các tỉnh (count)
select address.address as 'Địa chỉ', count(*) as 'Số lượng học viên'
from students
join address on address.a_id = students.a_id
group by address.address;

-- Tính điểm trung bình của các khóa học (avg)
SELECT 
    course.c_name AS 'Tên Khoá Học',
    AVG(points.p_point) AS 'Điểm trung bình'
FROM
    points
        JOIN
    course ON course.c_id = points.c_id
GROUP BY course.c_name
ORDER BY AVG(points.p_point) DESC
LIMIT 1;
-- Tính điểm trung bình lớn nhất 
SELECT 
    course.c_name AS 'Tên Khoá Học',
    AVG(points.p_point) AS 'Điểm Trung Bình'
FROM
    points
        JOIN
    course ON course.c_id = points.c_id
GROUP BY course.c_name
HAVING AVG(points.p_point) = (SELECT 
        MAX(avg_point)
    FROM
        (SELECT 
            AVG(points.p_point) AS avg_point
        FROM
            points
        GROUP BY c_id) AS avg_points);