let sql = require("mssql");
const config = require('./getConfig')().database;
let pool = null;
let connection = null;
let connectDbPool = () => {
    connection = new sql.ConnectionPool(config).connect().then(result => {
        console.log("ok");
        pool = result;
    }).catch(err => {
        console.log(err);
        connectDbPool();
    });
};
connectDbPool();


module.exports = function () {
    return pool;
}