import React from 'react';

export default class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      weather: null,
      err: null
    };
  }

  componentDidMount() {
    const geo = navigator.geolocation;
    geo.getCurrentPosition(pos => this.fetchWeather(pos.coords), () => {
      this.setState({
        err: 'Location not available'
      });
    });
  }

  fetchWeather(coords) {
    let url = 'http://api.openweathermap.org/data/2.5/weather?';
    let params = `lat=${coords.latitude}&lon=${coords.longitude}`;
    let apiKey = '&appid=f816d7f39052e3a98b21952097a43076';

    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.status === 200 && xhr.readyState === 4) {
        this.setState({
          weather: JSON.parse(xhr.responseText)
        });
      }
    };
    xhr.open('GET', url + params + apiKey, true);
    xhr.send();
  }

  render() {
    let weather = this.state.weather;
    if (!weather) {
      weather = <h2>{this.state.err || 'Loading...'}</h2>;
    } else {
      let temp = (weather.main.temp - 273.15) * 1.8 + 32;
      temp = temp.toFixed(1) + ' F';
      weather =
      <div>
        <h2>{weather.name}</h2>
        <h2>{temp}</h2>
      </div>;
    }

    return (
      <div>
        <h1>Weather</h1>
        <div className='weather'>
          {weather}
        </div>
      </div>
    )
  }
}
