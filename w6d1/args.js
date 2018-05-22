//sum 

function sum() {
  let sum = 0;
  let args = Array.from(arguments);
  args.forEach(el => sum += el);
  return sum;
}

function sum(...args) {
  let sum = 0;
  args.forEach((el) => sum += el);
  return sum;
}


//bind with args

Function.prototype.myBind = function(context) {
  let bind_args = Array.from(arguments).slice(1);
  const this_scope = this;
  return function() {
    let call_args = Array.from(arguments);
    return this_scope.apply(context, bind_args.concat(call_args));
  };
};

Function.prototype.myBind = function(context, ...bind_args) {
  return (...call_args) => this.apply(context, bind_args.concat(call_args));
};


//currying

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(number) {
    numbers.push(number);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

//Function.prototype.curry

Function.prototype.curry = function (numArgs) {
  let args = [];
  const this_scope = this;
  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return this_scope.apply(null, args);
    } else {
      return _curry;
    }
  };
};

Function.prototype.curry = function (numArgs) {
  let args = [];
  const _curry = arg => {
    args.push(arg);
    return args.length === numArgs ? this(...args) : _curry;
  };
  return _curry;
};
