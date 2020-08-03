# require "rails_helper"

# RSpec.describe Admin::AdminCustomersController, type: :controller do
#   let(:customer){FactoryBot.create :user}

#   describe "GET #index" do
#     before {get :index}
#     it "show all customers" do
#       expect(assigns(:admin_customers)).to eq([customer])
#     end

#     it "render the index view" do
#       expect(response).to render_template :index
#     end
#   end

#   describe "GET #edit" do
#     context "when exist customer" do
#       it "exist customer and render template edit" do
#         get :edit, params: {id: customer.id}
#         expect(response).to render_template :edit
#       end
#     end

#     context "when not exist customer" do
#       it "exist customer and redirect to admin " do
#         get :edit, params: {id: 100}
#         expect(response).to redirect_to admin_admin_customers_path
#       end
#     end
#   end

#   describe "PATCH #update" do
#     context "when valid param" do
#       before do
#         patch :update, params: {id: customer.id, user: {name: "abc"}}
#       end

#       it "should update customer" do
#         expect(response).to redirect_to admin_admin_customers_path
#       end
#     end

#     context "When invalid param" do
#       before do
#         patch :update, params: {id: customer.id, user: {name: " "}}
#       end

#       it "should return error message" do
#         expect(flash[:danger]).to eq I18n.t("admin_customer.update.update_fail")
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     context "when valid param" do
#       before do
#         delete :destroy,params: {id: customer.id}
#       end

#       it  "should delete success" do
#         expect(flash[:success]).to eq I18n.t("admin_customer.delete.delete_success")
#       end
#     end
#     context "when invalid param" do
#       before do
#         delete :destroy,params: {id: 100}
#       end

#       it "should delete fail" do
#         expect(flash[:danger]).to eq I18n.t("admin_customer.not_found_user")
#       end
#     end
#   end
# end
