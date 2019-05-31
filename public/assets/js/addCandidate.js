$(document).ready(function () {

    $("form[name='candidateRegistrationForm']").validate({
        rules: {
            fname:{
                required: true
            },
            lname:{
                required: true
            },
            email: {
                required: true,
                email: true
            },
            mobile: {
                required: true,
                minlength:10
            },
            birthDate:{
                required: true
            },
            currentCity:{
                required: true
            },
            jobProfileId:{
                required: true
            },
            experience:{
                required: true
            },
            resume:{
                required: true,
                extension: "pdf|txt"
            }
        },
        messages: {
            fname: "Please Enter First Name",
            lname: "Please Enter Last Name",
            email: {
                required: "Please Enter Email-id",
                email: "Please Enter Valid Email-id"
            },
            mobile: {
                required: "Please Enter Mobile Number",
                minlength: "Please Enter Valid Number"
            },
            birthDate: "Please Enter Birth Date",
            currentCity: "Please Enter Current City",
            jobProfileId: "Please Select Job Profile",
            experience: "Please Enter Experience (0 for Fresher)",
            resume:{
                required: "Please Choose file to upload",
                extension: "Please Upload only .pdf/.txt file"
            }
        },
        function(form) {
            form.submit();
        }
    });

    $('#reference-type input').on('click', (e) => changeReferenceType(e));

    function changeReferenceType(e) {
        let value = e.target.value;

        if(parseInt(value) === 0){
            $('#consultancyDropdown').removeClass('hidden');
            $('#referredBy').addClass('hidden');
        } else if (parseInt(value) === 1) {
            $('#referredBy').removeClass('hidden');
            $('#consultancyDropdown').addClass('hidden');
        } else {
            $('#consultancyDropdown').addClass('hidden');
            $('#referredBy').addClass('hidden');
        }
    }
});