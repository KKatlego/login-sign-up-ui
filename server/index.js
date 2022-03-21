const express = require("express");
var sqlite3 = require("sqlite3").verbose();

const app = express();
const port = process.env.port || 5000;

var db = new sqlite3.Database("DB");

//connect to database
db.serialize(function () {
    // create user table
    db.run("CREATE TABLE user (id INT, username TEXT)");
    var stmt = db.prepare("INSERT INTO user VALUES (?,?)");
    for (var i = 0; i < 10; i++) {
        var date = new Date();
        var d = date.toLocaleDateString();
        stmt.run(i, d);
    }
    // add data to database
    stmt.finalize();

    // select all users
    db.each("SELECT id, username FROM user", function (err, row) {
        console.log("User id : " + row.id, row.username);
    });
});

db.close();

app.listen(port, () => console.log(`listening on port ${port}`));
