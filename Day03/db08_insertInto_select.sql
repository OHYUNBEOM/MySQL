-- INSERT INTO SELECT

-- usertbl 컬럼 네개 가져와서 usertbl_copy에 집어넣는다
INSERT INTO usertbl_copy(userID,name,birthYear,addr)
SELECT userID,name,birthYear,addr FROM usertbl;