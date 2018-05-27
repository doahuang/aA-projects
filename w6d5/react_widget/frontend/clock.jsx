import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };

    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({
      time: new Date()
    });
  }

  componentDidMount() {
    this.timer = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timer);
  }

  render() {
    const time = this.state.time;
    let dateStr = time.toDateString();
    let timeStr = time.toLocaleTimeString({}, {timeZoneName: 'short'});

    return (
      <div>
        <h1>Clock</h1>
        <div className="clock">
          <span className='group'>
            <h2>Time</h2>
            <h2>{timeStr}</h2>
          </span>
          <span className='group'>
            <h2>Date</h2>
            <h2>{dateStr}</h2>
          </span>
        </div>
      </div>
    );
  }
}
