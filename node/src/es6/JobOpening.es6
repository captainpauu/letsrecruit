import Pagination from "./Pagination";

new class JobOpening {
    constructor() {
        this.bindEvents();
    }

    bindEvents(){
        $(document).ready(() => {
            Pagination.getPagination({
                tableId: 'jobs-table',
                rowClass: 'job-row',
                maxRows: 5,
            });
        });
    }


}