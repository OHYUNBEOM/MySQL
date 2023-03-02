-- INSERT
INSERT INTO usertbl
(userID,name,birthYear,addr,mobile1,mobile2,height,mDate)
VALUES
('OYB','오윤범',1998,'부산','010','85150728',174,'2023-03-02');

-- addr 까지만 Not Null
INSERT INTO usertbl
(userID,name,birthYear,addr,mobile1,mobile2,height,mDate)
VALUES
('HGS','홍길순',2000,'한양',NULL,NULL,NULL,NULL); 

-- Not Null 아예 안넣으면 알아서 NULL로 들어감
INSERT INTO usertbl
(userID,name,birthYear,addr)
VALUES
('SHM','손흥민',1991,'서울');

 -- 컬럼 지정 생략 가능(단, 입력하는 값 순서 컬럼 순서랑 일치)
INSERT INTO usertbl VALUES
('SJM','손웅정',1969,'서울','010','11112222','176',NULL);

-- AUTO_INCREMENT의 경우 필드값 입력하지 않아도 됨(buytbl에서는 num이 AI로 설정되어있음)
INSERT INTO buytbl
(userID,prodName,groupName,price,amount) -- num 없어도 자동증가됨
VALUES
('OYB','노트북','전자',500000,1)