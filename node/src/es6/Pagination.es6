new class Pagination {

    constructor() {
        this.currentPage = 1;
        this.lastPage = 1;
        this.maxRows = 5;
        this.allRows = '';
        this.bindEvents();
    }

    bindEvents() {
        $(document).ready(() => {
            this.allRows = $('#jobs-table .job-row');
            this.getPagination('#allJobs');

            $('#previous-btn').off('click').on('click', () => {
                this.pageChanged(this.currentPage - 1);
            });

            $('#next-btn').off('click').on('click', () => {
                this.pageChanged(this.currentPage + 1);
            });

            $('.page-item a.numbered').off('click').on('click', (e) => {
                let pageNum = Number($(e.currentTarget).data('number'));
                this.pageChanged(pageNum);
            });
        });
    }

    previousBtnPageItem() {
        let btn = `<li class="page-item">`
            + `<a class="page-link" id="previous-btn" aria-label="Previous">Previous</a>`
            + `</li>`;
        return btn;
    }

    nextBtnPageItem() {
        let btn = `<li class="page-item">`
            + `<a class="page-link" id="next-btn" aria-label="Previous">Next</a>`
            + `</li>`;
        return btn;
    }

    pageItem(pageNum) {
        let btn = `<li class="page-item">`
            + `<a class="page-link numbered" data-number="${pageNum}">${pageNum}</a>`
            + `</li>`;
        return btn;
    }

    createPagination(table) {
        let pagination = $(`#jobs-table .pagination`);
        let totalRows = this.allRows.length;
        if (totalRows > this.maxRows) {
            let html = this.previousBtnPageItem();
            this.lastPage = Math.ceil(totalRows / this.maxRows);
            for (let i = 1; i <= this.lastPage; i++) {
                html += this.pageItem(i);
            }
            html += this.nextBtnPageItem();

            pagination.html(html).show();
        } else {
            pagination.hide();
        }
    }

    pageChanged(pageNum) {
        $('.pagination .page-item a[data-number=' + this.currentPage + ']').removeClass('active');
        this.currentPage = pageNum;
        $('.pagination .page-item a[data-number=' + pageNum + ']').addClass('active');
        if (this.currentPage === 1){
            $('.pagination #previous-btn').addClass('disabled');
        } else {
            $('.pagination #previous-btn').removeClass('disabled');
        }

        if (this.currentPage === this.lastPage){
            $('.pagination #next-btn').addClass('disabled');
        } else {
            $('.pagination #next-btn').removeClass('disabled');
        }

        this.showItems();
    }

    showItems() {
        let row = 0;
        this.allRows.each((i, element) => {
            row++;
            if (row > (this.maxRows * this.currentPage)
                || row <= ((this.maxRows * this.currentPage) - this.maxRows)) {
                $(element).hide();
            } else {
                $(element).show();
            }
        });
    }

    getPagination(table) {
        this.currentPage = 1;

        this.createPagination(table);
        this.pageChanged(this.currentPage);
    }
}
