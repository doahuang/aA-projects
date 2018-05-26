import React from 'react';

class Clock extends React.Component {
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
    let timeStr = time.toLocaleTimeString();
    return (
      <div className="clock">
        <h3>Time: {timeStr}</h3>
        <h3>Date: {dateStr}</h3>
      </div>
    )
  }
}

export default Clock;
