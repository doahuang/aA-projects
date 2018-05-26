import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tabIndex: 0
    };
    this.clickTab = this.clickTab.bind(this);
  }

  clickTab(idx) {
    this.setState({
      tabIndex: idx
    });
  }

  render() {
    const tabs = this.props.tabs;
    let idx = this.state.tabIndex;
    return (
      <div className="tabs">
        <ul>
          {
            tabs.map((tab, idx) => {
              return <li key={idx} onClick={()=>this.clickTab(idx)}><h2>{tab.title}</h2></li>
            })
          }
        </ul>
        <br></br>
        <article>{tabs[idx].content}</article>
      </div>
    )
  }
}

export default Tabs;
