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
const bcrypt = require('bcryptjs');
var multer = require('multer');
const fs = require('fs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;


// var storage  = multer.diskStorage({
//     destination(req, file, cb) {
//       cb(null, 'uploads/');
//     },
//     filename(req, file, cb) {
//       cb(null, `${Date.now()}__${file.originalname}`);
//     },
//   });
  // var uploader = multer({ dest: 'uploads/' });
  // var uploadWithOriginalFilename = multer({ storage: storage });
  

  
  //파일 업로드
  router.post('/upload_page',multer({ dest:'uploads/'}).single('realFile'),(req,res,next) => {
    console.log('파일 업로드');
    console.log(req.body);
    console.log(req.file);
    res.send('성공');
  });
  


module.exports = router;