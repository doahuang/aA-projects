//surrogate

Function.prototype.inherits = function (SuperClass) {
  const Surrogate = function() {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};


Function.prototype.inherits = function (SuperClass) {
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
};

//test 

function MovingObject (name) {
  this.name = name;
}
MovingObject.prototype.sayHello = function(name) {
  console.log(`my name is ${this.name}`);
};

function Ship (name, color) {
  MovingObject.call(this, name);
  this.color = color;
}
Ship.inherits(MovingObject);
Ship.prototype.sayColor = function(color) {
  console.log(`my color is ${this.color}`);
};

function Asteroid (name, size) {
  MovingObject.call(this, name);
  this.size = size;
}
Asteroid.inherits(MovingObject);
Asteroid.prototype.saySize = function(size) {
  console.log(`my size is ${this.size}`);
};

let ship = new Ship('ship', 'yellow');
ship.sayHello();
ship.sayColor();

let asteroid = new Asteroid('asteroid', 'huge');
asteroid.sayHello();
asteroid.saySize();