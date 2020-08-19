require "rails_helper"

RSpec.describe EmailInformationController, type: :controller do
  describe "POST #create" do
    subject {post :create, params: {email: "abc"}}
    context "when customer click to send information to email" do
      it "put job to redis queue" do
        ActiveJob::Base.queue_adapter = :test
        subject
        expect(InforWorker.jobs.size).to eq(1)
      end
    end
  end
end
