drop database if exists quan_ly_vat_tu;
create database if not exists quan_ly_vat_tu;
use quan_ly_vat_tu;

CREATE TABLE phieu_xuat (
    so_px INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATETIME
);

CREATE TABLE vat_tu (
    ma_vtu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vtu VARCHAR(100)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_px INT,
    ma_vtu INT,
    dg_xuat FLOAT CHECK (dg_xuat > 0),
    sl_xuat INT CHECK (sl_xuat > 0),
    PRIMARY KEY (so_px , ma_vtu),
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu)
);

CREATE TABLE phieu_nhap (
    so_pn INT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    ma_vtu INT,
    so_pn INT,
    dg_nhap FLOAT CHECK (dg_nhap > 0),
    sl_nhap INT CHECK (sl_nhap > 0),
    PRIMARY KEY (ma_vtu , so_pn),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn)
);
CREATE TABLE so_dien_thoai (
    ma_sdt INT PRIMARY KEY,
    sdt VARCHAR(10)
);

CREATE TABLE nhacc (
    ma_ncc INT PRIMARY KEY AUTO_INCREMENT,
    ten_ncc VARCHAR(100),
    dia_chi VARCHAR(100),
    ma_sdt INT,
    FOREIGN KEY (ma_sdt)
        REFERENCES so_dien_thoai (ma_sdt)
);

CREATE TABLE don_dh (
    so_dh INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dh DATE,
    ma_ncc INT,
    FOREIGN KEY (ma_ncc)
        REFERENCES nhacc (ma_ncc)
);

CREATE TABLE chi_tiet_dat_hang (
    ma_vtu INT,
    so_dh INT,
    PRIMARY KEY (ma_vtu , so_dh),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    FOREIGN KEY (so_dh)
        REFERENCES don_dh (so_dh)
);
