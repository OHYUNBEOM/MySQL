-- OUTER JOIN
INSERT INTO stdtbl VALUES
('김범수','경남'),('성시경','서울'),('조용필','경기'),
('은지원','경북'),('바비킴','서울');

INSERT INTO clubtbl VALUES
('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');

INSERT INTO stdclubtbl VALUES
(NULL,'김범수','바둑'),(NULL,'김범수','축구'),(NULL,'조용필','축구'),
(NULL,'은지원','축구'),(NULL,'은지원','봉사'),(NULL,'바비킴','봉사');