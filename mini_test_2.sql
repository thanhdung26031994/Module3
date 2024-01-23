drop database if exists tour_management;
create database if not exists tour_management;
use tour_management;

CREATE TABLE city (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(255)
);

CREATE TABLE category_tour (
    category_id INT PRIMARY KEY,
    type_code VARCHAR(255),
    type_name VARCHAR(255)
);

CREATE TABLE destination (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(255),
    d_describe TEXT,
    cost DOUBLE CHECK (cost > 0),
    c_id INT,
    FOREIGN KEY (c_id)
        REFERENCES city (c_id)
);

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    id_number VARCHAR(255),
    date_birth DATE,
    c_id INT,
    FOREIGN KEY (c_id)
        REFERENCES city (c_id)
);

CREATE TABLE tour (
    tour_id INT PRIMARY KEY,
    tour_code VARCHAR(255),
    category_id INT,
    d_id INT,
    date_start DATE,
    date_end DATE,
    FOREIGN KEY (category_id)
        REFERENCES category_tour (category_id),
    FOREIGN KEY (d_id)
        REFERENCES destination (d_id)
);

CREATE TABLE order_tour (
    oder_id INT PRIMARY KEY,
    tour_id INT,
    client_id INT,
    statuss VARCHAR(255),
    FOREIGN KEY (tour_id)
        REFERENCES tour (tour_id),
    FOREIGN KEY (client_id)
        REFERENCES clients (client_id)
);
-- Thêm 5 thành phố 
insert into city
values (1, 'Quảng Ngãi'),
(2, 'Đà Nẵng'),
(3, 'Huế'),
(4, 'Quảng Nam'),
(5, 'Quy Nhơn');

-- Thêm 2 loại
insert into category_tour
values (1, 'CT01', 'Cả Ngày'),
(2, 'CT02', 'Trong một buổi');

-- Thêm 5 bản ghi của điểm đến du lịch
insert into destination
values (1, 'Đảo Lý Sơn', 'Đặt sản tỏi và vùng san hô đẹp', 2500.0, 1),
(2, 'Đồi Vọng Cảnh', 'Điểm đến ngắm trọn vẻ đẹp xứ Huế', 500.0, 3),
(3, 'Bà Nà Hill', 'Theo lối kiến trúc Châu Âu', 1500.0, 2),
(4, 'Phố cổ Hội An', 'Phố cổ Hội An cổ kính, thơ mộng', 3300.0, 4),
(5, 'Kỳ Co', 'ví như Maldives “phiên bản Việt” với bãi biển xanh, bờ cát trắng lung linh lấp lánh dưới nắng', 4100.0, 5);

-- Thêm 10 khách hàng
insert into clients
values(1, 'Vũ Thị Kiều Anh', '1234567890', '1993-01-01', 1),
(2, 'Trần Tuấn Anh', '1231234561', '1993-01-02', 1),
(3, 'Trần Minh Lộc', '1447852369', '1993-02-02', 5),
(4, 'Trần Thanh Hải', '1597532584', '1991-12-22', 2),
(5, 'Lê Việt Hưng', '1237897894', '1999-05-12', 2),
(6, 'Phan Quyết Thắng', '5656898923', '2000-04-12', 3),
(7, 'Nguyễn Đình Thống', '2212313211', '2000-04-12', 3),
(8, 'Lê Đăng Pháp', '6565984877', '1998-04-12', 4),
(9, 'Nguyễn Minh Phương', '1585211444', '2002-04-12', 4),
(10, 'Lương Văn Đạt', '5656844477', '2001-04-12', 3);

-- Thêm 15 tour
insert into tour
values(1, 'T001', 1, 1, '2023-03-02', '2023-03-02'),
(2, 'T002', 2, 2, '2023-04-02', '2023-04-02'),
(3, 'T003', 1, 3, '2023-05-02', '2023-05-02'),
(4, 'T004', 2, 4, '2023-03-12', '2023-03-13'),
(5, 'T005', 1, 5, '2023-02-02', '2023-02-02'),
(6, 'T006', 1, 5, '2023-03-02', '2023-03-02'),
(7, 'T007', 2, 4, '2023-01-11', '2023-01-11'),
(8, 'T008', 2, 3, '2023-11-12', '2023-11-12'),
(9, 'T009', 1, 2, '2023-12-08', '2023-03-08'),
(10, 'T010', 2, 1, '2023-09-02', '2023-09-02'),
(11, 'T011', 1, 1, '2023-04-27', '2023-04-28'),
(12, 'T012', 2, 3, '2023-06-02', '2023-06-02'),
(13, 'T013', 1, 1, '2023-08-02', '2023-08-02'),
(14, 'T014', 2, 4, '2023-07-02', '2023-07-02'),
(15, 'T015', 1, 2, '2023-03-02', '2023-03-02');

-- Thêm 10 hóa đơn đặt tour
insert into order_tour
values (1, 1, 1, 'Hoat động'),
(2, 3, 2, 'Không'),
(3, 6, 3, 'Hoat động'),
(4, 9, 4, 'Không'),
(5, 4, 5, 'Hoat động'),
(6, 11, 6, 'Hoat động'),
(7, 15, 7, 'Hoat động'),
(8, 13, 8, 'Không'),
(9, 7, 1, 'Hoat động'),
(10, 2, 2, 'Không');

-- Thống kê số lượng tour của các thành phố
insert into city
values (6, 'Hà Nội');

SELECT 
    c.c_name, COUNT(t.d_id) AS 'Số lần tour của TP'
FROM
    city c
        LEFT JOIN
    destination d ON d.c_id = c.c_id
        LEFT JOIN
    tour t ON t.d_id = d.d_id
GROUP BY c.c_name;

-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 ( dùng count)
SELECT 
    COUNT(*) AS 'Số tour bắt đầu trong T3'
FROM
    tour
WHERE
    month(tour.date_start) = 03;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
SELECT 
    COUNT(*) AS 'Số tour kết thúc trong T4'
FROM
    tour
WHERE
    month(tour.date_end) = 04 ;