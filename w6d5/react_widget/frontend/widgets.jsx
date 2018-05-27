import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';
import AutoComplete from './autocomplete';

const SomeTabs = [
  { title: 'one',
    content: "Here's something that's fun. Nature is so fantastic, enjoy it. Let it make you happy. We'll lay all these little funky little things in there." },
  { title: 'two',
    content: "Isn't that fantastic? You can just push a little tree out of your brush like that. Imagination is the key to painting. The little tiny Tim easels will let you down. It's almost like something out of a fairytale book." },
  { title: 'three',
    content: "And right there you got an almighty cloud. There we go. It looks so good, I might as well not stop."}
];

const SomeNames = [
  'Rachal',
  'Rupert',
  'Bruce',
  'Alvin',
  'Ernest',
  'Richard',
  'Shandra',
  'Freddie',
  'Brande',
  'Charles',
  'Gail',
  'Leana',
  'Morton',
  'Merry',
  'Trula',
  'Harland',
  'Rogelio',
  'Clarine',
  'Katelynn',
  'Chang'
];

const Root = () => (
  <div>
    <Clock />
    <Weather />
    <div className='group'>
      <Tabs tabs={SomeTabs} />
      <AutoComplete list={SomeNames} />
    </div>
  </div>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root />, document.getElementById('root'));
});
