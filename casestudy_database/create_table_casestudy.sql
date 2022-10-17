CREATE DATABASE case_study_furama;
USE case_study_furama;

CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45),
    PRIMARY KEY (ma_vi_tri)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45),
    PRIMARY KEY (ma_bo_phan)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45),
    PRIMARY KEY (ma_trinh_do)
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) UNIQUE NOT NULL,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    PRIMARY KEY (ma_nhan_vien),
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45),
    PRIMARY KEY (ma_loai_khach)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) UNIQUE NOT NULL,
    so_dien_thoai VARCHAR(45) UNIQUE NOT NULL,
    email VARCHAR(45) UNIQUE,
    dia_chi VARCHAR(45),
    ma_loai_khach INT,
    PRIMARY KEY (ma_khach_hang),
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45),
    PRIMARY KEY (ma_loai_dich_vu)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45),
    PRIMARY KEY (ma_kieu_thue)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    PRIMARY KEY (ma_dich_vu),
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(45) NOT NULL,
    trang_thai VARCHAR(45),
    PRIMARY KEY (ma_dich_vu_di_kem)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT,
    ngay_lam_hop_dong DATE NOT NULL,
    ngay_ket_thuc DATE NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    hop_dong_chi_tiet INT AUTO_INCREMENT,
    so_luong INT NOT NULL,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    PRIMARY KEY (hop_dong_chi_tiet),
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);













