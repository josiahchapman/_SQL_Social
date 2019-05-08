om/* List of *functions*
 * // verifyLogin-email-passwordhash => true/false
 * register-email-passwordhash-firstname-lastname
 *
 * incrementVoteCount-postid
 * decrementVoteCount-postid
 *
 * // checkVoteStatus-email-postid => (Returns "did not vote" if votes(email, postid) tuple does not exist. Returns true if tuple exists and USER_DID_UPVOTE is true. Returns false otherwise.)
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
  try {
  conn.connect(function(err)
  {
//    if (err)
//    {
//      throw err;
//    }
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
      var query = "SELECT APP_USER.EMAIL, APP_USER.PASSWORD_HASH "
                + "FROM APP_USER "
                + "WHERE APP_USER.EMAIL = \'" + dataReq[1] +"\'";

      conn.query(query, function(err, results)
      {
        if (err)
        {
          console.log(err);
          res.writeHead(200, {'Content-Type': 'application/json'});
          res.write(JSON.stringify({message: "does-not-exist"})); // not sure how to handle results...
        }
        else
        {
          res.writeHead(200, {'Content-Type': 'application/json'});
          res.write(JSON.stringify({results})); // not sure how to handle results...
          console.log(results);
        }
      });
    }
    else if (dataReq[0] == '/incrementVoteCount')
    {

    }
    else if (dataReq[0] == '/decrementVoteCount')
    {

    }
    else if (dataReq[0] == '/incrementAnswerCount')
    {

    }
    else if (dataReq[0] == '/decrementAnswerCount')
    {

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
      //if ()

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

      var query1 = "select DID_UPVOTE from votes "
                  + "where votes.POST_ID = \'"+ dataReq[1] +"\' and votes.USER_EMAIL = \'"+ dataReq[2]+"\'";


      conn.query(query1, function(err, results)
      {
        if (err)
        {
          res.writeHead(200, { 'Content-Type': 'application/json' });
          res.write(JSON.stringify({ message: "did-not-vote"}));
        }
        else
        {
          res.writeHead(200, { 'Content-Type': 'application/json' });
          res.write(JSON.stringify({results}));
        }
      });
                    //     res.write('<html><body><p>This is home Page.</p></body></html>');
                        // res.end();
    }
    else if (dataReq[0] == '/createAnswerOnPost')
    {

      var query1 = "insert into answers (BODY) values(\'"+ dataReq[3] +"\') where post.id = \'"
      + dataReq[2] +"\' and APP_USER.EMAIL = \'"+ dataReq[1] + "\'";


      conn.query(query1, function(err, results)
      {

        if (err) console.log(err);
      });

      res.writeHead(200, { 'Content-Type': 'application/json' });

      res.write(JSON.stringify({ message: "QUERY SUCCESSFUL"}));


    else
      res.end('Invalid Request!');

});

} // end of try block
catch (e) {
  console.log(e);
}

});



server.listen(5000); //6 - listen for any incoming requests

console.log('Node.js web server at port 5000 is running..')
