RSpec.shared_examples "Action status" do
  it "has a success status code" do
    expect(response).to have_http_status :success
  end
end
