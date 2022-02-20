const mysql = require('mysql')
const pool = mysql.createPool({
  onnectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "123456",
  database: "test",
  multipleStatements: true,
})

let query = function (sql, values) {
  return new Promise((resolve, reject) => {
    pool.getConnection(function (err, connection) {
      if (err) {
        reject(err)
      } else {
        connection.query(sql, values, (err, rows) => {
          if (err) {
            reject(err)
          } else {
            resolve(rows)
          }
          connection.release()
        })
      }
    })
  })
}

module.exports = { query }


// var mysql = require("mysql");
// var pool = mysql.createPool({
//   connectionLimit: 10,
//   host: "localhost",
//   user: "root",
//   password: "123456",
//   database: "test",
//   multipleStatements: true,
//   // debug:true,
// });
// //常规SQL
// let query = function (sql, arr = [], callback) {
//   //建立链接
//   pool.getConnection(function (err, connection) {
//     if (err) throw err;
//     connection.query(sql, arr, function (error, results, fields) {
//       //将链接返回到连接池中，准备由其他人重复使用
//       connection.release();
//       if (error) throw error;
//       //执行回调函数，将数据返回
//       callback && callback(results);
//     });
//   });
// };
// module.exports = {
//   query,
//   pool,
// };
