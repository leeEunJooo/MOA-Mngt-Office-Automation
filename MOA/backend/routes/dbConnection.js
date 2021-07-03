const mysql = require('mysql');
// Connection 객체 생성 
var connection = mysql.createConnection({
  host: '127.0.0.1',
  port: 3307,
  user: 'root',   
  password: 'wjdeorbs92',
  database: 'MOA_DB'  
});

// Connect
connection.connect(function (err) {   
  console.log("MOA_DB 접속");
  if (err) {     
    console.error('mysql connection error');     
    console.error(err);     
    throw err;   
  } 
});

module.exports = {mysql, connection};