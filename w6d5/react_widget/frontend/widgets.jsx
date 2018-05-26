import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

const Root = () => (
  <div>
    <Clock />
    <Tabs tabs={SomeTabs} />
  </div>
)

const SomeTabs = [
  { title: 'one', content: 'hello world' },
  { title: 'two', content: 'who is it' },
  { title: 'three', content: 'goodbye' }
];

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
});
