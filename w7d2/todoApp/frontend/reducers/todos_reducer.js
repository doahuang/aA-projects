import {RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';
import merge from 'lodash/merge';

 const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_TODO:
      newState = merge({}, state);
      newState[action.todo.id] = action.todo;
      return newState;
    case RECEIVE_TODOS:
      newState = merge({}, state);
      action.todos.forEach ((todoObj)=> {
        newState[todoObj.id] = todoObj;
      });
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
