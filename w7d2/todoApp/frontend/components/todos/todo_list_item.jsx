import React from 'react';

const TodoListItem = (todo) => (
  <li>
    <div>title: {todo.info.title}</div>
    <div>body: {todo.info.body}</div>
  </li>
);

export default TodoListItem;
