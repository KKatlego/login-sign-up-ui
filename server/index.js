// const { watch } = require("nodemon/lib/monitor");

const express = require("express");
const sqlite3 = require("sqlite3").verbose();
const app = express();
const port = process.env.port || 5000;

app.route("/").get((req, res) =>res.json("fist rest api"))

//connect to database
const db = new sqlite3.Database("./sample.db", sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        return console.error(err.message);
    } else {
        console.log("Conected successfully to the database");
    }
});

// select all rows
const sql = `SELECT * FROM users`


db.all(sql, [], (err, rows) => {
    if (err) {
        return console.error(err.message);
    } else{
        rows.forEach(row => console.log(row));
    }
});


db.close((err) => {
    if (err) {
        return console.error(err.message);
    }
});

app.listen(port, () => console.log(`listening on port ${port}`));
