import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

export default class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ''
    }

    this.changeInput = this.changeInput.bind(this);
    this.selectWord = this.selectWord.bind(this);
  }

  changeInput(e) {
    let inputVal = e.currentTarget.value;
    this.setState({inputVal})
  }

  selectWord(e) {
    let inputVal = e.currentTarget.innerText;
    if (inputVal === 'No Matches' || inputVal === this.state.inputVal) {
      inputVal = '';
    }
    this.setState({inputVal});
  }

  matchWords() {
    const matched = [];
    let input = this.state.inputVal;
    let list = this.props.list;

    if (!input) { return list }
    list.forEach(word => {
      let sub = word.slice(0, input.length);
      if (sub.toLowerCase() === input.toLowerCase()) {
        matched.push(word);
      }
    });

    if (!matched.length) {
      matched.push('No Matches');
    }
    return matched;
  }

  makeList() {
    return this.matchWords().map((word, idx) => (
      <li key={idx} onClick={this.selectWord}>{word}</li>
    ));
  }

  render() {
    return (
      <div>
        <h1>AutoComplete</h1>
        <div className='auto'>
          <input
            value={this.state.inputVal}
            placeholder='Search...'
            onChange={this.changeInput}
          />
          <ul>
            <ReactCSSTransitionGroup
              transitionName='auto'
              transitionEnterTimeout={500}
              transitoinLeaveTimeout={500}
            >
              {this.makeList()}
            </ReactCSSTransitionGroup>
          </ul>
        </div>
      </div>
    );
  }
}
