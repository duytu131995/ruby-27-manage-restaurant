$(document).ready(function() {
  $('.tbody').on('click', '.destroy', function() {
    let id = $(this).data('id')
    let childTr = $(this).closest('tr')
    $.ajax({
      url: '/admin/departments/' + id,
      type: 'delete',
      success: function(data){
        childTr.hide();
        $(".notification").html("")
        $(".notification").append('<div class="alert alert-success">'+ I18n.t("admin.departments.delete.success") +'</div>')
        alert(I18n.t("admin.departments.delete.confirm"))
      }
    })
    return false;
  })
})

