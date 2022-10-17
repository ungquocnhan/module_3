create database tranfer_erd_to_relational;
use tranfer_erd_to_relational;

CREATE TABLE phieu_xuat (
    so_px INT AUTO_INCREMENT PRIMARY KEY,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE vat_tu (
    ma_vtu varchar(30) PRIMARY KEY,
    ten_vtu VARCHAR(50)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_px INT,
    ma_vtu VARCHAR(30),
    don_gia_xuat FLOAT,
    so_luong_xuat INT,
    PRIMARY KEY (so_px , ma_vtu),
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu)
);

CREATE TABLE phieu_nhap (
    so_pn INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    ma_vtu VARCHAR(30),
    so_pn INT,
    don_gia_nhap FLOAT,
    so_luong_nhap INT,
    PRIMARY KEY (ma_vtu , so_pn),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn)
);

CREATE TABLE don_dat_hang (
    so_dh INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dh DATE,
    ma_ncc VARCHAR(30),
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc)
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_vtu VARCHAR(30),
    so_dh INT,
    PRIMARY KEY (ma_vtu , so_dh),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    FOREIGN KEY (so_dh)
        REFERENCES don_dat_hang (so_dh)
);

CREATE TABLE nha_cung_cap (
    ma_ncc VARCHAR(30) PRIMARY KEY,
    ten_ncc VARCHAR(30),
    dia_chi VARCHAR(30)
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(20) PRIMARY KEY,
    ma_ncc VARCHAR(30),
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cung_cap (ma_ncc)
);