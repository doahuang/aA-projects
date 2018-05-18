//Array#uniq


Array.prototype.uniq = function() {
  let arr = [];
  this.forEach(el => {
    if (arr.includes(el)) {
      return;
    }
    arr.push(el);
  });
  return arr;
};

// Array twoSum

Array.prototype.twoSum = function () {
  let pairs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
};
// Array transpose

Array.prototype.transpose = function () {
  let result = [];
  for (let i = 0; i < this[0].length; i++) {
    result.push([]);
  }

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[0].length; j++) {
      result[j][i] = this[i][j];
    }
  }
  return result;
};

//Array#myEach

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

printFunc = el => console.log(el);

//#myMap
squareFunc = el => el * el;

Array.prototype.myMap = function (callback) {
  let mapArr = [];
  this.myEach(el => mapArr.push(callback(el)));
  return mapArr;
};

//Array#myReduce
sumFunc = (el) => {
  return acc + el;
};

Array.prototype.myReduce = function (callback, initial) {
  let result;
  let acc = initial;
  let i = 0;
  if (initial === undefined) {
    acc = this[0];
    i++;
  }
  while (i < this.length) {
    acc = callback(acc,this[i]);
    i++;
  }
  return acc;
};

//Array# bubblesort
Array.prototype.bubbleSort = function () {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < (this.length - 1); i++) {
      let j = i + 1;
      if (this[i] > this[j]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
};

//String #substrings
String.prototype.subStrings = function () {
  let subs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j <= this.length; j++) {
      subs.push(this.slice(i,j));
    }
  }
  return subs;
};


//recursion

function range(start,end) {
  if (start === end) {
    return [];
  }
  let result = range(start, end - 1);
  result.push(end - 1);
  return result;
}

//sum rec

function sumRec(arr) {
  if (arr.length === 0){
    return 0;
  }
  let prevSum = sumRec(arr.slice(1));
  return prevSum + arr[0];
}

//exponent

function  exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base, exp - 1);
}

function  exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0){
    let temp = exponent2(base, exp / 2);
    return temp * temp;
  } else {
    let temp = exponent2(base, (exp-1)/2);
    return base * temp * temp;
  }
}


//fib

function fibonacci(n) {
  if (n <3) {
    return [0,1].slice(0,n);
}
  let last_fibs = fibonacci(n - 1);
  return last_fibs.concat(last_fibs[(last_fibs.length-1)] + last_fibs[(last_fibs.length-2)]);
}

//deep dup
function getType(el) {
  return Object.prototype.toString.call(el).slice(8, -1);
}

function deepDup(arr){
  return arr.map(el => (getType(el)==='Array') ? deepDup(el) : el);
}

//bsearch

function bsearch(arr, target) {
  console.log(arr);
  if (arr.length === 0) {
    return -1;
  }

  let mid = Math.floor(arr.length / 2);
  switch(Math.sign(arr[mid] - target)) {
    case 0:
      return mid;
    case 1:
      return bsearch(arr.slice(0, mid), target);
    case -1:
      let result = bsearch(arr.slice(mid + 1), target);
      return (result === -1) ? -1 : result + mid + 1;
  }
}

//mergesort

function merge(left, right) {
  const merged = [];

  while (left.length > 0 && right.length > 0) {
    let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }

  return merged.concat(left, right);
}


function mergesort(arr) {
  if (arr.length < 2) {
    return arr;
  }
  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);
  return merge(mergesort(left), mergesort(right));
}
