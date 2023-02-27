-- 그냥 테이블 접근
SELECT *
	FROM membertbl;
    
-- 뷰 생성
CREATE VIEW uv_memberTBL
	AS
SELECT memberName, memberAddress FROM memberTBL;

-- 뷰 조회
SELECT * FROM uv_membertbl -- View에서는 id안나옴. 원하는 데이터에서 일부분만 조회 가능