var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');


var mysql = require('mysql');
// Connection 객체 생성 
var connection = mysql.createConnection({
  host: '127.0.0.1',
  port: 3307,
  user: 'root',   
  password: 'wjdeorbs92',
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
    connection.query('SELECT * FROM TBL_MOA_BAS', function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });
  });

  //목록 등록
router.post('/insertList',function(req,res){
  console.log("목록 등록");
  const list = {
    'CUST_IDFY_SEQ': req.body,
    'SROC_FILE_PATH_NM': "",
    'LANG_CD': "",
    'SYS_DIV_CD': "",
    'CYCL_DATE_TYPE_CD': "",
    'DOW_NM': "",
    'DATA_EXE_TIME': "",
    'RPY_RESLT_CD': "",
    'TROBL_SVC_TYPE_CD': "",
    'INPUT_VAL':"",
    'TRT_STEP_NM': "",
    'CONN_EVN_DIV_CD':"",
    'ATTEN_MTR_SBST': "",
    'ATC_FILE_MANUAL_YN': "",
    'ATC_FILE_UPLD_PATH_NM': "",
    'OTPUT_SBST': "",
    'ETC_SBST': "",
    'EXE_SBST': "",
    'NTCART_TITLE_NM': "",
    'TKCGR_NM': "",
    'RUSER_NM': "",
    'FIRST_REG_DATE': "",
    'CHG_DATE':"",
    'FNS_DATE': "",
  }
  connection.query('select ')
})


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

    connection.query('SELECT * FROM TBL_MOA_BAS', function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });
  });
  
module.exports = router;