$(document).ready(function () {

    $("form[name='addUserForm']").validate({
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            userName: {
                required: true,
                minlength: 6
            },
            password: {
                required: true
            },
            confirmPassword: {
                required: true,
                equalTo: '#password'
            },
            technology: {
                required: true
            }
        },
        messages: {
            name: "Please Enter Full Name",
            email: {
                required: "Please Enter Email-id",
                email: "Please Enter Valid Email-id"
            },
            userName: {
                required: "Please Enter Username",
                minlength: "Username must be at-least 6 characters"
            },
            password: "Please Enter password",
            confirmPassword: {
                required: "Please Re-enter password",
                equalTo: "Password Doesn't Match"
            },
            technology: "Please Select Technology"
        },
        function(form) {
            form.submit();
        }
    });

    $('#add-user-btn').on('click', (e) => {
        $("form[name='addUserForm']").validate().resetForm();
    });
});