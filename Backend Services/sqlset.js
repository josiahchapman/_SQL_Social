

var mysql = require('mysql');


var conn = mysql.createConnection
({
  database:'test',
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "Walton43$"
});


conn.connect(function(err)
 {
  if (err)
  {
    throw err;
  }
  console.log("Connected!");



     // Create EMPLOYEES Table.
     var sql2 = "CREATE TABLE Composes" +
         " ( id int NOT NULL AUTO_INCREMENT, " +
         " vote_count int, " +
         " Title VARCHAR(255), " +
         " Answer_Count int, " +
         " Body VARCHAR(300), " +
         " PRIMARY KEY (id) )";



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
