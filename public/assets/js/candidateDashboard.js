$(document).ready(function () {

    $('.delete-candidate').on('click', (e) => {
        deleteCandidate(e);
    });

    function errorAlert() {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'Something went wrong!'
        });
    }

    function deleteCandidate(e) {
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
                        candidateId: id
                    },
                    success: (response) => {
                        if (response && !response.error) {
                            Swal.fire(
                                'Deleted!',
                                response.id + ' has been deleted successfully.',
                                'success'
                            ).then(() => {
                                window.location.reload();
                            })
                        } else {
                            errorAlert();
                        }
                    },
                    error: () => {
                        errorAlert();
                    }
                });
            }
        });
    }

});