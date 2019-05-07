/* SQL Table and Attribute names:
 * APP_USER
 * - EMAIL
 * - PASSWORD_HASH
 * - FIRST_NAME
 * - LAST_NAME
 *
 * POST
 * - id
 * - vote_count
 * - Title
 * - Answer_Count
 * - Body
 *
 * ANSWERS
 * - USER_EMAIL
 * - POST_ID
 * - BODY
 *
 * COMPOSES
 * - USER_EMAIL
 * - POST_ID
 *
 * VOTES
 * - USER_EMAIL
 * - POST_ID
 * - DID_UPVOTE
 */

var mysql = require('mysql');


var conn = mysql.createConnection
({
  database:'test',
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "AdultIntern1"
});


conn.connect(function(err)
 {
  if (err)
  {
    throw err;
  }
  console.log("Connected!");



     // Create EMPLOYEES Table.
     var sql2 = "CREATE TABLE ANSWERS" +
         " ( USER_EMAIL VARCHAR(255), " +
         " POST_ID int, " +
         " BODY VARCHAR(300), " +
         " PRIMARY KEY (USER_EMAIL, POST_ID) )";



     conn.query(sql2, function(err, results) {
         if (err) throw err;
         console.log("Query successful");
     });





   });
/*
     var empNos = ["E01", "E02", "E03"];
     var fullNames = ["John", "Smith", "Gates"];
     var hireDates = ["22/10/2001", "11/11/2000", "12/12/1990"];

     // Insert Datas to EMPLOYEES.
     for (var i = 0; i < empNos.length; i++) {
         var sql3 = "Insert into Employees (password, First_Name, Last_Name, Email) " //
             +
             " Values ('" + empNos[i] + "', '" + fullNames[i] + "', STR_TO_DATE('" + hireDates[i] + "', '%d/%m/%Y') )";

         conn.query(sql3, function(err, results) {
             if (err) throw err;
             console.log("The records have been inserted!");
         });
     }

 });*/
