const Asteroid = require('./asteroids.js');

function Game() {
  this.DIM_X = 1024;
  this.DIM_Y = 768;
  this.NUM_ASTEROIDS = 20;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.randomPosition = function () {
  let x = Math.floor(this.DIM_X * Math.random());
  let y = Math.floor(this.DIM_Y * Math.random());
  return [x, y];
};

Game.prototype.addAsteroids = function() {
  let asteroid;
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    asteroid = new Asteroid({ pos: this.randomPosition });
    this.asteroids.push(asteroid);
  }
};

