import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = (props) => {
  return (
    <div>
      <TodoForm action={props.receiveTodo} />
      <ul>
        <TodoListItem todos={props.todos} />
      </ul>
    </div>
  );
};

export default TodoList;
