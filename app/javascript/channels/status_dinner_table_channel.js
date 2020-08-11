import consumer from "./consumer"

consumer.subscriptions.create("StatusDinnerTableChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    $('.notificationtb').html('').show()
    $('.dinner-tables .dinner-table-' + data.id).html(I18n.t('dinner_tables.index.status') + ': <span class="' + data.status + '">' + I18n.t("dinner_tables." + data.status) + '</span>')
    $('.notificationtb').html('Bàn số ' + data.name + ': ' + I18n.t("dinner_tables." + data.status))
    setTimeout(function(){ $('.notificationtb').hide("slow") }, 2000);
  }
});

$(document).on("turbolinks:load", function() {
  $('.notificationtb').html('').hide()
  setTimeout(function(){ $('.alert').hide("slow") }, 2000);
})
