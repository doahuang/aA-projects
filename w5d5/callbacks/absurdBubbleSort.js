const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function absurdBubbleSort(arr, sortCompletionCallback) {
  
  function outerBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  
  outerBubbleSortLoop(true);
}


absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});


function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} larger than ${el2}? `, function (answer) {
    return (answer === 'yes' ? callback(true) : callback(false));
  });
}
// askIfGreaterThan(1,2,(res) => console.log(res));

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], 
      function(isGreaterThan) {
        if (isGreaterThan) {
          [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
          madeAnySwaps = true;
        }
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      }
    );
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

// innerBubbleSortLoop([1,4,3,2], 0, false, () => {
//   console.log('we are in outerspace!');
//   reader.close();}
// );
