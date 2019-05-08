/* List of *functions*
 * verifyLogin-email-passwordhash => true/false
 * register-email-passwordhash-firstname-lastname
 *
 * incrementVoteCount-postid
 * decrementVoteCount-postid
 *
 * checkVoteStatus-email-postid => (Returns "did not vote" if votes(email, postid) tuple does not exist. Returns true if tuple exists and USER_DID_UPVOTE is true. Returns false otherwise.)
 {
  "voteStatus": "did-not-vote" OR "true" OR "false"
 }
 *
 * incrementAnswerCount-postid
 * decrementAnswerCount-postid
 *
 * createAnswerOnPost-email-postid-body
 * createPost-email-title-body
 *
 * getProfileInfoForUser-email => user.email
 * updateProfileInfoForUser-email-passwordhash
 *
 * getAllPosts => (all post attributes for every post)
 * getAllPostsForUser-email-postid => (all post attributes for posts where user.email = email)
 * getAllAnswersForPost-postid => (answers.body and user.email for answer tuples where answers.postid = postid)
 *
 * changePassword-email-passwordhash
 */


var http = require('http'); // Import Node.js core module
var mysql = require('mysql');

var conn = mysql.createConnection
({
  database:'test',
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "AdultIntern1"
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
    // for /register-email-password_hash-firstname-Last_Name
      var query1 = " insert into APP_USER (Email, PASSWORD_HASH, First_Name, Last_Name)"
                + "values('"+dataReq[1]+"', '"+dataReq[2]+"', '"+dataReq[3]+"','"+dataReq[4]+"')";


      conn.query(query1, function(err, results)
      {
        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });

      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));
      //     res.write('<html><body><p>This is home Page.</p></body></html>');

          // res.end();
    }
    else if  (dataReq[0] == '/verifyLogin')
    {
      //-email-passwordhash
      var query = "SELECT USER.EMAIL AND USER.PASSWORD_HASH "
                + "FROM USER "
                + "WHERE USER.EMAIL = " + dataReq[1];

      conn.query(query, function(err, results)
      {
        if (err)
        {
          console.log(err)
        }
        else
        {
          res.writeHead(200, {'Content-Type': 'application/json'});
          res.write(JSON.stringify({message: results})); // not sure how to handle results...
        }
      });
    }
    else if (dataReq[0] == '/CreatePost')
    {
      // for /CreatePost-id-vote_count-Title-Answer_count-body
      var query1 = " insert into POST ( id , vote_count, Title, Answer_Count, Body)"
                + "values('"+dataReq[1]+"', '"+dataReq[2]+"', '"+dataReq[3]+"','"+dataReq[4]+"','"+dataReq[5]+"')";


      conn.query(query1, function(err, results)
      {
        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));
             //     res.write('<html><body><p>This is home Page.</p></body></html>');

                 // res.end();
    }
    else if (dataReq[0] == '/CreateComment')
    {
      // for /CreatePost-USER_EMAIL-POST_ID-BODY

      var query1 = " insert into ANSWERS ( USER_EMAIL, POST_ID, BODY)"
                + "values('"+dataReq[1]+"', '"+dataReq[2]+"', '"+dataReq[3]+"')";


      conn.query(query1, function(err, results)
      {
        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });

      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));
                      //     res.write('<html><body><p>This is home Page.</p></body></html>');
                          // res.end();
    }
    else if (dataReq[0] == '/incrementVoteCount')
    {
                        // for /CreatePost-USER_EMAIL-POST_ID-BODY
      if ()

      var query1 = " insert into VOTES( USER_EMAIL, POST_ID, DID_UPVOTE)"
                              + "values('"+dataReq[1]+"', '"+dataReq[2]+"', '"+dataReq[3]+"')";


      conn.query(query1, function(err, results)
      {
        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });

      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));
                    //     res.write('<html><body><p>This is home Page.</p></body></html>');

                        // res.end();
    }
    else if (dataReq[0] == '/checkVoteStatus')
    {

      var query1 = "select DID_UPVOTE from votes"
                  + "where "+ dataReq[2] +"= votes.POST_ID and "+ dataReq[3]+"= votes.USER_EMAIL";


      conn.query(query1, function(err, results)
      {
        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });

      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));
                    //     res.write('<html><body><p>This is home Page.</p></body></html>');

                        // res.end();
    }



    else
      res.end('Invalid Request!');

});
});

server.listen(5000); //6 - listen for any incoming requests

console.log('Node.js web server at port 5000 is running..')
