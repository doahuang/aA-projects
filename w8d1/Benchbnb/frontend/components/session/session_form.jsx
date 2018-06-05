import React from 'react';

export default class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => {
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }

  handleErrs() {
    return (
      <ul>
        {this.props.errors.map((err, i) => (
          <li key={i}>{err}</li>
        ))}
      </ul>
    );
  }

  render() {
    return (
      <div>
        <h2>{this.props.formType}</h2>
        <span>{this.handleErrs()}</span>
        <form>
          <label>Username:
            <input type='text' value={this.state.username}
              onChange={this.update('username')} />
          </label>
          <label>Password:
            <input type='password' value={this.state.password}
              onChange={this.update('password')} />
          </label>
          <button onClick={this.handleSubmit}>{this.props.formType}</button>
        </form>
      </div>
    );
  }
};
