/* #개인회원 테이블 */
INSERT INTO USER_TABLE (USER_ID, USER_PW, USER_PHONE, USER_BIRTH, USER_EMAIL, USER_ADRESS, USER_NAME, USER_ACT, USER_ROLE, TERMS_ACT, TERMS_DATE)
VALUES ('user22', 'user22', '01012345678', '000101', 'user22@example.com', '서울시 관악구', '사용자2','true', 'ROLE_P', 'Y', sysdate );


/* JA_CATEGORY TABLE 	*/
REM INSERTING into EXPORT_TABLE
SET DEFINE OFF;
-- 지역 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('LO','지역','1','LO',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('LO01','서울','2','LO','LO');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('LO02','경기','2','LO','LO');
--직종 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('JN','직종','1','JN',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('JN01','인터넷/IT/통신/모바일/게임','2','JN','JN');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('JN02','경영/인사/총무/사무','2','JN','JN');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('JN024','소프트웨어','2','JN','JN');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133101','시스템 소프트웨어 개발자(프로그래머)','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133100','시스템 소프트웨어 개발자','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133102','펌웨어 및 임베디드 소프트웨어 프로그래머','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133200','응용 소프트웨어 개발자','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133201','JAVA 프로그래밍 언어 전문가','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133202','JAVA 프로그래밍 언어 전문가','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133203','범용 응용 소프트웨어 프로그래머(ERP,정보처리,재무관리 등)','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133204','산업특화 응용 소프트웨어 프로그래머(국방,항공,교통 등)','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133205','네트워크 프로그래머','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133206','게임 프로그래머','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133207','모바일 애플리케이션 프로그래머(앱·어플 개발)','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133300','웹 개발자','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133301','웹 개발자(웹 엔지니어·웹 프로그래머)','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133302','웹 기획자','3','JN','JN024');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('133900','IT 테스터 및 IT QA 전문가','3','JN','JN024');
--게시판 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD','게시판','1','UBD',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD01','취업준비방','2','UBD','UBD');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD02','신입방','2','UBD','UBD');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD03','면접방','2','UBD','UBD');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD04','질문게시판','2','UBD','UBD');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD05','뉴스레터','2','UBD','UBD');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('UBD06','회사소개','2','UBD','UBD');
--경력 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('CA','경력관련','1','CA',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('CA02','경력','2','CA','CA');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('CA01','신입','2','CA','CA');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('CA03','관계없음','2','CA','CA');
--학력 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED','학력','1','ED',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED01','관계없음','2','ED','ED');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED02','고졸','2','ED','ED');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED03','대졸(2~3년)','2','ED','ED');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED04','대졸(4년)','2','ED','ED');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED05','석사','2','ED','ED');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ED06','박사','2','ED','ED');
--우대조건 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SC','우대조건','1','SC',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SC01','국가유공자','2','SC','SC');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SC02','보훈대상자','2','SC','SC');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SC03','취업보호대상자','2','SC','SC');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SC04','병역특례','2','SC','SC');
--고용형태 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ET','고용형태','1','ET',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ET10','정규직','2','ET','ET');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ET11','시간제정규직','2','ET','ET');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ET20','계약직','2','ET','ET');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('ET21','시간제계약직','2','ET','ET');
--근무형태 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('HT','근무 형태','1','HT',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('HT01','주5일제','2','HT','HT');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('HT02','주6일제','2','HT','HT');
--지원전형 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT','지원전형','1','PT',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT01','서류전형','2','PT','PT');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT02','1차면접','2','PT','PT');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT03','2차면접','2','PT','PT');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT04','최종면접','2','PT','PT');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('PT05','불합격','2','PT','PT');
--성별 카테고리
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SE','성별','1','SE',null);
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SE01','남성','2','SE','SE');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SE02','여성','2','SE','SE');
Insert into EXPORT_TABLE (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DEPT,CATEGORY_TYPE,REQ_CATEGORY_ID) values ('SE03','관계없음','2','SE','SE');


--회원 임시
-- 마스터 관리자
INSERT INTO USER_TABLE (USER_ID, USER_PW, USER_PHONE, USER_BIRTH, USER_EMAIL, ADDRESS_ROAD, USER_NAME, BS_TYPE, BS_LICENSE, USER_ROLE, TERMS_ACT, TERMS_DATE, TERMS_PERIOD)
VALUES ('admin', '$2a$10$t27GWA4xK07TrCqxVF.ouuvIZJW1ldcgivH5yHr2W8hmyp1x5/nbi', '01012345678', '1990-01-01 00:00:00', 'johndoe@example.com', '123 Main St, Anytown USA', 'John Doe', 'Retail', '12345', 'ROLE_AM', 'Y', '2023-03-19 00:00:00', 3);
-- 기업 회원
INSERT INTO USER_TABLE (USER_ID, USER_PW, USER_PHONE, USER_BIRTH, USER_EMAIL, ADDRESS_ROAD, USER_NAME, BS_TYPE, BS_LICENSE, USER_ROLE, TERMS_ACT, TERMS_DATE, TERMS_PERIOD)
VALUES ('buser11', '$2a$10$gohBEP3hvlo7j8B9vas49ucjYH9YLxrc1myDyerYG2aeu/hHrfn.a', '01012345678', '1990-07-07', 'buser@example.com', '123 Main St, 대한민국', '최민건', '모름', '12345', 'ROLE_B', 'Y', CURRENT_TIMESTAMP, 3);
-- 개인 회원
INSERT INTO USER_TABLE (USER_ID, USER_PW, USER_PHONE, USER_BIRTH, USER_EMAIL, ADDRESS_ROAD, USER_NAME, BS_TYPE, BS_LICENSE, USER_ROLE, TERMS_ACT, TERMS_DATE, TERMS_PERIOD)
VALUES ('user11', '$2a$10$pLJeF.qJd2DaoYkgEzD2s.I13JUlypoYTtLHURW4P2xoojIoUoEsu', '01099995555', '1960-11-07', 'user11@example.com', '어디에있긴함, 대한민국', '최민건', '되는거같음', '88888', 'ROLE_P', 'Y', CURRENT_TIMESTAMP, 3);


/* #이력서 테이블 */
INSERT INTO USER_RESUME (RESUME_NO, RESUME_TITLE, RESUME_PHOTO, RESUME_DATE, PORTF_FILE, USER_ID) VALUES(USER_RESUME_SEQ.NEXTVAL, '최선을 다하는 계발자가 되겠습니다.', '', sysdate, '', 'user11' );

--배너 테이블 컬럼 3개 고정
INSERT INTO BANNER VALUES('1','첫번 째 배너','','','1', SYSDATE, 'admin');
INSERT INTO BANNER VALUES('2','두번 째 배너','','','2', SYSDATE, 'admin');
INSERT INTO BANNER VALUES('3','세번 째 배너','','','3', SYSDATE, 'admin');