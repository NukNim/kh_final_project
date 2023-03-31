DROP TABLE "JA_CATEGORY";
DROP TABLE "BUSINESS_APPLICANT_FIND";
-----
            DROP TABLE "BUSINESS_APPLICANT_INTERVIEW";
        DROP TABLE "BUSINESS_APPLICANT_PASS";
        DROP TABLE "USER_APPLY";
    DROP TABLE "BUSINESS_APPLICANT";
DROP TABLE "RECRUIT_REGIST";
----
DROP SEQUENCE "RECRUIT_REGIST_SEQ";
CREATE SEQUENCE "RECRUIT_REGIST_SEQ";
------
            DROP TABLE "RESUME_U_INFO";
        DROP TABLE "R_HSCHOOL";
            DROP TABLE "RESUME_U_INFO";
        DROP TABLE "R_UNIVERSITY";
            DROP TABLE "RESUME_G_INFO";
        DROP TABLE "R_UNIVERSITY";
            DROP TABLE "RESUME_CAR_INFO";
        DROP TABLE "R_CAREER";
            DROP TABLE "RESUME_CERTI_INFO";
        DROP TABLE "R_CERTI";
            DROP TABLE "RESUME_CL_INFO";
        DROP TABLE "R_CL";
    DROP TABLE "USER_RESUME";    
        DROP TABLE "REPLY";
    DROP TABLE "BOARD";
DROP TABLE "USER_TABLE";





-- 카테고리 테이블 
DROP TABLE "JA_CATEGORY";

CREATE TABLE "JA_CATEGORY" (
	"CATEGORY_ID"	VARCHAR2(20)		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(100)		NOT NULL,
	"CATEGORY_DEPT"	VARCHAR2(10)		NULL,
	"CATEGORY_TYPE"	VARCHAR2(50)		NULL,
	"REQ_CATEGORY_ID"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "JA_CATEGORY"."CATEGORY_ID" IS 'ID 시퀀스로 순차 증가 (임시)';

COMMENT ON COLUMN "JA_CATEGORY"."CATEGORY_TYPE" IS '해당 ROW의 카테고리 고유번호를 대표하는 데이터';

COMMENT ON COLUMN "JA_CATEGORY"."REQ_CATEGORY_ID" IS '참조하는 상위단계 아이디';

ALTER TABLE "JA_CATEGORY" ADD CONSTRAINT "PK_JA_CATEGORY" PRIMARY KEY (
	"CATEGORY_ID"
);



---------------------------------



--유저테이블 생성 쿼리
DROP TABLE "USER_TABLE";

CREATE TABLE "USER_TABLE" (
	"USER_ID"	VARCHAR2(20)		NOT NULL,
	"USER_PW"	VARCHAR2(100)		NOT NULL,
	"USER_PHONE"	VARCHAR2(11)		NOT NULL,
	"USER_BIRTH"	TIMESTAMP		NOT NULL,
	"USER_EMAIL"	VARCHAR2(254)		NOT NULL,
	"USER_NAME"	VARCHAR2(50)		NULL,
	"BS_TYPE"	VARCHAR2(200)		NULL,
	"BS_LICENSE"	VARCHAR2(30)		NULL,
	"BS_MAIN_PHONE"	VARCHAR2(11)		NULL,
	"USER_CREATED_AT"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NULL,
	"USER_LAST_LOGIN"	TIMESTAMP		NULL,
	"USER_COUNT"	NUMBER		NULL,
	"USER_ACT"	VARCHAR2(5)	DEFAULT true	NULL,
	"USER_ROLE"	VARCHAR2(10)		NOT NULL,
	"TERMS_ACT"	VARCHAR2(1)		NOT NULL,
	"TERMS_DATE"	TIMESTAMP		NOT NULL,
	"TERMS_PERIOD"	NUMBER	DEFAULT 3	NOT NULL,
	"ADDRESS_ROAD"	VARCHAR2(100)		NULL,
	"ADDRESS_JIBUN"	VARCHAR2(100)		NULL,
	"ADDRESS_DETAIL"	VARCHAR2(100)		NULL,
	"ADDRESS_POSTCODE"	VARCHAR2(100)		NULL
);

ALTER TABLE "USER_TABLE" ADD CONSTRAINT "PK_USER_TABLE" PRIMARY KEY (
	"USER_ID"
);


--게시판 테이블 생성 쿼리
DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL,
	"CATEGORY_ID"	VARCHAR2(20)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	CLOB		NULL,
	"BOARD_DATE"	TIMESTAMP		NULL,
	"BOARD_ORIGINAL_FILENAME"	VARCHAR2(100)		NULL,
	"BOARD_RENAME_FILENAME"	VARCHAR2(100)		NULL,
	"BOARD_READ"	NUMBER	DEFAULT 0	NULL,
	"BOARD_LIKE"	NUMBER	DEFAULT 0	NULL,
	"TAG"	VARCHAR(200)		NULL,
	"SALARY_AVG"	VARCHAR(100)		NULL,
	"EMPLOYEE"	VARCHAR(100)		NULL,
	"LATITUDE"	VARCHAR(100)		NULL,
	"LONGITUDE"	VARCHAR(100)		NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_ORIGINAL_FILENAME" IS '파일첨부';

COMMENT ON COLUMN "BOARD"."BOARD_RENAME_FILENAME" IS '파일첨부';

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);


-- 댓글 테이블 생성 쿼리
DROP TABLE "REPLY";

CREATE TABLE "REPLY" (
	"REPLY_ID"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(500)		NOT NULL,
	"REPLY_CREATE_DATE"	TIMESTAMP		NOT NULL,
	"REPLY_LEVEL"	NUMBER		NULL,
	"REPLY_SEQ"	NUMBER		NULL
);

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '원글 : 자신의 게시글 고유번호, 답글 : 참조 게시글 고유번호';

COMMENT ON COLUMN "REPLY"."REPLY_LEVEL" IS '원글의 답글 : 1, 답글의 답글 : 2';

COMMENT ON COLUMN "REPLY"."REPLY_SEQ" IS '답글의 순번';

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_ID"
);


-- 이력서 테이블 생성 쿼리
DROP TABLE USER_RESUME;

CREATE TABLE USER_RESUME (
    RESUME_NO NUMBER NOT NULL PRIMARY KEY
    , RESUME_TITLE VARCHAR2(60) NOT NULL
    , RESUME_PHOTO VARCHAR2(200)
    , RESUME_ACT VARCHAR2(1) DEFAULT 'Y' CHECK (RESUME_ACT IN('Y', 'N')) 
    , RESUME_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    , PORTF_FILE VARCHAR2(200)
    , USER_ID VARCHAR2(20) NOT NULL
);


-- 자기소개서 생성 쿼리
DROP TABLE R_CL;

CREATE TABLE R_CL(
    CL_NO NUMBER NOT NULL PRIMARY KEY
    , CL_FILE VARCHAR2(200)
    , CL_GROWTH CLOB
    , CL_MOTIVE CLOB
    , CL_ADV CLOB
    , CL_ASP CLOB
);


-- 자기소개서 정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_CL_INFO;
CREATE TABLE RESUME_CL_INFO(
    RESUME_NO NUMBER
    , CL_NO NUMBER
);


-- 자격증 생성 쿼리
DROP TABLE R_CERTI;

CREATE TABLE R_CERTI(
    CERTI_NO NUMBER NOT NULL PRIMARY KEY
    , CERTI_NAME VARCHAR2(100)
    , CERTI_PUB VARCHAR2(100)
    , CERTI_DATE TIMESTAMP
);


-- 자격증 정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_CERTI_INFO;
CREATE TABLE RESUME_CERTI_INFO(
    RESUME_NO NUMBER
    , CERTI_NO NUMBER
);


-- 경력사항 생성 쿼리
DROP TABLE R_CAREER;

CREATE TABLE R_CAREER(
    CAR_NO NUMBER NOT NULL PRIMARY KEY
    , CAR_NAME VARCHAR2(100)
    , CAR_DATE TIMESTAMP
    , CAR_POSITION VARCHAR2(50)
    , CAR_DEPT VARCHAR2(50)
    , CAR_RESP VARCHAR2(200)
    , CAR_SALARY NUMBER
);


-- 경력사항 정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_CAR_INFO;
CREATE TABLE RESUME_CAR_INFO(
    RESUME_NO NUMBER
    , CAR_NO NUMBER
);


-- 고등학교 학력사항 생성 쿼리
DROP TABLE R_HSCHOOL;

CREATE TABLE R_HSCHOOL(
    H_EDU_NO NUMBER NOT NULL PRIMARY KEY
    , GED VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK (GED IN('Y', 'N'))
    , H_NAME VARCHAR2(60)
    , H_DATE TIMESTAMP
    , H_MAJOR VARCHAR2(10)
);  


-- 고등학교 학력정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_H_INFO;
CREATE TABLE RESUME_H_INFO(
    RESUME_NO NUMBER
    , H_EDU_NO NUMBER
);


-- 대학교 학력사항 생성 쿼리
DROP TABLE R_UNIVERSITY;

CREATE TABLE R_UNIVERSITY(
    U_EDU_NO NUMBER NOT NULL PRIMARY KEY
    , U_ACT VARCHAR2(1) CHECK (U_ACT IN('Y', 'N', 'R'))
    , U_CATEGORY VARCHAR2(1) CHECK (U_CATEGORY IN('T', 'F'))
    , U_NAME VARCHAR2(30)
    , U_DATE TIMESTAMP
    , U_MAJOR VARCHAR2(50)
    , U_POINT NUMBER
);


-- 대학교 학력정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_U_INFO;
CREATE TABLE RESUME_U_INFO(
    RESUME_NO NUMBER
    , U_EDU_NO NUMBER
);


-- 대학원 학력사항 생성 쿼리
DROP TABLE R_GSCHOOL;

CREATE TABLE R_GSCHOOL(
    G_EDU_NO NUMBER NOT NULL PRIMARY KEY
    , G_ACT VARCHAR2(1) CHECK (G_ACT IN('Y', 'N', 'R'))
    , G_NAME VARCHAR2(30)
    , G_CATEGORY CHAR(6)
    , G_DATE TIMESTAMP
    , G_MAJOR VARCHAR2(50)
    , G_POINT NUMBER
);


-- 대학원 학력정보 테이블 생성 쿼리 (낀테이블)
DROP TABLE RESUME_G_INFO;
CREATE TABLE RESUME_G_INFO(
    RESUME_NO NUMBER 
    , G_EDU_NO NUMBER
);




---------------------------------



-- # 채용공고등록 테이블
CREATE TABLE "RECRUIT_REGIST" (
	"RA_NUM"	NUMBER		NOT NULL,
	"RECRUIT_TYPE"	VARCHAR2(500)		NULL,
	"BUSINO"	VARCHAR2(20)		NULL,
	"COMPANY_NAME"	VARCHAR2(50)		NULL,
	"CAREER_TYPE"	VARCHAR2(5)		NULL,
	"INCHARGE_WORK"	VARCHAR2(500)		NULL,
	"DEPARTMENT"	VARCHAR2(100)		NULL,
	"RA_POSITION"	VARCHAR2(50)		NULL,
	"CONDITION_TYPE"	VARCHAR2(100)		NULL,
	"USER_EDUCATION"	VARCHAR2(100)		NULL,
	"SALARY"	VARCHAR2(100)		NULL,
	"MIN_SALARY"	VARCHAR2(100)		NULL,
	"MAX_SALARY"	VARCHAR2(100)		NULL,
	"WORK_DETAIL"	VARCHAR2(200)		NULL,
	"REGIST_DATE"	VARCHAR2(30)		NULL,
	"CLOSE_DATE"	VARCHAR2(30)		NULL,
	"APPLY_TYPE"	VARCHAR2(50)		NULL,
	"RA_TITLE"	VARCHAR2(200)		NOT NULL,
	"RA_CONTENT"	VARCHAR2(4000)		NULL,
	"RA_PROCESS"	VARCHAR2(200)		NULL,
	"RA_EXTRA_DOCUMENT"	VARCHAR2(500)		NULL,
	"CAREER"	VARCHAR2(50)		NULL,
	"HOLIDAY_TYPE"	VARCHAR2(50)		NULL,
	"EMP_TYPE_CODE"	VARCHAR2(10)		NULL
);

ALTER TABLE "RECRUIT_REGIST" ADD CONSTRAINT "PK_RECRUIT_REGIST" PRIMARY KEY (
	"RA_NUM"
);


-- # 지원자 테이블
DROP TABLE BUSINESS_APPLICANT;

CREATE TABLE BUSINESS_APPLICANT(
    BA_NUM NUMBER PRIMARY KEY
  , USER_ID VARCHAR2(20) NOT NULL
  , RESUME_NO NUMBER NOT NULL
  , RESULT_TYPE VARCHAR2(10) NOT NULL
  , RA_NUM NUMBER NOT NULL
);

-- # 개인회원 지원 테이블
DROP TABLE USER_APPLY;
CREATE TABLE USER_APPLY(
    USER_ID VARCHAR2(20) NOT NULL
  , BA_NUM NUMBER NOT NULL
  , APPLY_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , RESUME_NO NUMBER NOT NULL
);



--# 합격자 등록 테이블
CREATE TABLE BUSINESS_APPLICANT_PASS (
	AP_NUM	NUMBER	PRIMARY KEY
	, USER_ID	VARCHAR2(20) NULL	
	, USER_NAME	VARCHAR2(50) NULL
	, PASS_TYPE	VARCHAR2(10) NULL
	, RESULT_TITLE	VARCHAR2(100) NULL
	, RESULT_CONTENT	VARCHAR2(2000) NULL
	, ALARM_TYPE	VARCHAR2(10) NULL
	, BA_NUM	NUMBER NULL
);

COMMENT ON COLUMN "BUSINESS_APPLICANT_PASS"."PASS_TYPE" IS 'CHECK (pass_type IN("서류전형","1차면접","2차면접","최종합격"))';

COMMENT ON COLUMN "BUSINESS_APPLICANT_PASS"."ALARM_TYPE" IS 'CHECK (alarm_type IN("이메일","SMS문자"))';


--# 면접일정 등록 테이블
CREATE TABLE "BUSINESS_APPLICANT_INTERVIEW" (
	"AI_NUM"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NULL,
	"USER_NAME"	VARCHAR2(50)		NULL,
	"INTERVIEW_TIME"	TIMESTAMP		NULL,
	"INTERVIEW_LOCATION"	VARCHAR2(1000)		NULL,
	"INTERVIEWER"	VARCHAR2(100)		NULL,
	"ALARM_TYPE"	VARCHAR2(10)		NULL,
	"ATTEND_TYPE"	VARCHAR2(1)		NULL,
	"AP_NUM"	NUMBER		NULL
);

COMMENT ON COLUMN "BUSINESS_APPLICANT_INTERVIEW"."ALARM_TYPE" IS 'CHECK (alarm_type IN("이메일","SMS문자"))';

COMMENT ON COLUMN "BUSINESS_APPLICANT_INTERVIEW"."ATTEND_TYPE" IS 'CHECK (attend_type IN("N","Y"))';


---------------------------------



--시퀀스 생성 완료 

--RECRUIT_REGIST_SEQ 생성
DROP SEQUENCE RECRUIT_REGIST_SEQ;

CREATE SEQUENCE RECRUIT_REGIST_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
--BUSINESS_APPLICANT_SEQ 시퀀스 생성
DROP SEQUENCE BUSINESS_APPLICANT_SEQ;
       
CREATE SEQUENCE BUSINESS_APPLICANT_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
--BUSINESS_APPLICANT_INTERVIEW_SEQ 시퀀스 생성
DROP SEQUENCE BUSINESS_AI_SEQ;
       
CREATE SEQUENCE BUSINESS_AI_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
       
--BUSINESS_APPLICANT_PASS_SEQ 시퀀스 생성
DROP SEQUENCE BUSINESS_AP_SEQ;
       
CREATE SEQUENCE BUSINESS_AP_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
--USER_RESUME 시퀀스 생성
DROP SEQUENCE USER_RESUME_SEQ;
       
CREATE SEQUENCE USER_RESUME_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
       
--R_HSCHOOL 시퀀스 생성
DROP SEQUENCE R_HSCHOOL_SEQ;
       
CREATE SEQUENCE R_HSCHOOL_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
--R_UNIVERSITY 시퀀스 생성
DROP SEQUENCE R_UNIVERSITY_SEQ;
       
CREATE SEQUENCE R_UNIVERSITY_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
--R_GSCHOOL 시퀀스 생성

DROP SEQUENCE R_GSCHOOL_SEQ;
       
CREATE SEQUENCE R_GSCHOOL_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;


--R_CAREER 시퀀스 생성

DROP SEQUENCE R_CAREER_SEQ;
       
CREATE SEQUENCE R_CAREER_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;       
    
--R_CERTI 시퀀스 생성

DROP SEQUENCE R_CERTI_SEQ;
       
CREATE SEQUENCE R_CERTI_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
       
       
    
--R_CL 시퀀스 생성

DROP SEQUENCE R_CL_SEQ;
       
CREATE SEQUENCE R_CL_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;


--BOARD 시퀀스 생성

DROP SEQUENCE BOARD_SEQ;
       
CREATE SEQUENCE BOARD_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
              
              
--REPLY 시퀀스 생성

DROP SEQUENCE REPLY_SEQ;
       
CREATE SEQUENCE REPLY_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
              