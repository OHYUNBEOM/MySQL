CREATE DATABASE tabledb;
USE tabledb;

CREATE TABLE usertbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INt NOT NULL,
    addr VARCHAR(10)
);

CREATE TABLE buytbl(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    price INT,
    FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

-- 실무에 가장 근접한 PK방법 / PRIMARY KEY
-- 기본 키 두개 지정 
CREATE TABLE prodtbl(
	prodCode CHAR(3) NOT NULL,
    prodID CHAR(4) NOT NULL,
    prodDate DATETIME NOT NULL,
    prodCur VARCHAR(10) NULL,
    CONSTRAINT PK_prodtbl_prodCode_prodID
		PRIMARY KEY(prodCode,prodID) -- 핵심
);

-- 제약조건
-- UNIQUE
CREATE TABLE membertbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(50) NULL UNIQUE -- 유니크 제약조건 : 유니크 설정 시 중복되는 컬럼 값 삽입 불가능
);

-- CHECK
CREATE TABLE stdtbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10),
    grade INT CHECK (grade>=1 AND grade <=4), -- 1~4학년 까지만
    CONSTRAINT CK_name CHECK (name IS NOT NULL) -- NOT NULL과 동일 
);

