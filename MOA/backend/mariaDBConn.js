const mariadb = require('mariadb');
 
const pool = mariadb.createPool({
    host:'127.0.0.1', 
    port:3307,
    user: 'root',
    password: '!New1234',
    connectionLimit: 5
});
 
async function GetUserList(){
    let conn, rows;
    try{
        conn = await pool.getConnection();
        conn.query('USE MOA_DB');
        rows = await conn.query('show tables');
    }
    catch(err){
        throw err;
    }
    finally{
        if (conn) conn.end();
        return rows;
    }
}
 
module.exports = {
    getUserList: GetUserList
}

