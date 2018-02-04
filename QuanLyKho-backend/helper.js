const moment = require('moment');
const sql = require('mssql')

let login = (username, password, callback) => {
    console.log(username, password)
    const pool = require('./db')();
    pool.request()
        .input('username', sql.VarChar, username)
        .input('password', sql.VarChar, password)
        .execute('sp_User_login')
        .then(result => {

            callback(null, result.recordset[0]);
        }).catch(err => {
            console.log("sp_User_login", err);
            callback(err, null)
        }
    );
};
module.exports = {
    login
};