-- 피벗
CREATE TABLE pivotTest
(
	uname CHAR(3),
    season CHAR(2),
    amount INT
);

INSERT INTO sqldb.pivottest
(uname, season, amount)
VALUES
('김범수', '겨울', 10), ('윤종신', '여름', 15), ('김범수', '가을', 25), 
('김범수', '봄', 3), ('김범수', '봄', 37), ('윤종신', '겨울', 40), 
('김범수', '여름', 14), ('김범수', '겨울', 22), ('윤종신', '여름', 64);

-- 피벗기능
SELECT uName
	, sum(if(season='봄',amount,0)) as '봄'
    , sum(if(season='여름',amount,0)) as '여름'
    , sum(if(season='가을',amount,0)) as '가을'
    , sum(if(season='겨울',amount,0)) as '겨울'
    , sum(amount) as '합계'
    FROM pivottest
    GROUP BY uName
    