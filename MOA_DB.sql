CREATE DATABASE MOA_DB;

USE MOA_DB;
 
-- DROP TABLE TbL_MOA_DEPT_BAS;

-- 부서 테이블 생성
CREATE TABLE TBL_MOA_DEPT_BAS(
DEPT_IDX INT NOT NULL auto_increment primary KEY,
TEAM_NAME VARCHAR(100) NOT NULL,
DEPT_NAME VARCHAR(100) NOT NULL
);

select * from tbl_moa_dept_bas;

insert into tbl_moa_dept_bas values (1,'1팀','1담당');
insert into tbl_moa_dept_bas values (2,'2팀','1담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('3팀','1담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('4팀','1담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('5팀','2담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('6팀','2담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('7팀','2담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('8팀','2담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('9팀','3담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('10팀','3담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('11팀','3담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('12팀','3담당');
insert into tbl_moa_dept_bas(TEAM_NAME, DEPT_NAME) values ('13팀','3담당');


-- 사용자 테이블 생성
CREATE TABLE TBL_MOA_USER_BAS(
USER_IDX INT NOT NULL auto_increment PRIMARY KEY,
DEPT_IDX INT NOT NULL,
USER_ID varchar(100) NOT NULL,
PASSWORD VARCHAR(100) NOT NULL,
PHONE_NUM VARCHAR(100) NOT NULL,
USER_NAME VARCHAR(100) NOT NULL,
UPLOAD_CNT INT,
foreign key(DEPT_IDX) references TBL_MOA_DEPT_BAS(DEPT_IDX)
);

insert into TBL_MOA_USER_BAS values (1,1,'moa','moa','010-1111-2222','모아', 0);

select * from tbl_moa_user_bas;

delete from tbl_moa_user_bas where user_idx='2';
delete from tbl_moa_user_bas where user_id='moa';

SELECT user_id, password FROM tbl_moa_user_bas WHERE user_id ='moa';

-- 자동화 파일 세부정보 테이블 생성
CREATE TABLE TBL_MOA_FILE_BAS(
FILE_IDX INT NOT NULL auto_increment primary KEY,
FILE_PATH VARCHAR(200),
USE_TECH VARCHAR(100) NOT NULL,
TARGET_SYSTEM VARCHAR(100) NOT NULL,
EXECUTION_TIME VARCHAR(100) NOT NULL,
RESULT VARCHAR(100) NOT NULL,
WORKAROUND VARCHAR(100) NOT NULL,
INPUT_DATA VARCHAR(500),
PROCESS_STATUS VARCHAR(100) NOT NULL,
EXECUTION_METHOD VARCHAR(500) NOT NULL,
EXECUTION_ENV VARCHAR(100) NOT NULL,
NOTICE VARCHAR(500),
MANUAL_YN VARCHAR(100) NOT NULL,
MANUAL_PATH VARCHAR(200),
USER_NM VARCHAR(100) NOT NULL,
MANAGER VARCHAR(100) NOT NULL,
OUTPUT_DATA VARCHAR(500) NOT NULL,
ETC VARCHAR(500),
EFCT_FNS_DT date,
EFCT_ST_DT DATE
);

-- 자동화목록 테이블 생성
CREATE TABLE TBL_MOA_AUTO_LIST_BAS(
AUTO_LIST_IDX INT NOT NULL auto_increment primary KEY,
USER_IDX INT NOT NULL,
FILE_IDX INT NOT NULL,
TITLE_NM VARCHAR(200) NOT NULL,
WRITER varchar(100) NOT NULL,
UPLOAD_DATE DATE,
EFCT_FNS_DT date,
EFCT_ST_DT DATE,
foreign key(USER_IDX) references TBL_MOA_USER_BAS(USER_IDX),
foreign key(FILE_IDX) references TBL_MOA_FILE_BAS(FILE_IDX)
);

-- 자동화 파일 이력 테이블 생성
CREATE TABLE TBL_MOA_FILE_HST(
USER_IDX INT NOT NULL,
DEPT_IDX INT NOT NULL,
FILE_IDX INT NOT NULL,
FIRST_UPLOAD_DATE DATE,
LATEST_UPLOAD_DATE DATE,
LAST_HST_YN VARCHAR(100),
STATUS_CD VARCHAR(100) NOT NULL,
foreign key(STATUS_CD) references HST_STATUS_CD(STATUS_CD),
primary key(USER_IDX,DEPT_IDX,FILE_IDX)
);

-- 이력 상태 테이블 생성
create TABLE HST_STATUS_CD(
STATUS_CD VARCHAR(100) NOT NULL primary KEY,
STATUS_CD_NAME VARCHAR(100) NOT NULL
);

-- 실행 테이블 생성
CREATE TABLE TBL_MOA_EXECUTION_TXN(
AUTO_LIST_IDX INT NOT NULL,
USER_IDX INT NOT NULL,
FILE_IDX INT NOT NULL,
EXECUTION_USER VARCHAR(100) NOT NULL,
ERROR_YN VARCHAR(100) NOT NULL,
EXECUTION_DATE DATE,
LAST_HST_YN VARCHAR(100),
ERROR_FIELD VARCHAR(200),
primary key(AUTO_LIST_IDX,USER_IDX,FILE_IDX)
);
