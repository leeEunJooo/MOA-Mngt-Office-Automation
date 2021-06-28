const mariadb = require('mariadb');
 
const pool = mariadb.createPool({
    host:'127.0.0.1', 
    port:3306,
    user: 'root',
    password: '4573',
    connectionLimit: 5
});

// pool.connect(function (err) {
//     if (err) {
//         console.error('mariadb connection error');
//         console.error(err);
//         throw err;
//     }
// });

async function GetUserList(){
    let conn, rows;
    try{
        conn = await pool.getConnection();
        conn.query('USE MOA_DB');
        rows = await conn.query('SELECT * FROM TBL_MOA_USER_BAS');
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

