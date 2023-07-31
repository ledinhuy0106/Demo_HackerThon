create database HN_JV221024_HKT06_UyLe;
use HN_JV221024_HKT06_UyLe;
CREATE TABLE DmKhoa (
    Makhoa VARCHAR(20) PRIMARY KEY,
    TenKhoa VARCHAR(255)
);

CREATE TABLE DmNganh (
    MaNganh INT PRIMARY KEY,
    TenNganh VARCHAR(255),
    MaKhoa VARCHAR(20),
    FOREIGN KEY (MaKhoa)
        REFERENCES DmKhoa (Makhoa)
);

CREATE TABLE DmHocPhan (
    MaHP INT PRIMARY KEY,
    TenHP VARCHAR(255),
    SOdvht INT,
    MaNganh INT,
    HocKy INT,
    FOREIGN KEY (MaNganh)
        REFERENCES DmNganh (MaNganh)
);

CREATE TABLE DmLop (
    MaLop VARCHAR(20) PRIMARY KEY,
    TenLop VARCHAR(255),
    MaNganh INT,
    KhoaHoc INT,
    HeDt VARCHAR(255),
    NamNhapHoc INT,
    FOREIGN KEY (MaNganh)
        REFERENCES DmNganh (MaNganh)
);

CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    HoTen VARCHAR(255),
    MaLop VARCHAR(20),
    GioiTinh TINYINT(1),
    NgaySinh DATE,
    DiaChi VARCHAR(255),
    FOREIGN KEY (MaLop)
        REFERENCES DmLop (MaLop)
);

CREATE TABLE DiemHp (
    MaSV INT,
    MaHP INT,
    DiemHP DECIMAL(4 , 2 ),
    PRIMARY KEY (MaSV , MaHP),
    FOREIGN KEY (MaSV)
        REFERENCES SinhVien (MaSV),
    FOREIGN KEY (MaHP)
        REFERENCES DmHocPhan (MaHP)
);
