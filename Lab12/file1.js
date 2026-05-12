//Arrow notation version
//doest need the keyword function () => can represent function

const fs = require('fs');

//data is a inbuilt variable doesnt depend on the name of file
//no file is given so it will show if statement which is processing error and will give output as "Error reading file"
//otherwise will show file content
//readFile is a method which has three arguements, name of file, version number, function itself

fs.readFile('data.txt', 'utf8', (err, data) => {
	if (err) {
		console.log("Error reading file");
		return;
	}
	console.log("File content:", data);
});
