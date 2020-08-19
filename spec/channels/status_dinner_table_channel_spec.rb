require "rails_helper"

RSpec.describe StatusDinnerTableChannel, type: :channel do
  it "subscribes to a stream" do
    subscribe
    expect(subscription).to have_stream_from("status_dinner_table_channel")
  end

  it "subscribes without streams" do
    subscribe
    expect(subscription).not_to have_stream_from("123qwe")
  end
end
