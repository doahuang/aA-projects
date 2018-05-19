class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hh= this.date.getHours();
    this.mm= this.date.getMinutes();
    this.ss= this.date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.  
    this._tick = this._tick.bind(this);
    setInterval(this._tick, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hh}:${this.mm}:${this.ss}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    if (this.ss === 59) {
      if (this.mm === 59) {
        if (this.hh === 23) {
          this.hh = 0;
        } else {
          this.hh += 1;
        }
        this.mm = 0;
      } else {
        this.mm++;
      }
      this.ss = 0;
    } else {
      this.ss++;
    }
    console.clear();
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();
