const express = require('express');
const app = express();

const port = process.env.port || 5000

app.route("/").get((req, res) => res.json("Hello World!"));

app.listen(port, () => console.log(`listening on port ${port}`));