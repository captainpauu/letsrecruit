new class Global {
    constructor() {
        this.bindEvent();
    }

    bindEvent() {
        $(document).ready(function () {

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
            });

            $('#dataTable').DataTable();

            $('#interviewRequestTable').DataTable( {
                "order": [[ 4, "desc" ]]
            } );
        });
    }
}