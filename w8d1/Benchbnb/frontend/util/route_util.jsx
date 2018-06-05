import React from 'react';
import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';

const msp = state => {
  return {loggedIn: Boolean(state.session.id)};
};

const Auth = ({component: Component, path, loggedIn, exact}) => {
  return (
    <Route path={path} exact={exact} render={(props) => (
      loggedIn ? <Redirect to="/" /> : <Component {...props} />
    )} />
  );
};

export const AuthRoute = withRouter(connect(msp, null)(Auth));

const Protected = ({component: Component, path, loggedIn, exact}) => {
  return (
    <Route path={path} exact={exact} render={(props) => (
      loggedIn ? <Component {...props} /> : <Redirect to="/login" />
    )} />
  );
};

export const ProtectedRoute = withRouter(connect(msp, null)(Protected));
