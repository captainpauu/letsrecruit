import Swal from "sweetalert2";

new class CandidateDashboard {
    constructor() {
        this.bindEvents();
    }

    bindEvents() {
        $(document).ready(() => {
            $('#candidateTable').DataTable();

            $('.delete-candidate').on('click', (e) => {
                this.deleteCandidate(e);
            });
        });
    }

    errorAlert() {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'Something went wrong!'
        });
    }

    deleteCandidate(e) {
        var id = $(e.currentTarget).data('deleteid');

        $.when(
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            })
        ).done ((value) => {
            if(value && !value.dismiss) {
                $.ajax({
                    type: "post",
                    url: '/candidate/delete',
                    data: {
                        candidateId: id,
                        csrf_token: $('#csrf_token').val()
                    },
                    success: (response) => {
                        if (response && !response.error) {
                            Swal.fire(
                                'Deleted!',
                                'Candidate has been deleted successfully.',
                                'success'
                            ).then(() => {
                                window.location.reload();
                            })
                        } else {
                            this.errorAlert();
                        }
                    },
                    error: () => {
                        this.errorAlert();
                    }
                });
            }
        });
    }
}
