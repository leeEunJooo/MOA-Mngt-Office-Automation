var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');


var mysql = require('mysql');
// Connection 객체 생성 
var connection = mysql.createConnection({
  host: '127.0.0.1',
  port: 3307,
  user: 'root',   
  password: '!New1234',
  database: 'MOA_DB'  
});
// Connect
connection.connect(function (err) {   
    console.log("MOA_DB 접속");
    if (err) {     
      console.error('mysql connection error');     
      console.error(err);     
      throw err;   
    } 
  });

  //목록 올 조회
  router.get('/selectList', function (req, res) {
    console.log("메인");
    connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq ', function (err, rows) {
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
      'search_select': req.body.search_select,
      'search_text': req.body.search_text,
    };

    console.log("search_select : ", search.search_select);
    console.log("search_text : ", search.search_text);


    // if문으로 대분류 확인

    // 공통코드가서 맞는거 가지고 오기

    // tbl_moa_bas에서 맞는거 뿌려주기

    connection.query('SELECT * FROM TBL_MOA_BAS', function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });
  });
  
module.exports = router;