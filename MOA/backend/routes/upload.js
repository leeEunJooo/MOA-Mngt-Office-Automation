var express = require('express');
var router = express.Router();
//npm install multer --save 설치해야함.
var multer = require('multer');
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
})
var menu_storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'menu_uploads/') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
})
var uploader = multer({storage : storage});
var menu_uploader = multer({storage: menu_storage});
const fs = require('fs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

  
  //자동화 파일 업로드
  router.post('/upload',uploader.single('filepath'), (req, res, next) => {
    
    console.log('파일 업로드');
    var filepath = '\\\\uploads\\\\'+ req.file.filename;
  
    console.log(filepath);
    console.log(req.body);

    const File={
      'FILE_SEQ':req.body.file_seq,
    }
    
    connection.query('UPDATE TBL_MOA_BAS SET SROC_FILE_PATH_NM = "'+filepath +'" WHERE FILE_SEQ = "'+ File.FILE_SEQ+'"',File,function(err,row){
      if(err) throw err;
      console.log(row);
      res.send(row);
    })
   
  });

  //메뉴얼 파일 업로드

  router.post('/menu_upload',menu_uploader.single('filepath'), (req, res, next) => {
    
    console.log('메뉴얼 파일 업로드');
    var filepath = '\\\\menu_uploads\\\\'+ req.file.filename;
  
    console.log(filepath);
    console.log(req.body);

    const File={
      'FILE_SEQ':req.body.file_seq,
    }
    
    connection.query('UPDATE TBL_MOA_BAS SET ATC_FILE_UPLD_PATH_NM = "'+filepath +'" WHERE FILE_SEQ = "'+ File.FILE_SEQ+'"',File,function(err,row){
      if(err) throw err;
      console.log(row);
      res.send(row);
    })
  });
   


module.exports = router;