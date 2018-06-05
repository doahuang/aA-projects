import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signup } from '../../actions/session_actions';

const msp = (state, ownProps) => {
  return {
    errors: state.errors.session,
    formType: 'Sign Up'
  };
};

const mdp = dispatch => {
  return {
    action: user => dispatch(signup(user))
  };
};

export default connect(msp, mdp)(SessionForm);
