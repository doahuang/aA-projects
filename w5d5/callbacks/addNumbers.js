const readline = require('readline');

const reader = readline.createInterface({  
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
  
  if (numsLeft === 0 ) {
    reader.close();
    return completionCallback(sum);
  } else {
    reader.question("Give me a number: ", function (res) {
      sum += parseInt(res);
      console.log(`Partial Sum: ${sum}`);
      addNumbers(sum, numsLeft-1, completionCallback);
    });

  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));