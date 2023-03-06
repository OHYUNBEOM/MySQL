/* BookRentalShop 실습 */
-- 서브쿼리
SELECT b.Author AS '저자'
	-- , b.Division AS '장르'
	, (SELECT Names 
		FROM divtbl 
        WHERE Division=b.Division) AS '장르'
    , b.Names AS '제목'
    , b.ISBN
    , b.Price AS '금액'
	FROM bookstbl AS b
    ORDER BY b.Names;
    -- ORDER BY 제목;
    -- ORDER BY 3; / 1:저자 2:장르 3:제목


-- 조인(위 서브쿼리와 같은 의미) / 서브쿼리를 쓰는것에 비해 매우 빠르다.
SELECT b.Author AS '저자'
    , d.Names AS '장르'
    , b.Names AS '제목'
    , b.ISBN
    , b.Price AS '금액'
	FROM bookstbl AS b
JOIN divtbl as d -- JOIN = INNER JOIN
	ON b.Division = d.Division
	ORDER BY b.Names;



-- 서브쿼리 (속도 느리지만 쓰면 좋을 경우)
SELECT (SELECT Names
		FROM divtbl
		WHERE Division=bb.Division) AS '장르' -- 장르명을 공포/스릴러 형태로 출력하기 위해 사용
	, bb.총합
	FROM (
		SELECT b.Division
			, sum(b.Price) AS '총합'
			FROM bookstbl AS b
			GROUP BY b.Division -- 장르 별 Price 합계로 그룹핑
		) AS bb;
        
        
-- 내부조인(테이블 여러개)
SELECT m.Names AS '이름'
	, m.Addr AS '주소'
    , m.Mobile AS '연락처'
    , r.rentalDate AS '대여일자'
    , IFNULL(r.returnDate,'미반납') AS '반납일자' -- 반납일자 없는사람 --> 미반납 처리
    , b.Names AS '제목'
--    , b.Division
    , b.Price AS '금액'
    , d.Names AS '장르'
	FROM membertbl AS m
JOIN rentaltbl as r
	ON m.memberIdx = r.memberIdx -- 여기까지 JOIN하면 책 빌린 사람들만 나옴alter
JOIN bookstbl as b
	ON r.bookIdx=b.bookIdx
JOIN divtbl as d
	ON b.Division = d.Division;
    
    
-- 외부조인
SELECT m.Names AS '이름'
	, m.Addr AS '주소'
    , m.Mobile AS '연락처'
    , r.rentalIdx -- rentalIdx가 null이면 책 안빌린 사람
    , r.rentalDate AS '대여일자'
    , r.returnDate AS '반납일자'
    , b.Names AS '제목'
--    , b.Division
    , b.Price AS '금액'
    , d.Names AS '장르'
	FROM membertbl AS m
LEFT OUTER JOIN rentaltbl as r -- membertbl이 부모테이블이기에 LEFT 조인
	ON m.memberIdx = r.memberIdx -- 여기까지 JOIN하면 책 빌린 사람들만 나옴alter
LEFT OUTER JOIN bookstbl as b
	ON r.bookIdx=b.bookIdx
LEFT OUTER JOIN divtbl as d
	ON b.Division = d.Division
WHERE r.rentalIdx IS NULL; -- 책 안빌린 사람 찾기



-- 책을 두권이상 출판한 저자 출력
SELECT bb.Author
--	, bb.Division
    , bb.출판권수
    , bb.합계금액
    , d.Names AS '장르'
	FROM(
		SELECT b.Author
			, b.Division
			, COUNT(b.Author) AS '출판권수'
			, SUM(b.Price) AS '합계금액'
			FROM bookstbl AS b
			GROUP BY b.Author,b.Division
			HAVING COUNT(b.Author)>=2 -- 해당 조건에 맞는거 일단 찍어본다음에 서브쿼리로 묶어서 사용하면됨
		) AS bb
	JOIN divtbl AS d
		ON bb.Division = d.Division
		ORDER BY bb.출판권수 DESC;