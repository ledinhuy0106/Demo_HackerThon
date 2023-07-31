INSERT INTO DmKhoa (Makhoa, TenKhoa)
VALUES
    ('CNTT', 'Công nghệ thông tin'),
    ('KT', 'Kế Toán'),
    ('SP', 'Sư Phạm');


INSERT INTO DmNganh (MaNganh, TenNganh, MaKhoa)
VALUES
(140902, 'Sư phạm toán tin ', 'SP'),
(480202, 'Tin học ứng dụng', 'CNTT');


INSERT INTO DmHocPhan (MaHP, TenHP, SOdvht, MaNganh, HocKy)
VALUES
(1, 'Toán cao cấp A1', 4, 480202, 1),
       (2, 'Tiếng anh 1', 3, 480202, 1),
       (3, 'Vật lý đại cương', 4, 480202, 1),
       (4, 'Tiếng anh 2', 7, 480202, 1),
       (5, 'Tiếng anh 1', 3, 140902, 2),
       (6, 'Xác Xuất thống kê', 3, 480202, 2);
    
    INSERT INTO DmLop (MaLop, TenLop, MaNganh, KhoaHoc, HeDt, NamNhapHoc)
VALUES
    ('CT11', 'Cao đẳng tin học', 480202, 11, 'TC', 2013),
       ('CT12', 'Cao đẳng tin học', 480202, 12, 'CĐ', 2013),
       ('CT13', 'Cao đẳng tin học', 480202, 13, 'TC', 2014);


INSERT INTO SinhVien (MaSV, HoTen, MaLop, GioiTinh, NgaySinh, DiaChi)
VALUES
(1, 'Phan Thanh', 'CT12', 0, '1990-09-12', 'Tuy Phước'),
       (2, 'Nguyễn Thi Cấm', 'CT12', 1, '1994-01-12', 'Quy Nhơn'),
       (3, 'võ Thị Hà', 'CT12', 1, '1995-07-02', 'An Nhơn'),
       (4, 'Trần Hoài Nam', 'CT12', 0, '1994-04-05', 'Tây Sơn'),
       (5, 'Tran Văn Hoàng', 'CT13', 0, '1995-08-04', 'Vĩnh Thạch'),
       (6, 'Đặng Thị Thảo', 'CT13', 1, '1995-06-12', 'Quy Nhơn'),
       (7, 'Lê Thị Sen', 'CT13', 1, '1994-08-12', 'Phù mỹ'),
       (8, 'Nguyễn Van Huy', 'CT11', 0, '1995-06-04', 'Tuy Phước'),
       (9, 'Trần Thị Hoa', 'CT11', 1, '1994-08-09', 'Hoài  Nhơn');
    
INSERT INTO DiemHp (MaSV, MaHP, DiemHP)
VALUES
       (2, 2, 5.9),
       (2, 3, 4.5),
       (3, 1, 4.3),
       (3, 2, 6.7),
       (3, 3, 7.3),
       (4, 1, 4),
       (4, 2, 5.2),
       (4, 3, 3.5),
       (5, 1, 9.8),
       (5, 2, 7.9),
       (5, 3, 7.5),
       (6, 1, 6.1),
       (6, 2, 5.6),
       (6, 3, 4),
       (7, 1, 6.2);


