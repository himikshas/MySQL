let x = 0; y = 1;

for (let i = 3; i <= 13; i++) {
	console.log(x);
	let num = x + y;
	x = y;
	y = num;
}

//here first let x and y as 0 and 1 
//then start from 3rd index till 13 otherwise it will go till 10th index only and only 8 numbers would print 
//print x 
//then add x and y and save in a variable
//then y would be equal to x
//and num would be equal to y 
//example : x = 0, y = 1, num = x+y => 0+1=1, print 0,1,1
//then now x becomes y means, x=1, y becomes num means, y=1, num = 1+1=2
//0,1,1,2 and goes on


