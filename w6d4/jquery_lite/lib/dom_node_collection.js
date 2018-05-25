class DOMNodeCollection {
  constructor(arr) {
    this.arr = arr;
  }

  html(str = null) {
    if (str === null) {
      return this.arr[0].innerHTML;
    } else {
      for (let i = 0; i < this.arr.length; i++) {
        this.arr[i].innerHTML = str;
      }
    }
  }

  empty() { this.html(''); }

  append(arg) {
    for (let i = 0; i < this.arr.length; i++) {
      if (arg instanceof HTMLElement) {
        this.arr[i].innerHTML += arg.outerHTML;
      } else if (arg.constructor.name === 'String') {
        this.arr[i].innerHTML += arg;
      }
    }
  }

  attr(name, value = null) {
    if (value === null) {
      return this.arr[0].getAttribute(name);
    } else {
      return this.arr[0].setAttribute(name, value);
    }
  }

  addClass(name) {
    this.arr[0].classList.add(name);
  }

  removeClass(name) {
    this.arr[0].classList.remove(name);
  }


  children() {
    let kids = [];
    for (let i = 0; i < this.arr.length; i++) {
      if (this.arr[i].children.length > 0) {
        kids.push(this.arr[i].children);
      }
    }
    return new DOMNodeCollection(kids);
  }

  parent() {
    let parents = [];
    for (let i = 0; i < this.arr.length; i++) {
      let currParent = this.arr[i].parentNode;
      if (!parents.includes(currParent) && currParent !== null) {
        parents.push(currParent);
      }
    }
    return new DOMNodeCollection(parents);
  }

  find(arg) {
    let selected = Array.from(document.querySelectorAll(arg));
    let kids = [];
    for (let i = 0; i < selected.length; i++) {
      console.log(Array.from(this.arr[0].children));
      console.log(selected);
    }


    // let found = selected.filter( (el) => {
    //   this.children().arr.includes(el);
    // });
    // return new DOMNodeCollection(found);
  }

}



module.exports = DOMNodeCollection;
