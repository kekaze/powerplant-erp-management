$(document).ready( function () {
    var options = 
    {
        isEnabled: true,
        hasBoundCheck: true,
        minBoundClass: 'dt-colresizable-bound-min',
        maxBoundClass: 'dt-colresizable-bound-max',
        isResizable: function (column) {
            return true;
        }
    };
    
    let user_table = $('#users-table').DataTable();
    user_table.columns.adjust().draw();

    let wor_table = $('#wor-table').DataTable({
        "scrollX": true,
        'dom': 'Rlfrtip',
        colResize: options,
        "bAutoWidth": false
    });
    wor_table.order([0, 'desc']).draw();
    wor_table.colResize.enable();

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