-- Active: 1677474333744@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus; 

-- 문장 종료 --> ; 
SELECT * FROM employees.titles;

-- sqldb를 사용
USE sqldb;

-- 조건절 검색
SELECT userID
	, name
    , birthYear
    , height 
	FROM usertbl 
	WHERE name='김경호';

-- 관계 연산자
SELECT *
	FROM USERTBL
 WHERE birthYear>=1970
AND height >= 182; 

-- 사이 값 조회
SELECT *
  FROM usertbl
	WHERE height>=180
	AND height<=183;
    
-- BETWEEN 사용
SELECT *
  FROM usertbl
	WHERE height BETWEEN 180 AND 183;

-- IN 연산자
SELECT *
	FROM usertbl
	WHERE addr='경남' 
		or addr='경북' 
        or addr='전남';

SELECT *
	FROM usertbl
	WHERE addr IN ('경남','경북','전남');
    
-- 문자열 검색
SELECT * 
	FROM usertbl
    WHERE name LIKE '김__';

SELECT * 
	FROM usertbl
    WHERE name not LIKE '%김%';
    
-- Subquery(서브쿼리) 사용위치
-- 1. 컬럼위치
-- 2. 테이블위치
-- 3. 조건절위치 
-- WHERE절에 서브쿼리 컬럼이 한개 이상이거나 결과가 한개 이상이면
-- 조건 연산자로 조회 불가능 -> IN 사용하면 조회 가능
SELECT name
	, height
    FROM usertbl
    WHERE height IN (SELECT height FROM usertbl WHERE name LIKE '김%');


-- 가상 테이블
SELECT u.userID
	, u.name
	, (2023-u.birthYear) AS '나이' -- AS 나이 안해주면 컬럼명이 2023-u.birthYear 그대로나옴
	FROM(
		SELECT userID,name,birthYear,addr
		FROM usertbl
        ) AS u
	WHERE u.birthYear>1969;
    
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID AS '아이디'
	, (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름' -- WHERE문 공유하는 userID (외래키느낌) 뽑아옴 
	, b.prodName
    , b.price * b.amount AS '판매액'
	FROM buytbl AS b;

-- 정렬 Order BY
SELECT name
	, birthYear
	, height
	FROM usertbl
	WHERE birthYear>1069 
	ORDER BY height DESC; -- Default : ASC , 2개 작성 가능한데 첫번째 정렬이 기준
    
-- 중복제거 / 중복제거할 칼럼만
SELECT DISTINCT addr
	FROM usertbl;

-- LIMIT 갯수 제한
USE homeplus;

SELECT * FROM membertbl
	LIMIT 3;
    
USE sqldb;
-- 조회하면서 새로운 테이블 생성
-- PK/FK 제약조건은 복사 안됨
-- 일부 컬럼(열)만 복사하여 테이블 생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
	, prodName
    , price
    FROM buytbl
    WHERE groupName='전자';