const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');
const app = express();

// Middleware to read POST form data
app.use(express.urlencoded({ extended: true }));

// Read DB password
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();

// MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: dbPassword,
  database: 'library'
});

db.connect(err => {
  if (err) throw err;
  console.log('MySQL Connected...');
});

// HTML FORM (GET) 
app.get('/', (req, res) => {
  res.send(`
    <h2>Update Student Name</h2>
    <form method="POST" action="/update">
      Student ID: <input type="number" name="id" required><br><br>
      New Name: <input type="text" name="name" required><br><br>
      <input type="submit" value="Update">
    </form>
  `);
});

//  UPDATE (POST)
app.post('/update', (req, res) => {
  const id = req.body.id;
  const name = req.body.name;

  const sql = 'UPDATE Student SET Student_Name = ? WHERE StudentID = ?';

  db.query(sql, [name, id], (err, result) => {
    if (err) return res.send(err);

    if (result.affectedRows === 0) {
      return res.send("No student found");
    }

    res.send("Student updated successfully");
  });
});

// SERVER 
app.listen(8012, () => {
  console.log('Server running on http://localhost:8012');
});
