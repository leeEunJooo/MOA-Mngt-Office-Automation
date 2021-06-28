var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

  //목록 올 조회
  router.get('/selectList', function (req, res) {
    console.log("메인");
    connection.query('SELECT m.FILE_SEQ, m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq ', function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });
  });

  

  
  //목록 검색

  //목록 등록


  //목록 수정

  //목록 검색
  router.post('/search', function (req, res) {
    console.log("목록 검색");

    const search = {
      'search_select_code': req.body.search_select.code,
      'search_text': req.body.search_text,
    };

    console.log("search_select_code : ", search.search_select_code);
    console.log("search_text : ", search.search_text);


    // if문으로 대분류 확인
    if (search.search_select_code.includes("ETC")) {
      console.log("코드 테이블에 포함되어 있지 않은 경우");
      connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM) against("' + search.search_text + '*" in boolean mode)', function (err, rows) {
        if (err) throw err;
        console.log(rows);
        res.send(rows);
      });
    } else {
      console.log("코드 테이블에 포함되어 있는 경우");
      connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "' + search.search_text + '"', function (err, row) {
        if (err) throw err;
        console.log(row);
        console.log(row[0]);
        console.log(row[0].CD_ID);
        // res.send(row);

        connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("' + row[0].CD_ID + '*" in boolean mode)', function (err, rows) {
          if (err) throw err;
          console.log(rows);
          res.send(rows);
        });
      });
    }

    // 공통코드가서 맞는거 가지고 오기

    // tbl_moa_bas에서 맞는거 뿌려주기

    // connection.query('SELECT * FROM TBL_MOA_BAS', function (err, rows) {
    //   if (err) throw err;
    //   console.log(rows);
    //   res.send(rows);
    // });
  });

  //detail
  router.post('/listDetail/:id', function (req, res) {
    const id = parseInt(req.params.id);
    connection.query('SELECT * FROM TBL_MOA_BAS WHERE FILE_SEQ='+id, function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });

  });

module.exports = router;