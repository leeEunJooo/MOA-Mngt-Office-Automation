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



module.exports = router;