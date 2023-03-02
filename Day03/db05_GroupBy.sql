-- 집계함수 사용 그룹핑
USE sqldb;
-- GROUP BY에 작성된 컬럼명만 SELECT 자리에 쓸 수 있음 / Column은 사용불가하지만 sum과 같은 함수는 사용가능
SELECT userID as '아이디'
	, sum(amount) as '구매개수'
	FROM buytbl
    GROUP BY userID;
    
SELECT userID as '아이디'
	, avg(amount) as '평균구매개수'
	FROM buytbl
    GROUP BY userID;

-- HAVING
SELECT userID
	, sum(price*amount) as '비용' -- 다음과 같이 집계함수를 통해 만들어진 '비용' WHERE 사용 불가/ 아래 HAVING 써야함
	FROM buytbl
    GROUP BY userID
    HAVING 비용 >= 1000; -- 집계함수등의 결과값을 조건으로 필터링하기위함. WHERE같은 역할
    
-- Rollup
SELECT userID
	, sum(price*amount) as '비용' 
	FROM buytbl
    GROUP BY userID
    WITH ROLLUP; -- 총합 또는 중간합계 필요한 경우 사용, Group By와 함께 사용하면 분류 별 합계 및 그 총합 구해짐 