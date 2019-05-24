$(document).ready(function () {

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