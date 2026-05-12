const http=require('http');
function handleRequest(req,res) {
	res.write("Hello from node js server");
	res.end();
}

//const is a keyword for constant
//http package we will use
//next we would create a function called handleRequest which is taking request and response
//req => request and res => response


const server = http.createServer(handleRequest);

server.listen(3000, '0.0.0.0', () => {
	console.log("Server running at http://localhost:3000");
});

//this command is starting the server 
// this code is going to create a server for, apache and lighttpd not required this alone can start server
