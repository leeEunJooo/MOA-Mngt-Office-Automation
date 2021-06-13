var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');

//추가한 부분
var mysql = require('mysql');
// Connection 객체 생성 
var connection = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root',   
  password: 'wjdeorbs92',
  database: 'pwa_crud'  
});  
// Connect
connection.connect(function (err) {   
  console.log("connection start!");
  if (err) {     
    console.error('mysql connection error');     
    console.error(err);     
    throw err;   
  } 
});

// /* GET users listing. */
// router.get('/', function(req, res, next) {
//   res.send('respond with a resource');
// });

router.get('/', function (req, res) {
  console.log("start!");
  connection.query('SELECT * FROM users', function (err, rows) {
    if (err) throw err;
    res.send(rows);
  });
});

router.post('/signUp', function (req, res) {
  console.log("singup start!");
  const user = {
    'userid': req.body.user.userid,
    'name': req.body.user.name,
    'password': req.body.user.password
  };
  console.log("req : " + req.body.user.userid);
  console.log("req : " + req.body.user.name);
  console.log("req : " + req.body.user.password);

  connection.query('SELECT userid FROM users WHERE userid = "' + user.userid + '"', function (err, row) {
    console.log("aaa : ");

    if (row[0] == undefined){ //  동일한 아이디가 없을경우,
      const salt = bcrypt.genSaltSync();
      const encryptedPassword = bcrypt.hashSync(user.password, salt);
      connection.query('INSERT INTO users (userid,name,password) VALUES ("' + user.userid + '","' + user.name + '","' + encryptedPassword + '")', user, function (err, row2) {
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
  console.log("login start : ");
  const user = {
    'userid': req.body.user.userid,
    'password': req.body.user.password
  };
  connection.query('SELECT userid, password FROM users WHERE userid = "' + user.userid + '"', function (err, row) {
    if (err) {
      res.json({ // 매칭되는 아이디 없을 경우
        success: false,
        message: 'Login failed please check your id or password!'
      })
    }
    if (row[0] !== undefined && row[0].userid === user.userid) {
      bcrypt.compare(user.password, row[0].password, function (err, res2) {
        if (res2) {
          res.json({ // 로그인 성공 
            success: true,
            message: 'Login successful!'
          })
        }
        else {
          res.json({ // 매칭되는 아이디는 있으나, 비밀번호가 틀린 경우            success: false,
            message: 'Login failed please check your id or password!'
          })
        }
      })
    }
  })
});

module.exports = router;
