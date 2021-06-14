var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');

//추가한 부분
// const mariadb = require('mariadb');
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

router.get('/', function (req, res) {
  console.log("메인");
  connection.query('SELECT * FROM TBL_MOA_USER_BAS', function (err, rows) {
    if (err) throw err;
    res.send(rows);
  });
});

router.post('/signUp', function (req, res) {
  console.log("회원가입");
  const user = {
    'user_id': req.body.user.user_id,
    'user_name': req.body.user.user_name,
    'password': req.body.user.password
  };
  connection.query('SELECT user_id FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    if (row[0] == undefined){ //  동일한 아이디가 없을경우,
      const salt = bcrypt.genSaltSync();
      const encryptedPassword = bcrypt.hashSync(user.password, salt);
      connection.query('INSERT INTO TBL_MOA_USER_BAS (dept_idx, user_id, password, phone_num, user_name, upload_cnt) VALUES (1, "' + user.user_id + '","' + encryptedPassword + '", "' + '010-1234-5678' + '", "' + user.user_name + '", 2)', user, function (err, row2) {
        if (err) throw err;
      });
      res.json({
        success: true,
        message: 'Sing Up Success!'
      })
    }
    else {
      res.json({
        success: false,
        message: 'Sign Up Failed Please use anoter ID'
      })
    }
  });
  
});
router.post('/login', function (req, res) {
  console.log("로그인");
  const user = {
    'user_id': req.body.user.user_id,
    'password': req.body.user.password
  };
  connection.query('SELECT user_id, password FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    if (err) {
      console.log
    }else{
      if(row[0]===undefined){
        res.json({
          success:false,
          message : '아이디가 틀립니다.'
        })
      }
      if (row[0] !== undefined && row[0].user_id === user.user_id) {
        bcrypt.compare(user.password, row[0].password, function (err, res2) {
          if (res2) {
            req.session.is_logined = true;
            req.session.user_id =req.body.user.user_id; 
            res.json({ // 로그인 성공 
              success: true,
              message: '로그인 성공'
            })
          }
          else {
            res.json({ // 매칭되는 아이디는 있으나, 비밀번호가 틀린 경우            success: false,
              message: '비밀번호가 틀립니다.'
            })
          }
        })
      }
    }
  })
});

router.post('/pwReset', function (req, res) {
  console.log("비밀번호 초기화");
  const user = {
    'user_id': req.body.user.user_id,
    'password1' : req.body.user.password1,
    'password2' : req.body.user.password2
  };

  connection.query('SELECT user_id FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    if (row[0] == undefined){ //  동일한 아이디가 없을경우,
      res.json({
        success: false,
        message: 'PW Reset Failed Please check your ID'
      })
    }
    else {
      if(user.password1 == user.password2){
        const salt = bcrypt.genSaltSync();
        const encryptedPassword = bcrypt.hashSync(user.password1, salt);
        connection.query('UPDATE TBL_MOA_USER_BAS SET password = "' + encryptedPassword + '" where user_id = "' + user.user_id + '"', user, function (err, row2) {
          if (err) throw err;
        });
        res.json({
          success: true,
          message: 'PW Reset Success!'
        })
      }else{
        res.json({
          success: false,
          message: '비밀번호가 동일하지 않습니다.'
        })
      }
      
    }
  });
  
});

module.exports = router;
