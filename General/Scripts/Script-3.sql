CREATE TABLE LOL_CH(
		LOLCH_NO NUMBER PRIMARY KEY
);

INSERT INTO LOL_CH VALUES(1);
INSERT INTO LOL_CH VALUES(2);
INSERT INTO LOL_CH VALUES(3);
INSERT INTO LOL_CH VALUES(4);
INSERT INTO LOL_CH VALUES(5);

SELECT * FROM LOL_CH;





CREATE TABLE LOL_MEMBER(
		NAME VARCHAR(30) PRIMARY KEY ,
		LINE VARCHAR(9) NOT NULL ,
		LOL_TYPE VARCHAR(20) NOT NULL ,
		GENDER CHAR(3) CONSTRAINT NN_GENDER NOT NULL,
			CONSTRAINT CK_GENDER CHECK (GENDER IN ('남', '여')),
		LOLCH_NO NUMBER,
		
		CONSTRAINT LOLCH_NO_FK FOREIGN KEY (LOLCH_NO)
		REFERENCES LOL_CH (LOLCH_NO)
);

DROP TABLE LOL_MEMBER;

INSERT INTO LOL_MEMBER
VALUES ('가렌', '탑', '전사', '남');

SELECT * FROM LOL_MEMBER;
