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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/es6/Pagination.es6");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/es6/Pagination.es6":
/*!********************************!*\
  !*** ./src/es6/Pagination.es6 ***!
  \********************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony default export */ __webpack_exports__[\"default\"] = (new class Pagination {\n\n    constructor() {\n        this.currentPage = 1;\n        this.lastPage = 1;\n        this.maxRows = 5;\n        this.allRows = '';\n        this.showFirstBtn = false;\n        this.showLastBtn = false;\n        this.showPreviousBtn = true;\n        this.showNextBtn = true;\n    }\n\n    bindEvents() {\n        $('#first-btn').off('click').on('click', () => {\n            this.pageChanged(1);\n        });\n\n        $('#previous-btn').off('click').on('click', () => {\n            this.pageChanged(this.currentPage - 1);\n        });\n\n        $('#next-btn').off('click').on('click', () => {\n            this.pageChanged(this.currentPage + 1);\n        });\n\n        $('#last-btn').off('click').on('click', () => {\n            this.pageChanged(this.lastPage);\n        });\n\n        $('.page-item a.numbered').off('click').on('click', (e) => {\n            let pageNum = Number($(e.currentTarget).data('number'));\n            this.pageChanged(pageNum);\n        });\n    }\n\n    firstBtnPageItem() {\n        return `<li class=\"page-item\">`\n            + `<a class=\"page-link\" id=\"first-btn\" aria-label=\"First\">First</a>`\n            + `</li>`;\n    }\n\n    previousBtnPageItem() {\n        return `<li class=\"page-item\">`\n            + `<a class=\"page-link\" id=\"previous-btn\" aria-label=\"Previous\">`\n            + `<span aria-hidden=\"true\">&laquo;</span>`\n            + `<span class=\"sr-only\">Previous</span>`\n            + `</a></li>`;\n    }\n\n    nextBtnPageItem() {\n        return `<li class=\"page-item\">`\n            + `<a class=\"page-link\" id=\"next-btn\" aria-label=\"Previous\">`\n            + `<span aria-hidden=\"true\">&raquo;</span>`\n            + `<span class=\"sr-only\">Next</span>`\n            + `</a></li>`;\n    }\n\n    lastBtnPageItem() {\n        return `<li class=\"page-item\">`\n            + `<a class=\"page-link\" id=\"last-btn\" aria-label=\"Last\">Last</a>`\n            + `</li>`;\n    }\n\n    pageItem(pageNum) {\n        return `<li class=\"page-item\">`\n            + `<a class=\"page-link numbered\" data-number=\"${pageNum}\">${pageNum}</a>`\n            + `</li>`;\n    }\n\n    createPagination(table) {\n        let pagination = $(`#${table} .pagination`);\n        let totalRows = this.allRows.length;\n        let html = '';\n\n        if (totalRows > this.maxRows) {\n            if(this.showFirstBtn) {\n                html += this.firstBtnPageItem();\n            }\n            if(this.showPreviousBtn) {\n                html += this.previousBtnPageItem();\n            }\n\n            this.lastPage = Math.ceil(totalRows / this.maxRows);\n            for (let i = 1; i <= this.lastPage; i++) {\n                html += this.pageItem(i);\n            }\n\n            if(this.showNextBtn) {\n                html += this.nextBtnPageItem();\n            }\n            if(this.showLastBtn){\n                html += this.lastBtnPageItem();\n            }\n\n            pagination.html(html).show();\n            this.bindEvents();\n        } else {\n            pagination.hide();\n        }\n    }\n\n    pageChanged(pageNum) {\n        $('.pagination .page-item a[data-number=' + this.currentPage + ']').removeClass('active');\n        this.currentPage = pageNum;\n        $('.pagination .page-item a[data-number=' + pageNum + ']').addClass('active');\n        if (this.currentPage === 1){\n            $('.pagination #previous-btn').addClass('disabled');\n            $('.pagination #first-btn').addClass('disabled');\n        } else {\n            $('.pagination #previous-btn').removeClass('disabled');\n            $('.pagination #first-btn').removeClass('disabled');\n        }\n\n        if (this.currentPage === this.lastPage){\n            $('.pagination #next-btn').addClass('disabled');\n            $('.pagination #last-btn').addClass('disabled');\n        } else {\n            $('.pagination #next-btn').removeClass('disabled');\n            $('.pagination #last-btn').removeClass('disabled');\n        }\n\n        this.showItems();\n    }\n\n    showItems() {\n        let row = 0;\n        this.allRows.each((i, element) => {\n            row++;\n            if (row > (this.maxRows * this.currentPage)\n                || row <= ((this.maxRows * this.currentPage) - this.maxRows)) {\n                $(element).hide();\n            } else {\n                $(element).show();\n            }\n        });\n    }\n\n    getPagination(data) {\n        this.currentPage = 1;\n        this.maxRows = data.maxRows ? data.maxRows : this.maxRows;\n        this.allRows = $(`#${data.tableId} .${data.rowClass}`);\n        this.showFirstBtn = typeof data.showFirstBtn !== \"undefined\" ? data.showFirstBtn : this.showFirstBtn;\n        this.showLastBtn = typeof data.showLastBtn !== \"undefined\" ? data.showLastBtn : this.showLastBtn;\n        this.showPreviousBtn = typeof data.showPreviousBtn !== \"undefined\" ? data.showPreviousBtn : this.showPreviousBtn;\n        this.showNextBtn = typeof data.showNextBtn !== \"undefined\" ? data.showNextBtn : this.showNextBtn;\n\n        this.createPagination(data.tableId);\n        this.pageChanged(this.currentPage);\n    }\n});\n\n//# sourceURL=webpack:///./src/es6/Pagination.es6?");

/***/ })

/******/ });