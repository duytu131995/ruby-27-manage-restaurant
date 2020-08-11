class StatusDinnerTableChannel < ApplicationCable::Channel
  def subscribed
    stream_from "status_dinner_table_channel"
  end

  def unsubscribed
  end
end
