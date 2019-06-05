$(document).ready(function () {

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

    $('#shceduleInterviewBtn').on('click', (e) => {
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

    $('#submitFeedbackBtn').on('click', (e) => {
        submitFeedback();
    });

    function errorAlert() {
        Swal.fire({
            type: 'error',
            title: 'Oops...',
            text: 'Something went wrong!'
        });
    }

    function submitFeedback() {
        Swal.fire({
            title: 'Make sure you have given complete feedback',
            text: "You won't be able to Edit this again!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#ffc107',
            cancelButtonColor: '#F2F7FB',
            confirmButtonText: 'Yes, Submit this!'
        }, function () {
            $.ajax({
                type: "post",
                url: '/interview/submit-feedback',
                data: {
                    id: $('#feedbackId').val(),
                    candidateId: $('#candidateId').val()
                },
                success: (response) => {
                    if (response && !response.error) {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        ).then(() => {
                            window.location.reload();
                        })
                    } else {
                        errorAlert();
                    }
                },
                error: function () {
                    errorAlert();
                }
            });
        });
    }
});