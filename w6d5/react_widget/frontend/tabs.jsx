import React from 'react';

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tabIndex: 0
    };
  }

  clickTab(idx) {
    this.setState({
      tabIndex: idx
    });
  }

  isTabbed(idx) {
    if (this.state.tabIndex === idx) { return "tabbed" }
  }

  makeTab(tabs) {
    return tabs.map((tab, idx) => (
      <li key={idx}
        onClick={() => this.clickTab(idx)}
        className={this.isTabbed(idx)}>
        <span>{tab.title}</span>
      </li>
    ))
  }

  render() {
    const tabs = this.props.tabs;
    let currTab = tabs[this.state.tabIndex];

    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
          <div className="tab-title">
            <ul>{this.makeTab(tabs)}</ul>
          </div>
          <div className="tab-content">
            <article>{currTab.content}</article>
          </div>
        </div>
      </div>
    );
  }
}
