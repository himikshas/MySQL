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
database: 'library'
});
db.connect(err => {
if (err) throw err;
console.log('MySQL Connected...');
});

app.get('/student', (req, res) => {
const studentName = req.query.name;
if (!studentName) {
return res.status(400).send('Please provide a student name');
}
const sql = 'SELECT * FROM Student WHERE Student_Name = ?';
console.log(studentName)
db.query(sql, [studentName], (err, results) => {
if (err) {
return res.status(500).send(err);
}
let html = `
<h2>Student Results</h2>
<table border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>Department</th>
<th>Email</th>
<th>DOB</th>
</tr>
`;
results.forEach(s => {
html += `
<tr>
<td>${s.StudentID}</td>
<td>${s.Student_Name}</td>
<td>${s.Department}</td>
<td>${s.Email}</td>
<td>${new Date(s.DOB).toLocaleDateString()}</td>
</tr>
`;
});
html += "</table>";
res.send(html);
});
});

app.listen(8012, () => {
console.log('Server running on http://localhost:8012');
});
                                           
