const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');
const app=express();
// Read password from file
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();
// MySQL connection
const db = mysql.createConnection({
host: 'localhost',
user: 'root',
password: dbPassword,
database: 'ensembl_local'
});
db.connect(err => {
if (err) throw err;
console.log('MySQL Connected...');
});

app.get('/gene', (req, res) => {
db.query('SELECT * FROM gene', (err, results) => {
if (err) {
return res.status(500).send(err);
}

res.json(results);
});
});


app.listen(8012, () => {
console.log('Server running on http://localhost:8012');
});

