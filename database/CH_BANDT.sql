CREATE DATABASE CH_BANDT
GO
USE CH_BANDT
GO

CREATE TABLE DANHMUCSP
(
	MA_DM INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TEN_DN NVARCHAR(255) NOT NULL,
	TINHTRANG BIT NULL
)

CREATE TABLE SANPHAM
(
	MA_SP INT IDENTITY(1,1) PRIMARY KEY NOT NULL,			/* Mã sản phẩm */
	TEN_SP NVARCHAR (255) NOT NULL,
	GIABAN FLOAT NOT NULL,
	SOLUONG INT NOT NULL,
	NGAY_THEMSP DATE NULL,
	HINHANH_SP NVARCHAR (255) NULL,
	TINHTRANG BIT NULL,
	MA_DM INT NOT NULL,									/* Mã danh mục */
	FOREIGN KEY (MA_DM) REFERENCES DANHMUCSP
)

CREATE TABLE CHUCVU
(
	MA_CV INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TEN_CV NVARCHAR(255) NULL,
	TINHTRANG BIT NULL,		
)

CREATE TABLE NGUOIDUNG
(
	EMAIL NVARCHAR (255) PRIMARY KEY NOT NULL,
	TEN_NG NVARCHAR (255) NULL,
	MA_CV INT  NULL,
	MATKHAU CHAR (255) NULL,
	SĐT CHAR (20) NULL,
	DIACHI NVARCHAR (255),
	NGAYSINH DATE NULL,
	TINHTRANG BIT NULL,
	FOREIGN KEY (MA_CV) REFERENCES CHUCVU
)

CREATE TABLE HOADON
(
	MA_HD INT PRIMARY KEY IDENTITY(1,1) NOT NULL,		/* Mã hóa đơn */				/* Mã sản phẩm */
	NGAYMUA DATE NULL,
	TONGTIEN FLOAT NULL,
	EMAIL NVARCHAR(255) NOT NULL,
	TINHTRANG BIT NULL,
	FOREIGN KEY (EMAIL) REFERENCES NGUOIDUNG

)

CREATE TABLE CT_HOADON
(
	MA_CT INT IDENTITY(1,1) NOT NULL,
	GIA MONEY NULL,
	SOLUONG INT NULL,
	MA_HD INT  NOT NULL,
	MA_SP INT NOT NULL,
	TINHTRANG BIT NULL,
	FOREIGN KEY (MA_SP) REFERENCES SANPHAM,
	FOREIGN KEY (MA_HD) REFERENCES HOADON
)





SELECT * FROM SANPHAM
DROP TABLE SANPHAM
DROP DATABASE CH_BANDT

--------------------------DANH MỤC SP----------------------------
INSERT INTO DANHMUCSP VALUES (N'IPHONE',1)
INSERT INTO DANHMUCSP VALUES (N'MACBOOK',1)
INSERT INTO DANHMUCSP VALUES (N'TABLET',1)
INSERT INTO DANHMUCSP VALUES (N'ACCESSORY',1)
SELECT * FROM DANHMUCSP

--------------------------CHỨC VỤ---------------------------------
INSERT INTO CHUCVU VALUES (N'ADMIN',1)
INSERT INTO CHUCVU VALUES (N'USER',1)
SELECT * FROM CHUCVU

--------------------------NGƯỜI DÙNG-------------------------------------------------------------------------------------------------------------------
INSERT INTO NGUOIDUNG VALUES (N'luongvanxuong@gmail.com',N'Lương Văn Xưởng',1,N'123456',N'0938163410',N'HCM',N'2022-10-02',1)
INSERT INTO NGUOIDUNG VALUES (N'admin.com',N'Admin',1,N'123456',N'01234556',N'Nhà Bè',N'2022-12-11',1)
INSERT INTO NGUOIDUNG VALUES (N'phamvanminhnhat@gmail.com',N'Phạm Văn Minh Nhật',1,N'123456',N'0909111888',N'Đào Tống Nguyên',N'2022-12-25',1)
INSERT INTO NGUOIDUNG VALUES (N'phamvuphilong111@gmail.com',N'Phạm Vũ Phi Long',2,N'123456',N'0908123456',N'Quận 12',N'2022-03-22',1)
INSERT INTO NGUOIDUNG VALUES (N'tuitennhatdo@gmail.com',N'Nhật Độ',2,N'123456',N'090345556',N'Bình Tân',N'2022-05-24',1)
INSERT INTO NGUOIDUNG VALUES (N'xuongluong123@gmail.com',N'Xưởng',2,N'123456',N'0908123456',N'Quận 12',N'2022-03-22',1)
SELECT * FROM NGUOIDUNG

-------------------------SẢN PHẨM--------------------------------------------------------------------------------------------------------------------
INSERT INTO SANPHAM VALUES(N'IPHONE 11 PRO MAX',22000000,50,N'2021-10-20',N'https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-green-600x600.jpg',1,1)
INSERT INTO SANPHAM VALUES(N'IPHONE 11',15000000,10,N'2021-10-20',N'https://cdn.hoanghamobile.com/i/preview/Uploads/2020/09/17/apple-iphone-11-64gb-6.1.jpg',1,1)
INSERT INTO SANPHAM VALUES(N'MacBook Air 2020 MGNE3SA',50000000,15,N'2021-10-20',N'https://hc.com.vn/i/ecommerce/media/GS.007150_FEATURE_74798.jpg',1,2)
INSERT INTO SANPHAM VALUES(N'MacBook Pro 2020',65000000,9,N'2021-12-12',N'https://macone.vn/wp-content/uploads/2020/05/macbookpro2020-grey.jpeg',1,2)
INSERT INTO SANPHAM VALUES(N'Ipad Pro M1',12000000,9,N'2021-11-09',N'https://cdn.tgdd.vn/Products/Images/522/269327/ipad-pro-m1-11-inch-wifi-1tb-2021-bac-thumb-600x600.jpeg',1,3)
INSERT INTO SANPHAM VALUES(N'Ipad Mini 6 (2021)',12000000,9,N'2021-11-09',N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/09/15/image-removebg-preview-22.png',1,3)
INSERT INTO SANPHAM VALUES(N'Bàn phím Apple Magic Keyboard',12000000,9,N'2021-11-09',N'https://cdn.tgdd.vn/Products/Images/1882/209111/ban-phim-magic-keyboard-us-apple-mla22-trang-1-org.jpg',1,4)
INSERT INTO SANPHAM VALUES(N'Sạc Apple 30W',500000,99,N'2021-11-09',N'https://cdn.tgdd.vn/Products/Images/9499/184764/adapter-sac-macbook-12-inch-30w-apple-mr2a2-trang-2-1-org.jpg',1,4)
INSERT INTO SANPHAM VALUES(N'Tai nghe Bluetooth Apple Airpod 3',4600000,70,N'2021-11-09',N'https://cdn.tgdd.vn/Products/Images/54/250701/bluetooth-airpods-3-1.jpg',1,4)

INSERT INTO SANPHAM VALUES(N'IPHONE 13 PRO MAX',55000,50,N'2021-10-20',N'https://cdn.tgdd.vn/Products/Images/42/250261/iphone-13-pro-max-xanh-la-thumb-600x600.jpg',1,1)
INSERT INTO SANPHAM VALUES(N'IPHONE 13',15000,10,N'2021-10-20',N'https://cdn.hoanghamobile.com/i/preview/Uploads/2021/09/15/image-removebg-preview-12.png',1,1)
INSERT INTO SANPHAM VALUES(N'MacBook Pro 2021',65000000,9,N'2021-12-12',N'https://macone.vn/wp-content/uploads/2021/10/macbook-pro-16-inch-2021-gray-1024x853.png',1,2)
INSERT INTO SANPHAM VALUES(N'MacBook Pro 16 M1',50000000,15,N'2021-10-20',N'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/10/19/637702682508615222_macbook-pro-16-2021-xam-1.jpg',1,2)
INSERT INTO SANPHAM VALUES(N'Ipad Mini 6',12000000,9,N'2021-11-09',N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/09/15/image-removebg-preview-24.png',1,3)
INSERT INTO SANPHAM VALUES(N'Ipad 10.2 2021',12000000,9,N'2021-11-09',N'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/15/637673418591737699_ipad-10-2-2021-wi-fi-xam-1.jpg',1,3)
INSERT INTO SANPHAM VALUES(N'Apple Watch Series 6 44mm',12000000,9,N'2021-11-09',N'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(wh...-1.jpg',1,4)
INSERT INTO SANPHAM VALUES(N'Apple Watch SE 44mm',500000,99,N'2021-11-09',N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/01/12/se-gray.png',1,4)
INSERT INTO SANPHAM VALUES(N'Apple Watch Series 7 44mm',4600000,70,N'2021-11-09',N'https://24hstore.vn/images/products/2021/10/14/large/apple-watch-series-7-starlight-41mm-gps.jpg',1,4)
SELECT * FROM SANPHAM

-----------------------------HÓA ĐƠN---------------------------------------------------------------------------------------------------------------
INSERT INTO HOADON VALUES(N'2022-01-13',22000000,N'xuongluong123@gmail.com',1)
INSERT INTO HOADON VALUES(N'2022-01-14',60000000,N'xuongluong123@gmail.com',1)
INSERT INTO HOADON VALUES(N'2021-12-21',100000000,N'tuitennhatdo@gmail.com',1)
INSERT INTO HOADON VALUES(N'2021-12-21',1000000,N'tuitennhatdo@gmail.com',1)
INSERT INTO HOADON VALUES(N'2021-10-02',5000000,N'phamvuphilong111@gmail.com',1)
SELECT * FROM HOADON

------------------------------CHI TIẾT HÓA ĐƠN-----------------------------------------------------------------------------------------------------
INSERT INTO CT_HOADON VALUES(22000,1,1,1,1)
INSERT INTO CT_HOADON VALUES(2000,2,3,2,1)
INSERT INTO CT_HOADON VALUES(22000,1,1,2,1)
INSERT INTO CT_HOADON VALUES(80000,5,4,5,1)

SELECT * FROM CT_HOADON