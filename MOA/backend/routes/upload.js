var express = require('express');
var router = express.Router();

var multer = require('multer');
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
})
var uploader = multer({storage : storage});
const fs = require('fs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

  
  //파일 업로드
  router.post('/upload',uploader.single('filepath'),(req, res, next) => {
   
    console.log('파일 업로드');
    // console.log(File);
    console.log(req.file);
    res.send('성공');
  });



module.exports = router;