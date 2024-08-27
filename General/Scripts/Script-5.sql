-- MEMBERS 테이블 생성

CREATE TABLE MEMBERS(

MEMBER_ID VARCHAR2(20) PRIMARY KEY ,

MEMBER_PWD VARCHAR2(20) NOT NULL,

MEMBER_NAME VARCHAR2(30),

MEMBER_AGE NUMBER,

MEMBER_EMAIL VARCHAR2(50)
);

INSERT INTO MEMBERS
VALUES('ASDF', 'DSWS', '아라알', 2, '1234ㅂㅈㄷㄱ');


DROP TABLE MEMBERS;

-- BOARDS 테이블 생성

CREATE TABLE BOARDS(

BOARD_NO NUMBER PRIMARY KEY,

BOARD_TITLE VARCHAR2(100),

BOARD_CONTENT VARCHAR2(4000),

BOARD_WRITER VARCHAR2(20)
		CONSTRAINT BOARD_WRITER_FK 
		REFERENCES MEMBERS (MEMBER_ID),

BOARD_REG_DATE DATE DEFAULT CURRENT_DATE

		

		
);
		
SELECT * FROM MEMBERS;
SELECT *FROM BOARDS;

INSERT INTO BOARDS 
VALUES (1, 'DD', 'AA', 'ASDF', '2023-03-22');

INSERT INTO BOARDS 
VALUES (2, 'ASD', 'AS', 'ASDF', CURRENT_DATE);

DROP TABLE BOARDS;



SELECT 
		EMP_ID 사번,
		EMP_NAME 이름,
		DECODE(SUBSTR(EMP_NO, 8, 1), '1', 'M', '2', 'F') 성별,
		SALARY 급여,
		JOB_NAME 직급명,
		DEPT_TITLE 부서명
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY BETWEEN 3000000 AND 4000000
ORDER BY SALARY;
		




















