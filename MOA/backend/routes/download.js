var express = require('express');
var router = express.Router();

var fs = require('fs'); //파일 로드 사용
var path = require('path');
var mime = require('mime');
//npm i iconv-lite
//npm i mime
//이거 두개 설치해야함

var getDownloadFilename = require('./library/getDownloadFilename').getDownloadFilename;

//자동화업무 파일 다운로드
router.get('/:file_name', function(req, res, next) {
  var upload_folder = path.join(__dirname,"../uploads/");
  var file = upload_folder + req.params.file_name; // ex) /upload/files/sample.txt
  console.log(file);
  try {
    if (fs.existsSync(file)) { // 파일이 존재하는지 체크
      var filename = path.basename(file); // 파일 경로에서 파일명(확장자포함)만 추출
      var mimetype = mime.getType(file); // 파일의 타입(형식)을 가져옴
      res.setHeader('Content-disposition', 'attachment; filename=' + getDownloadFilename(req, filename)); // 다운받아질 파일명 설정
      res.set('Content-type', mimetype); // 파일 형식 지정
    
      var filestream = fs.createReadStream(file)
      .pipe(res)
      .on('finish',()=>{
        console.log('download complete');
      })


    //   res.download(file);
    } else {
        res.send('해당 파일이 없습니다.');
      return;
    }1.
  } catch (e) { // 에러 발생시
    console.log(e);
    res.send('파일을 다운로드하는 중에 에러가 발생하였습니다.');
    return;
  }
});

//메뉴얼파일 다운로드
router.get('/menu/:file_name', function(req, res, next) {
    var upload_folder = path.join(__dirname,"../menu_uploads/");
    var file = upload_folder + req.params.file_name; // ex) /upload/files/sample.txt
    console.log(file);
    try {
      if (fs.existsSync(file)) { // 파일이 존재하는지 체크
        var filename = path.basename(file); // 파일 경로에서 파일명(확장자포함)만 추출
        var mimetype = mime.getType(file); // 파일의 타입(형식)을 가져옴
        res.setHeader('Content-disposition', 'attachment; filename=' + getDownloadFilename(req, filename)); // 다운받아질 파일명 설정
        res.set('Content-type', mimetype); // 파일 형식 지정
      
        var filestream = fs.createReadStream(file)
        .pipe(res)
        .on('finish',()=>{
          console.log('download complete');
        })
  
  
      //   res.download(file);
      } else {
          res.send('해당 파일이 없습니다.');
        return;
      }
    } catch (e) { // 에러 발생시
      console.log(e);
      res.send('파일을 다운로드하는 중에 에러가 발생하였습니다.');
      return;
    }
  });


  // 파일 읽어오기
  router.post('/readfile/:file_name', function(req, res, next) {
    var upload_folder = path.join(__dirname,"../uploads/");
    //파일 경로 지정
    var file = upload_folder + req.params.file_name; // ex) /upload/files/sample.txt
    //파일읽기(동기식IO메소드)
    var data = fs.readFileSync(file,'utf8');
    // console.log(data);
    if(data == ""){
      res.send("파일이 없습니다.");
    }else{
      res.send(data);
    }
  });
module.exports = router;