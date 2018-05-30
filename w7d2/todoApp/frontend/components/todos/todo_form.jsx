import React from 'react';

 class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false
    };
    this.submitTodo = this.submitTodo.bind(this);
    this.changeTitle = this.changeTitle.bind(this);
    this.changeBody = this.changeBody.bind(this);
  }

  submitTodo() {
    this.state.id = new Date().getTime();
    this.props.createTodo(this.state);
      // .then(() => this.setState({
      //   title: '',
      //   body: ''
      // }));
  }

  changeTitle(e) {
    this.setState({
      title: e.target.value
    });
  }

  changeBody(e) {
    this.setState({
      body: e.target.value
    });
  }

  render() {
    return (
      <div>
        <div>Title</div>
        <input onChange={this.changeTitle} value={this.state.title}></input>
        <br></br>
        <div>Body</div>
        <textarea onChange={this.changeBody} value={this.state.body}></textarea>
        <div>
          <button onClick={this.submitTodo}>Create Todo!</button>
        </div>
      </div>
    );
  }
}

export default TodoForm;
