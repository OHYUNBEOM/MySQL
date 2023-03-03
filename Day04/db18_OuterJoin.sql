-- P.284부터 참조
-- 쇼핑몰 가입하고 물건을 한번도 구매하지 않은 회원까지 모두 출력
SELECT u.*
	, b.prodName
    , b.groupName
    , b.price
    , b.amount -- b. 찍고 자동완성 안되면 Ctrl+Space
	FROM usertbl AS u
    LEFT OUTER JOIN buytbl AS b -- u.userID와 b.userID 일치하는거 싹다 보여주고 밑에 일치하지 않는것도 다 보여줌
		ON u.userID = b.userID
        WHERE b.userID IS NULL; -- 가입했지만 물건을 사지않은 애들 출력하는 조건. buytbl에 있는애들이 뭐라도 산애들이니까 
        
        
-- 학생 중 동아리에 가입하지 않은 학생 찾기
SELECT s.stdname,s.addr
	, j.num, c.clubName, c.roomNo
	FROM stdtbl AS s
    LEFT OUTER JOIN stdclubtbl AS j 
		ON s.stdName = j.stdName
	LEFT OUTER JOIN clubtbl AS c
		ON c.clubname = j.clubName
UNION -- !동아리 가입안한애 + 아무도 가입안한 동아리!
SELECT s.stdname,s.addr -- 동아리 중 아무도 가입하지 않은 동아리
	, j.num, c.clubName, c.roomNo
	FROM stdtbl AS s
    RIGHT OUTER JOIN stdclubtbl AS j 
		ON s.stdName = j.stdName
	RIGHT OUTER JOIN clubtbl AS c
		ON c.clubname = j.clubName;
        
        
-- IN:조건만족 / NOT IN:조건만족X
SELECT name
	, height
	FROM usertbl
    WHERE height NOT IN (SELECT height
							FROM usertbl
							WHERE name LIKE '김경호%');