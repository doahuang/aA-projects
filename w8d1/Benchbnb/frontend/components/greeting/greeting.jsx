import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  const sessionLinks = () => {
    return (
      <nav>
        <Link to="/login">Login</Link> <Link to="/signup">Sign Up</Link>
      </nav>
    );
  };
  const personalGreeting = () => {
    return (
      <div>
        <span>Welcome, {currentUser.username}! </span>
        <button onClick={logout}>Log Out</button>
      </div>
    );
  };

  return currentUser ? personalGreeting() : sessionLinks();
};


export default Greeting;
