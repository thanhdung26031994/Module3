drop database if exists Quan_Ly_Hang_Hoa;
create database if not exists Quan_Ly_Hang_Hoa;
use Quan_Ly_Hang_Hoa;

create table vat_tu(
	vt_id int primary key auto_increment,
    vt_ma varchar(10),
    ten varchar(255),
    dvt varchar(255),
    gia float check (gia > 0)
);

create table ton_kho(
	tk_id int primary key auto_increment,
    vt_id int,
    sl_dau float,
    sl_nhap float,
    sl_xuat float,
    foreign key(vt_id) references vat_tu(vt_id)
);

create table nha_cung_cap(
	ncc_id int primary key auto_increment,
    ncc_ma varchar(255),
    ten varchar(255),
    dia_chi varchar(255),
    sdt varchar(10)
);

create table don_dat_hang(
	ddh_id int primary key auto_increment,
    ddh_ma varchar(255),
    ngay_dat date,
    ncc_id int,
    foreign key(ncc_id) references nha_cung_cap(ncc_id)
);

create table phieu_nhap(
	pn_id int primary key auto_increment,
    pn_ma varchar(255),
    ngay_nhap date,
    ddh_id int,
    foreign key(ddh_id) references don_dat_hang(ddh_id)
);

create table phieu_xuat(
	px_id int primary key auto_increment,
    px_ma varchar(255),
    ngay_xuat date,
    ten_kh varchar(255)
);

create table chi_tiet_don_hang(
	ctdh_id int primary key auto_increment,
    ddh_id int,
    vt_id int,
    sl_dat float,
    foreign key(ddh_id) references don_dat_hang(ddh_id),
    foreign key(vt_id) references vat_tu(vt_id)
);

create table chi_tiet_phieu_nhap(
	ctpn_id int primary key auto_increment,
    pn_id int,
    vt_id int,
    sl_nhap float,
    dg_nhap float,
    ghi_chu text,
    foreign key(pn_id) references phieu_nhap(pn_id),
    foreign key(vt_id) references vat_tu(vt_id)
);

create table chi_tiet_phieu_xuat(
	ctpx_id int primary key auto_increment,
    px_id int,
    vt_id int,
    sl_xuat float,
    dg_xuat float,
    ghi_chu text,
    foreign key(px_id) references phieu_xuat(px_id),
    foreign key(vt_id) references vat_tu(vt_id)
);
-- Nhập 5 bản ghi bảng Vật tư
insert into vat_tu
values (1, 'VT001', 'Cát', 'Kg', 123.1),
(2, 'VT002', 'Gạch', 'Viên', 12.9),
(3, 'VT003', 'Sắt Cây', 'Cây', 23.4),
(4, 'VT004', 'Đinh', 'Kg', 3.4),
(5,'VT005', 'Xi măng', 'Tấn', 8.5);

-- Nhập 5 bản ghi bảng Tồn kho
insert into ton_kho
values(1, 1, 100, 250, 120.25),
(2, 5, 20, 150, 35),
(3, 2, 500, 1000, 800),
(4, 3, 80, 300, 289),
(5, 4, 1000, 800, 1120);

-- Nhập 3 nhà cung cấp
insert into nha_cung_cap
values(1, 'NCC01', 'Hoà Phát', 'Quảng Ngãi', '0987654321'),
(2, 'NCC02', 'VinFast', 'Quảng Nam', '0987656544'),
(3, 'NCC03', 'SangSum', 'Đà Nẵng', '0123456789'),
(4, 'NCC04', 'Apple', 'Huế', '0987428963'),
(5, 'NCC05', 'Dung Quất', 'Quảng Ngãi', '0753869142');

-- Nhập 3 đơn hàng
insert into don_dat_hang
values(1, 'DDH01', '2024-01-01', 1),
(2, 'DDH02', '2024-01-11', 3),
(3, 'DDH03', '2024-01-22', 4);

-- Nhập 3 phiếu nhập
insert into phieu_nhap
values (1, 'PN001', '2024-01-02', 1),
(2, 'PN002', '2024-01-13', 2),
(3, 'PN003', '2024-01-25', 3);

-- Nhập 3 phiếu xuất 
insert into phieu_xuat
values (1, 'PX01', '2024-01-05', 'Phát'),
(2, 'PX02', '2024-01-18', 'Lộc'),
(3, 'PX03', '2024-01-29', 'Thọ');

-- Nhập 6 CT Đơn hàng
insert into chi_tiet_don_hang
values (1, 1, 5, 10),
(2, 2, 1, 120),
(3, 2, 3, 50),
(4, 3, 2, 60),
(5, 3, 2, 80),
(6, 1, 4, 100);

-- Nhập 6 CT Phiếu nhập
insert into chi_tiet_phieu_nhap
values (1, 1, 5, 30, 10, 'Xi măng HP'),
(2, 2, 2, 40, 15, 'Gạch hồng hà'),
(3, 3, 3, 50, 22, 'Sắt Vip'),
(4, 1, 4, 70, 5.8, 'Đinh tán'),
(5, 2, 5, 80, 10, 'Xi măng HP'),
(6, 3, 1, 100, 110, 'Cát Sông Hồng');

-- Nhập 6 CT Phiếu xuất
insert into chi_tiet_phieu_xuat
values (1, 1, 5, 50,12, 'Khách đang cần'),
(2, 2, 2, 60,19, 'Không vội'),
(3, 3, 3, 100,26, 'Không vội'),
(4, 1, 4, 20,5.9, 'Khách đang cần'),
(5, 2, 5, 65,13, 'Không vội'),
(6, 3, 1, 32,112, 'Khách đang cần');

-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP as
select pn.pn_ma, vt.vt_ma, ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_nhap pn on pn.pn_id = ct.pn_id;

select * from vw_CTPNHAP;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, 
-- đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT as
select pn.pn_ma, vt.vt_ma, vt.ten , ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_nhap pn on pn.pn_id = ct.pn_id;

select * from vw_CTPNHAP_VT;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, 
-- mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN as
select pn.pn_ma, pn.ngay_nhap, ctdh.sl_dat, vt.vt_ma,vt.ten , ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
 join vat_tu vt on vt.vt_id = ct.vt_id
 join phieu_nhap pn on pn.pn_id = ct.pn_id
 join chi_tiet_don_hang ctdh on ctdh.vt_id = vt.vt_id;

select * from vw_CTPNHAP_VT_PN;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, 
-- mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN_DH as
select pn.pn_ma, pn.ngay_nhap, ctdh.sl_dat, ncc.ncc_ma, vt.vt_ma,vt.ten , ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_nhap pn on pn.pn_id = ct.pn_id
left join chi_tiet_don_hang ctdh on ctdh.vt_id = vt.vt_id
left join don_dat_hang ddh on ddh.ddh_id = ctdh.ddh_id
left join nha_cung_cap ncc on ncc.ncc_id = ddh.ncc_id;

select * from vw_CTPNHAP_VT_PN_DH;

-- 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
-- Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 50.
create view vw_CTPNHAP_loc as
select pn.pn_ma, vt.vt_ma, ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_nhap pn on pn.pn_id = ct.pn_id
where ct.sl_nhap > 50;

select * from vw_CTPNHAP_loc;

-- 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, 
-- đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
create view vw_CTPNHAP_VT_loc as
select pn.pn_ma, vt.vt_ma, vt.ten , ct.sl_nhap, ct.dg_nhap, (ct.sl_nhap * ct.dg_nhap) as TTN
from chi_tiet_phieu_nhap ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_nhap pn on pn.pn_id = ct.pn_id
where vt.dvt = 'Kg';

select * from vw_CTPNHAP_VT_loc;

-- 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
create view vw_CTPXUAT as
select px.px_ma, vt.vt_ma, ct.sl_xuat, ct.dg_xuat, (ct.sl_xuat * ct.dg_xuat) as TTX
from chi_tiet_phieu_xuat ct
left join vat_tu vt on vt.vt_id = ct.vt_id
left join phieu_xuat px on px.px_id = ct.px_id;

select * from vw_CTPXUAT;

-- 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT as
select px.px_ma, vt.vt_ma, vt.ten, ct.sl_xuat, ct.dg_xuat
from chi_tiet_phieu_xuat ct
 join vat_tu vt on vt.vt_id = ct.vt_id
 join phieu_xuat px on px.px_id = ct.px_id;
 
 -- 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng,
 -- mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT_PX as
select px.px_ma, px.ten_kh, vt.vt_ma, vt.ten, ct.sl_xuat, ct.dg_xuat
from chi_tiet_phieu_xuat ct
join vat_tu vt on vt.vt_id = ct.vt_id
join phieu_xuat px on px.px_id = ct.px_id;

-- Tạo các stored procedure sau
-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.

delimiter //
create procedure get_tong_sl_cuoi(in vt_ma varchar(255))
begin
select vt.vt_ma, ((tk.sl_dau + tk.sl_nhap) - tk.sl_xuat) as SLC
from ton_kho tk
join vat_tu vt on vt.vt_id = tk.vt_id
where vt.vt_ma = vt_ma;
end //  
delimiter ;

call get_tong_sl_cuoi('VT001');

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào, out là tổng tiền xuất
delimiter //
create procedure get_tong_tien_xuat(in vt_ma varchar(255), out SLC float)
begin
select vt.vt_ma, sum(ct.sl_xuat * ct.dg_xuat) as SLC
from chi_tiet_phieu_xuat ct
join vat_tu vt on vt.vt_id = ct.vt_id
group by vt.vt_ma
having vt.vt_ma = vt_ma;
end //  
delimiter ;

call get_tong_tien_xuat('VT005', @SLC);

insert into chi_tiet_phieu_xuat
values (8,1, 5, 20,14, 'đang cần');

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.

DELIMITER //
create procedure get_tong_sl_dat
(in ddh_ma varchar(255))
begin
select ddh_ma, sum(sl_dat)
from don_dat_hang ddh 
join chi_tiet_don_hang ctdh on ctdh.ddh_id = ctdh.ddh_id
group by ddh.ddh_ma
having ddh.ddh_ma = ddh_ma;
end //
DELIMITER ;

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
DELIMITER //
create procedure get_them_ddh
(in t_ddh_ma varchar(255),
 in t_ngay_dat date,
 t_ncc_id int)
begin
insert into don_dat_hang(ddh_ma, ngay_dat,ncc_id)
values (t_ddh_ma, t_ngay_dat, t_ncc_id);
end //
DELIMITER ;

call get_them_ddh('DDH04', '2024-02-02', 3);

select * from don_dat_hang;

-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
DELIMITER //
create procedure get_them_ctdh
(in t_ddh_id int,
 in t_vt_id int,
 in t_sl_dat float)
begin
insert into chi_tiet_don_hang(ddh_id, vt_id, sl_dat)
values (t_ddh_id, t_vt_id, t_sl_dat);
end //
DELIMITER ;

call get_them_ctdh(3, 2, 11);

select * from chi_tiet_don_hang;



