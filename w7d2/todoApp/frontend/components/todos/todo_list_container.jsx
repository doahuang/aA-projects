import {connect} from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import {createTodo, fetchTodos} from '../../actions/todo_actions';


const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    createTodo: (todo) => dispatch(createTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos())
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
