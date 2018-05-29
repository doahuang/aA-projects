import React from 'react';

 class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      input: ''
    };
    this.submitTodo = this.submitTodo.bind(this);
  }

  submitTodo() {
    let todo = {
      // id
      // title
      
    };
    return props.action(todo);
  }

  render() {
    return (
      <form>
        <label for="title">Title</label>
        <input id="title" value={this.state.input}></input>
        <input onClick={this.submitTodo} type="submit">Create Todo!</input>
      </form>
    );
  }
}

export default TodoForm;
