create database case_study_furama;
use case_study_furama;

create table nhan_vien(
ma_nhan_vien int auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45) unique,
luong double,
so_dien_thoai varchar(45) unique,
email varchar(45) unique,
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
primary key(ma_nhan_vien));

create table vi_tri(
ma_vi_tri int auto_increment,
ten_vi_tri varchar(45),
primary key(ma_vi_tri));

create table trinh_do(
ma_trinh_do int auto_increment,
ten_trinh_do varchar(45),
primary key(ma_trinh_do));

create table bo_phan(
ma_bo_phan int auto_increment,
ten_bo_phan varchar(45),
primary key(ma_bo_phan));

create table khach_hang(
ma_khach_hang int auto_increment,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45) unique,
so_dien_thoai varchar(45) unique,
email varchar(45) unique,
dia_chi varchar(45),
primary key(ma_khach_hang));

create table loai_khach(
ma_loai_khach int auto_increment,
ten_loai_khach varchar(45),
primary key(ma_loai_khach));

create table hop_dong(
ma_hop_dong int auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
primary key(ma_hop_dong));

create table dich_vu(
ma_dich_vu int auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text,
primary key(ma_dich_vu));

create table kieu_thue(
ma_kieu_thue int auto_increment,
ten_kieu_thue varchar(45),
primary key(ma_kieu_thue));

create table hop_dong_chi_tiet(
hop_dong_chi_tiet int auto_increment,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
primary key(hop_dong_chi_tiet));

create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(45),
trang_thai varchar(45),
primary key(ma_dich_vu_di_kem));

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment,
ten_loai_dich_vu varchar(45),
primary key(ma_loai_dich_vu));


