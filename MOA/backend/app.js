var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
// var multer = require('multer');
// var upload = multer({dest:'uploads/'})

var session = require('express-session'); // npm install express-session
var FileStore = require('session-file-store')(session) // npm install session-file-store

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/musers');
var listRouter = require('./routes/mlist');
var uploadRouter = require('./routes/upload');
var downloadRouter = require('./routes/download');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

//세션
app.use(session({
  key: 'sid',  //세션의 키값
  secret: 'secret', // 세션의 비밀 키, 쿠키값의 변조를 막기위해서 이 값을 통해 세션을 암호화 하여 저장
  resave: false, // 세션을 항상 저장할 지 여부(false 권장)
  saveUninitialized: true, // 세션이 저장되기 전에 uninitialize상태로 만들어 저장
  store: new FileStore(),
  cookie: { //쿠키설정
    maxAge: 1000 * 60 * 60 // 쿠키 유효기간 24시간
  }
}));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'uploads')));

app.use('/', indexRouter);
// app.use('/users', usersRouter);
app.use('/api/musers', usersRouter);
app.use('/api/mlist', listRouter);
app.use('/api/upload', uploadRouter);
app.use('/api/download', downloadRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
