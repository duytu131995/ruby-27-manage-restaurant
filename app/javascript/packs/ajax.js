$(document).ready(function() {
  $('#new_department').on('submit', function(e) {
    var name = $('#department_name').val();
    var description = $('#department_description').val();
    e.preventDefault();
    if (name && description) {
      $.ajax({
        url: '/admin/departments',
        type: 'post',
        dataType: 'json',
        data: {department: {name: name, description: description}},
        success: function (data){
          $('tbody').append(data.department_data);
        },
        error: function (){
          alert("Loi roi")
        }
      })
    } else {
      alert("Name can be blank")
    }
   return false;
  })

  $('.tbody').on('click', '.destroy', function() {
    var id = $(this).data('id')
    var childTr = $(this).closest('tr')
    $.ajax({
      url: '/admin/departments/' + id,
      type: 'delete',
      success: function ( data ){
        childTr.hide();
        confirm("Ban co chac chan muon xoa");
      },
      error: function (){
        alert("Loi roi")
      }
    })
    return false;
  })
})

