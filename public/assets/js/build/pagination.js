'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

new (function () {
    function pagination() {
        _classCallCheck(this, pagination);

        this.currentPage = 1;
        this.lastPage = 1;
        this.maxRows = 5;
        this.allRows = '';
        this.bindEvents();
    }

    _createClass(pagination, [{
        key: 'bindEvents',
        value: function bindEvents() {
            var _this = this;

            $(document).ready(function () {
                _this.allRows = $('#jobs-table .job-row');
                _this.getPagination('#allJobs');

                $('#previous-btn').off('click').on('click', function () {
                    _this.pageChanged(_this.currentPage - 1);
                });

                $('#next-btn').off('click').on('click', function () {
                    _this.pageChanged(_this.currentPage + 1);
                });

                $('.page-item a.numbered').off('click').on('click', function (e) {
                    var pageNum = Number($(e.currentTarget).data('number'));
                    _this.pageChanged(pageNum);
                });
            });
        }
    }, {
        key: 'previousBtnPageItem',
        value: function previousBtnPageItem() {
            var btn = '<li class="page-item">' + '<a class="page-link" id="previous-btn" aria-label="Previous">' + '<span aria-hidden="true">&laquo;</span>' + '<span class="sr-only">Previous</span>' + '</a></li>';
            return btn;
        }
    }, {
        key: 'nextBtnPageItem',
        value: function nextBtnPageItem() {
            var btn = '<li class="page-item">' + '<a class="page-link" id="next-btn" aria-label="Previous">' + '<span aria-hidden="true">&raquo;</span>' + '<span class="sr-only">Next</span>' + '</a></li>';
            return btn;
        }
    }, {
        key: 'pageItem',
        value: function pageItem(pageNum) {
            var btn = '<li class="page-item">' + ('<a class="page-link numbered" data-number="' + pageNum + '">' + pageNum + '</a>') + '</li>';
            return btn;
        }
    }, {
        key: 'createPagination',
        value: function createPagination(table) {
            var pagination = $('#jobs-table .pagination');
            var totalRows = this.allRows.length;
            if (totalRows > this.maxRows) {
                var html = this.previousBtnPageItem();
                this.lastPage = Math.ceil(totalRows / this.maxRows);
                for (var i = 1; i <= this.lastPage; i++) {
                    html += this.pageItem(i);
                }
                html += this.nextBtnPageItem();

                pagination.html(html).show();
            } else {
                pagination.hide();
            }
        }
    }, {
        key: 'pageChanged',
        value: function pageChanged(pageNum) {
            $('.pagination .page-item a[data-number=' + this.currentPage + ']').removeClass('active');
            this.currentPage = pageNum;
            $('.pagination .page-item a[data-number=' + pageNum + ']').addClass('active');
            if (this.currentPage === 1) {
                $('.pagination #previous-btn').addClass('disabled');
            } else {
                $('.pagination #previous-btn').removeClass('disabled');
            }

            if (this.currentPage === this.lastPage) {
                $('.pagination #next-btn').addClass('disabled');
            } else {
                $('.pagination #next-btn').removeClass('disabled');
            }

            this.showItems();
        }
    }, {
        key: 'showItems',
        value: function showItems() {
            var _this2 = this;

            var row = 0;
            this.allRows.each(function (i, element) {
                row++;
                if (row > _this2.maxRows * _this2.currentPage || row <= _this2.maxRows * _this2.currentPage - _this2.maxRows) {
                    $(element).hide();
                } else {
                    $(element).show();
                }
            });
        }
    }, {
        key: 'getPagination',
        value: function getPagination(table) {
            this.currentPage = 1;

            this.createPagination(table);
            this.pageChanged(this.currentPage);

            /*$('#maxRows').on('change',function(evt){
                 $('.pagination').find("li").slice(1, -1).remove();
                var num = 0 ;									// reset tr counter
                var maxRows = parseInt($(this).val());			// get Max Rows from select option
                 if(maxRows == 5000 ){
                    $('.pagination').hide();
                }else {
                    $('.pagination').show();
                }
                 var totalRows = $('.job-row').length;		// numbers of rows
                $('.job-row').each(function(){			// each TR in  table and not the header
                    num++;									// Start Counter
                    if (num > maxRows ){						// if tr number gt maxRows
                        $(this).hide();							// fade it out
                    }if (num <= maxRows ){
                        $(this).show();
                    }// else fade in Important in case if it ..
                });											//  was fade out to fade it in
                if (totalRows > maxRows){						// if tr total rows gt max rows option
                    var pagenum = Math.ceil(totalRows/maxRows);	// ceil total(rows/maxrows) to get ..
                    //	numbers of pages
                    for (var i = 1; i <= pagenum ;){			// for each page append pagination li
                        $('.pagination #prev').before('<li data-page="'+i+'">\
                  <span>'+ i++ +'<span class="sr-only">(current)</span></span>\
                </li>').show();
                    }											// end for i
                } 												// end if row count > max rows
                $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
                $('.pagination li').on('click',function(evt){		// on click each page
                    evt.stopImmediatePropagation();
                    evt.preventDefault();
                    var pageNum = $(this).attr('data-page');	// get it's number
                     var maxRows = parseInt($('#maxRows').val());			// get Max Rows from select option
                     if(pageNum == "prev" ){
                        if(lastPage == 1 ){return;}
                        pageNum  = --lastPage ;
                    }
                    if(pageNum == "next" ){
                        if(lastPage == ($('.pagination li').length -2) ){return;}
                        pageNum  = ++lastPage ;
                    }
                     lastPage = pageNum ;
                    var trIndex = 0 ;							// reset tr counter
                    $('.pagination li').removeClass('active');	// remove active class from all li
                    $('.pagination [data-page="'+lastPage+'"]').addClass('active');// add active class to the clicked
                    // $(this).addClass('active');					// add active class to the clicked
                    $(table+' tr:gt(0)').each(function(){		// each tr in table not the header
                        trIndex++;								// tr index counter
                        // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                        if (trIndex > (maxRows*pageNum) || trIndex <= ((maxRows*pageNum)-maxRows)){
                            $(this).hide();
                        }else {$(this).show();} 				//else fade in
                    }); 										// end of for each tr in table
                });										// end of on click pagination list
             }).val(5).change();*/
        }
    }]);

    return pagination;
}())();
//# sourceMappingURL=pagination.js.map