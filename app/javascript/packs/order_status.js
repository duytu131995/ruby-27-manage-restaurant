$(document).ready(function () {
  $('.premium-status').click(function () {
    let id = $(this).data('id')
    let url = $(this).attr('href')
    $.ajax({
      method: 'PATCH',
      dataType: 'json',
      url: url,
      context: this,
      data: {
        id: id
      },
      success: function (res) {
        if (res.status) {
          alert(I18n.t('order.update_success'))
          $(this).closest('.premium-status').html('<span class="badge badge-success">' + I18n.t('order_items.order_item_success') + '</span>');
      } else (
          alert(I18n.t('order.order_item_not_found'))
        )
      }
    })
  });
})
