var mysql = require('mysql');

// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".

var con = mysql.createConnection({
  host: 'localhost',
  user: 'student',
  password: 'student',
  database: 'chat'
});
  
con.connect(function(err) {
  if (err) {
    throw err;
  }
  console.log('Connected!');
});

module.exports = {
  getMessages: function (table) {
    con.query(`SELECT * FROM ${table}`, function (err, result, fields) {
      if (err) {
        throw err;
      }
      console.log(result);
    });
  },

  
  getUsers: function (table) {
    con.query(`SELECT * FROM ${table}`, function (err, result, fields) {
      if (err) {
        throw err;
      }
      console.log(result);
    });
  },
  
  addMessage: function (username, message, roomname) {
    let queryUserId = `SELECT id FROM users WHERE username =${username}`;
    con.query(queryUserId, function (err, result) {
      if (err) {
        throw err;
      } else {
        var sql = `INSERT INTO messages (user_id, message, roomname) VALUES ('${result}', '${message}', '${roomname}')`;
        con.query(sql, function (err, result) {
          if (err) {
            throw err;
          }
          console.log('1 message record inserted');
        });
      }
    });
  },

  addUser: function(user) {
    var sql = `INSERT INTO users (username) VALUES ('${user}')`;
    con.query(sql, function (err, result) {
      if (err) {
        throw err;
      }
      console.log('1 record inserted');
    });
  }
};