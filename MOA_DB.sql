CREATE DATABASE MOA_DB;

USE MOA_DB;

drop table tbl_moa_cd_bas;
drop table tbl_moa_execution_txn;
drop table tbl_moa_hst;
drop table tbl_moa_bas;
drop table tbl_moa_user_bas;












SELECT DISTINCT m.FILE_SEQ, m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where SROC_FILE_PATH_NM LIKE "%a%";

               --      + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where DOW_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where DATA_EXE_TIME LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where INPUT_VAL LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where TRT_STEP_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where ATTEN_MTR_SBST LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where ATC_FILE_MANUAL_YN LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where ATC_FILE_UPLD_PATH_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where OTPUT_SBST LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where ETC_SBST LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where EXE_SBST LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where NTCART_TITLE_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where TKCGR_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where RUSER_NM LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where DTL_DESC_SBST LIKE "%' + search.search_text +'%";'
--                     + 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE, m.FILE_SEQ FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where WRKJOB_PRPS_NM LIKE "%' + search.search_text +'%";'






























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

update tbl_moa_user_bas set UPLD_CASCNT = 0 where CUST_IDFY_SEQ =1; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ=3;
update tbl_moa_user_bas set UPLD_CASCNT = 2 where CUST_IDFY_SEQ =4; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =6; 
update tbl_moa_user_bas set UPLD_CASCNT = 1 where CUST_IDFY_SEQ =7; 
-- select * from tbl_moa_user_bas;
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

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (3, '\\download\\moa.xml', 'L01', 'S01', 'C01', '','10:00', 'R01', 'B01', '', 
'완료', 'E01', '실환경에서 개통과 기기변경이 실제로 이루어지는 것이기 때문에 그날 퇴근하기전에 개통하기 전과 기기변경되기 전으로 다시 정보들을 원복시켜주어야한다.', 'N', '', 'Y/N', '', '윈도우상 스케줄러를 통해 실행한다.', '조근점검', '윤동섭', '윤동섭', '2021-06-15', '2021-06-15', '9999-12-31','DT플랫폼, MVNO플랫폼 시스템 조근점검 자동수행','고객업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (4, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', 'ITSM login id, pw, fp공수 입력된 파일위치', 
'완료', 'E01', 'fp공수 입력된 파일이 정해진 형식에 밪게 작성되어야 한다.', 'N', '', 'N', '', '형식에 맞게 실행시 필요한 전보가 있는 파일을 작성하고, 파이썬 파일에 직접 ITSM login id, pw, fp공수 입력된 파일 위치를 입력하여 실행', 'ITSM AP변경단계 처리 자동화', '이은주', 'kt ds 개발 BA', '2021-06-30', '2021-06-30', '9999-12-31','ITSM AP변경등록~개발 SR승인 요청 단계 자동 수행','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (4, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', '스펙번호, 공수, email', 
'완료', 'E01', '', 'N', '', 'N', '스펙 처리를 통해 srm번호를 가져온다.', '파이썬 파일에 스펙번호, 공수, 이메일을 입력하고 실행', 'ITSM 개발 spec 처리 자동화', '이은주', 'kt ds 개발 BA', '2021-07-01', '2021-07-01', '9999-12-31','ITSM SPEC ~ AP변경 등록 처리 자동화','스탭업무대상');


INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (7, '\\download\\moa.xml', 'L01', 'S06', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검', '황윤섭', '황윤섭','2021-07-05', '2021-07-05', '9999-12-31','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_BAS(CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, 
TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, 
ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (6, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','06:00', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '.', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'MVNO-RDS 시스템 상세점검', '정대균', '정대균', '2021-06-15', '2021-06-15', '9999-12-31','MVNO-RDS 시스템 영역의 Portal, UI,배치, PWC, FDH연동 등 상세 점검','스탭업무대상');


alter table tbl_moa_bas add FULLTEXT(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM,DTL_DESC_SBST);
alter table tbl_moa_bas add FULLTEXT(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD);

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

-- SELECT * FROM TBL_MOA_HST;
-- delete from TBL_MOA_HST where file_seq = 10;



-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L01*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L03*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("L04*" in boolean mode) and e.LAST_HST_YN="Y";
-- SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("S17*" in boolean mode) and e.LAST_HST_YN="Y";

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (1,3, '\\download\\moa.xml', 'L01', 'S01', 'C01', '','10:00', 'R01', 'B01', '', 
'완료', 'E01', '실환경에서 개통과 기기변경이 실제로 이루어지는 것이기 때문에 그날 퇴근하기전에 개통하기 전과 기기변경되기 전으로 다시 정보들을 원복시켜주어야한다.', 'N', '', 'Y/N', '', '윈도우상 스케줄러를 통해 실행한다.', '조근점검', '윤동섭', '윤동섭', '2021-06-15', '9999-12-31', 'Y', 'N', 'R','DT플랫폼, MVNO플랫폼 시스템 조근점검 자동수행','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (2,4, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', 'ITSM login id, pw, fp공수 입력된 파일위치', 
'완료', 'E01', 'fp공수 입력된 파일이 정해진 형식에 밪게 작성되어야 한다.', 'N', '', 'N', '', '형식에 맞게 실행시 필요한 전보가 있는 파일을 작성하고, 파이썬 파일에 직접 ITSM login id, pw, fp공수 입력된 파일 위치를 입력하여 실행', 'ITSM AP변경단계 처리 자동화', '이은주', 'kt ds 개발 BA', '2021-06-30', '9999-12-31', 'Y', 'N', 'R','ITSM AP변경등록~개발 SR승인 요청 단계 자동 수행','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (3,4, '\\download\\moa.xml', 'L02', 'S04', 'C03', '29일','10:00', 'R04', 'B01', '스펙번호, 공수, email', 
'완료', 'E01', '', 'N', '', 'N', '스펙 처리를 통해 srm번호를 가져온다.', '파이썬 파일에 스펙번호, 공수, 이메일을 입력하고 실행', 'ITSM 개발 spec 처리 자동화', '이은주', 'kt ds 개발 BA', '2021-07-01','9999-12-31', 'Y', 'N', 'R','ITSM SPEC ~ AP변경 등록 처리 자동화','스탭업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (4,7, '\\download\\moa.xml', 'L01', 'S06', 'C01', '','05:50', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', '조근점검', '황윤섭', '황윤섭', '2021-07-05', '9999-12-31', 'Y', 'N', 'R','K-RDS, K-Note, MVNO-RDS, M-RDS 시스템 조근점검 자동 수행','고객업무대상');

INSERT INTO TBL_MOA_HST(FILE_SEQ, CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, 
DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, 
OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST,WRKJOB_PRPS_NM) 
VALUES (5,6, '\\download\\moa.xml', 'L01', 'S08', 'C01', '','06:00', 'R03', 'B01', '', 
'완료', 'E01', '9시 이전 수행시 전사 발송, 9시 이후 수행시 내부 테스트 발송', 'N', '', '점검결과 메일+SMS', '', 'AntBot Manager 서버(AntBot 웹 페이지)에 등록해 놓은 스케줄에 따라 자동수행됨', 'MVNO-RDS 시스템 상세점검', '정대균', '정대균', '2021-06-15', '9999-12-31', 'Y', 'N', 'R','MVNO-RDS 시스템 영역의 Portal, UI,배치, PWC, FDH연동 등 상세 점검','스탭업무대상');

-- select * from TBL_MOA_EXECUTION_TXN;
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
VALUES (1, 3, '윤동섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (2, 4, '이은주', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (3, 4, '이은주', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (4, 7, '황윤섭', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (5, 6, '정대균', '0000-00-00 00:00:00', 'N', '','Y');

INSERT INTO TBL_MOA_EXECUTION_TXN(FILE_SEQ, CUST_IDFY_SEQ, EXE_EMP_NM, EXE_DATE, ERR_YN, ERR_MSG_SBST,LAST_HST_YN) 
VALUES (1, 4, '최민혜', sysdate(), 'N', '','Y');

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