const mysql = require('mysql');
// Connection 객체 생성 
var connection = mysql.createConnection({
  host: '127.0.0.1',
  port: 3307,
  user: 'root',   
  password: '!New1234',
  database: 'MOA_DB'  
});

module.exports = {mysql, connection};