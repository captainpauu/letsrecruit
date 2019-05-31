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

    $('#feedbackSubmitBtn').on('click', (e) => {
        $("form[name='feedbackForm']").validate().resetForm();
    });
});