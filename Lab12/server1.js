// server1.js

// Step 1: Import modules
const http = require('http');
const url = require('url');
const fs = require('fs');

// Step 2: Create server
const server = http.createServer((req, res) => {

    // Step 3: Parse URL
    const parsedUrl = url.parse(req.url, true);

    // Step 4: If /add → perform addition
    if (parsedUrl.pathname === '/add') {

        const num1 = parseFloat(parsedUrl.query.num1);
        const num2 = parseFloat(parsedUrl.query.num2);

        const sum = num1 + num2;

        res.writeHead(200, { 'Content-Type': 'text/html' });

        res.write(`<h1>Result</h1>`);
        res.write(`<p>Number 1: ${num1}</p>`);
        res.write(`<p>Number 2: ${num2}</p>`);
        res.write(`<h2>Sum = ${sum}</h2>`);

        res.end();
    }

    // Step 8: If NOT /add → serve HTML file
    else {
        fs.readFile('addNum.html', (err, data) => {
            if (err) {
                res.writeHead(500, { 'Content-Type': 'text/plain' });
                res.end("Error loading HTML file");
            } else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.end(data);
            }
        });
    }
});

// Step 9: Start server
server.listen(3000, () => {
    console.log("Server running at http://localhost:3000");
});
