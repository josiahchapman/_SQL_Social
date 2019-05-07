var http = require('http'); // Import Node.js core module
var mysql = require('mysql');

var conn = mysql.createConnection
({
  database:'test',
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "Walton43$"
});



var server = http.createServer(function (req, res)

{
  conn.connect(function(err)
   {
    if (err)
    {
      throw err;
    }
    console.log("Connected to SQL!");

  var dataReq = req.url.split('-' , 50)

  if (dataReq[0] == '/register')
  {
    // for /register-email-password-firstname-Last_Name

    var query1 = " insert into user (Email)"
                +    "values('"+dataReq[1]+"')";

                    conn.query(query1, function(err, results)
                     {
                        if (err) console.log(err);
                    });

     //check the URL of the current request
           res.writeHead(200, { 'Content-Type': 'application/json' });
      //     res.writeHead(200, { 'Content-Type': 'text/html' });

           res.write(JSON.stringify({ message: "Hello World"}));
      //     res.write('<html><body><p>This is home Page.</p></body></html>');

          // res.end();
         }


    else
        res.end('Invalid Request!');

});





});
server.listen(5000); //6 - listen for any incoming requests

console.log('Node.js web server at port 5000 is running..')
