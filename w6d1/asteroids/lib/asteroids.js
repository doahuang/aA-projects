const MovingObject = require('./moving_object.js');
window.MovingObject = MovingObject;

const Util = require('./utils.js');

const canvasEl = document.getElementById("game-canvas");
const ctx = canvasEl.getContext("2d");

function Asteroid(pos) {
  COLOR = 'yellow';
  RADIUS = 20;
  MovingObject.call(this, pos);
  this.radius = RADIUS;
  this.color = COLOR;
  this.vel = Util.randomVec(this.radius);
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;

