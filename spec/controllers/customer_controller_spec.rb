# require "rails_helper"

# RSpec.describe UsersController, type: :controller do
#   let!(:user_customer){FactoryBot.create :user}
#   let!(:params) {FactoryBot.attributes_for :user}

#   describe "GET #new" do
#     before{get :new}

#     it "should render view new" do
#       expect(response).to render_template :new
#     end

#     it "should assign @user" do
#       expect(assigns(:user)).to be_a_new(User)
#     end
#   end

#   describe "POST #create" do
#     context "When valid param" do
#       subject{post :create, params: {user: params}}
#       it "should create user success" do
#         subject
#         expect(flash[:info]).to eq I18n.t("users.active.active_check")
#       end

#       it "create a new customer success" do
#         expect{subject}.to change(User, :count).by(1)
#       end
#     end

#     context "when invalid param" do
#       before do
#         post :create, params: {user: {name: " "}}
#       end

#       it "should render view new" do
#         expect(response).to render_template :new
#       end

#       it "should return error message" do
#         expect(flash[:danger]).to eq I18n.t("users.create.create_fail")
#       end
#     end
#   end
# end
