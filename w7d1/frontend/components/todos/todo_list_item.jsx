import React from 'react';

const TodoListItem = (props) => {
    return props.todos.map (()=> {
        return <li>{todo.title}</li>;
      });
};

export default TodoListItem;
