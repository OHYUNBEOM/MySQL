/* OUTER JOIN */
-- std table
CREATE TABLE stdtbl(
	stdName NVARCHAR(10) NOT NULL PRIMARY KEY -- Join 시에 Column 타입 안맞추면 오류 발생
    , addr CHAR(4) NOT NULL
);

CREATE TABLE clubtbl(
	clubname NVARCHAR(10) NOT NULL PRIMARY KEY -- Join 시에 Column 타입 안맞추면 오류 발생
    , roomNo NCHAR(4) NOT NULL
);

CREATE TABLE stdclubtbl(
	num int AUTO_INCREMENT NOT NULL PRIMARY KEY
    , stdName NVARCHAR(10) NOT NULL -- Join 시에 Column 타입 안맞추면 오류 발생
    , clubName NVARCHAR(10) NOT NULL 
	, FOREIGN KEY(stdName) REFERENCES stdtbl(stdName) -- 외래키로 stdName을 잡았기에 stdName에 있는 값만 갖고놀 수 있음
    , FOREIGN KEY(clubName) REFERENCES clubtbl(clubName) -- clubName도 동일
);