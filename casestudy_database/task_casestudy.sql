USE case_study_furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên 
-- bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    ((ho_ten LIKE 'H%') OR (ho_ten LIKE 'T%')
        OR (ho_ten LIKE 'K%'))
        AND CHAR_LENGTH(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
--  và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT 
    *
FROM
    khach_hang
WHERE
    (YEAR(CURRENT_TIMESTAMP) - YEAR(ngay_sinh) BETWEEN 18 AND 50)
        AND (dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(hd.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY hd.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. 
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (IFNULL(dv.chi_phi_thue, 0) + IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0)) AS tong_tien
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
ORDER BY kh.ma_khach_hang;
   
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3). 
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        RIGHT JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 1)
                AND YEAR(hd.ngay_lam_hop_dong) = '2021')
GROUP BY ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        RIGHT JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = '2020')
        AND dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = '2021')
GROUP BY ma_dich_vu;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;

SELECT DISTINCT
    ho_ten
FROM
    khach_hang;
    
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;
    
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(ngay_lam_hop_dong) AS `month`, COUNT(ma_khach_hang)
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = '2021'
GROUP BY `month`
ORDER BY `month`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
--  có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dvdk.*
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi')
GROUP BY dvdk.ten_dich_vu_di_kem;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        LEFT JOIN
    nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
        LEFT JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE
    dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            hd.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31')
        AND dv.ma_dich_vu NOT IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
        WHERE
            hd.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-06-30')
GROUP BY hd.ma_hop_dong;
  
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 
    dvdk.*, SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem >= ALL (SELECT 
        SUM(hdct.so_luong)
    FROM
        dich_vu_di_kem dvdk
            JOIN
        hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem);
  
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
--  (được tính dựa trên việc count các ma_dich_vu_di_kem). 
SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        RIGHT JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING so_lan_su_dung = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới
--  chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. 
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
FROM
    nhan_vien nv
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
        JOIN
    trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
        JOIN
    hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
WHERE hd.ngay_lam_hop_dong BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) <= 3;  
  
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        *
    FROM
        (SELECT 
            hd.ma_nhan_vien
        FROM
            nhan_vien nv
        LEFT JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
        GROUP BY hd.ma_nhan_vien
        HAVING COUNT(hd.ma_nhan_vien) >= 1) AS xoa_nhan_vien);
  
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. 
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).  
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    dv.chi_phi_thue + IFNULL(SUM(hdct.so_luong * dvdk.gia), 0) AS tong_tien
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong
ORDER BY kh.ma_khach_hang;  

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_loai_khach = 2
        AND ma_khach_hang IN (SELECT 
            *
        FROM
            (SELECT 
                kh.ma_khach_hang
            FROM
                khach_hang kh
            JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
            JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2021
            GROUP BY hd.ma_hop_dong
            HAVING SUM((hdct.so_luong * dvdk.gia) + dv.chi_phi_thue) > 10000000) AS update_khach_hang);
            
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        *
    FROM
        (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
        LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        WHERE
            YEAR(hd.ngay_lam_hop_dong) < 2021) xoa_khach_hang);
            
SET SQL_SAFE_UPDATES = 0; 


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ten_dich_vu_di_kem = (SELECT 
            *
        FROM
            (SELECT 
                dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
            FROM
                dich_vu_di_kem dvdk
            RIGHT JOIN hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            RIGHT JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2020
            GROUP BY dvdk.ma_dich_vu_di_kem
            HAVING SUM(hdct.so_luong) > 10) cap_nhat_gia);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION ALL SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” -> "Yên Bái"
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.-> "25/04/2021"
CREATE VIEW v_nhan_vien AS
    SELECT 
        *
    FROM
        nhan_vien
    WHERE
        dia_chi LIKE '%Yên Bái%'
            AND ma_nhan_vien IN (SELECT 
                nv.ma_nhan_vien
            FROM
                nhan_vien nv
                    LEFT JOIN
                hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
            WHERE
                hd.ngay_lam_hop_dong = '2021-04-25'
            GROUP BY hd.ma_nhan_vien
            HAVING COUNT(hd.ma_nhan_vien) >= 1);

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE v_nhan_vien 
SET 
    dia_chi = 'Liên Chiểu';
       
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(IN p_ma_khach_hang INT)
BEGIN
DELETE FROM
	khach_hang 
    WHERE 
	ma_khach_hang = p_ma_khach_hang;
END //
DELIMITER ;
CALL sp_xoa_khach_hang(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(IN p_ngay_lam_hop_dong DATE, p_ngay_ket_thuc DATE, p_tien_dat_coc DOUBLE, p_ma_nhan_vien INT, p_ma_khach_hang INT, p_ma_dich_vu INT)
BEGIN
INSERT INTO 
	hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
SELECT
	p_ngay_lam_hop_dong, p_ngay_ket_thuc, p_tien_dat_coc, p_ma_nhan_vien, p_ma_khach_hang, p_ma_dich_vu
FROM 
	hop_dong
WHERE EXISTS (
SELECT 
	hd.ma_nhan_vien, hd.ma_khach_hang, hd.ma_dich_vu 
FROM 
	hop_dong hd 
    RIGHT JOIN 
    nhan_vien nv 
    ON nv.ma_nhan_vien = hd.ma_nhan_vien
	RIGHT JOIN khach_hang kh 
    ON kh.ma_khach_hang = hd.ma_khach_hang
	RIGHT JOIN dich_vu dv 
    ON dv.ma_dich_vu = hd.ma_dich_vu 
    WHERE hd.ma_nhan_vien IN (1,2,3,4,5,6,7,8,9,10) 
    AND hd.ma_khach_hang IN (1,2,3,4,5,6,7,8,9,10) 
    AND hd.ma_dich_vu IN (1,2,3,4,5,6))
LIMIT 1;
END //
DELIMITER ;
CALL sp_them_moi_hop_dong('2022-10-22','2022-10-24',2000000, 5,6,4);

delete from hop_dong WHERE ma_hop_dong>10;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong 
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
insert into `history`(tong_record_con_lai, delete_day) 
SELECT count(hop_dong.ma_hop_dong), now()
FROM hop_dong;
END //
DELIMITER ;

select * from history;
select * from hop_dong;
DELETE FROM hop_dong WHERE ma_hop_dong = 3;
drop TRIGGER tr_xoa_hop_dong;

-- tạo bảng để ghi log
create table `history`(
id int auto_increment primary key,
tong_record_con_lai int,
update_day date
);

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
--  với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật,
--  nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
DELIMITER //
CREATE TRIGGER tr_cap_nhat_hop_dong 
BEFORE UPDATE ON hop_dong
FOR EACH ROW
BEGIN
declare ngay_cap_nhat date
if (datediff(ngay_cap_nhat, ngay_lam_hop_dong) > 2),
update hop_dong
set ngay_ket_thuc = ngay_cap_nhat,
insert into `history`(tong_hop_dong, update_day) 
SELECT count(hop_dong.ma_hop_dong), now()
FROM hop_dong;
END //
DELIMITER ;