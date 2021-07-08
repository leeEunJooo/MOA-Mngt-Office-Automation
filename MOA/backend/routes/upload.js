var express = require('express');
var router = express.Router();

var multer = require('multer');
var upload = multer({ dest:'uploads/'})
const fs = require('fs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

  
  //파일 업로드
  router.post('/upload_page',upload.single('moafile'),(req, res, next) => {
    console.log('파일 업로드');
    console.log(req.body);
    console.log(req.file);
    res.send('성공');
  });
  


module.exports = router;