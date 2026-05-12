const fs = require('fs');
//here importing filsystem(fs0

//read file is taking a function as input
//function takes error and data as input
fs.readFile('data.txt', 'utf8', function(err, data) {
	if (err) {
		console.log("Error reading file");
		return;
	}

	console.log("File content:", data);
});
