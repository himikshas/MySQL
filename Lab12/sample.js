console.log("File name:", process.argv[1]);
console.log("Arguments passed:", process.argv.slice(2));

//argv in general will give complete thing
//in second command argv.slice(20 it means before 2nd argument after that slice everything
//first command will give file name
//OUTPUT :
//File name: /home/ibab/Applications/DB_Design/Lab12/sample.js
//Arguments passed: [ 'Hello', 'and', 'Welcome', 'to', 'BDBP208' ]
//index starts from 0
