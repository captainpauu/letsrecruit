import Swal from 'sweetalert2';

new class CandidateProfile {
    constructor() {
        this.bindEvents();
    }

    bindEvents() {
        $(document).ready(() => {
            this.validateScheduleForm();

            $('#scheduleInterviewBtn').on('click', (e) => {
                $("form[name='scheduleInterviewForm']").validate().resetForm();
            });


            $("form[name='feedbackForm']").validate({
                rules: {
                    feedback: {
                        required: true,
                    }
                },
                messages: {
                    scheduledDate: "Please Enter Feedback of Interview"
                },
                function(form) {
                    form.submit();
                }
            });

            $('#feedbackFormBtn').on('click', (e) => {
                $("form[name='feedbackForm']").validate().resetForm();
            });

            $('#offerJobBtn').on('click', (e) => this.offerJobToCandidate(e));
        });
    }

    validateScheduleForm() {
        $("form[name='scheduleInterviewForm']").validate({
            rules: {
                scheduledDate: {
                    required: true,
                },
                scheduledTime: {
                    required: true,
                },
                interviewMode: {
                    required: true
                },
                interviewerId: {
                    required: true,
                }
            },
            messages: {
                scheduledDate: "Please Select Schedule Date",
                scheduledTime: "Please Select Schedule Time",
                interviewMode: "Please Select Mode of Interview",
                interviewerId: "Please Select Interviewer"
            },
            function(form) {
                form.submit();
            }
        });

    }

    errorAlert() {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'Something went wrong!'
        });
    }

    offerJobToCandidate(e) {
        var id = $(e.currentTarget).data('id');
        $.when(
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Offer!'
            })
        ).done((value) => {
            if (value && !value.dismiss) {
                $.ajax({
                    type: "post",
                    url: '/user/offer-job',
                    data: {
                        id: id,
                        csrf_token: $('input[name="csrf_token"]').val()
                    },
                    success: (response) => {
                        if (response.success) {
                            Swal.fire(
                                'Offered!',
                                'Job has been offered successfully.',
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