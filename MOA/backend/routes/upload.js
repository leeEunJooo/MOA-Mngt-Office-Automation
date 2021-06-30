// var express = require('express');
// var router = express.Router();
// var multer = require('multer');


// var storage  = multer.diskStorage({
//     destination(req, file, cb) {
//       cb(null, 'uploadedFiles/');
//     },
//     filename(req, file, cb) {
//       cb(null, `${Date.now()}__${file.originalname}`);
//     },
//   });
//   var upload = multer({ dest: 'uploadedFiles/' });
//   var uploadWithOriginalFilename = multer({ storage: storage });
  
//   router.get('/', function(req,res){
//     res.render('upload');
//   });
  
//   router.post('/uploadFile', upload.single('attachment'), function(req,res){
//     res.render('confirmation', { file:req.file, files:null });
//   });
  
//   router.post('/uploadFileWithOriginalFilename', uploadWithOriginalFilename.single('attachment'), function(req,res){
//     res.render('confirmation', { file:req.file, files:null });
//   });
  
//   router.post('/uploadFiles', upload.array('attachments'), function(req,res){
//     res.render('confirmation', { file: null, files:req.files} );
//   });
  
//   router.post('/uploadFilesWithOriginalFilename', uploadWithOriginalFilename.array('attachments'), function(req,res){
//     res.render('confirmation', { file:null, files:req.files });
//   });
  
//   module.exports = router;
var express = require('express');
var router = express.Router();
var createError = require('http-errors')
var multer = require('multer'); //express에 multer모듈 적용(for 파일업로드)
// var upload = multer({dest:'uploads/'}) 
// 입력한 파일이 uploads/폴더 내에 저장된다.
// multer라는 모듈이 함수라서 함수에 옵션능 ㄹ줘서 실행을 시키면, 해당 함수는 미들웨어를 리턴한다.

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;


  router.post('/upload', multer({ dest: 'uploads/' }).single('bin') ,(req, res, next) => {
    console.log(req.body)
    console.log(req.file)
    res.status(204).send()
  })
  


module.exports = router;