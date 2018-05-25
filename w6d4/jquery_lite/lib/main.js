const DOMNodeCollection = require('./dom_node_collection');

function $l(arg) {
  if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  } else {
    const arr = [];
    const args = document.querySelectorAll(arg);
    for (let i = 0; i < args.length; i++) {
      arr.push(args[i]);
    }
    return new DOMNodeCollection(arr);
  }
}

window.$l = $l;
