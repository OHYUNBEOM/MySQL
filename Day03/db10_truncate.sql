INSERT INTO proctbl (TOTAL_NAME)
VALUES('BBK');

SELECT * FROM proctbl;

DELETE FROM proctbl WHERE ID =3;

-- 완전초기화
TRUNCATE proctbl;

DELETE FROM proctbl;

-- 기존 데이터 2개인 상태에서 DELETE FROM proctbl로 다 삭제하고 다시 집어넣으면 id가 3번부터 시작됨
-- 완전 초기화를 하고싶다면 TRUNCATE 사용