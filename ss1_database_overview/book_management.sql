drop database if exists book_management;
create database if not exists book_management;
use book_management;

CREATE TABLE books (
    b_id INT PRIMARY KEY,
    b_name VARCHAR(30),
    page_size INT,
    author VARCHAR(100)
);
-- Nhập dữ liệu cho bảng
insert into books(b_id, b_name, page_size, author)
values (1, 'Toán', 45, 'Nguyễn Thái Học'),
(2, 'Văn', 34, 'Trần Minh Hoàng'),
(3, 'Sử', 56, 'Dương Trung Quốc'),
(4, 'Địa', 76, 'Lê Văn Hiến'),
(5, 'Hoá', 32, 'Hà Văn Minh');

-- Cập nhập số trang page_size = 50 với sách có name = 'Sử'
use book_management;
UPDATE books SET page_size = '50' WHERE b_name = 'Sử' and b_id = '3';

-- Xoá sách có id = 5
DELETE FROM books WHERE b_id = '5';

-- Xoá bảng books	
drop table books;

-- Xoá cơ sở dữ liệu book_management
drop database book_management;