import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  makeList() {
    return this.props.todos.map(todo => (
      <TodoListItem
        info={todo}
        key={todo.id} />
    ));
  }

  render() {
    return (
      <div>
        <TodoForm createTodo={this.props.createTodo} />
        <h3>My Todo List</h3>
        <ol>{this.makeList()}</ol>
      </div>
    );
  }
}

export default TodoList;
