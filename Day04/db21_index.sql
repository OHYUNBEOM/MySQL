USE tabledb;

CREATE TABLE TBL1(
	ID INT NOT NULL PRIMARY KEY,
	bridge INT NULL,
    content VARCHAR(5000)
);

/* sqldb DB의 usertbl 데이터중
 userId,name,birthYear,addr 만 가져와서
 tabledb.usertbl 에 다 집어넣음 */
INSERT INTO tabledb.usertbl 
SELECT userID,name,birthYear,addr
	FROM sqldb.usertbl;
    
SELECT * FROM usertbl WHERE name ='김범수';