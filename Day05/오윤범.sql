USE bookrentalshop;

-- 1번 문제
SELECT 
	CONCAT(LEFT(m.Names,1),',',RIGHT(m.Names,2)) AS '회원명'
	, SUBSTRING_INDEX(m.Addr,' ',-1) AS '주소'
    , m.Mobile AS '폰번호'
    , UPPER(m.email) AS '이메일'
  FROM membertbl AS m
  ORDER BY 이메일 DESC;




-- 2번 문제
SELECT d.Names AS '장르'
	, b.Author AS '작가'
    , b.Names AS '책제목'
	FROM bookstbl AS b
JOIN divtbl as d
	ON b.Division = d.Division
    ORDER BY 장르,작가;



-- 3번 문제
INSERT INTO divtbl
(Division,Names)
VALUES
('I002','네트워크');


-- 4번 문제
UPDATE membertbl 
	SET membertbl.Levels = 'D'
		, membertbl.Mobile='010-9839-9999'
	WHERE membertbl.Names='성명건';


-- 5번 문제

SELECT IFNULL(d.Names, '--합계--') AS '장르' -- divtbl의 장르명
	, CONCAT(FORMAT(sum(b.Price),'0,000'),'원') AS 'total'
	FROM bookstbl AS b
	JOIN divtbl AS d
		ON b.Division = d.Division
	GROUP BY d.Names -- 장르 별 Price 합계로 그룹핑
	WITH ROLLUP