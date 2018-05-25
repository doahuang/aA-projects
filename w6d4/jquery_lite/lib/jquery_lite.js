/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(arr) {\n    this.arr = arr;\n  }\n\n  html(str = null) {\n    if (str === null) {\n      return this.arr[0].innerHTML;\n    } else {\n      for (let i = 0; i < this.arr.length; i++) {\n        this.arr[i].innerHTML = str;\n      }\n    }\n  }\n\n  empty() { this.html(''); }\n\n  append(arg) {\n    for (let i = 0; i < this.arr.length; i++) {\n      if (arg instanceof HTMLElement) {\n        this.arr[i].innerHTML += arg.outerHTML;\n      } else if (arg.constructor.name === 'String') {\n        this.arr[i].innerHTML += arg;\n      }\n    }\n  }\n\n  attr(name, value = null) {\n    if (value === null) {\n      return this.arr[0].getAttribute(name);\n    } else {\n      return this.arr[0].setAttribute(name, value);\n    }\n  }\n\n  addClass(name) {\n    this.arr[0].classList.add(name);\n  }\n\n  removeClass(name) {\n    this.arr[0].classList.remove(name);\n  }\n\n\n  children() {\n    let kids = [];\n    for (let i = 0; i < this.arr.length; i++) {\n      if (this.arr[i].children.length > 0) {\n        kids.push(this.arr[i].children);\n      }\n    }\n    return new DOMNodeCollection(kids);\n  }\n\n  parent() {\n    let parents = [];\n    for (let i = 0; i < this.arr.length; i++) {\n      let currParent = this.arr[i].parentNode;\n      if (!parents.includes(currParent) && currParent !== null) {\n        parents.push(currParent);\n      }\n    }\n    return new DOMNodeCollection(parents);\n  }\n\n  find(arg) {\n    let selected = Array.from(document.querySelectorAll(arg));\n    let kids = [];\n    for (let i = 0; i < selected.length; i++) {\n      console.log(Array.from(this.arr[0].children));\n      console.log(selected);\n    }\n\n\n    // let found = selected.filter( (el) => {\n    //   this.children().arr.includes(el);\n    // });\n    // return new DOMNodeCollection(found);\n  }\n\n}\n\n\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./lib/dom_node_collection.js\");\n\nfunction $l(arg) {\n  if (arg instanceof HTMLElement) {\n    return new DOMNodeCollection([arg]);\n  } else {\n    const arr = [];\n    const args = document.querySelectorAll(arg);\n    for (let i = 0; i < args.length; i++) {\n      arr.push(args[i]);\n    }\n    return new DOMNodeCollection(arr);\n  }\n}\n\nwindow.$l = $l;\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });