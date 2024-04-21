
$(document).ready( function () {
    $('#users-table').DataTable();
    let wor_table = $('#wor-table').DataTable();
    wor_table.order([0, 'desc']).draw();
    $('#reservation').DataTable();
    
    // Function to handle form submission
    function submitForm() {
        $("#reservation_form").submit();
    }
    
    // Handle pressing Enter key
    $("#matcode").keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            event.preventDefault();
            submitForm();
        }
    });

    // Handle blur event on input field
    $("#matcode").blur(function(){
        submitForm();
    });

    // // Handle focus event on input field
    // $("#inputField").focus(function(){
    //     // Add any focus-specific behavior here
    // });

});