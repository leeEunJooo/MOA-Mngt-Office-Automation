CREATE DATABASE MOA_DB;

USE MOA_DB;

drop table tbl_moa_cd_bas;
drop table tbl_moa_execution_txn;
drop table tbl_moa_hst;
drop table tbl_moa_bas;
drop table tbl_moa_user_bas;

-- 사용자 테이블 생성
CREATE TABLE TBL_MOA_USER_BAS(
CUST_IDFY_SEQ int NOT NULL auto_increment PRIMARY KEY,
USER_ID VARCHAR(11) NOT NULL,
USER_PWD VARCHAR(256) NOT NULL,
USER_TEL_NO VARCHAR(12) NOT NULL,
USER_NM VARCHAR(60) NOT NULL,
UPLD_CASCNT int NOT NULL,
TEAM_DIV_CD VARCHAR(3) NOT NULL,
EMP_POS_DIV_CD VARCHAR(3) NOT NULL
);
-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test01', 'test01', '01099881122','최민혜', 0, 'T02', 'D01');  

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test02', 'test02', '01012345678','신채영', 0, 'T02', 'D01');  

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test03', 'test03', '01090907171','윤동섭', 0, 'T02', 'D01');  

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test04', 'test04', '01022445566','이은주', 0, 'T03', 'D01');  

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test05', 'test05', '01099227171','안혜경', 0, 'T03', 'D01'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test06', 'test06', '01012123434','정대균', 0, 'T04', 'D01'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test07', 'test07', '01079798787','황윤섭', 0, 'T04', 'D01'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test08', 'test08', '01034617256','조대흠', 0, 'T06', 'D02'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test99', 'test99', '01094324321','홍길동', 0, 'T09', 'D03'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test10', 'test10', '01096742671','유세정', 0, 'T12', 'D03'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test11', 'test11', '01072817328','이수현', 0, 'T11', 'D03'); 

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test12', 'test12', '01022334455','노현정', 0, 'T04', 'D01');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test13', 'test13', '01033334444','대우석', 0, 'T03', 'D01');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test14', 'test14', '01055557777','김주영', 0, 'T03', 'D01');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test15', 'test15', '01066667777','김정원', 0, 'T03', 'D01');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test16', 'test16', '01000000000','이재진', 0, 'T13', 'D03');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test17', 'test17', '01000000000','강동수', 0, 'T10', 'D01');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test18', 'test18', '01000000000','김자은', 0, 'T08', 'D02');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test19', 'test19', '01000000000','장범수', 0, 'T07', 'D02');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test20', 'test20', '01000000000','김현정', 0, 'T09', 'D03');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test21', 'test21', '01000000000','이순신', 0, 'T14', 'D03');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test22', 'test22', '01000000000','유관순', 0, 'T15', 'D03');

-- INSERT INTO TBL_MOA_USER_BAS(USER_ID, USER_PWD, USER_TEL_NO, USER_NM, UPLD_CASCNT, TEAM_DIV_CD, EMP_POS_DIV_CD) 
-- VALUES ('test23', 'test23', '01000000000','장영실', 0, 'T05', 'D02');

update tbl_moa_user_bas set UPLD_CASCNT = 2 where CUST_IDFY_SEQ =8; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=3;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =14; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =15; 
update tbl_moa_user_bas set UPLD_CASCNT = 10 where CUST_IDFY_SEQ =7; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =10; 
update tbl_moa_user_bas set UPLD_CASCNT = 3 where CUST_IDFY_SEQ =13; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =12; 

update tbl_moa_user_bas set UPLD_CASCNT = 0 where CUST_IDFY_SEQ =4; 
update tbl_moa_user_bas set UPLD_CASCNT = 0 where CUST_IDFY_SEQ =5; 
update tbl_moa_user_bas set UPLD_CASCNT = 0 where CUST_IDFY_SEQ =6; 

update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=11;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=16;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=17;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=18;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=19;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=20;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=21;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=22;
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=23;

select * from tbl_moa_user_bas;
select * from tbl_moa_bas;

-- 외래키 참조해제
-- set foreign_key_checks=0;
-- delete from tbl_moa_bas where file_seq = 10;
-- 외래키 참조 설정
-- set foreign_key_checks=1;

-- select e.cd_nm, sum(upld_cascnt) as upupld_cascnt from tbl_moa_user_bas as m, TBL_MOA_CD_BAS as e where m.team_div_cd = e.CD_ID group by team_div_cd;
-- select e.cd_nm, sum(upld_cascnt) as upupld_cascnt from tbl_moa_user_bas as m, TBL_MOA_CD_BAS as e where m.EMP_POS_DIV_CD = e.CD_ID group by EMP_POS_DIV_CD;
-- select e.cd_nm, count(lang_cd) as count from tbl_moa_bas as m, TBL_MOA_CD_BAS as e where m.lang_cd = e.CD_ID group by lang_cd;
-- select c.CD_NM, WRKJOB_PRPS_NM, count(WRKJOB_PRPS_NM) as cnt from tbl_moa_bas as b left join tbl_moa_user_bas as u on b.cust_idfy_seq = u.cust_idfy_seq, tbl_moa_cd_bas as c where c.CD_ID = u.team_div_cd group by c.CD_ID, WRKJOB_PRPS_NM;


-- 자동화 세부정보 테이블 생성
CREATE TABLE TBL_MOA_BAS(
FILE_SEQ int NOT NULL auto_increment PRIMARY KEY,
CUST_IDFY_SEQ int NOT NULL,
SROC_FILE_PATH_NM VARCHAR(60) NOT NULL,
LANG_CD VARCHAR(3) NOT NULL,
SYS_DIV_CD VARCHAR(3) NOT NULL,
CYCL_DATE_TYPE_CD VARCHAR(3) NOT NULL,
DOW_NM VARCHAR(60),
DATA_EXE_TIME VARCHAR(8) NOT NULL,
RPY_RESLT_CD VARCHAR(3) NOT NULL,
TROBL_SVC_TYPE_CD VARCHAR(3) NOT NULL,
INPUT_VAL VARCHAR(50),
TRT_STEP_NM VARCHAR(60) NOT NULL,
CONN_EVN_DIV_CD VARCHAR(3) NOT NULL,
ATTEN_MTR_SBST VARCHAR(1000),
ATC_FILE_MANUAL_YN VARCHAR(1) NOT NULL,
ATC_FILE_UPLD_PATH_NM VARCHAR(200),
OTPUT_SBST VARCHAR(2000),
ETC_SBST VARCHAR(1000),
EXE_SBST VARCHAR(1000) NOT NULL,
NTCART_TITLE_NM VARCHAR(60) NOT NULL,
TKCGR_NM VARCHAR(60) NOT NULL,
RUSER_NM VARCHAR(60) NOT NULL,
FIRST_REG_DATE DATE NOT NULL,
CHG_DATE DATE NOT NULL,
FNS_DATE DATE NOT NULL,
DTL_DESC_SBST VARCHAR(1000),
WRKJOB_PRPS_NM VARCHAR(60) NOT NULL,
FOREIGN KEY(CUST_IDFY_SEQ) REFERENCES TBL_MOA_USER_BAS(CUST_IDFY_SEQ)
);

update TBL_MOA_BAS set SROC_FILE_PATH_NM = '\\uploads\\DT조근점검 flowchart.xaml' where file_seq = 4;

-- 유세정 외 조대흠

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (8, '\\uploads\\UserList (1).vue', 'L03', 'S11', 'C02', '금요일','10:00', 'R02', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '조근점검', '조대흠', '조대흠', '2021-07-19', '2021-07-19', '9999-12-31','','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (8, '\\uploads\\UserList (1).vue', 'L04', 'S12', 'C03', '2일','09:00', 'R03', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '빌링관련자동화', '조대흠', '조대흠', '2021-07-19', '2021-07-19', '9999-12-31','','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (10, '\\uploads\\Login (3).vue', 'L05', 'S14', 'C01', '','09:00', 'R04', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '조근점검', '유세정', '유세정', '2021-07-19', '2021-07-19', '9999-12-31','','고객업무대상');

-- 고객개발1팀

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (3, '\\download\\moa.xml', 'L01', 'S01', 'C01', '','10:00', 'R01', 'B01', '', 
'완료', 'E01', '실환경에서 개통과 기기변경이 실제로 이루어지는 것이기 때문에 그날 퇴근하기전에 개통하기 전과 기기변경되기 전으로 다시 정보들을 원복시켜주어야한다.', 'N', '', 'Y/N', '', '윈도우상 스케줄러를 통해 실행한다.', '조근점검', '윤동섭', '윤동섭', '2021-06-15', '2021-06-15', '9999-12-31','DT플랫폼, MVNO플랫폼 시스템 조근점검 자동수행','고객업무대상');

-- 고객개발2팀
INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (13, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', 'ITSM login id, pw, fp공수 입력된 파일위치', 
'완료', 'E01', 'fp공수 입력된 파일이 정해진 형식에 밪게 작성되어야 한다.', 'N', '', 'N', '', '형식에 맞게 실행시 필요한 전보가 있는 파일을 작성하고, 파이썬 파일에 직접 ITSM login id, pw, fp공수 입력된 파일 위치를 입력하여 실행', 'ITSM AP변경단계 처리 자동화', '대우석', 'kt ds 개발 BA', '2021-06-30', '2021-06-30', '9999-12-31','ITSM AP변경등록~개발 SR승인 요청 단계 자동 수행','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (13, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', '스펙번호, 공수, email', 
'완료', 'E01', '', 'N', '', 'N', '스펙 처리를 통해 srm번호를 가져온다.', '파이썬 파일에 스펙번호, 공수, 이메일을 입력하고 실행', 'ITSM 개발 spec 처리 자동화', '대우석', 'kt ds 개발 BA', '2021-07-01', '2021-07-01', '9999-12-31','ITSM SPEC ~ AP변경 등록 처리 자동화','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (13, '\\uploads\\N과M_4.java', 'L02', 'S03', 'C05', '월요일','00:00', 'R01', 'B01', '팀 이메일', 
'완료', 'E01', '', 'N', '', '압축파일', '', '파일의 코드에 팀 이메일을 입력하고 파일을 실행시키기만 하면 비바체에서 엑셀을 다운로드 하고, ITSM에서 담당자가 누군지, 
과제 내용 등을 조회하여 요구사항 분석시 파일을 자동으로 생성한 후 압축하여 팀 이메일로 팀내 과제 개발 담당자들에게 전송', '정기과제 요구 분석시 작성 자동화', '대우석', '팀 내 1명', '2021-07-19', '2021-07-19', '9999-12-31','스펙 확정 VIVACE의 스펙확정 자료를 기준으로 ITSM데이터 수집하여 과제별 엑셀 작성 후 각 담당자에게 이메일 전송','스탭업무대상');

-- INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
-- TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
-- ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
-- VALUES (4, '\\uploads\\N과M_4.java', 'L02', 'S03', 'C04', '','0:00', 'R01', 'B01', '팀 이메일', 
-- '완료', 'E01', '', 'N', '', '압축파일', '', '파일의 코드에 팀 이메일을 입력하고 파일을 실행시키기만 하면 비바체에서 엑셀을 다운로드 하고, ITSM에서 담당자가 누군지, 
-- 과제 내용 등을 조회하여 요구사항 분석시 파일을 자동으로 생성한 후 압축하여 팀 이메일로 팀내 과제 개발 담당자들에게 전송', '정기과제 요구 분석시 작성 자동화', '이은주', '팀 내 1명', '2021-07-19', '2021-07-19', '9999-12-31','스펙 확정 VIVACE의 스펙확정 자료를 기준으로 ITSM데이터 수집하여 과제별 엑셀 작성 후 각 담당자에게 이메일 전송','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (14, '\\uploads\\N과M_5.java', 'L02', 'S15', 'C03', '29일','00:00', 'R04', 'B01', '엑셀파일(팀 이름, 메일 주소)', 
'완료', 'E01', '일일 점검자 현황에 매달 올라오는 파일이 해당월로 존재해야함', 'N', '', 'N', '', '파이썬 파일을 실행하며 팀, 날짜, 이름, 메일 주소가 적힌 엑셀파일에서 날짜칸이 비어있는 사람의 이름을 가져와서  works > 보안점검자 에 이름을 넣는다.', '매월 지정하는 보안 담당자 지정 자동화', '김주영', '팀 보안 점검 담당자', '2021-07-19', '2021-07-19', '9999-12-31','works > space > 보안점검자 작성 자동화','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (15, '\\uploads\\Login.vue', 'L02', 'S16', 'C03', '1일','00:00', 'R04', 'B01', '사용자 아이디, 비밀번호, 제목, 날짜, 시작시간, 종료시간, 이메일, 장소, 설명', 
'완료', 'E01', '시간을 입력할 때 10분 단위로 입력해야한다.', 'N', '', 'N', '매월 12개정도 일정을 넣어야해서 만들었음', '윈도우에서 exe파일을 실행시켜 gui에 input값을 입력하고 실행버튼을 누른다', '일정 등록 자동화', '김정원', '누구나', '2021-07-19', '2021-07-19', '9999-12-31','반복적인 일정 등록(소스리뷰, IA리뷰 등)을 자동화한다. UI에 일정 관련 정보를 입력 후 수정하면 일정등록','스탭업무대상');

-- 유통서비스팀

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\download\\moa.xml', 'L01', 'S06', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(K-RDS)', '황윤섭', '황윤섭','2021-07-05', '2021-07-05', '9999-12-31','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\download\\moa.xml', 'L01', 'S07', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(K-Note)', '황윤섭', '황윤섭','2021-07-05', '2021-07-05', '9999-12-31','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(MVNO-RDS)', '황윤섭', '황윤섭','2021-07-05', '2021-07-05', '9999-12-31','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\download\\moa.xml', 'L01', 'S09', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(M-RDS)', '황윤섭', '황윤섭','2021-07-05', '2021-07-05', '9999-12-31','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (12, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','06:00', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '.', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'MVNO-RDS 시스템 상세점검', '노현정', '노현정', '2021-06-15', '2021-06-15', '9999-12-31','MVNO-RDS 시스템 영역의 Portal, UI,배치, PWC, FDH연동 등 상세 점검','스탭업무대상');
							

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_1.java', 'L01', 'S06', 'C01', '','09:00', 'R01', 'B01', '', 
'완료', 'E01', '', 'N', '', '점검결과 메일', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'EDI솔루션(xTrus) 점검', '황윤섭', '황윤섭과장', '2021-07-19', '2021-07-19', '9999-12-31','Apple사와 연동을 하는 솔루션의 정상 가동여부, 연동결과 모니터링 기능','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_2.java', 'L01', 'S06', 'C07', '','01:00', 'R02', 'B01', '', 
'완료', 'E01', '', 'N', '', '올레TV탭 실시간 실적 SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '올레TV탭 실적 SMS자동 발송', '황윤섭', '정헌수 차장(스마트단말마케팅팀) 등 올레 TV탭 관련 사업부서', '2021-07-19', '2021-07-19', '9999-12-31','올레TV탭 신규 출시(5/10~)에 따른 LTE+TV동시판매 실적 실시간 확인을 위해 실시간 집계 및 SMS발송','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_3.java', 'L01', 'S09', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS	', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(M-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '2021-07-19', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_7.java', 'L01', 'S06', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(K-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '2021-07-19', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_6.java', 'L01', 'S08', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(MVNO-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '2021-07-19', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(K-Note)', '황윤섭', '황윤섭과장', '2021-07-19', '2021-07-19', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (11, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'CRM서비스팀관련 자동화', '이수현', '이수현', '2021-07-20', '2021-07-20', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (16, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '오픈채널사업TF관련 자동화', '이재진', '이재진', '2021-07-06', '2021-07-06', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (17, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '오픈채널사업TF관련 자동화', '강동수', '강동수', '2021-07-06', '2021-07-06', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (18, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'pay서비스팀관련 자동화', '김자은', '김자은', '2021-07-10', '2021-07-10', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (19, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '빌링개발관련 자동화', '장범수', '장범수', '2021-07-14', '2021-07-14', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (20, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '고객DX솔루션관련 자동화', '김현정', '김현정', '2021-07-21', '2021-07-21', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (21, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'BSS품질혁신TF관련 자동화', '이순신', '이순신', '2021-07-15', '2021-07-15', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (22, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'IT컨설팅관련 자동화', '유관순', '유관순', '2021-07-15', '2021-07-15', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (23, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'Rater서비스관련 자동화', '장영실', '장영실', '2021-07-16', '2021-07-16', '9999-12-31','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');






-- 자동화 세부정보 이력 테이블 생성
CREATE TABLE TBL_MOA_HST(
STTUS_CHG_HST_SEQ INT NOT NULL auto_increment PRIMARY KEY,
FILE_SEQ INT NOT NULL,
CUST_IDFY_SEQ INT NOT NULL,
SROC_FILE_PATH_NM VARCHAR(60) NOT NULL,
LANG_CD VARCHAR(3) NOT NULL,
SYS_DIV_CD VARCHAR(3) NOT NULL,
CYCL_DATE_TYPE_CD VARCHAR(3) NOT NULL,
DOW_NM VARCHAR(60),
DATA_EXE_TIME VARCHAR(8) NOT NULL,
RPY_RESLT_CD VARCHAR(3) NOT NULL,
TROBL_SVC_TYPE_CD VARCHAR(3) NOT NULL,
INPUT_VAL VARCHAR(50),
TRT_STEP_NM VARCHAR(60) NOT NULL,
CONN_EVN_DIV_CD VARCHAR(3) NOT NULL,
ATTEN_MTR_SBST VARCHAR(1000),
ATC_FILE_MANUAL_YN VARCHAR(1) NOT NULL,
ATC_FILE_UPLD_PATH_NM VARCHAR(200),
OTPUT_SBST VARCHAR(2000),
ETC_SBST VARCHAR(1000),
EXE_SBST VARCHAR(1000) NOT NULL,
NTCART_TITLE_NM VARCHAR(60) NOT NULL,
TKCGR_NM VARCHAR(60) NOT NULL,
RUSER_NM VARCHAR(60) NOT NULL,
ST_DATE DATE NOT NULL,
FNS_DATE DATE NOT NULL,
LAST_HST_YN VARCHAR(1),
FILE_UPD_YN VARCHAR(1) NOT NULL,
STTUS_DIV_CD VARCHAR(3) NOT NULL,
DTL_DESC_SBST VARCHAR(1000),
WRKJOB_PRPS_NM VARCHAR(60) NOT NULL,
FOREIGN KEY(FILE_SEQ) REFERENCES TBL_MOA_BAS(FILE_SEQ),
FOREIGN KEY(CUST_IDFY_SEQ) REFERENCES TBL_MOA_BAS(CUST_IDFY_SEQ)
);

SELECT * FROM TBL_MOA_HST; where cust_idfy_seq=8;
-- delete from TBL_MOA_HST where file_seq = 10;



-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L01*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L03*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L04*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("S17*" in boolean mode) and e.LAST_HST_YN="Y";

-- 유세정,조대흠
INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (1,8, '\\uploads\\UserList (1).vue', 'L03', 'S11', 'C02', '금요일','10:00', 'R02', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '조근점검', '조대흠', '조대흠', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (2,8, '\\uploads\\UserList (1).vue', 'L04', 'S12', 'C03', '2일','09:00', 'R03', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '빌링관련자동화', '조대흠', '조대흠','2021-07-19', '9999-12-31', 'Y', 'N', 'R','','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (3,10, '\\uploads\\Login (3).vue', 'L05', 'S14', 'C01', '','09:00', 'R04', 'B01', '', 
'완료', 'E01', '', 'N', '', '', '', '실행방법', '조근점검', '유세정', '유세정','2021-07-19', '9999-12-31', 'Y', 'N', 'R','','고객업무대상');


-- 고객개발 1팀
INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (4,3, '\\download\\moa.xml', 'L01', 'S01', 'C01', '','10:00', 'R01', 'B01', '', 
'완료', 'E01', '실환경에서 개통과 기기변경이 실제로 이루어지는 것이기 때문에 그날 퇴근하기전에 개통하기 전과 기기변경되기 전으로 다시 정보들을 원복시켜주어야한다.', 'N', '', 'Y/N', '', '윈도우상 스케줄러를 통해 실행한다.', '조근점검', '윤동섭', '윤동섭', '2021-06-15', '9999-12-31', 'Y', 'N', 'R','DT플랫폼, MVNO플랫폼 시스템 조근점검 자동수행','고객업무대상');

-- 고객개발 2팀
INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (5,13, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', 'ITSM login id, pw, fp공수 입력된 파일위치', 
'완료', 'E01', 'fp공수 입력된 파일이 정해진 형식에 밪게 작성되어야 한다.', 'N', '', 'N', '', '형식에 맞게 실행시 필요한 전보가 있는 파일을 작성하고, 파이썬 파일에 직접 ITSM login id, pw, fp공수 입력된 파일 위치를 입력하여 실행', 'ITSM AP변경단계 처리 자동화', '대우석', 'kt ds 개발 BA', '2021-06-30', '9999-12-31', 'Y', 'N', 'R','ITSM AP변경등록~개발 SR승인 요청 단계 자동 수행','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (6,13, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', '스펙번호, 공수, email', 
'완료', 'E01', '', 'N', '', 'N', '스펙 처리를 통해 srm번호를 가져온다.', '파이썬 파일에 스펙번호, 공수, 이메일을 입력하고 실행', 'ITSM 개발 spec 처리 자동화', '대우석', 'kt ds 개발 BA', '2021-07-01','9999-12-31', 'Y', 'N', 'R','ITSM SPEC ~ AP변경 등록 처리 자동화','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7,13, '\\uploads\\N과M_4.java', 'L02', 'S03', 'C05', '월요일','00:00', 'R01', 'B01', '팀 이메일', 
'완료', 'E01', '', 'N', '', '압축파일', '', '파일의 코드에 팀 이메일을 입력하고 파일을 실행시키기만 하면 비바체에서 엑셀을 다운로드 하고, ITSM에서 담당자가 누군지, 과제 내용 등을 조회하여 요구사항 분석시 파일을 자동으로 생성한 후 압축하여 팀 이메일로 팀내 과제 개발 담당자들에게 전송', '정기과제 요구 분석시 작성 자동화', '대우석', '팀 내 1명', '2021-07-19','9999-12-31', 'Y', 'N', 'R','스펙 확정 VIVACE의 스펙확정 자료를 기준으로 ITSM데이터 수집하여 과제별 엑셀 작성 후 각 담당자에게 이메일 전송','스탭업무대상');

-- INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
-- DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
-- OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
-- VALUES (14,4, '\\uploads\\N과M_4.java', 'L02', 'S03', 'C04', '','0:00', 'R01', 'B01', '팀 이메일', 
-- '완료', 'E01', '', 'N', '', '압축파일', '', '파일의 코드에 팀 이메일을 입력하고 파일을 실행시키기만 하면 비바체에서 엑셀을 다운로드 하고, ITSM에서 담당자가 누군지, 
-- 과제 내용 등을 조회하여 요구사항 분석시 파일을 자동으로 생성한 후 압축하여 팀 이메일로 팀내 과제 개발 담당자들에게 전송', '정기과제 요구 분석시 작성 자동화', '이은주', '팀 내 1명', '2021-07-19','9999-12-31', 'Y', 'N', 'R','스펙 확정 VIVACE의 스펙확정 자료를 기준으로 ITSM데이터 수집하여 과제별 엑셀 작성 후 각 담당자에게 이메일 전송','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (8,14, '\\uploads\\N과M_5.java', 'L02', 'S15', 'C03', '29일','00:00', 'R04', 'B01', '엑셀파일(팀 이름, 메일 주소)', 
'완료', 'E01', '일일 점검자 현황에 매달 올라오는 파일이 해당월로 존재해야함', 'N', '', 'N', '', '파이썬 파일을 실행하며 팀, 날짜, 이름, 메일 주소가 적힌 엑셀파일에서 날짜칸이 비어있는 사람의 이름을 가져와서  works > 보안점검자 에 이름을 넣는다.', '매월 지정하는 보안 담당자 지정 자동화', '김주영', '팀 보안 점검 담당자', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','works > space > 보안점검자 작성 자동화','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (9,15, '\\uploads\\Login.vue', 'L02', 'S16', 'C03', '1일','00:00', 'R04', 'B01', '사용자 아이디, 비밀번호, 제목, 날짜, 시작시간, 종료시간, 이메일, 장소, 설명', 
'완료', 'E01', '시간을 입력할 때 10분 단위로 입력해야한다.', 'N', '', 'N', '매월 12개정도 일정을 넣어야해서 만들었음', '윈도우에서 exe파일을 실행시켜 gui에 input값을 입력하고 실행버튼을 누른다', '일정 등록 자동화', '김정원', '누구나', '2021-07-19','9999-12-31', 'Y', 'N', 'R','반복적인 일정 등록(소스리뷰, IA리뷰 등)을 자동화한다. UI에 일정 관련 정보를 입력 후 수정하면 일정등록','스탭업무대상');

-- 유통서비스팀
INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (10,7, '\\download\\moa.xml', 'L01', 'S06', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(K-RDS)', '황윤섭', '황윤섭', '2021-07-05', '9999-12-31', 'Y', 'N', 'R','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (11,7, '\\download\\moa.xml', 'L01', 'S07', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(K-Note)', '황윤섭', '황윤섭', '2021-07-05', '9999-12-31', 'Y', 'N', 'R','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (12,7, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(MVNO-RDS)', '황윤섭', '황윤섭', '2021-07-05', '9999-12-31', 'Y', 'N', 'R','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (13,7, '\\download\\moa.xml', 'L01', 'S09', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검(M-RDS)', '황윤섭', '황윤섭', '2021-07-05', '9999-12-31', 'Y', 'N', 'R','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');


INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (14,12, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','06:00', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'MVNO-RDS 시스템 상세점검', '노현정', '노현정', '2021-06-15', '9999-12-31', 'Y', 'N', 'R','MVNO-RDS 시스템 영역의 Portal, UI,배치, PWC, FDH연동 등 상세 점검','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (15,7, '\\uploads\\N과M_1.java', 'L01', 'S06', 'C01', '','09:00', 'R01', 'B01', '', 
'완료', 'E01', '', 'N', '', '점검결과 메일', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'EDI솔루션(xTrus) 점검', '황윤섭', '황윤섭과장', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','Apple사와 연동을 하는 솔루션의 정상 가동여부, 연동결과 모니터링 기능','고객업무대상');


INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (16,7, '\\uploads\\N과M_2.java', 'L01', 'S06', 'C07', '','01:00', 'R02', 'B01', '', 
'완료', 'E01', '', 'N', '', '올레TV탭 실시간 실적 SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '올레TV탭 실적 SMS자동 발송', '황윤섭', '정헌수 차장(스마트단말마케팅팀) 등 올레 TV탭 관련 사업부서', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','올레TV탭 신규 출시(5/10~)에 따른 LTE+TV동시판매 실적 실시간 확인을 위해 실시간 집계 및 SMS발송','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (17,7, '\\uploads\\N과M_3.java', 'L01', 'S09', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS	', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(M-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (18, 7, '\\uploads\\N과M_7.java', 'L01', 'S06', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(K-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (19, 7, '\\uploads\\N과M_6.java', 'L01', 'S06', 'C07', '','0:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot', '황윤섭', '황윤섭과장','2021-07-19', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (20, 7, '\\uploads\\N과M_6.java', 'L01', 'S08', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '유통 Mail-Bot(MVNO-RDS)', '황윤섭', '황윤섭과장', '2021-07-19', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');
-- ---------------------------------------------
INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (21,11, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'CRM서비스팀관련 자동화', '이수현', '이수현', '2021-07-20', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (22,16, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '오픈채널사업TF관련 자동화', '이재진', '이재진', '2021-07-06', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (23,17, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '오픈채널사업TF관련 자동화', '강동수', '강동수', '2021-07-06', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (24,18, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'pay서비스팀관련 자동화', '김자은', '김자은', '2021-07-10', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (25,19, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '빌링개발관련 자동화', '장범수', '장범수', '2021-07-14', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (26,20, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '고객DX솔루션관련 자동화', '김현정', '김현정', '2021-07-21', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (27,21, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'BSS품질혁신TF관련 자동화', '이순신', '이순신', '2021-07-15', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (28,22, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'IT컨설팅관련 자동화', '유관순', '유관순', '2021-07-15', '9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (29,23, '\\uploads\\N과M_6.java', 'L01', 'S07', 'C07', '','00:05', 'R03', 'B01', '원격처리 프로세스별 명령 문구를 antbot 메일 계정으로 송신함', 
'완료', 'E01', '정의된 정확한 명령 문구를 발송해야함(문구가 다를 경우 실행 안됨)', 'N', '', '처리결과 메일 + SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'Rater서비스관련 자동화', '장영실', '장영실', '2021-07-16','9999-12-31', 'Y', 'N', 'R','외부에서 시스템 원격처리를 위해 Mail 수신여부를 주기적으로 polling하는 자동화 프로세스, 시스템점검, 배치재수행, 배치로그확인, M-RDS OTP 예외처리 등의 업무를 외부에서 실시간 처리 가능','스탭업무대상');

-- ------------------------------------------------------------------------------------------------------------------------------------


select * from TBL_MOA_EXECUTION_TXN;
-- delete from TBL_MOA_EXECUTION_TXN where file_seq = 10;

-- 실행 테이블 생성
CREATE TABLE TBL_MOA_EXECUTION_TXN(
EXE_SEQ INT NOT NULL auto_increment PRIMARY KEY,
FILE_SEQ INT NOT NULL,
CUST_IDFY_SEQ INT NOT NULL,
EXE_EMP_NM VARCHAR(30) NOT NULL,
EXE_DATE datetime NOT NULL,
ERR_YN VARCHAR(1) NOT NULL,
ERR_MSG_SBST VARCHAR(1000),
LAST_HST_YN VARCHAR(1),
FOREIGN KEY(FILE_SEQ) REFERENCES TBL_MOA_BAS(FILE_SEQ),
FOREIGN KEY(CUST_IDFY_SEQ) REFERENCES TBL_MOA_USER_BAS(CUST_IDFY_SEQ)
);

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (1, 8, '조대흠', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (2, 8, '조대흠', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (3, 10, '유세정', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (4, 3, '윤동섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (5, 13, '대우석', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (6, 13, '대우석', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (7, 13, '대우석', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (8, 14, '김주영', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (9, 15, '김정원', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (10, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (11, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (12,7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (13,7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (14,  12, '노현정', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (15,  7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (16, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (17, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (18, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (19,7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (20, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (21, 11, '이수현', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (22, 16, '이재진', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (23, 17, '강동수', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (24, 18, '김자은', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (25, 19, '장범수', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (26, 20, '김현정', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (27, 21, '이순신', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (28, 22, '유관순', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (29, 23, '장영실', '0000-00-00 00:00:00', 'N', '','Y');


-- 코드공통 테이블 생성
CREATE TABLE TBL_MOA_CD_BAS(
ITG_CD_GROUP_ID VARCHAR(5) NOT NULL,
ITG_CD_GROUP_NM VARCHAR(60) NOT NULL,
CD_ID VARCHAR(30) NOT NULL,
CD_NM VARCHAR(60) NOT NULL,
RFRN_VAL1 VARCHAR(100),
RFRN_VAL2 VARCHAR(100)
);


-- 코드공통 테이블 데이터 INSERT
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('DDC', '담당코드', 'D01', '고객담당');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('DDC', '담당코드', 'D02', '빌링담당');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('DDC', '담당코드', 'D03', 'CRM담당');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T01', '고객운영팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T02', '고객개발1팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T03', '고객개발2팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T04', '유통서비스팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T05', 'Rater서비스팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T06', '빌링운영팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T07', '빌링개발팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T08', 'PAY서비스팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T09', '고객DX솔루션팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T10', 'CRM사업팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T11', 'CRM서비스팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T12', '오픈채널서비스팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T13', '오픈채널사업TF');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T14', 'BSS 품질혁신팀');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TDC', '팀코드', 'T15', 'IT 컨설팅팀');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SDC', '상태코드', 'R', '등록');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SDC', '상태코드', 'U', '수정');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SDC', '상태코드', 'D', '삭제');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L01', 'AntBot');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L02', 'Python');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L03', 'JAVA');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L04', 'JavaScript');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L05', 'C#');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('LDC', '언어코드', 'L06', 'C++');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S01', 'DT플랫폼');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S02', 'MVNE플랫폼');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S03', '비바체');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S04', 'ITSM');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S05', 'ICIS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S06', 'K-RDS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S07', 'K-Note');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S08', 'MVNO-RDS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S09', 'M-RDS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S10', 'KOS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S11', '스마트신청서');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S12', '케이티닷컴');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S13', 'KT샵');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S14', '마이페이지');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S15', 'WORKS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S16', '그룹메일');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('SYD', '시스템코드', 'S17', 'JIRA');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C01', '매일');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C02', '매주');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C03', '매월');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C04', '배포날');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C05', '배포후');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C06', '배포전');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CDC', '작동시기', 'C07', '수시');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('RRC', '응답결과', 'R01', '메일');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('RRC', '응답결과', 'R02', 'SMS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('RRC', '응답결과', 'R03', '메일+SMS');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('RRC', '응답결과', 'R04', '없음');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TSC', '장애대응', 'B01', '담당자직접재수행');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('TSC', '장애대응', 'B02', '자동재수행');

INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CEC', '접속환경', 'E01', '로컬');
INSERT INTO TBL_MOA_CD_BAS(ITG_CD_GROUP_ID, ITG_CD_GROUP_NM, CD_ID, CD_NM) VALUES ('CEC', '접속환경', 'E02', '사외망');
-- select * from TBL_MOA_CD_BAS;