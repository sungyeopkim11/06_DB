/* 관리자 계정(sys) 접속 후 수행 */

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;


-- 계정 생성
CREATE USER REPET IDENTIFIED BY RP1234;

-- 권한 부여
GRANT CONNECT, RESOURCE TO REPET;

-- 테이블 저장 공간 할당
ALTER USER REPET
DEFAULT TABLESPACE USERS
QUOTA 100M ON USERS;

SELECT * FROM "MEMBER";
SELECT * FROM BOARD;
SELECT * FROM BOARD_IMG;

COMMIT;

INSERT INTO BOARD_TYPE VALUES(4, '자유게시판');

SELECT COUNT(*)
		FROM "BOARD"
		WHERE BOARD_CODE = 3
		AND   BOARD_DEL_FL = 'N';
	
-- 게시판 종류 별로 샘플 데이터 개수 확인
SELECT BOARD_CODE, COUNT(*)
FROM BOARD
GROUP BY BOARD_CODE
ORDER BY BOARD_CODE ASC;


SELECT * FROM REPORT_BOARD;
	
SELECT 
		    ROW_NUMBER() OVER (ORDER BY B.BOARD_NO ASC) AS "RNUM",
		    B.BOARD_TITLE,
		    RC.REPORT_CATEGORY_CONTENT,
		    R.REPORT_WRITE_DATE,
		    R.REPORT_CATEGORY AS REPORT_CATEGORY,
		    M2.MEMBER_NICKNAME AS REPORT_NICKNAME,
		    R.BOARD_NO
		FROM 
		    "BOARD" B
		JOIN 
		    "BOARD_TYPE" BT ON (B.BOARD_CODE = BT.BOARD_CODE)
		JOIN 
		    "REPORT_BOARD" R ON (B.BOARD_NO = R.BOARD_NO)
		JOIN 
		    "MEMBER" M ON (M.MEMBER_NO = B.MEMBER_NO)
		JOIN 
		    "REPORT_CATEGORY" RC ON (RC.REPORT_CATEGORY = R.REPORT_CATEGORY)
		JOIN 
		    "MEMBER" M2 ON (M2.MEMBER_NO = R.MEMBER_NO)  
		WHERE 
		    B.BOARD_DEL_FL = 'N' 
		AND   
		    B.BOARD_CODE = 2 
		ORDER BY 
		    RNUM DESC;
	
	
	
	
	
	
	SELECT * FROM (
        SELECT 
            ROW_NUMBER() OVER (ORDER BY B.BOARD_NO ASC) AS "RNUM",
            B.BOARD_NO,
            B.BOARD_TITLE,
            B.READ_COUNT,
            M.MEMBER_NICKNAME
            
        FROM BOARD B 
        JOIN MEMBER M ON (B.MEMBER_NO = M.MEMBER_NO)
        WHERE B.BOARD_CODE = 2 
        AND B.BOARD_DEL_FL = 'N'
        AND B.BOARD_TITLE LIKE '%' || '135' || '%'
    ) 
    ORDER BY RNUM DESC;
	
	
	
	
SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY B.BOARD_NO ASC) AS "RNUM", B.BOARD_NO, B.BOARD_TITLE, B.READ_COUNT, M.MEMBER_NICKNAME FROM BOARD B JOIN MEMBER M ON (B.MEMBER_NO = M.MEMBER_NO) WHERE B.BOARD_CODE = 2 AND B.BOARD_DEL_FL = 'N' AND B.BOARD_TITLE LIKE '%' || 135 || '%' ) ORDER BY RNUM DESC	
	
	
	
	
	
	
	
	