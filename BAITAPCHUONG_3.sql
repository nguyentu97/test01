
--------------------------------------------------BAI TAP CHUONG 3-------------------------------------------------

--Bai 3.2)

CREATE DATABASE QLHANGHOA;
--
CREATE TABLE HANG
( MaH char(10) not Null primary key,
TenH varchar(30),
SLTon int);
--
CREATE TABLE KHACH
(MaK char(10) not Null primary key ,
TenK varchar(30),
DiaChi char(10));
--
CREATE TABLE HOADON
(SoHD char(10) not Null primary key,
NgayHD date ,
MaK char(10)
FOREIGN KEY (MaK) REFERENCES KHACH(MaK));
--
CREATE TABLE CHITIETHD
(SoHD char(10) not Null,
MaH char(10)not Null,
SLBan int,
DGia int ,
PRIMARY KEY(SoHD,MaH),
FOREIGN KEY (SoHD) REFERENCES HOADON(SoHD));
--
INSERT INTO HANG VALUES ('M1','H1',3),('M2','H2',7),('M3','H3',1);
--
INSERT INTO KHACH VALUES('K1','A','HN'),('K2','B','HP'),('K3','C','QN');
--
INSERT INTO HOADON VALUES('HD1','1/1/2013','K1'),('HD2','3/5/2016','K2'),('HD3','5/3/2016','K3');
--
INSERT INTO CHITIETHD VALUES('HD1','M1',4,100),('HD2','M2',2,200),('HD3','M3',3,400);
--
DROP TABLE CHITIETHD;

--1)Đưa ra danh sách địa chỉ của các khách hàng

SELECT TenK ,DiaChi 
FROM KHACH;

--2)Đưa ra tên hàng và số lượng tồn của những mặt hàng

SELECT TenH ,SLTon 
FROM HANG;

--3)Đưa ra thông tin của các mặt hàng có số lượng tồn >5.

SELECT TenH ,SLTon 
FROM HANG 
WHERE SLTon>5;

--4)Đưa ra các thông tin khách hàng có địa chỉ ở Hà Nội
SELECT TenK ,DiaChi 
FROM KHACH 
WHERE DiaChi='HN';

--5)Đưa ra tên khách hàng mua hàng ngày 1/1/2013

SELECT KHACH.* FROM KHACH , HOADON 
WHERE (DAY(NgayHD)=1)and(MONTH(NgayHD)=1)and(YEAR(NgayHD)=2013) and (HOADON.MaK=KHACH.MaK);

--6)Đưa ra Mã hàng, Tên hàng có đơn giá bán >200,000

SELECT HANG.MaH,TenH 
FROM HANG,CHITIETHD 
WHERE DGia>200 and(CHITIETHD.MaH=HANG.MaH);

--7)Đưa ra tên khách hàng ở Hải Phòng mua hàng ngày 2/2/2013
SELECT KHACH.TenK,DiaChi 
FROM KHACH , HOADON 
WHERE DiaChi='HP'and(DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) and (HOADON.MaK=KHACH.MaK);

--8)Đưa ra tên hàng được bán trong ngày 2/2/2013
SELECT HANG.TenH 
FROM HANG, HOADON 
WHERE() (DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) ;

--9)Đưa ra các mã hàng chưa từng được bán

SELECT MaH from HANG WHERE HANG.MaH Not in (SELECT CHITIETHD.MaH FROM CHITIETHD) 

--10)Đưa ra các mã khách chưa từng mua hàng từ ngày 12/12/2012.

SELECT KHACH.MaK 
FROM KHACH , HOADON 
WHERE (DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) and (HOADON.MaK=KHACH.MaK);
                                             
                                             ---------------------------------------