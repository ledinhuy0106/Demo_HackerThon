
-- 1. Danh sách sinh viên có điểm HP >= 5
SELECT sv.MaSV, sv.HoTen, sv.MaLop, dh.DiemHP, dh.MaHP
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
JOIN DmHocPhan hp ON dh.MaHP = hp.MaHP
WHERE dh.DiemHP >= 5
order by sv.MaSV;

-- 2. Danh sách sinh viên được sắp xếp theo MaLop, HoTen
SELECT sv.MaSV, sv.HoTen, sv.MaLop, dh.DiemHP, dh.MaHP
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
ORDER BY sv.MaLop;

-- 3. Danh sách sinh viên có DiemHP từ 5 đến 7 ở học kỳ I
SELECT sv.MaSV, sv.HoTen, sv.MaLop, dh.DiemHP, hp.HocKy
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
JOIN DmHocPhan hp ON dh.MaHP = hp.MaHP
WHERE dh.DiemHP BETWEEN 5 AND 7 AND hp.HocKy = 1;

-- 4. Danh sách sinh viên của Khoa có mã CNTT
SELECT sv.MaSV, sv.HoTen, sv.MaLop, nganh.MaKhoa
FROM SinhVien sv
JOIN DmLop lop ON sv.MaLop = lop.MaLop
JOIN DmNganh nganh ON lop.MaNganh = nganh.MaNganh
JOIN DmKhoa khoa ON nganh.MaKhoa = khoa.Makhoa
WHERE khoa.Makhoa = 'CNTT';

-- 5. Tổng số sinh viên của mỗi lớp
SELECT lop.MaLop, lop.TenLop, COUNT(sv.MaSV) AS SiSo
FROM DmLop lop
LEFT JOIN SinhVien sv ON lop.MaLop = sv.MaLop
GROUP BY lop.MaLop, lop.TenLop;

-- 6. Điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ
SELECT hp.HocKy, sv.MaSV, sv.HoTen,  SUM(dh.DiemHP * hp.SOdvht) / SUM(hp.SOdvht) AS DiemTBC
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
JOIN DmHocPhan hp ON dh.MaHP = hp.MaHP
GROUP BY sv.MaSV, sv.HoTen, hp.HocKy;

-- 7. Số lượng nam nữ theo từng lớp
SELECT lop.MaLop, lop.TenLop,
    SUM(CASE WHEN sv.GioiTinh = 1 THEN 1 ELSE 0 END) AS SoNam,
    SUM(CASE WHEN sv.GioiTinh = 0 THEN 1 ELSE 0 END) AS SoNu
FROM DmLop lop
LEFT JOIN SinhVien sv ON lop.MaLop = sv.MaLop
GROUP BY lop.MaLop, lop.TenLop;

-- 8. Điểm trung bình chung của mỗi sinh viên ở học kỳ 1
SELECT sv.MaSV, sv.HoTen,
    SUM(dh.DiemHP * hp.SOdvht) / SUM(hp.SOdvht) AS DiemTBC_HK1
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
JOIN DmHocPhan hp ON dh.MaHP = hp.MaHP
WHERE hp.HocKy = 1
GROUP BY sv.MaSV, sv.HoTen;

-- 9. Số học phần thiếu điểm (DiemHP < 5) của mỗi sinh viên
SELECT sv.MaSV, sv.HoTen, COUNT(*) AS SoHocPhanThieuDiem
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
WHERE dh.DiemHP < 5
GROUP BY sv.MaSV, sv.HoTen;

-- 10. Số sinh viên có điểm HP < 5 của mỗi học phần
SELECT dh.MaHP, COUNT(sv.MaSV) AS SoSinhVienThieuDiem
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
WHERE dh.DiemHP < 5
GROUP BY dh.MaHP;

-- 11. Tổng số đơn vị học trình có điểm HP < 5 của mỗi sinh viên
SELECT sv.MaSV, sv.HoTen, SUM(hp.SOdvht) AS TongDvhtThieuDiem
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
JOIN DmHocPhan hp ON dh.MaHP = hp.MaHP
WHERE dh.DiemHP < 5
GROUP BY sv.MaSV, sv.HoTen
order by sv.MaSv;

-- 12. MaLop, TenLop có tổng số sinh viên > 2
SELECT lop.MaLop, lop.TenLop, Count(*) as siso
FROM DmLop lop
LEFT JOIN SinhVien sv ON lop.MaLop = sv.MaLop
GROUP BY lop.MaLop, lop.TenLop
HAVING COUNT(sv.MaSV) > 2;

-- 13. HoTen sinh viên có ít nhất 2 học phần có điểm < 5
SELECT sv.MaSv,sv.HoTen,  count(*)  as SoLuong
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
WHERE dh.DiemHP < 5
GROUP BY sv.HoTen, sv.MaSv
HAVING COUNT(DISTINCT dh.MaHP) >= 2;

-- 14. HoTen sinh viên học ít nhất 3 học phần mã 1,2,3
SELECT sv.HoTen, count(*) as SoLuong
FROM SinhVien sv
JOIN DiemHp dh ON sv.MaSV = dh.MaSV
WHERE dh.MaHP IN (1, 2, 3)
GROUP BY sv.HoTen
HAVING COUNT(DISTINCT dh.MaHP) >= 3;
