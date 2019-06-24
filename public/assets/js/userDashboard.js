function errorAlert() {
    Swal.fire({
        type: 'error',
        title: 'Oops...',
        text: 'Something went wrong!'
    });
}

function deleteUser(e) {
    var id = $(e.currentTarget).data('deleteid');

    $.when(
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete!'
        })
    ).done ((value) => {
        if(value && !value.dismiss) {
            $.ajax({
                type: "post",
                url: '/user/delete',
                data: {
                    userId: id
                },
                success: (response) => {
                    if (response && !response.error) {
                        Swal.fire(
                            'Deleted!',
                            'User has been deleted successfully.',
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

function checkIfEmailExists(e) {
    var value = e.target.value;
    $('button.btn-primary').removeClass('disabled');

    if(value !== '') {
        $.ajax({
            type: "post",
            url: '/user/check-email',
            data: {
                email: value
            },
            success: (response) => {
                if (response.success) {
                    $('button.btn-primary').removeClass('disabled');
                } else {
                    $('button.btn-primary').addClass('disabled');
                    Swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Email exists already. Please enter another Email-id'
                    });
                }
            }
        });
    }
}

function checkIfUserNameExists(e) {
    var value = e.target.value;
    $('button.btn-primary').removeClass('disabled');

    if(value !== '') {
        $.ajax({
            type: "post",
            url: '/user/check-user-name',
            data: {
                username: value
            },
            success: (response) => {
                if (response.success) {
                    $('button.btn-primary').removeClass('disabled');
                } else {
                    $('button.btn-primary').addClass('disabled');
                    Swal.fire({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Username already used. Please enter another username'
                    });
                }
            }
        });
    }
}

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

    $('#addUserForm #email').on('blur', (e) => checkIfEmailExists(e));

    $('#addUserForm #username').on('blur', (e) => checkIfUserNameExists(e));

    $('#add-user-btn').on('click', (e) => {
        $("form[name='addUserForm']").validate().resetForm();
    });

    $('.delete-user').on('click', (e) => {
        deleteUser(e);
    });
});