var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

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
    'user_tel_no':req.body.user.user_tel_no,
    'user_nm': req.body.user.user_nm,
    'user_id': req.body.user.user_id,
    'user_pwd': req.body.user.user_pwd,
    'team_div_cd' : req.body.user.default_team.idx,
    'emp_pos_div_cd' : req.body.user.default_team.idx2
  }
  console.log(user);
  // const team_div_cd ={
  //   'team_div_cd' : req.body.team_div_cd.idx,
  //   'emp_pos_div_cd' : req.boby.team_div_cd.idx2
  // }
  // console.log(team_div_cd);
  connection.query('SELECT user_id FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    console.log(res);
    if (row[0] == undefined){ //  동일한 아이디가 없을경우,
      const salt = bcrypt.genSaltSync();
      const encryptedPassword = bcrypt.hashSync(user.user_pwd, salt);
      connection.query('INSERT INTO TBL_MOA_USER_BAS (user_id, user_pwd, user_tel_no, user_nm, upld_cascnt, team_div_cd, emp_pos_div_cd ) VALUES ("' + user.user_id + '","' + encryptedPassword + '", "' + user.user_tel_no + '", "' + user.user_nm + '","' + 0 + '","' + user.team_div_cd + '","' + user.emp_pos_div_cd + '")', user, function (err, row2) {
        if (err) throw err;
      });
      res.json({
        success: true,
        message: '회원가입이 완료되었습니다.'
      })
    }
    else {
      res.json({
        success: false,
        message: '이미 있는 아이디입니다. 다른 아이디를 입력해주세요.'
      })
    }
  });
});

router.post('/login', function (req, res) {
  console.log("로그인");
  const user = {
    'user_id': req.body.user.user_id,
    'user_pwd': req.body.user.user_pwd
  };

  connection.query('SELECT user_id, user_pwd FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    if (err) {
      console.log(err);
    }else{
      if(row[0]===undefined){
        res.json({
          success:false,
          message : '아이디가 틀립니다.'
        })
      }
      if (row[0] !== undefined && row[0].user_id === user.user_id) {
        bcrypt.compare(user.user_pwd, row[0].user_pwd, function (err, res2) {
          if (res2) {
            console.log(res2);
            // req.session.is_logined = true;
            req.session.user=row[0];
            req.session.save();
            res.json({ // 로그인 성공 
              token: req.session,
              success: true,
              message: '로그인 성공'
            })
          }
          else {
            res.json({ // 매칭되는 아이디는 있으나, 비밀번호가 틀린 경우            success: false,
              success:false,
              message: '비밀번호가 틀립니다.'
            })
          }
        })
      }
    }
  })
});

//아이디로 정보 조회
router.post('/userinfo', function (req, res) {
  console.log("정보조회");
  
  const users = {
    'user_id': req.body.user_id,
  };
  console.log(users.user_id);
  connection.query('SELECT * FROM TBL_MOA_USER_BAS WHERE user_id = "' + users.user_id + '"', function (err, rows) {
    if (err) throw err;
    console.log(rows);
    res.send(rows);
    });
});




router.post('/pwReset', function (req, res) {
  console.log("비밀번호 초기화");
  const user = {
    'user_id': req.body.user.user_id,
    'user_pwd': req.body.user.user_pwd,
    'confirm_user_pwd' : req.body.user.confirm_user_pwd
  };

  connection.query('SELECT * FROM TBL_MOA_USER_BAS WHERE user_id = "' + user.user_id + '"', function (err, row) {
    if (row[0] == undefined){ //  동일한 아이디가 없을경우,
      res.json({
        success: false,
        message: '아이디를 다시 입력해주세요.'
      })
    }
    else {
      if(user.user_pwd == user.confirm_user_pwd){
        bcrypt.compare(user.user_pwd, row[0].USER_PWD, function (err, res2) {
          console.log(res2);
          if(res2){
            res.json({
              success: false,
              message: '이전 비밀번호와 일치합니다.'
            })
          }else{
            const salt = bcrypt.genSaltSync();
            const encryptedPassword = bcrypt.hashSync(user.user_pwd, salt);
            connection.query('UPDATE TBL_MOA_USER_BAS SET user_pwd = "' + encryptedPassword + '" where user_id = "' + user.user_id + '"', user, function (err, row2) {
              if (err) throw err;
            });
            res.json({
              success: true,
              message: '비밀번호 초기화가 완료되었습니다.'
            })
          }
        });
      }else{
        res.json({
          success: false,
          message: '비밀번호가 일치하지 않습니다.'
        })
      }
    }
  });
  
});

//업로드 업데이트
router.post('/uploadUpdate', function(req,res){
  const user = {
    'CUST_IDFY_SEQ': req.body.users.CUST_IDFY_SEQ,
  };
  console.log(user.CUST_IDFY_SEQ);
  connection.query('UPDATE TBL_MOA_USER_BAS SET UPLD_CASCNT = UPLD_CASCNT+ 1 where CUST_IDFY_SEQ = "' + user.CUST_IDFY_SEQ + '"', user, function (err, row2){
    if(err) throw err;
    console.log(row2);
    res.send(row2);
  });
});




/////////////////////////////////통계////////////////////////////////////
//담당별 자동화 건수
router.post('/div_cnt', function(req,res){
  console.log("담당별 자동화 건수");
  connection.query('select e.cd_nm, sum(upld_cascnt) as upld_cascnt from tbl_moa_user_bas as m, TBL_MOA_CD_BAS as e where m.EMP_POS_DIV_CD = e.CD_ID group by EMP_POS_DIV_CD',function(err,rows){
    if(err) throw err;
    console.log(rows);
    res.send(rows);
  });
});


//팀별 자동화 건수
router.post('/team_cnt', function(req,res){
  console.log("팀별 자동화 건수");
  connection.query('select e.cd_nm, sum(upld_cascnt) as upld_cascnt from tbl_moa_user_bas as m, TBL_MOA_CD_BAS as e where m.team_div_cd = e.CD_ID group by team_div_cd',function(err,rows){
    if(err) throw err;
    console.log(rows);
    res.send(rows);
  });
});

//업무 목적별 팀별 현황
router.post('/work_prps',function(req,res){
  console.log("업무 목적별 팀별 현황");
  // connection.query('')
});


//기술별 자동화 건수
router.post('/lang_cnt', function(req,res){
  console.log("기술별 자동화 건수");
  connection.query('select e.cd_nm, count(lang_cd) as upld_cascnt from tbl_moa_bas as m, TBL_MOA_CD_BAS as e where m.lang_cd = e.CD_ID group by lang_cd',function(err,rows){
    if(err) throw err;
    console.log(rows);
    res.send(rows);
  });
});
////////////////////////////통계 끝//////////////////////////////////////////////////


module.exports = router;
