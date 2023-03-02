-- UPDATE&TRANSACTION
-- UPDATE문 사용시 COMMIT/ROLLBACK 통해서 미리 잘못된 UPDATE 방지해줘야함
START TRANSACTION;

-- UPDATE 구문에는 WHERE절 빼면 안됨!
UPDATE usertbl_copy
	SET mobile1='010'
    , mobile2='66667788'
    , addr='부산'
    WHERE userID='OYB';

COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 절대 안됨
DELETE FROM usertbl_copy
	WHERE userID='OYB';