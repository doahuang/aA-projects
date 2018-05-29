import {connect} from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import {receiveTodo, receiveTodos} from '../../actions/todo_actions';


const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    receiveTodos: (todos) => dispatch(receiveTodos(todos))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
